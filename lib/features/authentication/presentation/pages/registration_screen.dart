import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:istu_map/features/authentication/presentation/widgets/auth_elevated_button.dart';
import 'package:istu_map/features/authentication/presentation/widgets/auth_screen_template.dart';
import 'package:istu_map/features/authentication/presentation/widgets/authentication_text_field.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  var email = '';
  String? emailErrorMessage;

  var password = '';
  String? passwordErrorMessage;

  var firstName = '';
  String? firstNameErrorMessage;

  var lastName = '';
  String? lastNameErrorMessage;

  @override
  Widget build(BuildContext context) {
    return AuthScreenTemplate(
      content: [
        Align(
          alignment: const Alignment(0, 0.5),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 55),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 31),
                  child: Text(
                    'Регистрация',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AuthenticationTextField(
                      label: 'E-mail',
                      onChanged: (value) {
                        if (emailErrorMessage != null) {
                          setState(() {
                            emailErrorMessage = null;
                          });
                        }
                        email = value;
                      },
                      errorText: emailErrorMessage,
                    ),
                    const Gap(30),
                    AuthenticationTextField(
                      label: 'Пароль',
                      onChanged: (value) {
                        if (passwordErrorMessage != null) {
                          setState(() {
                            passwordErrorMessage = null;
                          });
                        }
                        password = value;
                      },
                      errorText: passwordErrorMessage,
                    ),
                    const Gap(30),
                    Row(
                      children: [
                        Expanded(
                          child: AuthenticationTextField(
                            label: 'Имя',
                            onChanged: (value) {
                              if (firstNameErrorMessage != null) {
                                setState(() {
                                  firstNameErrorMessage = null;
                                });
                              }
                              firstName = value;
                            },
                            errorText: firstNameErrorMessage,
                          ),
                        ),
                        const Gap(10),
                        Expanded(
                          child: AuthenticationTextField(
                            label: 'Фамилия',
                            onChanged: (value) {
                              if (lastNameErrorMessage != null) {
                                setState(() {
                                  lastNameErrorMessage = null;
                                });
                              }
                              lastName = value;
                            },
                            errorText: lastNameErrorMessage,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Gap(30),
                AuthElevatedButton(
                  text: 'Создать аккаунт',
                  onPressed: () {
                    var emailValidate = EmailValidator.validate(email);
                    var passwordValidate = password.length >= 6;
                    var firstNameValidate = firstName.isNotEmpty;
                    var lastNameValidate = lastName.isNotEmpty;
                    if (!emailValidate) {
                      setState(() {
                        emailErrorMessage = 'Неверный адрес электронной почты';
                      });
                    }
                    if (!passwordValidate) {
                      setState(() {
                        passwordErrorMessage = 'Неверный пароль';
                      });
                    }
                    if (!firstNameValidate) {
                      setState(() {
                        firstNameErrorMessage = 'Заполните поле';
                      });
                    }
                    if (!lastNameValidate) {
                      setState(() {
                        lastNameErrorMessage = 'Заполните поле';
                      });
                    }
                    if (emailValidate &&
                        passwordValidate &&
                        firstNameValidate &&
                        lastNameValidate) {
                      Navigator.pushNamed(context, '/authorization');
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
