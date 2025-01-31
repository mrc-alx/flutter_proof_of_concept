import 'package:appium_driver/async_io.dart';
import 'package:flutter_test/flutter_test.dart';
import 'screens/login_screen.dart';

Future<void> main() async {
  late AppiumWebDriver driver;
  
  setUp(() async {
    driver = await createDriver(uri: Uri.parse('http://127.0.0.1:4723/'),
      desired: {
        'platformName': 'android',
        'appium:automationName': 'uiautomator2',
        'appium:app': 'D:\\com.edenred.eq.uta.apk',
        'appium:autoGrantPermissions': true
      });

    driver.timeouts.setImplicitTimeout(Duration(seconds: 10));
  });

  tearDown(() async {
    await driver.quit();
  });

  test('Login using invalid credentials', () async {
    var profileTab = await driver.findElement(AppiumBy.accessibilityId('Profile\nTab 3 of 3'));
    await profileTab.click();

    var loginButton = await driver.findElement(AppiumBy.accessibilityId('Login'));
    await loginButton.click();

    loginButton = await driver.findElement(AppiumBy.accessibilityId('Login'));
    await loginButton.click();

    Loginscreen loginscreen = Loginscreen(driver);
    await loginscreen.loginWithCredentials('username', 'password');

    final errorMessage = await driver.findElement(AppiumBy.accessibilityId('Your credentials are wrong. Please try again.'));
    expect(await errorMessage.displayed, isTrue);
  });

}