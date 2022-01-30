import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tz_auth/features/data/repositories/app_repository.dart';
import 'package:tz_auth/features/data/repositories/auth_code/auth_code_repo_impl.dart';
import 'package:tz_auth/features/data/repositories/update_repo_impl.dart/update_repo_impl.dart';
import 'package:tz_auth/features/domain/repositories/repo_auth_code.dart';
import 'package:tz_auth/features/domain/repositories/repo_update_user.dart';
import 'package:tz_auth/features/domain/usecases/auth_case.dart';
import 'package:tz_auth/features/domain/usecases/auth_code_case.dart';
import 'package:tz_auth/features/domain/usecases/user_update_case.dart';
import 'package:tz_auth/features/presentation/bloc/auth_code_cubit/auth_code_cubit.dart';
import 'package:tz_auth/features/presentation/bloc/auth_email_cubit/auth_email_cubit.dart';
import 'package:tz_auth/features/presentation/bloc/user_update_cubit/cubit/user_update_cubit.dart';

import 'features/data/repositories/auth/auth_repo_impl.dart';
import 'features/domain/repositories/repo_auth.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(
    () => sharedPreferences,
  );
  // Repository
  sl.registerLazySingleton<AppRepository>(
    () => AppRepository(),
  );
  sl.registerLazySingleton<RepoAuth>(
    () => AuthRepoImpl(repository: sl()),
  );
  sl.registerLazySingleton<RepoAuthCode>(
    () => AuthCodeRepoImpl(repository: sl()),
  );
  sl.registerLazySingleton<RepoUpdateUser>(
    () => UpdateRepoImpl(repository: sl()),
  );

  // UseCases
  sl.registerLazySingleton<AuthCase>(
    () => AuthCase(
      repoAuth: sl(),
    ),
  );
  sl.registerLazySingleton<AuthCodeUseCase>(
    () => AuthCodeUseCase(
      repoUser: sl(),
      preferences: sl(),
    ),
  );
  sl.registerLazySingleton<UserUpdateCase>(
    () => UserUpdateCase(
      repoUpdateUser: sl(),
      preferences: sl(),
    ),
  );
  // Bloc / Cubit
  sl.registerFactory(
    () => AuthEmailCubit(
      useCase: sl(),
    ),
  );
  sl.registerFactory(
    () => AuthCodeCubit(
      authCodeUseCase: sl(),
    ),
  );
  sl.registerFactory(
    () => UserUpdateCubit(
      userUpdateCase: sl(),
    ),
  );
}
