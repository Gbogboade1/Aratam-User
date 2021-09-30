import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/call/pickup/pickup_screen.dart';
import 'package:flutter_sixvalley_ecommerce/utill/app_constants.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../call.dart';
import '../call_methods.dart';

class PickupLayout extends StatelessWidget {
  final Widget scaffold;
  final CallMethods callMethods = CallMethods();
  final SharedPreferences sharedPreferences;

  PickupLayout({
    @required this.scaffold,
    this.sharedPreferences,
  });

  String get uid => sharedPreferences.getString(AppConstants.USER_ID) ?? '';
  @override
  Widget build(BuildContext context) {
    return (uid != null)
        ? StreamBuilder(
            stream: callMethods.callStream(uid: uid),
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data.data != null) {
                Call call = Call.fromMap(snapshot.data.data);

                if (!call.hasDialled) {
                  return PickupScreen(call: call);
                }
              }
              return scaffold;
            },
          )
        : Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
  }
}
