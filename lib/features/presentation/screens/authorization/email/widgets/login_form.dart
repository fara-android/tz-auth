import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tz_auth/features/presentation/bloc/auth_email_cubit/auth_email_cubit.dart';
import 'package:tz_auth/features/presentation/screens/authorization/otp/otp_screen.dart';
import 'package:tz_auth/features/presentation/widgets/app_toast.dart';
import 'package:tz_auth/features/presentation/widgets/custom_button.dart';
import 'package:tz_auth/features/presentation/widgets/custom_text_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          CustomTextField(
            controller: emailController,
            icon: Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 32,
            ),
            hintText: "Почта",
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(
            height: 22,
          ),
          BlocConsumer<AuthEmailCubit, AuthEmailState>(
            listener: (context, state) {
              state.maybeWhen(
                orElse: () {},
                loaded: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OtpScreen(
                        email: emailController.text,
                      ),
                    ),
                  );
                },
                failed: (e) {
                  FocusScope.of(context).unfocus();
                  Future.delayed(
                    Duration(milliseconds: 300),
                  ).then(
                    (value) => {
                      emailController.clear(),
                      AppToasts().showBottomToast(e, context, true)
                    },
                  );
                },
              );
            },
            builder: (context, state) {
              return CustomButton(
                onTap: () {
                  BlocProvider.of<AuthEmailCubit>(context)
                      .getSmsCode(emailController.text);
                },
                buttonText: "Выслать Код",
              );
            },
          )
        ],
      ),
    );
  }
}
