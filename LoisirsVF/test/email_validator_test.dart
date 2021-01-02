import 'package:LoisirProj/controller/utilities/Services.dart';
import 'package:LoisirProj/view/screens/sign/login_screen.dart';

import 'package:flutter_test/flutter_test.dart';


void main() {
  test("empty email returns error string ", () {
    var result = EmailValidator.validate('');

    expect(result, 'Enter your email please!');
  });


  test("non-empty email returns null", () {
    var result = EmailValidator.validate('email');

    expect(result, null);
  });
}