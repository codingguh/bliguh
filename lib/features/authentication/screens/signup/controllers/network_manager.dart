import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:bliguh/common/widgets/loaders/loaders.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class NetworkManager extends GetxController {
  static NetworkManager get instance => Get.find();

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  final Rx<ConnectivityResult> _connectionStatus = ConnectivityResult.none.obs;

  //Initialize the network manager and set up a stream to conntinually check the connecttion status
  @override
  void onInit() async {
    super.onInit();
    _connectivitySubscription = await _connectivity.onConnectivityChanged
        .listen(_updateConnectionStatus);
  }

  //update connection status base on the changes in connectivity and show a relevant popup for no internet connection
  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    final newResult = result;
    _connectionStatus.value = newResult;
    // print('ssfdg kontol ${_coRnnectionStatus.value}');
    if (_connectionStatus.value == ConnectivityResult.none) {
      //No internet connection
      Loaders.customToast(message: 'No Internet connection');
    }
    // Future.delayed(Duration(seconds: 3), () {
    //   // print('peraama ${newReSsult}');
    //   // Loaders.warningSnackBar(
    //   //     message: 'No Internet connection', title: 'No internet');

    // });
  }

  //Check the internet connectionstatus
  //Returns true if connectd dalse otherwise
  Future<bool> isConnected() async {
    try {
      print('isdasdasdasdsad');
      // FullScreenLoader.openLoadingDialog('Oh snap', TImages.bliguhloader);
      final result = await _connectivity.checkConnectivity();
      print('sdadada $result');
      if (result == ConnectivityResult.none) {
        // FullScreenLoader.stopLoading();
        Loaders.warningSnackBar(
            title: 'Oh snap', message: 'No Internet connection');
        return false;
      } else {
        // FullScreenLoader.stopLoading();
        return true;
      }
    } on PlatformException catch (_) {
      // FullScreenLoader.stopLoading();
      return false;
    } catch (e) {
      // FullScreenLoader.stopLoading();
      return false;
    }
  }

  //Dispose or close the active connectivity stream
  @override
  void onClose() {
    super.onClose();
    _connectivitySubscription.cancel();
  }
}
