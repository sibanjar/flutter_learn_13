import 'dart:async';
import 'dart:developer' as developer;

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class ConnectivityExample extends StatefulWidget {
  const ConnectivityExample({Key? key}) : super(key: key);

  @override
  State<ConnectivityExample> createState() => _ConnectivityExampleState();
}

class _ConnectivityExampleState extends State<ConnectivityExample> {
  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    initConnectivity();

    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }


  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      developer.log('Couldn\'t check connectivity status', error: e);
      return;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState(() {
      _connectionStatus = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Connectivity example app'),
        elevation: 4,
      ),
      body: StreamBuilder(
          stream: Connectivity().onConnectivityChanged,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            // if(snapshot.hasData){
            //   ConnectivityResult result = snapshot.data;
            //   if(result == ConnectivityResult.mobile){
            //     return Connected('Mobile Data');
            //   }else if(result == ConnectivityResult.wifi){
            //     return Connected('wifi');
            //   }
            //   else if (result == ConnectivityResult.ethernet) {
            //     return Connected('ethernet');
            //   }else if (result == ConnectivityResult.vpn) {
            //     return Connected('vpn');
            //   } else{
            //     //no internet
            //     noInternet();
            //   }
            // }else{
            //   return loding();
            // }
        return Column(
        children: [
        Text('Connection Status: ${_connectionStatus.toString()}'),
        Connected(_connectionStatus.toString()),
        ],
        );
    },

    ));
  }
  Widget loding()=> const Center(child: CircularProgressIndicator());
  Widget Connected(String type)=> Center(child: Text('$type Connected'));
  Widget noInternet()=> const Center(child: Text('no Internet Connection'));
}