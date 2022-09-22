import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lanuz_app/presentation/cubit/Authentication/authentication_cubit.dart';
import 'package:lanuz_app/presentation/screens/authentication/auth_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dependency_injection.dart';
import 'core/theme/theme_data.dart';

SharedPreferences? globalSharedPreferences;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  globalSharedPreferences = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CustomThemeData.themeData(),
      home: BlocProvider(
        create: (context) => sl<AuthenticationCubit>(),
        child: const AuthManager(),
      ),
    );
  }
}
