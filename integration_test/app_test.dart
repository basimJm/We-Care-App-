import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mapd722_group2_project/main.dart' as app;

void main() {
  group('App Test', () {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();

    testWidgets('Full app test (Register, Login, Create patient)',
        (tester) async {
      app.main();

      await tester.pumpAndSettle();
      await Future.delayed(const Duration(milliseconds: 2000));
      await tester.pumpAndSettle();

      // Register first
      final goToRegisterButton = find.byKey(const Key('goToRegisterButton'));
      final firstNameTextField = find.byKey(const Key('firstNameRegister'));
      final lastNameTextField = find.byKey(const Key('lastNameRegister'));
      final emailTextField = find.byKey(const Key('emailRegister'));
      final passwordTextField = find.byKey(const Key('passwordRegister'));
      final confirmPasswordTextField =
          find.byKey(const Key('confirmPasswordRegister'));
      final registerButton = find.byKey(const Key('buttonRegister'));
      final successOkButton = find.byKey(const Key('successOkButton'));

      await tester.tap(goToRegisterButton);
      await Future.delayed(const Duration(seconds: 1));

      await tester.enterText(firstNameTextField, 'John');
      await Future.delayed(const Duration(seconds: 1));

      await tester.enterText(lastNameTextField, 'Smith');
      await Future.delayed(const Duration(seconds: 1));

      await tester.enterText(emailTextField, 'john@test.com');
      await Future.delayed(const Duration(seconds: 1));

      await tester.enterText(passwordTextField, 'test1234');
      await Future.delayed(const Duration(seconds: 1));

      await tester.enterText(confirmPasswordTextField, 'test1234');
      await Future.delayed(const Duration(seconds: 3));

      await tester.dragUntilVisible(
        registerButton, // what you want to find
        find.byKey(const Key('RegisterScroll')), // widget you want to scroll
        const Offset(-250, 0), // delta to move
      );
      await Future.delayed(const Duration(seconds: 2));
      await tester.tap(registerButton, warnIfMissed: false);
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 1));
      await tester.tap(successOkButton, warnIfMissed: false);
      await Future.delayed(const Duration(seconds: 2));

      // End of Register

      // Then login
      final emailLoginTextField = find.byKey(const Key('emailLogin'));
      final passwordLoginTextField = find.byKey(const Key('passwordLogin'));
      final loginButton = find.byKey(const Key('buttonLogin'));

      await tester.enterText(emailLoginTextField, 'john@test.com');
      await Future.delayed(const Duration(seconds: 1));

      await tester.enterText(passwordLoginTextField, 'test1234');
      await Future.delayed(const Duration(seconds: 1));

      await tester.tap(loginButton);
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));

      // End of login

      // Then tap floating action button to go to create a patient form
      final createPatientFloatButton =
          find.byKey(const Key('createPatientFloatButton'));

      await tester.tap(createPatientFloatButton);
      await Future.delayed(const Duration(seconds: 1));

      // End of Floating action button create patient

      // Create a patient
      final createPatientFirstName =
          find.byKey(const Key('createPatientFirstName'));
      final createPatientLastName =
          find.byKey(const Key('createPatientLastName'));
      final createPatientAddress =
          find.byKey(const Key('createPatientAddress'));
      final createPatientMobile = find.byKey(const Key('createPatientMobile'));
      final createPatientEmail = find.byKey(const Key('createPatientEmail'));
      final clickSelectDateCreatePatient =
          find.byKey(const Key('clickSelectDateCreatePatient'));
      final createPatientSubmitButton =
          find.byKey(const Key('createPatientSubmitButton'));
      final createPatientSuccessOkButton =
          find.byKey(const Key('successOkButton'));

      await tester.enterText(createPatientFirstName, 'David');
      await Future.delayed(const Duration(seconds: 1));

      await tester.enterText(createPatientLastName, 'Hunt');
      await Future.delayed(const Duration(seconds: 1));

      await tester.enterText(createPatientAddress, 'Brampton');
      await Future.delayed(const Duration(seconds: 1));

      await tester.enterText(createPatientMobile, '6475253139');
      await Future.delayed(const Duration(seconds: 1));

      await tester.enterText(createPatientEmail, 'david@test.com');
      await Future.delayed(const Duration(seconds: 1));

      await tester.dragUntilVisible(
        clickSelectDateCreatePatient, // what you want to find
        find.byKey(
            const Key('createPatientScroll')), // widget you want to scroll
        const Offset(-250, 0), // delta to move
      );
      await Future.delayed(const Duration(seconds: 2));
      tester.tap(clickSelectDateCreatePatient);
      await Future.delayed(const Duration(seconds: 2));

      await tester.tap(find.byIcon(Icons.edit));
      await Future.delayed(const Duration(seconds: 2));
      await tester.pumpAndSettle();
      await tester.enterText(find.byType(Dialog), '07/31/1995');
      await Future.delayed(const Duration(seconds: 2));
      await tester.tap(find.text('OK'));
      await Future.delayed(const Duration(seconds: 2));
      await tester.pumpAndSettle();

      // test('datepicker test', () async {
      //   expect(clickSelectDateCreatePatient, findsOneWidget);
      //   tester.tap(clickSelectDateCreatePatient);
      //   await tester.tap(find.text('15'));
      //   await tester.tap(find.text('OK'));
      //   print('October 15 selected and tapped OK');
      // });

      await tester.dragUntilVisible(
        createPatientSubmitButton, // what you want to find
        find.byKey(
            const Key('createPatientScroll')), // widget you want to scroll
        const Offset(-250, 0), // delta to move
      );
      await Future.delayed(const Duration(seconds: 1));
      await tester.tap(createPatientSubmitButton);
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 3));
      await tester.tap(createPatientSuccessOkButton, warnIfMissed: false);
      await Future.delayed(const Duration(seconds: 2));
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 4));

      // End of create patient
    });
  });
}
