abstract class AppValidator {
  String? validator(String? value);
}

//  TEXT VALIDATOR
class TextValidator extends AppValidator {
  @override
  validator(String? value) {
    if (value == null || value.isEmpty) {
      return "Please Enter this field";
    } else {
      return null;
    }
  }
}