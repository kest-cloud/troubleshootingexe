import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/LocationPermission cubit/locationcheck_cubit.dart';
import 'cubit/MobileDataCheck cubit/internet_cubit_cubit.dart';
import 'cubit/Server cubit/server_cubit.dart';

import 'UI/homepage.dart';
import 'cubit/bluetooth cubit/bluetooth_cubit.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (BuildContext context) => InternetCubitCubit(),
      ),
      BlocProvider(
        create: (context) => LocationcheckCubit(),
      ),
      BlocProvider(
        create: (context) => BluetoothCubit(),
      ),
      BlocProvider(
        create: (context) => ServerCubit(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TroubleShoot App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}
