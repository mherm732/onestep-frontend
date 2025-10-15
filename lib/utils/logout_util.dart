import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:one_step_app_flutter/screens/register_login_selection.dart';
import '../screens/login_screen.dart';

Future<void> logout(BuildContext context) async {
  const storage = FlutterSecureStorage();
  await storage.delete(key: 'jwt');

  Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(builder: (context) => const AuthSelectionScreen()),
    (route) => false,
  );
}
