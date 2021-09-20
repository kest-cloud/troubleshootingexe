import 'package:apptroubleshoot/cubit/internet_cubit_cubit.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
//import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:geolocator/geolocator.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  InternetCubitCubit internet = InternetCubitCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Troubleshooting"),
        shadowColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text("Help me to find what is wrong",
                style: TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            // Text('$_status'),
            BlocProvider(
                create: (context) => InternetCubitCubit(),
                child: BlocBuilder<InternetCubitCubit, InternetCubitState>(
                  builder: (context, state) {
                    if (state is InternetConnectedState) {
                      return const Text("Internet connected");
                    } else if (state is InternetDisconnectedState) {
                      return const Text("Disconnected");
                    }
                    return const Text("disconnected");
                  },
                ))
          ],
        ),
      ),
    );
  }
}
