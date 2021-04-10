import 'package:flutter/material.dart';

import 'package:flutter_push/src/pages/home_page.dart';
import 'package:flutter_push/src/pages/notification_page.dart';
import 'package:flutter_push/src/services/push_notifications_services.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> navigateKey = new GlobalKey<NavigatorState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final pushServices = new PushNotificationsServices();
    pushServices.initNotifications();

    pushServices.messageStream.listen((data) {
      print('data desde el main: $data');
      // Navigator.pushNamed(context, 'notification');
      navigateKey.currentState.pushNamed('notification', arguments: data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Push app',
        navigatorKey: navigateKey,
        debugShowCheckedModeBanner: false,
        initialRoute: 'home',
        routes: {
          'home': (BuildContext context) => HomePage(),
          'notification': (BuildContext context) => NotificationPage(),
        });
  }
}
