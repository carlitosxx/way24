import 'package:custom_widgets/custom_widgets.dart';
import 'package:way24/core/failures/http_failure.dart';
import 'package:way24/core/failures/local_failure.dart';
import 'package:way24/core/presentation/global.i18n.dart';
import 'package:way24/core/presentation/utils/error_mapping.dart';

/// Mapea las fallas a una cadena
ErrorMapping failureToString(HttpFailure failure) {
  return failure.when(
    network: () => ErrorMapping(
      messageError: kNoNetworkMessage.i18n,
      painter: NoConectionCP(),
      titleError: kWarning.i18n,
    ),
    notFound: () => ErrorMapping(
      messageError: kNotFoundMessage.i18n,
      painter: WarningCP(),
      titleError: kWarning.i18n,
    ),
    server: () => ErrorMapping(
      messageError: kServerMessage.i18n,
      painter: WarningCP(),
      titleError: kWarning.i18n,
    ),
    forbidden: () => ErrorMapping(
      messageError: kForbiddenMessage.i18n,
      painter: WarningCP(),
      titleError: kWarning.i18n,
    ),
    unauthorized: () => ErrorMapping(
      messageError: kUnauthorizedMessage.i18n,
      painter: WarningCP(),
      titleError: kWarning.i18n,
    ),
    badRequest: (error) {
      if (error.message.isNotEmpty) {
        final errorMessage = error.message.join('\n');
        return ErrorMapping(
          messageError: errorMessage,
          painter: WarningCP(),
          titleError: kAlert.i18n,
        );
      }
      return ErrorMapping(
        messageError: kNotMessageError.i18n,
        painter: WarningCP(),
        titleError: kWarning.i18n,
      );
    },
    local: () => ErrorMapping(
      messageError: kLocal.i18n,
      painter: WarningCP(),
      titleError: kWarning.i18n,
    ),
  );
}

/// local failure to string
ErrorMapping localFailureToString(LocalFailure failure) {
  return failure.when(
    sharedPreferences: () => ErrorMapping(
      messageError: kLocal.i18n,
      painter: WarningCP(),
      titleError: kWarning.i18n,
    ),
  );
}
