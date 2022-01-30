import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tz_auth/features/domain/entities/user_entity/user_entity.dart';
import 'package:tz_auth/features/domain/usecases/user_update_case.dart';

part 'user_update_cubit.freezed.dart';

class UserUpdateCubit extends Cubit<UserUpdateState> {
  final UserUpdateCase userUpdateCase;
  UserUpdateCubit({required this.userUpdateCase})
      : super(UserUpdateState.initial());

  updateUser(
      {required String token,
      String? name,
      String? phone,
      String? email}) async {
    emit(UserUpdateState.loading());
    final result = await userUpdateCase.updateUser(
      token: token,
      name: name,
      email: email,
      phone: phone,
    );
    if (result.error == null) {
      emit(
        UserUpdateState.loaded(
          userEntity: UserEntity(
            name: result.result!.name,
            phone: result.result!.phone,
            email: result.result!.email,
          ),
        ),
      );
    } else {
      emit(UserUpdateState.failed(message: result.error!.message));
    }
  }
}

@freezed
class UserUpdateState with _$UserUpdateState {
  const factory UserUpdateState.initial() = _Initial;
  const factory UserUpdateState.loading() = _Loading;
  const factory UserUpdateState.loaded({required UserEntity userEntity}) =
      _Loaded;
  const factory UserUpdateState.failed({required String message}) = _Failed;
}
