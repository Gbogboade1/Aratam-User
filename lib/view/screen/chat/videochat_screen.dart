import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/call/call.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/seller_model.dart';
import 'package:flutter_sixvalley_ecommerce/utill/app_constants.dart';
import 'package:permission_handler/permission_handler.dart';

// ignore: must_be_immutable
class VideoChatScreen extends StatefulWidget {
  final SellerModel seller;
  final Call call;

  VideoChatScreen({Key key, this.call, this.seller}) : super(key: key);

  static String get appUid => AppConstants.appId;
  static String get token => AppConstants.token;

  @override
  State<VideoChatScreen> createState() => _VideoChatScreenState();
}

class _VideoChatScreenState extends State<VideoChatScreen> {
  @override
  Widget build(BuildContext context) {
    AgoraClient client = AgoraClient(
      agoraConnectionData: AgoraConnectionData(
        appId: VideoChatScreen.appUid,
        tempToken: VideoChatScreen.token,
        channelName: widget.seller.id.toString(),
      ),
      enabledPermission: [
        Permission.camera,
        Permission.microphone,
      ],
    );
    return Scaffold(
      body: Stack(
        children: [
          AgoraVideoViewer(
            client: client,
            layoutType: Layout.grid,
            showNumberOfUsers: true,
          ),
          AgoraVideoButtons(
            client: client,
          ),
        ],
      ),
    );
  }
}
