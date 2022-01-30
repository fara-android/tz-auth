import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tz_auth/features/presentation/bloc/user_update_cubit/cubit/user_update_cubit.dart';
import 'package:tz_auth/features/presentation/screens/profile/widgets/log_out.dart';
import 'package:tz_auth/features/presentation/widgets/app_toast.dart';
import 'package:tz_auth/features/presentation/widgets/custom_button.dart';
import 'package:tz_auth/features/presentation/widgets/custom_text_field.dart';
import 'package:tz_auth/service_locator.dart';

class Profile extends StatefulWidget {
  final String email;
  final String phone;
  final String name;
  const Profile({
    Key? key,
    required this.email,
    required this.phone,
    required this.name,
  }) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  final updateCubit = sl<UserUpdateCubit>();
  final prefs = sl<SharedPreferences>();

  @override
  void initState() {
    nameController.text = widget.name;
    phoneController.text = widget.phone;
    emailController.text = widget.email;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(height: 12),
              LogOut(),
              BlocProvider<UserUpdateCubit>(
                create: (context) => updateCubit,
                child: BlocListener<UserUpdateCubit, UserUpdateState>(
                  listener: (context, state) {
                    state.maybeWhen(
                      orElse: () {},
                      loaded: (entity) {
                        emailController.text = entity.email!;
                        nameController.text = entity.name!;
                        phoneController.text = entity.phone!;
                        AppToasts().showBottomToast(
                          'Данные успешно сохранены',
                          context,
                        );
                        FocusScope.of(context).requestFocus(FocusNode());
                      },
                      failed: (e) {
                        AppToasts().showBottomToast(e, context, true);
                        FocusScope.of(context).requestFocus(FocusNode());
                      },
                    );
                  },
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: nameController,
                        hintText: 'Имя',
                      ),
                      CustomTextField(
                        controller: phoneController,
                        hintText: 'Телефон',
                      ),
                      CustomTextField(
                        controller: emailController,
                        hintText: 'Почта',
                      ),
                    ],
                  ),
                ),
              ),
              CustomButton(
                  onTap: () {
                    updateCubit.updateUser(
                      token: prefs.getString('token') ?? '',
                      email: emailController.text,
                      name: nameController.text,
                      phone: phoneController.text,
                    );
                  },
                  buttonText: "Сохранить"),
            ],
          ),
        ),
      ),
    );
  }
}
