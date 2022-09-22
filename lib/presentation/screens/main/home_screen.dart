import 'package:flutter/material.dart';
import 'package:general/widgets/text.dart';
import 'package:geolocator/geolocator.dart';

import '../../../core/utils/constant.dart';
import '../../../core/utils/desc_data.dart';
import '../../../main.dart';
import '../../widgets/components/modal_builder.dart';
import '../../widgets/custom/clip_path_bg.dart';
import '../../widgets/helper/helper_widget.dart';

import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Future<void> getAddressFromLatLong(Position position) async {
  //   List<Placemark> placemark =
  //       await placemarkFromCoordinates(position.latitude, position.longitude);
  // }

  void _getCurrentLocation() async {
    Position position = await _determinePosition();
    // getAddressFromLatLong(position);
    final coordinates = '${position.latitude},${position.longitude}';
    final user = globalSharedPreferences!.getString('email');
    print('User sharedpreferences email : $user');
    updateCoordinates(
        coordinates, globalSharedPreferences?.getString('email') ?? '');
  }

  Future<Position> _determinePosition() async {
    LocationPermission permission;

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location Permissions are denied');
      }
    }
    return await Geolocator.getCurrentPosition();
  }

  Future updateCoordinates(String coordinates, String email) async {
    try {
      var response = await http.post(
          Uri.http(ipv4, 'client/add_coordinate.php'),
          body: {'coordinates': coordinates, 'email': email});
      if (response.statusCode == 200) {
        return response.body;
      } else {}
    } catch (e) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CustomHomeContainer(height: 600)),
        const ClipPathBackground(height: 600),
        Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 30),
                const CustomText(
                  'Emergency Evacuation\nNeeded?',
                  textAlign: TextAlign.center,
                  color: Colors.white,
                  size: 24,
                  weight: FontWeight.w600,
                ),
                const SizedBox(height: 70),
                const CustomText(
                  'One Press Button for Emergency Assitance',
                  color: Colors.white,
                  size: 16,
                  weight: FontWeight.w300,
                ),
                GestureDetector(
                  onTap: _getCurrentLocation,
                  child: Center(
                    child: Container(
                        margin: const EdgeInsets.all(30),
                        padding: const EdgeInsets.all(20),
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(150),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.red, Colors.red.shade900],
                          ),
                        ),
                        child: Image.asset(
                          'assets/image/Emergency design button.png',
                          width: 70,
                          height: 70,
                        )),
                  ),
                ),
                const CustomText(
                  'After pressing the alarm button\nit will automatically notify the rescuers',
                  textAlign: TextAlign.center,
                  color: Colors.white,
                  size: 15,
                  weight: FontWeight.w300,
                ),
                const SizedBox(height: 110),
                const CustomText(
                  'Know your Hazard',
                  color: Colors.white,
                  size: 20,
                  weight: FontWeight.w600,
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    columnBuilder('Storm Surge', 'assets/image/Floods.png', () {
                      showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          context: context,
                          isScrollControlled: true,
                          builder: ((context) {
                            return const ModalBuilder(
                              calamity: title1,
                              description: stormSurge,
                              alertDesc: stormSurgeAlertDesc,
                              guideline1: firstSurgeContent,
                              image1: firstSurgeImage,
                              guideline2: secondSurgeContent,
                              image2: secondSurgeImage,
                              guideline3: thirdSurgeContent,
                              image3: thirdSurgeImage,
                            );
                          }));
                    }),
                    columnBuilder('Land Slide', 'assets/image/Landslide.png',
                        () {
                      showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          context: context,
                          isScrollControlled: true,
                          builder: ((context) {
                            return const ModalBuilder(
                              calamity: title2,
                              description: landSlide,
                              alertDesc: landSlideAlertDesc,
                              guideline1: firstLandContent,
                              image1: firstLandImage,
                              guideline2: secondLandContent,
                              image2: secondLandImage,
                              guideline3: thirdLandContent,
                              image3: thirdLandImage,
                            );
                          }));
                    }),
                    columnBuilder('Flood', 'assets/image/Tsunami.png', () {
                      showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          context: context,
                          isScrollControlled: true,
                          builder: ((context) {
                            return const ModalBuilder(
                              calamity: title3,
                              description: flood,
                              alertDesc: floodAlertDesc,
                              guideline1: firstFloodContent,
                              image1: firstFloodImage,
                              guideline2: secondFloodContent,
                              image2: secondFloodImage,
                              guideline3: thirdFloodContent,
                              image3: thirdFloodImage,
                            );
                          }));
                    }),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
