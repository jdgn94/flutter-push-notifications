import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';

// dja8hS-pSGOHr4uB4Kevea:APA91bEH24kBjsWIOHBS6ancgV36DAFc80w230epvZ2HPELTxdK1MUOrsWSKwL1bYi9yPV_WuD2R3YQGS1JVnp6zY4spV88lpOIuF816uLhHB44agWMU9jy_3GuvHQa5xpK0XXsJAEuD

class PushNotificationsServices {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  final _messageStreamController = StreamController<Map>.broadcast();

  Stream<Map> get messageStream => _messageStreamController.stream;

  initNotifications() async {
    await _firebaseMessaging.requestNotificationPermissions();
    final token = await _firebaseMessaging.getToken();

    print("========== Firebase token ==========");
    print(token);

    _firebaseMessaging.configure(
      onMessage: onMessage,
      onBackgroundMessage: onBackgroundMessage,
      onLaunch: onLaunch,
      onResume: onResume,
    );
  }

  static Future<dynamic> onBackgroundMessage(
      Map<String, dynamic> message) async {
    if (message.containsKey('data')) {
      // Handle data message
      final dynamic data = message['data'];
    }

    if (message.containsKey('notification')) {
      // Handle notification message
      final dynamic notification = message['notification'];
    }
  }

  Future<dynamic> onMessage(Map<String, dynamic> message) async {
    print("========== on message ==========");
    // print("message $message");
    final data = message['data'];
    // print("comida: ${data['food']}");
    _messageStreamController.sink.add(data);
  }

  Future<dynamic> onLaunch(Map<String, dynamic> message) async {
    print("========== on launch ==========");
    // print("message $message");
    final data = message['data'];
    // print("comida: ${data['food']}");
    // _messageStreamController.sink.add(data);
  }

  Future<dynamic> onResume(Map<String, dynamic> message) async {
    print("========== on resume ==========");
    // print("message $message");
    final data = message['data'];
    // print("comida: ${data['food']}");
    _messageStreamController.sink.add(data);
  }

  disposed() {
    _messageStreamController?.close();
  }
}
