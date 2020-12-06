import 'package:LoisirProj/controller/utilities/Services.dart';
import 'package:LoisirProj/view/screens/sign/login_screen.dart';

import 'package:flutter_test/flutter_test.dart';


void main() {
  test("empty password returns error string ",(){

    var result = PasswordValidator.validate('');

    expect(result,'Enter your password please!');

  });

  test("non-empty password returns null ",(){

    var result = PasswordValidator.validate('password');

    expect(result,null);

  });

}