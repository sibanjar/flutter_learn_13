import 'package:flutter/material.dart';
import 'package:flutter_learn_13/main.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

class TryNotify extends StatelessWidget {
  const TryNotify({super.key});

  @override
  Widget build(BuildContext context) {

    void showNotification() async{
      AndroidNotificationDetails androidNotificationDetails = const AndroidNotificationDetails(
          'myNotice',
          'You get Notification',
      enableVibration: true,
      enableLights: true,
      colorized: true,
        // color: Colors.red,
        priority: Priority.max,
        importance: Importance.max
      );

      DarwinNotificationDetails iosNotificationDetails = const DarwinNotificationDetails(
        presentAlert: true
      );


      NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails,
        iOS: iosNotificationDetails,
      );

      await notificationsPlugin.zonedSchedule(
          0,
          'sample notification',
          'hey you have new notification.',
          tz.TZDateTime.from(DateTime.now().add(const Duration(seconds: 5)),tz.local),
          notificationDetails,
          uiLocalNotificationDateInterpretation:UILocalNotificationDateInterpretation.wallClockTime,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
         matchDateTimeComponents: DateTimeComponents.time,


      );
      // await notificationsPlugin.show(0, 'sample notification', 'hey you have new notification.', notificationDetails);

    }

    return Scaffold(
      appBar: AppBar(title: const Text('Notification'),centerTitle: true,),
      body: Center(child: ElevatedButton(
        onPressed: showNotification,
        child: const Text('notify'),
      ),),
    );
  }
}
