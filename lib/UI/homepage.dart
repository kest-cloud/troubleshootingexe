import 'package:apptroubleshoot/UI/widget.dart';
import 'package:apptroubleshoot/constants/enums.dart';
import 'package:apptroubleshoot/cubit/Data_Availability/datacheck_cubit.dart';
import 'package:apptroubleshoot/cubit/bluetooth%20cubit/bluetooth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/LocationPermission cubit/locationcheck_cubit.dart';
import '../cubit/MobileDataCheck cubit/internet_cubit_cubit.dart';
import '../cubit/Server cubit/server_cubit.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

            BlocBuilder<InternetCubitCubit, InternetCubitState>(
              builder: (context, state) {
                if (state is InternetConnectedState &&
                    state.connectionStatus == ConnectionStatus.mobile) {
                  return const RowwClass(label: "Mobile Data On", opacity: 1);

                  // Text("Internet connected");
                } else if (state is InternetDisconnectedState &&
                    state.connectionStatus == ConnectionStatus.none) {
                  return const RowwClass(
                      label: "Please Turn On Mobile Data!", opacity: 0.3);
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
            const SizedBox(height: 20),
            BlocBuilder<LocationcheckCubit, LocationcheckState>(
              builder: (context, state) {
                if (state is LocationAcceptEverState &&
                    state.locationStatus == LocationStatus.always) {
                  return const RowwClass(
                      label: "Permission Granted!", opacity: 1);

                  // Text("Location Permission Accepted");
                } else if (state is LocationAcceptState &&
                    state.locationStatus == LocationStatus.whileInUse) {
                  return const RowwClass(
                      label: "Permission Granted!", opacity: 1);

                  // Text("Location Permission Accepted");
                } else if (state is LocationDeniedState &&
                    state.locationStatus == LocationStatus.denied) {
                  return const RowwClass(
                      label: "Permission Denied", opacity: 0.3);
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
            const SizedBox(height: 20),
            BlocBuilder<ServerCubit, ServerState>(
              builder: (context, state) {
                if (state is ServerConnectedState && true) {
                  return const RowwClass(
                      label: "Server Connection!", opacity: 1);
                } else if (state is ServerDisconnectedState) {
                  return const RowwClass(
                      label: "Something Went wrong! Server Not Reachable!",
                      opacity: 0.3);
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
            const SizedBox(height: 20),
            BlocBuilder<DatacheckCubit, DatacheckState>(
              builder: (context, state) {
                if (state is DataAccessState &&
                    state.dataCheck == DataCheck.active) {
                  return const RowwClass(
                      label: "Data Connection Active", opacity: 1);
                } else if (state is NoDataAccessState &&
                    state.dataCheck == DataCheck.notactive) {
                  return const RowwClass(
                      label: "No Data Connection Detected", opacity: 0.3);
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
            const SizedBox(height: 20),
            BlocBuilder<BluetoothCubit, BluetoothDevState>(
                builder: (context, state) {
              if (state is BluetoothConnectedState) {
                return const RowwClass(
                    label: 'Bluetooth Connected', opacity: 1);
              } else {
                return const RowwClass(
                    label: 'Bluetooth Disconnected', opacity: 0.3);
              }
            }),
          ],
        ),
      ),
    );
  }
}
