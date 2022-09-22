import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:general/widgets/text.dart';
import 'package:general/widgets/textfield.dart';
import 'package:lanuz_app/main.dart';
import 'package:lanuz_app/presentation/screens/authentication/sign_up_screen.dart';

import '../../../core/theme/color.dart';
import '../../../dependency_injection.dart';
import '../../cubit/Authentication/authentication_cubit.dart';
import '../../widgets/custom/clip_path_bg.dart';
import '../../widgets/helper/helper_widget.dart';
import '../main_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  void checkLoginState() async {
    final newuser = globalSharedPreferences!.getString('email');
    if (newuser!.isNotEmpty) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (ctx) => const MainScreen()));
    }
  }

  @override
  void initState() {
    super.initState();
    checkLoginState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(),
      body: Stack(
        children: [
          const ClipPathBackground(height: 700),
          Center(
            child: Container(
              padding: const EdgeInsets.fromLTRB(50, 50, 50, 0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    verticalSpace(30),
                    const CustomText(
                      'Welcome to LanuzAPP',
                      size: 24,
                      color: Colors.white,
                      weight: FontWeight.w600,
                    ),
                    verticalSpace(100),
                    const CustomText(
                      'Login',
                      size: 24,
                      color: Colors.white,
                      weight: FontWeight.w600,
                    ),
                    verticalSpace(30),
                    CustomTextField(
                      'Username',
                      color: Colors.black,
                      contentPadding: const EdgeInsets.all(2),
                      radius: 30,
                      controller: emailController,
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
                      'Password',
                      color: Colors.black,
                      contentPadding: const EdgeInsets.all(2),
                      radius: 30,
                      prefix: const Padding(
                        padding: EdgeInsets.only(left: 20, right: 10),
                        child: Icon(
                          Icons.key,
                          color: Colors.grey,
                        ),
                      ),
                      controller: passwordController,
                    ),
                    verticalSpace(70),
                    GestureDetector(
                      onTap: () {
                        final email = emailController.text;
                        globalSharedPreferences?.setString('email', email);
                        context.read<AuthenticationCubit>().login(
                            emailController.text, passwordController.text, () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((ctx) => const MainScreen())));
                        });
                      },
                      child: Container(
                        width: double.infinity,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: BUTTON_COLOR,
                        ),
                        child: const Center(
                            child: CustomText(
                          'Login',
                          color: Colors.white,
                        )),
                      ),
                    ),
                    verticalSpace(30),
                    const CustomText('Forgot your password?',
                        color: Colors.white, size: 14),
                    const SizedBox(height: 250),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CustomText('Don\'t have account? ', color: GREY),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          BlocProvider<AuthenticationCubit>(
                                            create: (context) =>
                                                sl<AuthenticationCubit>(),
                                            child: const SignUpScreen(),
                                          )));
                            },
                            child: const CustomText('SignUp',
                                color: Colors.purple)),
                      ],
                    )
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
