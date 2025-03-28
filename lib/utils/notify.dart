import 'dart:math';
import 'package:awesome_notifications/awesome_notifications.dart';

class Notify{
  Future<bool> dailyNotification() async{
    String localTimeZone = await AwesomeNotifications().getLocalTimeZoneIdentifier();
    return await AwesomeNotifications().createNotification(
      schedule: NotificationCalendar(
        preciseAlarm: true,
        allowWhileIdle: true,
        timeZone: localTimeZone,
        hour: 06,
        minute: 00,
        second: 00,
        repeats: true
      ),
      content: NotificationContent(
        id:Random().nextInt(100), 
        channelKey: 'daily_hadith',
        title: 'Daily Hadith',
        body: 'Read a new hadith today',
        )
    );
  }
}

