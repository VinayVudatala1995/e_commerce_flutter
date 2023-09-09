import 'package:e_commerce_flutter/Login.dart';
import 'package:e_commerce_flutter/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  group('App bar and Title ', () {
    testWidgets('Check Scafffold', (WidgetTester tester) async {
      //Arrange
      // we are loading our developed login widget into the tester widget
      await tester.pumpWidget(const MaterialApp(home: Login()));

      //Act
      Finder isScaffold = find.byType(Scaffold);

      //Assertion
      expect(isScaffold, findsOneWidget);
    });

    testWidgets('App bar and Title text check', (WidgetTester tester) async {
      //Arrange
      await tester.pumpWidget(const MaterialApp(home: Login()));

      //Act
      Finder appBar_Finder = find.byType(AppBar);
      Finder appBar_Title = find.text('Login');

      //Assertion
      expect(appBar_Finder, findsOneWidget);
      expect(appBar_Title, findsNWidgets(2));
    });
  });

  group('Email and Password Text form field Test cases', () {
    testWidgets('Valid Email ', (WidgetTester tester) async {
//Arrange
      await tester.pumpWidget(const MaterialApp(home: Login()));

//Act
      Finder emailTextFormField =
          find.byKey(const ValueKey('Login_email_text_form'));
      Finder loginButton = find.byType(ElevatedButton);

      await tester.enterText(emailTextFormField, 'vinay@gmail.com');
      await tester.tap(loginButton);

      await tester.pumpAndSettle();

      Finder errorTexts =
          find.text(ErrorStrings().error_message_valid_email_id);

      //Assertion
      expect(errorTexts, findsNothing);
    });
  });

  testWidgets('Email,Password and Button Text Form Field check',
      (WidgetTester tester) async {
    //Arrange
    await tester.pumpWidget(const MaterialApp(home: Login()));

    //Act
    // Finder emailTextFormField =
    //     find.byKey(const ValueKey('Login_email_text_form'));
    // Finder passwordTextFormField =
    //     find.byKey(const ValueKey('Login_password_text_form'));
    Finder textFormField = find.byType(TextFormField);
    Finder loginButton = find.byType(ElevatedButton);

    //Assertion
    expect(textFormField, findsAtLeastNWidgets(1));
    //expect(passwordTextFormField, findsOneWidget);
    expect(loginButton, findsOneWidget);
  });

  testWidgets('Email and Password  Validation  when  nothing entered',
      (WidgetTester tester) async {
    //Arrange
    await tester.pumpWidget(const MaterialApp(home: Login()));

    //Act
    //I want to check whether any form field errors are displaying on button tap

    Finder loginButton = find.byType(ElevatedButton);
    await tester.tap(loginButton);
    await tester.pumpAndSettle();
    Finder errorTexts = find.text(ErrorStrings().error_message_field_required);

    //Assertion
    expect(errorTexts, findsNWidgets(2));
  });

  testWidgets('Invalid Email check', (WidgetTester tester) async {
//Arrange
    await tester.pumpWidget(const MaterialApp(home: Login()));

//Act
    Finder emailTextFormField =
        find.byKey(const ValueKey('Login_email_text_form'));
    Finder loginButton = find.byType(ElevatedButton);

    await tester.enterText(emailTextFormField, 'vinay');
    await tester.tap(loginButton);

    await tester.pumpAndSettle();

    Finder errorTexts = find.text(ErrorStrings().error_message_valid_email_id);
    //Assertion
    expect(errorTexts, findsOneWidget);
  });

  testWidgets('Min Length Password check', (WidgetTester tester) async {
//Arrange
    await tester.pumpWidget(const MaterialApp(home: Login()));

//Act
    Finder emailTextFormField =
        find.byKey(const ValueKey('Login_password_text_form'));
    Finder loginButton = find.byType(ElevatedButton);

    await tester.enterText(emailTextFormField, 'vina');
    await tester.tap(loginButton);

    await tester.pumpAndSettle();

    Finder errorTexts =
        find.text(ErrorStrings().error_message_password_min_characters);
    //Assertion
    expect(errorTexts, findsOneWidget);
  });

  testWidgets('Max Length Password check', (WidgetTester tester) async {
//Arrange
    await tester.pumpWidget(const MaterialApp(home: Login()));

//Act
    Finder emailTextFormField =
        find.byKey(const ValueKey('Login_password_text_form'));
    Finder loginButton = find.byType(ElevatedButton);

    await tester.enterText(emailTextFormField, 'vinayvudatala');
    await tester.tap(loginButton);

    await tester.pumpAndSettle();

    Finder errorTexts =
        find.text(ErrorStrings().error_message_password_max_characters);
    //Assertion
    expect(errorTexts, findsOneWidget);
  });

  testWidgets('Valid Password Format check', (WidgetTester tester) async {
//Arrange
    await tester.pumpWidget(const MaterialApp(home: Login()));

//Act
    Finder emailTextFormField =
        find.byKey(const ValueKey('Login_password_text_form'));
    Finder loginButton = find.byType(ElevatedButton);

    await tester.enterText(emailTextFormField, 'vinayvuda');
    await tester.tap(loginButton);

    await tester.pumpAndSettle();

    Finder errorTexts = find.text(ErrorStrings().error_message_valid_password);
    //Assertion
    expect(errorTexts, findsOneWidget);
  });

  testWidgets(('Valid Email and Valid Password login check'),
      (WidgetTester tester) async {
    //Arrange
    await tester.pumpWidget(const MaterialApp(home: Login()));

    //Act
    Finder emailTextFormField =
        find.byKey(const ValueKey('Login_email_text_form'));
    Finder passwordTextFormField =
        find.byKey(const ValueKey('Login_password_text_form'));
    Finder loginButton = find.byType(ElevatedButton);

    await tester.tap(loginButton);
    await tester.pumpAndSettle();
    Finder errorTexts = find.text(ErrorStrings().error_message_field_required);

    //Assertion
    expect(errorTexts, findsNWidgets(2));

    await tester.enterText(emailTextFormField, 'vinay@gmail.com');
    await tester.tap(loginButton);
    await tester.pumpAndSettle();
    Finder errorTexts1 = find.text(ErrorStrings().error_message_field_required);

    //Assertion
    expect(errorTexts, findsNWidgets(1));

    await tester.enterText(passwordTextFormField, 'Pass@123');
    await tester.tap(loginButton);
    await tester.pumpAndSettle();
    Finder errorTexts_Field_Required =
        find.text(ErrorStrings().error_message_field_required);
    Finder errorTexts_valid_email =
        find.text(ErrorStrings().error_message_valid_email_id);
    Finder errorTexts_valid_password =
        find.text(ErrorStrings().error_message_valid_password);
    Finder errorTexts_valid_password_max_char =
        find.text(ErrorStrings().error_message_password_max_characters);
    Finder errorTexts_valid_password_min_char =
        find.text(ErrorStrings().error_message_password_min_characters);

    //Assertion

    expect(errorTexts_Field_Required, findsNothing);
    expect(errorTexts_valid_email, findsNothing);
    expect(errorTexts_valid_password, findsNothing);
    expect(errorTexts_valid_password_max_char, findsNothing);
    expect(errorTexts_valid_password_min_char, findsNothing);
  });
}
