import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:roome/src/core/api/status_codes.dart';
import 'package:roome/src/core/errors/failure.dart';
import 'package:roome/src/core/utils/app_strings.dart';

class ServerFailure extends Failure {
  ServerFailure({String? errorMessage}) : super(errorMessage: errorMessage);

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errorMessage: 'Connection Timeout With ApiServer');

      case DioExceptionType.sendTimeout:
        return ServerFailure(errorMessage: 'Send Timeout With ApiServer');

      case DioExceptionType.receiveTimeout:
        return ServerFailure(errorMessage: 'Receive Timeout With ApiServer');

      case DioExceptionType.badCertificate:
        return ServerFailure(
            errorMessage: 'Your request not found, please try again later!');

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioException.response!.statusCode!,
          dioException.response!.data,
        );

      case DioExceptionType.cancel:
        return ServerFailure(errorMessage: 'Request to ApiServer was canceled');

      case DioExceptionType.connectionError:
        return ServerFailure(errorMessage: AppStrings.noInternet);

      case DioExceptionType.unknown:
        return ServerFailure(
          errorMessage: "Unexpected Error, please try again!",
        );

      default:
        return ServerFailure(errorMessage: AppStrings.opps);
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    final parsedResponse = jsonDecode(response);

    if (statusCode == StatusCodes.badRequest ||
        statusCode == StatusCodes.unAuthorized ||
        statusCode == StatusCodes.forbidden) {
      return ServerFailure(errorMessage: parsedResponse['message']);
    } else if (statusCode == StatusCodes.internalServerError) {
      return ServerFailure(errorMessage: parsedResponse['error']);
    }
    return ServerFailure(errorMessage: AppStrings.opps);
  }
}
