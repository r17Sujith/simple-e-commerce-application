import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wtf_healthify/provider/nearest_gym_provider.dart';
import 'package:wtf_healthify/screens/home_page.dart';
import 'package:wtf_healthify/utils/shared_preference.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await sharedPrefs.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NearestGymProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 0,
          ),
        ),
        home: const MyHomePage(),
      ),
    );
  }
}



