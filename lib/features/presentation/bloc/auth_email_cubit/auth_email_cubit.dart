import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tz_auth/features/domain/usecases/auth_case.dart';

part 'auth_email_cubit.freezed.dart';

class AuthEmailCubit extends Cubit<AuthEmailState> {
  final AuthCase useCase;
  AuthEmailCubit({required this.useCase}) : super(AuthEmailState.initial());

  getSmsCode(String email) async {
    emit(AuthEmailState.loading());
    final result = await useCase.getSms(email);
    if (result.result?.success ?? false || result.error?.code == 400) {
      emit(AuthEmailState.loaded());
    } else {
      emit(AuthEmailState.failed(message: result.error?.message ?? ''));
    }
  }
}

@freezed
class AuthEmailState with _$AuthEmailState {
  const factory AuthEmailState.initial() = _Initial;
  const factory AuthEmailState.loading() = _Loading;
  const factory AuthEmailState.loaded() = _Loaded;
  const factory AuthEmailState.failed({required String message}) = _Failed;
}
