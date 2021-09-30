

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/call/call_methods.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/chat/videochat_screen.dart';
import 'package:permission_handler/permission_handler.dart';

import '../call.dart';

class PickupScreen extends StatelessWidget {
  final Call call;
  final CallMethods callMethods = CallMethods();

  PickupScreen({
    @required this.call,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Incoming...",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            SizedBox(height: 50),
            CachedNetworkImage(
             imageUrl: call.callerPic,
              height: 150,
              width: 150,
            ),
            SizedBox(height: 15),
            Text(
              call.callerName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 75),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.call_end),
                  color: Colors.redAccent,
                  onPressed: () async {
                    await callMethods.endCall(call: call);
                  },
                ),
                SizedBox(width: 25),
                IconButton(
                  icon: Icon(Icons.call),
                  color: Colors.green,
                  onPressed: () async =>
                      await [Permission.microphone, Permission.camera].request() != null
                          ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => VideoChatScreen(call: call),
                              ),
                            )
                          : {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
