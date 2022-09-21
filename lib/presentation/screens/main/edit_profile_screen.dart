import 'package:flutter/material.dart';
import 'package:general/general.dart';

import '../../widgets/custom/clip_path_bg.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final fullnameController = TextEditingController();
  final genderController = TextEditingController();
  final contactController = TextEditingController();
  final addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const CustomText('Edit Profile'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Stack(
            children: [
              const ClipPathBackground(height: 350),
              Container(
                margin: const EdgeInsets.fromLTRB(20, 100, 20, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 70,
                      backgroundColor: Colors.white,
                      child: Align(
                          alignment: Alignment.bottomRight,
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                                margin: const EdgeInsets.all(6),
                                child: Image.asset('assets/image/Add.png')),
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: CustomTextField('Full Name', controller: fullnameController),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: CustomTextField('Gender', controller: genderController),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: CustomTextField('Contact Number',
                controller: contactController),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: CustomTextField('Address', controller: addressController),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {},
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              child: CustomText('Save'),
            ),
          ),
        ],
      ),
    );
  }
}
