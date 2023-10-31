import 'package:permission_handler/permission_handler.dart';

class PermissionManager {
  static Future<void> requestLocationPermission() async {
    final status = await Permission.location.status;
    if (status.isRestricted || status.isDenied || status.isLimited) {
      await Permission.location.request();
    }
  }
}
