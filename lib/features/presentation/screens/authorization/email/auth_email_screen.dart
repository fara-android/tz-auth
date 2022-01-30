import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tz_auth/features/presentation/bloc/auth_email_cubit/auth_email_cubit.dart';
import 'package:tz_auth/features/presentation/screens/authorization/email/widgets/login_form.dart';
import 'package:tz_auth/features/presentation/screens/authorization/email/widgets/text_widget.dart';
import 'package:tz_auth/service_locator.dart';

class AuthEmail extends StatefulWidget {
  const AuthEmail({Key? key}) : super(key: key);

  @override
  _AuthEmailState createState() => _AuthEmailState();
}

class _AuthEmailState extends State<AuthEmail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff7f6fb),
      body: SafeArea(
        child: BlocProvider<AuthEmailCubit>(
          create: (_) => sl<AuthEmailCubit>(),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 24, horizontal: 32),
            child: Column(
              children: [
                Spacer(),
                SizedBox(height: 18),
                TextWidget(),
                SizedBox(height: 24),
                LoginForm(),
                Spacer(),
                SizedBox(height: 20)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
