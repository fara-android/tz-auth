import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tz_auth/features/presentation/screens/authorization/email/auth_email_screen.dart';
import 'package:tz_auth/service_locator.dart';

class LogOut extends StatelessWidget {
  const LogOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Привет!",
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.w400),
        ),
        InkWell(
          onTap: () {
            var prefs = sl<SharedPreferences>();
            prefs.clear();
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => AuthEmail(),
                ),
                (route) => false);
          },
          child: Text(
            "выйти",
            style: TextStyle(
                color: Colors.blue,
                decoration: TextDecoration.underline,
                fontSize: 16),
          ),
        ),
      ],
    );
  }
}
