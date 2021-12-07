import 'package:loan_app/core/core.dart';

extension I18n on String {
  String tr({Map<String, String>? values}) {
    return IntegrationIOC.getL10n().translate(
      this,
      values: values,
    );
  }
}
