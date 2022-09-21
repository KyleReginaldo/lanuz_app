import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(),
      nonRotatedChildren: [
        TileLayer(
          urlTemplate:
              'https://api.mapbox.com/styles/v1/dankz01/cl8b5fez5007n14qlk1sz2x1w/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiZGFua3owMSIsImEiOiJjbDU2Zzl1NTAwYzl0M2luYmRkNjZoMHlpIn0.-hCnY7ZjwBW0Wf91zheEPg',
          additionalOptions: const {
            'accessToken':
                'pk.eyJ1IjoiZGFua3owMSIsImEiOiJjbDU2Zzl1NTAwYzl0M2luYmRkNjZoMHlpIn0.-hCnY7ZjwBW0Wf91zheEPg',
            'id': 'mapbox.mapbox-streets-v8'
          },
        ),
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
