import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:general/general.dart';
import 'package:latlong2/latlong.dart';

class Hazard {
  final String templateUrl;
  final String title;

  Hazard({required this.templateUrl, required this.title});
}

const floodUrl =
    'https://api.mapbox.com/styles/v1/dankz01/cl8dwollz003n14mvp6oxul1d/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiZGFua3owMSIsImEiOiJjbDU2Zzl1NTAwYzl0M2luYmRkNjZoMHlpIn0.-hCnY7ZjwBW0Wf91zheEPg';
const landslideUrl =
    'https://api.mapbox.com/styles/v1/dankz01/cl8dwxk5l000515rkr74pah51/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiZGFua3owMSIsImEiOiJjbDU2Zzl1NTAwYzl0M2luYmRkNjZoMHlpIn0.-hCnY7ZjwBW0Wf91zheEPg';
const stormUrl =
    'https://api.mapbox.com/styles/v1/dankz01/cl8dwzr4g001h14nsoiamysoa/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiZGFua3owMSIsImEiOiJjbDU2Zzl1NTAwYzl0M2luYmRkNjZoMHlpIn0.-hCnY7ZjwBW0Wf91zheEPg';
List<Hazard> dropdown = [
  Hazard(templateUrl: floodUrl, title: 'Flood'),
  Hazard(templateUrl: landslideUrl, title: 'Landslide'),
  Hazard(templateUrl: stormUrl, title: 'Storm Surge'),
];

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Hazard template = dropdown.first;

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(center: LatLng(9.239878, 126.024329)),
      nonRotatedChildren: [
        TileLayer(
          urlTemplate: template.templateUrl,
          fastReplace: true,
          additionalOptions: const {
            'accessToken':
                'pk.eyJ1IjoiZGFua3owMSIsImEiOiJjbDU2Zzl1NTAwYzl0M2luYmRkNjZoMHlpIn0.-hCnY7ZjwBW0Wf91zheEPg',
            'id': 'mapbox.mapbox-streets-v8'
          },
        ),
        Center(
          child: DropdownButton<Hazard>(
              value: template,
              items: dropdown.map((e) {
                return DropdownMenuItem<Hazard>(
                  value: e,
                  child: CustomText(e.title),
                );
              }).toList(),
              onChanged: (Hazard? val) {
                setState(() {
                  template = val!;
                });
              }),
        )
        // MarkerLayer(
        //   markers: [
        //     Marker(
        //         point: Latlng.LatLng(52.5, -0.09),
        //         builder: (ctx) => Container(
        //               child: const FlutterLogo(),
        //             ))
        //   ],
        // )
      ],
    );
  }
}
