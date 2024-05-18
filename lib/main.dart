import 'dart:math';

import 'package:flutter/material.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:hadith_app/pages/daily_hadith.dart';
import 'package:hadith_app/pages/main_page.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:hadith_app/utils/notify.dart';

void main() async {
  runApp(MyApp());
  AwesomeNotifications().initialize(
  // set the icon to null if you want to use the default app icon
    null,
    [
      NotificationChannel(
          channelGroupKey: 'daily',
          channelKey: 'daily_hadith',
          channelName: 'Daily Hadith',
          channelDescription: 'Notification channel for daily hadith',
          defaultColor: Color.fromARGB(255, 149, 255, 167),
          ledColor: Colors.white)
    ],
    // Channel groups are only visual and are not required
    channelGroups: [
      NotificationChannelGroup(
          channelGroupKey: 'daily',
          channelGroupName: 'Daily Notifications')
    ],
    debug: true
  );
  AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
  if (!isAllowed) {
    AwesomeNotifications().requestPermissionToSendNotifications();
  }
});
  await Notify().dailyNotification();
}

final defaultColorScheme =ColorScheme.fromSwatch(
  primarySwatch: Colors.lightGreen,
);

class MyApp extends StatefulWidget {
  
  static final navigatorKey = GlobalKey<NavigatorState>();
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {

    // Only after at least the action method is set, the notification events are delivered
    AwesomeNotifications().setListeners(
        onActionReceivedMethod: NotificationController.onActionReceivedMethod,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(builder: (lightColorScheme,darkColorScheme){
      return MaterialApp(
        navigatorKey: MyApp.navigatorKey,
        title: 'Hadith App',
        theme: ThemeData(
          colorScheme: lightColorScheme ?? defaultColorScheme,
            useMaterial3: true),
          darkTheme: ThemeData(
            colorScheme: darkColorScheme ?? defaultColorScheme,
            useMaterial3: true),
          themeMode: ThemeMode.dark, 
        home: const MainPage(),
        );
        }
    );
  }
}

class NotificationController {

  /// Use this method to detect when a new notification or a schedule is created
  @pragma("vm:entry-point")
  static Future <void> onNotificationCreatedMethod(ReceivedNotification receivedNotification) async {
    // Your code goes here
  }

  /// Use this method to detect every time that a new notification is displayed
  @pragma("vm:entry-point")
  static Future <void> onNotificationDisplayedMethod(ReceivedNotification receivedNotification) async {
    // Your code goes here
  }

  /// Use this method to detect if the user dismissed a notification
  @pragma("vm:entry-point")
  static Future <void> onDismissActionReceivedMethod(ReceivedAction receivedAction) async {
    // Your code goes here
  }

  /// Use this method to detect when the user taps on a notification or action button
  @pragma("vm:entry-point")
  static Future <void> onActionReceivedMethod(ReceivedAction receivedAction) async {
    // Your code goes here

    // Navigate into pages, avoiding to open the notification details page over another details page already opened
    MyApp.navigatorKey.currentState?.push(MaterialPageRoute(builder: (context) =>  DailyHadith(index: Random().nextInt(7562)+1)));
  }
}
