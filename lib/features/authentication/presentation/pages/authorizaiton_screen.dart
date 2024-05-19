import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:istu_map/features/authentication/presentation/widgets/auth_elevated_button.dart';
import 'package:istu_map/features/authentication/presentation/widgets/auth_screen_template.dart';
import 'package:istu_map/features/authentication/presentation/widgets/authentication_text_field.dart';
import 'package:istu_map/features/authentication/presentation/widgets/login_via_lk_button.dart';

class AuthorizaitonScreen extends StatefulWidget {
  const AuthorizaitonScreen({Key? key}) : super(key: key);

  @override
  State<AuthorizaitonScreen> createState() => _AuthorizaitonScreenState();
}

class _AuthorizaitonScreenState extends State<AuthorizaitonScreen> {
  var email = '';
  String? emailErrorMessage;

  var password = '';
  String? passwordErrorMessage;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AuthScreenTemplate(
      content: [
        Align(
          alignment: const Alignment(0, 0.4),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 55),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 31),
                  child: Text(
                    'Вход',
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
                    )
                  ],
                ),
                const Gap(30),
                AuthElevatedButton(
                  text: 'Войти',
                  onPressed: () {
                    if (EmailValidator.validate(email)) {
                      if (password.length >= 6) {
                        Navigator.of(context).pushReplacementNamed('/map');
                      } else {
                        setState(() {
                          passwordErrorMessage = 'Неверный пароль';
                        });
                      }
                    } else {
                      setState(() {
                        emailErrorMessage = 'Неверный адрес электронной почты';
                      });
                    }
                  },
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed('/registration');
                  },
                  child: const Text(
                    'Создать аккаунт',
                    style: TextStyle(
                      color: Colors.grey,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.grey,
                    ),
                  ),
                ),
                const Gap(10),
                const LoginViaLkButton(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
