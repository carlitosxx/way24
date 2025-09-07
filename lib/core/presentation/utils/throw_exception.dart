import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:way24/core/failures/bad_request.model.dart';
import 'package:way24/core/failures/http_failure.dart';
import 'package:way24/core/presentation/global.i18n.dart';

/// Method Throw an exception
HttpFailure throwException<T>(T ex) {
  if (ex is AuthApiException) {
    switch (ex.code) {
      case 'invalid_credentials':
        return HttpFailure.badRequest(
          BadRequestModel(
            statusCode: int.parse(ex.statusCode ?? '0'),
            message: [kInvalidCredencials.i18n],
            error: ex.code ?? 'invalid_credentials',
          ),
        );

      case 'email_not_confirmed':
        return HttpFailure.badRequest(
          BadRequestModel(
            statusCode: int.parse(ex.statusCode ?? '0'),
            message: [kEmailNotConfirmed.i18n],
            error: ex.code ?? 'email_not_confirmed',
          ),
        );
      case 'expired_token':
        return HttpFailure.badRequest(
          BadRequestModel(
            statusCode: int.parse(ex.statusCode ?? '0'),
            message: [kExpiredToken.i18n],
            error: ex.code ?? 'expired_token',
          ),
        );
      case 'user_not_found':
        return HttpFailure.badRequest(
          BadRequestModel(
            statusCode: int.parse(ex.statusCode ?? '0'),
            message: [kuserNotFound.i18n],
            error: ex.code ?? 'user_not_found',
          ),
        );
      case 'email_already_registered':
        return HttpFailure.badRequest(
          BadRequestModel(
            statusCode: int.parse(ex.statusCode ?? '0'),
            message: [kEmailAlreadyRegistered.i18n],
            error: ex.code ?? 'email_already_registered',
          ),
        );
      case 'email_address_invalid':
        return HttpFailure.badRequest(
          BadRequestModel(
            statusCode: int.parse(ex.statusCode ?? '0'),
            message: [kEmailInvalid.i18n],
            error: ex.code ?? 'email_address_invalid',
          ),
        );
      case 'password_too_weak':
        return HttpFailure.badRequest(
          BadRequestModel(
            statusCode: int.parse(ex.statusCode ?? '0'),
            message: [kPasswordTooWeak.i18n],
            error: ex.code ?? 'password_too_weak',
          ),
        );
      case 'access_denied':
        return HttpFailure.badRequest(
          BadRequestModel(
            statusCode: int.parse(ex.statusCode ?? '0'),
            message: [kAccesDenied.i18n],
            error: ex.code ?? 'access_denied',
          ),
        );
      case 'email_address_not_authorized':
        return HttpFailure.badRequest(
          BadRequestModel(
            statusCode: int.parse(ex.statusCode ?? '0'),
            message: [kEmailNotAuthorized.i18n],
            error: ex.code ?? 'email_address_not_authorized',
          ),
        );
      case 'over_email_send_rate_limit':
        return HttpFailure.badRequest(
          BadRequestModel(
            statusCode: int.parse(ex.statusCode ?? '0'),
            message: [kOverEmailSendRateLimit.i18n],
            error: ex.code ?? 'over_email_send_rate_limit',
          ),
        );
      case 'otp_expired':
        return HttpFailure.badRequest(
          BadRequestModel(
            statusCode: int.parse(ex.statusCode ?? '0'),
            message: [kOtpExpiredOrInvalid.i18n],
            error: ex.code ?? 'otp_expired',
          ),
        );
      case 'same_password':
        return HttpFailure.badRequest(
          BadRequestModel(
            statusCode: int.parse(ex.statusCode ?? '0'),
            message: [kSomePassword.i18n],
            error: ex.code ?? 'same_password',
          ),
        );
      default:
        return HttpFailure.notFound();
    }
  }
  return HttpFailure.server();
}
