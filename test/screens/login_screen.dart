import 'package:appium_driver/async_io.dart';
import 'package:flutter_test/flutter_test.dart';

class Loginscreen {

  AppiumWebDriver driver;
  late AppiumWebElement emailField;
  late AppiumWebElement passwordField;
  late AppiumWebElement loginButton;

  Loginscreen(this.driver);

  init() async {
    emailField = await driver.findElements(AppiumBy.className('android.widget.EditText')).skip(0).first;
    passwordField = await driver.findElements(AppiumBy.className('android.widget.EditText')).skip(1).first;
    loginButton = await driver.findElements(AppiumBy.accessibilityId('Login')).skip(1).first;
  }
  
  Future<void> loginWithCredentials(String username, String password) async {
    await emailField.click();
    await emailField.sendKeys(username);

    await passwordField.click();
    await passwordField.sendKeys(password);

    await driver.execute("mobile: hideKeyboard", []);
    await loginButton.click();
  }

}