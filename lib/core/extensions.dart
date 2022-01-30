import 'package:dio/dio.dart';

extension DioErrorUtils on Object {
  String get dioErrorMessage {
    var output = '';
    if (this is! DioError) return output;
    final error = this as DioError;
    if (error.response?.statusCode == 422) {
      final Map? errorsMap = error.response?.data['error'];
      if (errorsMap == null) {
        return output;
      } else {
        output = errorsMap['message'];
      }
    } else if (error.response?.statusCode == 500) {
      final Map? errorsMap = error.response?.data['error'];
      if (errorsMap == null) {
        return output;
      } else {
        output = errorsMap['message'];
      }
    } else if (error.response?.statusCode == 520) {
      final Map? errorsMap = error.response?.data['error'];
      if (errorsMap == null) {
        return output;
      } else {
        output = errorsMap['message'];
      }
    }

    return output;
  }

  int? get dioErrorStatusCode {
    int? output;
    if (this is! DioError) return output;
    if ((this as DioError).type == DioErrorType.other) return 520;
    return (this as DioError).response?.statusCode;
  }
}
