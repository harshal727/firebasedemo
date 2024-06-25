import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase/coffee_shop/models/coffee_shop.dart';
import 'package:firebase/sql_database/sql_demo.dart';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

import 'coffee_shop/home_page.dart';
import 'database/add_product.dart';
import 'database/bottombar.dart';
import 'database/home_screen.dart';
import 'demo_payment.dart';
import 'loading_animation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  //await FirebaseApi().initNotification();

  await GetStorage.init();
  // await AwesomeNotifications().initialize(
  //   null,
  //   [
  //     NotificationChannel(
  //         channelGroupKey: "basic_channel_group",
  //         channelKey: 'basic_channel',
  //         channelName: 'Basic_Notification',
  //         channelDescription: "Basic Notification channel")
  //   ],
  //   channelGroups: [
  //     NotificationChannelGroup(
  //         channelGroupKey: "basic_channel_group",
  //         channelGroupName: "Basic_Group")
  //   ],
  // );
  // bool isallowed = await AwesomeNotifications().isNotificationAllowed();
  // if (!isallowed) {
  //   AwesomeNotifications().requestPermissionToSendNotifications();
  // }
  runApp(const MyApp());
}

// class Myapp extends StatefulWidget {
//   const Myapp({super.key});
//
//   @override
//   State<Myapp> createState() => _MyappState();
// }
//
// class _MyappState extends State<Myapp> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     AwesomeNotifications().setListeners(
//       onActionReceivedMethod: NotificationController.onActionReceivedMethod,
//       onNotificationCreatedMethod:
//           NotificationController.onNotificationCreatedMethod,
//       onNotificationDisplayedMethod:
//           NotificationController.onNotificationDisplayedMethod,
//       onDismissActionReceivedMethod:
//           NotificationController.onDismissActionReceivedMethod,
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               ElevatedButton(
//                   onPressed: () {
//                     AwesomeNotifications().createNotification(
//                       content: NotificationContent(
//                         id: 1,
//                         channelKey: "basic_channel",
//                         title: "App Store",
//                         body: "You are in the App Store",
//                       ),
//                     );
//                   },
//                   child: const Text("Send Notification"))
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return ChangeNotifierProvider(
    //   create: (context) => CoffeeShop(),
    //   builder: (context, child) =>  MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     home: HomePage(),
    //   ),
    // );
    return  const GetMaterialApp(
      //initialBinding: ControllerBindings(),
      debugShowCheckedModeBanner: false,
      home: DemoPayment(),
      // home: PreferenceManager.getUid() == null
      //     ? const RegistrationScreen()
      //     : const Bottombar(),
    );
  }
}
