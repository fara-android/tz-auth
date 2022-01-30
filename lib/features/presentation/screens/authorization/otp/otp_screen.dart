import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tz_auth/features/presentation/bloc/auth_code_cubit/auth_code_cubit.dart';
import 'package:tz_auth/features/presentation/screens/authorization/email/widgets/text_widget.dart';
import 'package:tz_auth/features/presentation/screens/authorization/otp/widgets/code_form.dart';
import 'package:tz_auth/service_locator.dart';

class OtpScreen extends StatefulWidget {
  final String email;
  const OtpScreen({
    Key? key,
    required this.email,
  }) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
        ),
        backgroundColor: Color(0xfff7f6fb),
        elevation: 0,
      ),
      backgroundColor: Color(0xfff7f6fb),
      body: SafeArea(
        child: BlocProvider(
          create: (context) => sl<AuthCodeCubit>(),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 24, horizontal: 32),
            child: Column(
              children: [
                Spacer(),
                SizedBox(height: 24),
                TextWidget(),
                SizedBox(height: 28),
                CodeForm(email: widget.email),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
