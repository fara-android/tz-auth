import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:tz_auth/features/presentation/bloc/auth_code_cubit/auth_code_cubit.dart';
import 'package:tz_auth/features/presentation/screens/profile/profile.dart';
import 'package:tz_auth/features/presentation/widgets/app_toast.dart';
import 'package:tz_auth/features/presentation/widgets/custom_button.dart';

class CodeForm extends StatefulWidget {
  final String email;
  const CodeForm({Key? key, required this.email}) : super(key: key);

  @override
  State<CodeForm> createState() => _CodeFormState();
}

class _CodeFormState extends State<CodeForm> {
  TextEditingController pinController = TextEditingController();
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    focusNode.requestFocus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          PinCodeTextField(
            focusNode: focusNode,
            controller: pinController,
            appContext: context,
            length: 6,
            keyboardType: TextInputType.number,
            cursorColor: Colors.purple,
            onChanged: (_) {},
            onTap: () {
              pinController.clear();
            },
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(12),
              inactiveColor: Colors.grey,
              activeColor: Colors.purple,
              selectedColor: Colors.grey,
            ),
          ),
          SizedBox(
            height: 22,
          ),
          BlocConsumer<AuthCodeCubit, AuthCodeState>(
            listener: (context, state) {
              state.maybeWhen(
                  orElse: () {},
                  loaded: (entity) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Profile(
                          name: entity.name ?? '',
                          phone: entity.phone ?? '',
                          email: entity.email ?? '',
                        ),
                      ),
                    );
                  },
                  failed: (message) {
                    focusNode.unfocus();
                    AppToasts().showBottomToast(message, context, true);
                    Future.delayed(
                      Duration(seconds: 3),
                    ).then(
                      (value) => {
                        focusNode.requestFocus(),
                      },
                    );
                  });
            },
            builder: (context, state) {
              return CustomButton(
                  onTap: () {
                    BlocProvider.of<AuthCodeCubit>(context).checkSms(
                      widget.email,
                      pinController.text,
                    );
                  },
                  buttonText: "Подтвердть");
            },
          )
        ],
      ),
    );
  }
}
