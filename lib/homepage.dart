import 'package:apptroubleshoot/constants/enums.dart';
import 'package:apptroubleshoot/cubit/internet_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/bluetooth_cubit.dart';
import 'cubit/locationcheck_cubit.dart';
import 'cubit/server_cubit.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  InternetCubitCubit internet = InternetCubitCubit();
  LocationcheckCubit location = LocationcheckCubit();

  @override
  Widget build(BuildContext context) {
    //  location.determinePosition();
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
                  if (state is InternetConnectedState &&
                      state.connectionStatus == ConnectionStatus.mobile) {
                    return Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const <Widget>[
                          Icon(Icons.signal_cellular_4_bar,
                              color: Colors.green),
                          SizedBox(width: 10),
                          Text(
                            'Internet Connection',
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          )
                        ],
                      ),
                    );

                    // Text("Internet connected");
                  } else if (state is InternetDisconnectedState &&
                      state.connectionStatus == ConnectionStatus.none) {
                    return Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const <Widget>[
                          Icon(Icons.signal_cellular_0_bar, color: Colors.red),
                          SizedBox(width: 10),
                          Text(
                            'No Internet Connection',
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          )
                        ],
                      ),
                    );
                    // Text("Disconnected");
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
            ),
            const SizedBox(height: 20),
            BlocProvider(
              create: (context) => LocationcheckCubit(),
              child: BlocBuilder<LocationcheckCubit, LocationcheckState>(
                builder: (context, state) {
                  if (state is LocationAcceptState &&
                      state.locationStatus == LocationStatus.whileInUse) {
                    return Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const <Widget>[
                          Icon(Icons.thumb_up, color: Colors.green),
                          SizedBox(width: 10),
                          Text(
                            "Permission Granted",
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          )
                        ],
                      ),
                    );

                    // Text("Location Permission Accepted");
                  } else if (state is LocationDeniedState &&
                      state.locationStatus == LocationStatus.denied) {
                    return Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const <Widget>[
                          Icon(Icons.thumb_down, color: Colors.red),
                          SizedBox(width: 10),
                          Text(
                            "Permission Denied",
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          )
                        ],
                      ),
                    );

                    //Text("Permission Denied");
                  } else if (state is LocationAcceptEverState &&
                      state.locationStatus == LocationStatus.always) {
                    return Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const <Widget>[
                          Icon(Icons.thumb_up, color: Colors.green),
                          SizedBox(width: 10),
                          Text(
                            "Permission Granted",
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          )
                        ],
                      ),
                    );

                    // Text("Location Permission Accepted");
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
            ),
            const SizedBox(height: 20),
            BlocProvider(
              create: (context) => ServerCubit(),
              child: BlocBuilder<ServerCubit, ServerState>(
                builder: (context, state) {
                  if (state is ServerConnectedState && true) {
                    return Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const <Widget>[
                          Icon(Icons.thumb_up, color: Colors.green),
                          SizedBox(width: 10),
                          Text(
                            "Server Connection!",
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                    );

                    //Text("Server Connection");
                  } else if (state is ServerDisconnectedState) {
                    return Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const <Widget>[
                          Icon(Icons.thumb_down, color: Colors.red),
                          SizedBox(width: 10),
                          Text(
                            "Something Went wrong! Server Not Reachable!",
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
            ),

            const SizedBox(height: 20),
//the bluetooth can be detected when put on already...
//but I can not figure how yet
//to effect the state change bacause its not returning anything,
//except null value
            // BlocProvider(
            //   create: (context) => BluetoothCubit(),
            //   child: BlocBuilder<BluetoothCubit, BluetoothDeviceState>(
            //     builder: (context, state) {
            //       if (state is BluetoothConnectedState) {
            //         return const Text("Bluetooth Connected");
            //       } else if (state is LocationDeniedState) {
            //         return const Text("Bluetooth Disconnected");
            //       } else {
            //         return const CircularProgressIndicator();
            //       }
            //     },
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
