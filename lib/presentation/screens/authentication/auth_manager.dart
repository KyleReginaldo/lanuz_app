import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lanuz_app/presentation/cubit/Authentication/authentication_cubit.dart';
import 'package:lanuz_app/presentation/screens/authentication/sign_in_screen.dart';
import 'package:lanuz_app/presentation/screens/main/home_screen.dart';

class AuthManager extends StatefulWidget {
  const AuthManager({super.key});

  @override
  State<AuthManager> createState() => _AuthManagerState();
}

class _AuthManagerState extends State<AuthManager> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationCubit, AuthenticationState>(
      builder: (context, state) {
        if (state is Authenticating) {
          return const CircularProgressIndicator();
        } else if (state is Authenticated) {
          return const HomeScreen();
        } else {
          return const SignInScreen();
        }
      },
    );
  }
}
