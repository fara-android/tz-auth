import 'package:tz_auth/features/presentation/bloc/auth_email_cubit/auth_email_cubit.dart';

extension IsLoading on AuthEmailState {
  bool get isLoading => maybeWhen(orElse: () => false, loading: () => true);
}
