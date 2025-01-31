import 'package:appium_driver/async_io.dart';
import 'package:flutter_test/flutter_test.dart';

class Loginscreen {

  AppiumWebDriver driver;

  Loginscreen(this.driver);
  
  Future<void> loginWithCredentials(String username, String password) async {
    final emailField = await driver.findElements(AppiumBy.className('android.widget.EditText')).skip(0).first;
    await emailField.click();
    await emailField.sendKeys(username);

    final passwordField = await driver.findElements(AppiumBy.className('android.widget.EditText')).skip(1).first;
    await passwordField.click();
    await passwordField.sendKeys(password);

    await driver.execute("mobile: hideKeyboard", []);

    final loginButton = await driver.findElements(AppiumBy.accessibilityId('Login')).skip(1).first;
    await loginButton.click();
  }

}