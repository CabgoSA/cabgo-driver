import 'dart:io';
import 'dart:async';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';
import 'package:uuid/uuid.dart';

class DeviceInfo{

  static Future<List<String>> getDeviceDetails() async {
    var uuid = Uuid();
    String deviceID;
    String deviceType;
    dynamic data;
    final deviceInfoPlugin = DeviceInfoPlugin();
    try {

    if (Platform.isAndroid) {
       deviceType = 'android';
       await deviceInfoPlugin.deviceInfo.then((value){
         data = value.toMap();
         deviceID = uuid.v5(Uuid.NAMESPACE_URL, data['id']);
       });
    } else if (Platform.isIOS) {
      deviceType = 'ios';
    }

    } on PlatformException {
        print('Failed to get platform version');
      }

     return [deviceID,deviceType];
  }
}