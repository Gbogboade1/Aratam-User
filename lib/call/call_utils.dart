

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/call/call.dart';
import 'package:flutter_sixvalley_ecommerce/call/call_methods.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/user_info_model.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/chat/videochat_screen.dart';


class CallUtils {
  static final CallMethods callMethods = CallMethods();

  static dial({UserInfoModel from, UserInfoModel to, context}) async {
    Call call = Call(
      callerId: from.id.toString(),
      callerName: from.name,
      callerPic: from.image,
      receiverId: to.id.toString(),
      receiverName: to.name,
      receiverPic: to.image,
      channelId: Random().nextInt(1000).toString(),
    );

    bool callMade = await callMethods.makeCall(call: call);

    call.hasDialled = true;

    if (callMade) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VideoChatScreen(call: call),
          ));
    }
  }
}
