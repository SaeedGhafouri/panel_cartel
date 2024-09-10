class FormValidator {
  final Map<String, String?> _errors = {};
  Map<String, String?> validateFields(Map<String, String> fields, Map<String, String> rules) {
    _errors.clear();

    fields.forEach((key, value) {
      final rule = rules[key];

      if (rule != null) {
        if (rule.contains('required') && value.isEmpty) {
          _errors[key] = '$key نمیتواند خالی باشد';
        }

        if (rule.contains('numeric') && double.tryParse(value) == null) {
          _errors[key] = '$key باید عددی باشد';
        }
      }
    });

    return _errors;
  }

  bool hasErrors() => _errors.isNotEmpty;

  Map<String, String?> getErrors() => _errors;
}
