// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
// class NotificationDemo extends StatefulWidget {
//   const NotificationDemo({super.key});
//
//   @override
//   State<NotificationDemo> createState() => _NotificationDemoState();
// }
//
// class _NotificationDemoState extends State<NotificationDemo> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.grey.shade300,
//         title: const Text("Notification"),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//                 onPressed: () {
//                   NotificationService().showNotification(title: "This is a notification",body: "It's Work");
//                 }, child: const Text("Show Notification"))
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class NotificationService {
//   final FlutterLocalNotificationsPlugin notificationsPlugin =
//       FlutterLocalNotificationsPlugin();
//
//   Future<void> initNotification() async {
//     AndroidInitializationSettings initializationSettings =
//         const AndroidInitializationSettings('download');
//     var initializationSettingIOS = DarwinInitializationSettings(
//       requestAlertPermission: true,
//       requestBadgePermission: true,
//       requestSoundPermission: true,
//       onDidReceiveLocalNotification: (id, title, body, payload) async {},
//     );
//
//     var initializationSetting = InitializationSettings(
//         android: initializationSettings, iOS: initializationSettingIOS);
//     await notificationsPlugin.initialize(
//       initializationSetting,
//       onDidReceiveNotificationResponse:
//           (NotificationResponse notificationResponse) async {},
//     );
//   }
//
//   NotificationDetails notificationDetails() {
//     return const NotificationDetails(
//         android: AndroidNotificationDetails('channelId', 'channelName',
//             importance: Importance.max),iOS: DarwinNotificationDetails());
//   }
//
//   Future showNotification(
//       {int id = 0, String? title, String? body, String? payLoad}) async {
//     return notificationsPlugin.show(id, title, body, notificationDetails());
//   }
// }




// import 'package:firebase/controller/controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class NotificationDemo extends StatefulWidget {
//   const NotificationDemo({super.key});
//
//   @override
//   State<NotificationDemo> createState() => _NotificationDemoState();
// }
//
// class _NotificationDemoState extends State<NotificationDemo> {
// Controller controller=Get.put(Controller());
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Notification"),
//         centerTitle: true,
//         backgroundColor: Colors.grey.shade300,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//                 onPressed: () => controller.sendNotification(), child: const Text("Send Notification"))
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:firebase_messaging/firebase_messaging.dart';
//
// class FirebaseApi{
//   final firebaseMessaging=FirebaseMessaging.instance;
//   Future<void> initNotification()async{
//     await firebaseMessaging.requestPermission();
//     final fCMTocken=await firebaseMessaging.getToken();
//     print("Tocken:->>>>>>><<<<<<<$fCMTocken");
//   }
// }











import 'package:awesome_notifications/awesome_notifications.dart';



class NotificationController {
  /// Use this method to detect when a new notification or a schedule is created
  @pragma("vm:entry-point")
  static Future<void> onNotificationCreatedMethod(
      ReceivedNotification receivedNotification) async {
    // Your code goes here
  }

  /// Use this method to detect every time that a new notification is displayed
  @pragma("vm:entry-point")
  static Future<void> onNotificationDisplayedMethod(
      ReceivedNotification receivedNotification) async {
    // Your code goes here
  }

  /// Use this method to detect if the user dismissed a notification
  @pragma("vm:entry-point")
  static Future<void> onDismissActionReceivedMethod(
      ReceivedAction receivedAction) async {
    // Your code goes here
  }

  /// Use this method to detect when the user taps on a notification or action button
  @pragma("vm:entry-point")
  static Future<void> onActionReceivedMethod(
      ReceivedAction receivedAction) async {
    // Your code goes here

    // Navigate into pages, avoiding to open the notification details page over another details page already opened
    // Myapp.navigatorKey.currentState?.pushNamedAndRemoveUntil(
    //     '/notification-page',
    //     (route) =>
    //         (route.settings.name != '/notification-page') || route.isFirst,
    //     arguments: receivedAction);
  }
}