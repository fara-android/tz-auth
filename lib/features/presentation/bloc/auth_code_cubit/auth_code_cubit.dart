import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tz_auth/features/domain/entities/user_entity/user_entity.dart';
import 'package:tz_auth/features/domain/usecases/auth_code_case.dart';

part 'auth_code_cubit.freezed.dart';

class AuthCodeCubit extends Cubit<AuthCodeState> {
  final AuthCodeUseCase authCodeUseCase;
  AuthCodeCubit({required this.authCodeUseCase})
      : super(AuthCodeState.initial());
  checkSms(String email, String pinCode) async {
    emit(AuthCodeState.loading());
    final result = await authCodeUseCase.checkSms(email, pinCode);
    if (result.error == null) {
      emit(AuthCodeState.loaded(UserEntity(
        email: result.result!.email,
        name: result.result!.name,
        phone: result.result!.phone,
      )));
    } else {
      emit(AuthCodeState.failed(result.error!.message));
    }
  }
}

@freezed
class AuthCodeState with _$AuthCodeState {
  const factory AuthCodeState.initial() = _Initial;
  const factory AuthCodeState.loading() = _Loading;
  const factory AuthCodeState.loaded(UserEntity userEntity) = _Loaded;
  const factory AuthCodeState.failed(String message) = _Failed;
}
