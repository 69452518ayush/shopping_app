import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ecommerce/utils/popups/snackbar_helpers.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class NetworkManager extends GetxController{
  static NetworkManager get instance => Get.find();

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  final Rx<ConnectivityResult> _connectivityStatus = ConnectivityResult.none.obs;
  /// Initialize the network manager and set up a stream to stream to continually check the connection status.
  @override
  void onInit(){
    super.onInit();
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }
  /// Update the connection status based on changes in connectivity and share a relevant popup for no internet
 Future<void> _updateConnectionStatus(List<ConnectivityResult> result) async {
    _connectivityStatus.value = result [0];
    if(_connectivityStatus.value == ConnectivityResult.none){
      USnackBarHelpers.warningSnackBar(title: 'No Internet Connection');
    }
 }
 /// Check the internet connection status
/// Returns 'true' if connected , 'false' otherwise
  Future<bool> isConnected() async {
    try {
      final result = await _connectivity.checkConnectivity();
      if(result[0] == ConnectivityResult.none){
        return false;

      } else {
        return true;
      }
    } on PlatformException catch (_){
      return false;
    }
  }
}/*
/// Dispose or close the active connectivity stream.
@override
void onClose() {
  super.onClose();
  _connectivitySubscription.cancel();
}
*/