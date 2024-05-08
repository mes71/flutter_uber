import 'package:connectivity_plus/connectivity_plus.dart';

Future<bool> checkConnectivity() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult.contains(ConnectivityResult.mobile) ||
      connectivityResult.contains(ConnectivityResult.wifi) ||
      connectivityResult.contains(ConnectivityResult.ethernet)) {
    return true;
  } else {
    return false;
  }
}
