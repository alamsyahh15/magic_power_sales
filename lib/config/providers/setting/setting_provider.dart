import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:magic_power_sales/config/string.dart';

class SettingProvider extends ChangeNotifier {
  FirebaseRemoteConfig? remoteConfig;

  Future<void> initialized() async {
    ValueListenable<FirebaseRemoteConfig?> remoteConfig =
        ValueNotifier(await setupRemoteConfig());
    if (remoteConfig.value != null) {
      await remoteConfig.value!.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(seconds: 10),
          minimumFetchInterval: Duration.zero,
        ),
      );
      final updated = await remoteConfig.value!.fetchAndActivate();
      if (updated) {
        log("Updated Found $updated");
      } else {
        remoteConfig.value!.activate();
        log("Updated not Found $updated");
      }
      await remoteConfig.value!.ensureInitialized();
      String result = remoteConfig.value!.getValue("config_setting").asString();
      log("Result => $result");
      final data = jsonDecode(result);
      if (Platform.isAndroid) liveStatus = data['status_live_sales'];
      if (Platform.isIOS) liveStatus = data['status_live_ios_sales'];
      log("Config Setting => App Is Live $liveStatus\nBase URL => ${Strings.baseUrl}");
    }
  }

  Future<FirebaseRemoteConfig> setupRemoteConfig() async {
    await Firebase.initializeApp();
    final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
    await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(seconds: 10),
      minimumFetchInterval: Duration.zero,
    ));
    RemoteConfigValue(null, ValueSource.valueStatic);
    return remoteConfig;
  }
}
