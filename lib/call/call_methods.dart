

import 'call.dart';

class CallMethods {
  //TODO AS SOON AS BACKEND ENDPOINT IS AVAILABLE
  Stream callStream({String uid}) {}

  Future<bool> makeCall({Call call}) async {
    try {
      call.hasDialled = true;
      Map<String, dynamic> hasDialledMap = call.toMap(call);

      call.hasDialled = false;
      Map<String, dynamic> hasNotDialledMap = call.toMap(call);

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> endCall({Call call}) async {
    try {
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
