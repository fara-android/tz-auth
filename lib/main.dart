import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tz_auth/features/presentation/screens/authorization/email/auth_email_screen.dart';
import 'package:tz_auth/features/presentation/screens/profile/profile.dart';
import 'service_locator.dart' as di;
import 'service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(TzAuth());
}

class TzAuth extends StatefulWidget {
  const TzAuth({Key? key}) : super(key: key);

  @override
  State<TzAuth> createState() => _TzAuthState();
}

class _TzAuthState extends State<TzAuth> {
  @override
  void initState() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: buildMainPage(),
    );
  }

  Widget buildMainPage() {
    var prefs = sl<SharedPreferences>();
    if (prefs.containsKey('token')) {
      return Profile(
          email: prefs.getString('email') ?? '',
          phone: prefs.getString('phone') ?? '',
          name: prefs.getString('name') ?? '');
    }

    return AuthEmail();
  }
}
