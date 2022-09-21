import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:general/widgets/text.dart';
import 'package:general/widgets/textfield.dart';

import '../../../core/theme/color.dart';
import '../../../domain/enitity/user_entity.dart';
import '../../cubit/Authentication/authentication_cubit.dart';
import '../../widgets/custom/clip_path_bg.dart';
import '../../widgets/helper/helper_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final fullnameController = TextEditingController();
  final emailController = TextEditingController();
  final genderController = TextEditingController();
  final contactController = TextEditingController();
  // ignore: non_constant_identifier_names
  final loc_addressController = TextEditingController();
  final pwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void register() async {
    final user = UserEntity(
      fullname: fullnameController.text,
      email: emailController.text,
      gender: genderController.text,
      contact: contactController.text,
      loc_address: loc_addressController.text,
      pword: pwordController.text,
      coordinates: 'Empty',
    );
    context.read<AuthenticationCubit>().register(user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(),
      body: Stack(
        children: [
          const ClipPathBackground(height: 900),
          Center(
            child: Container(
              padding: const EdgeInsets.fromLTRB(50, 50, 50, 0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const CustomText(
                      'Welcome to LanuzAPP',
                      size: 24,
                      weight: FontWeight.w600,
                      color: Colors.white,
                    ),
                    verticalSpace(100),
                    const CustomText(
                      'Signup',
                      size: 24,
                      weight: FontWeight.w600,
                      color: Colors.white,
                    ),
                    verticalSpace(30),
                    CustomTextField(
                      'Enter Full Name',
                      contentPadding: const EdgeInsets.all(2),
                      radius: 30,
                      controller: fullnameController,
                      prefix: const Padding(
                        padding: EdgeInsets.only(left: 20, right: 10),
                        child: Icon(
                          Icons.person,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    verticalSpace(20),
                    CustomTextField(
                      'Email/Username',
                      contentPadding: const EdgeInsets.all(2),
                      radius: 30,
                      prefix: const Padding(
                        padding: EdgeInsets.only(left: 20, right: 10),
                        child: Icon(
                          Icons.mail,
                          color: Colors.grey,
                        ),
                      ),
                      controller: emailController,
                    ),
                    verticalSpace(20),
                    CustomTextField(
                      'Gender',
                      contentPadding: const EdgeInsets.all(2),
                      radius: 30,
                      prefix: const Padding(
                        padding: EdgeInsets.only(left: 20, right: 10),
                        child: Icon(
                          Icons.female,
                          color: Colors.grey,
                        ),
                      ),
                      controller: genderController,
                    ),
                    verticalSpace(20),
                    CustomTextField(
                      'Contact Number',
                      contentPadding: const EdgeInsets.all(2),
                      radius: 30,
                      prefix: const Padding(
                        padding: EdgeInsets.only(left: 20, right: 10),
                        child: Icon(
                          Icons.phone,
                          color: Colors.grey,
                        ),
                      ),
                      controller: contactController,
                    ),
                    verticalSpace(20),
                    CustomTextField(
                      'Address',
                      contentPadding: const EdgeInsets.all(2),
                      radius: 30,
                      prefix: const Padding(
                        padding: EdgeInsets.only(left: 20, right: 10),
                        child: Icon(
                          Icons.location_city,
                          color: Colors.grey,
                        ),
                      ),
                      controller: loc_addressController,
                    ),
                    verticalSpace(20),
                    CustomTextField(
                      'Password',
                      contentPadding: const EdgeInsets.all(2),
                      radius: 30,
                      prefix: const Padding(
                        padding: EdgeInsets.only(left: 20, right: 10),
                        child: Icon(
                          Icons.lock,
                          color: Colors.grey,
                        ),
                      ),
                      controller: pwordController,
                    ),
                    verticalSpace(20),
                    CustomTextField(
                      'Confirm Password',
                      contentPadding: const EdgeInsets.all(2),
                      radius: 30,
                      prefix: const Padding(
                        padding: EdgeInsets.only(left: 20, right: 10),
                        child: Icon(
                          Icons.key,
                          color: Colors.grey,
                        ),
                      ),
                      controller: confirmPasswordController,
                    ),
                    verticalSpace(20),
                    GestureDetector(
                      onTap: () async {
                        register();
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: double.infinity,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: BUTTON_COLOR),
                        child: const Center(
                            child: CustomText(
                          'Sign Up',
                          color: Colors.white,
                        )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
