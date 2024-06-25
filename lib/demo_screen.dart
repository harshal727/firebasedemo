import 'package:firebase/preference_manager/prefernce_manager.dart';
import 'package:flutter/material.dart';

class DemoScreen extends StatefulWidget {
  const DemoScreen({Key? key}) : super(key: key);

  @override
  State<DemoScreen> createState() => _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> {
  var username;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ElevatedButton(
            //   onPressed: () {
            //     PreferenceManager.setUserName("abc");
            //   },
            //   child: Text('Add'),
            // ),
            ElevatedButton(
              onPressed: () async {
                username = await PreferenceManager.getUserName();
                print('HELLO ${PreferenceManager.getUserName()}');
              },
              child: Text('${PreferenceManager.getUserName()}'),
            ),
          ],
        ),
      ),
    );
  }
}
