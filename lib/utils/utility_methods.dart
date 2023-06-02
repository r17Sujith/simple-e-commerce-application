

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:permission_handler/permission_handler.dart';
abstract class UtilityMethods{
  /*Method to show snack bar*/
  static x(BuildContext scaffoldContext, var message) {
    ScaffoldMessenger.of(scaffoldContext).showSnackBar(SnackBar(
        content: Text(message), backgroundColor: Colors.red));
  }

  static Future<void> checkLocationPermission() async {
    PermissionStatus status = await Permission.location.status;
    if (status.isGranted) {
      return;
    } else {
      // Location permission is not determined
      // You can request the location permission
      PermissionStatus requestStatus = await Permission.location.request();
      if (requestStatus.isGranted) {
        return;
      } else if (requestStatus.isPermanentlyDenied) {
        openAppSettings();
      }
    }
  }

}