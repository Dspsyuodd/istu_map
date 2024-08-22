import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:gap/gap.dart';
import 'package:istu_map/features/authentication/presentation/pages/istu_oauth_page.dart';
import '../../domain/entities/user_data.dart';
import '../../domain/entities/user_dto.dart';
import '../bloc/authentication_bloc.dart';
import 'registration_page.dart';
import '../widgets/auth_elevated_button.dart';
import '../widgets/auth_screen_template.dart';
import '../widgets/authentication_text_field.dart';
import '../widgets/login_via_lk_button.dart';

class AuthorizaitonPage extends StatefulWidget {
  const AuthorizaitonPage({Key? key}) : super(key: key);

  @override
  State<AuthorizaitonPage> createState() => _AuthorizaitonPageState();
}

class _AuthorizaitonPageState extends State<AuthorizaitonPage> {
  var _email = '';
  String? _emailErrorMessage;

  var _password = '';
  String? _passwordErrorMessage;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
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
                          controller: _emailController,
                          label: 'E-mail',
                          onChanged: (value) {
                            if (_emailErrorMessage != null) {
                              setState(() {
                                _emailErrorMessage = null;
                              });
                            }
                            _email = value;
                          },
                          errorText: _emailErrorMessage,
                        ),
                        const Gap(30),
                        AuthenticationTextField(
                          controller: _passwordController,
                          obscureText: true,
                          label: 'Пароль',
                          onChanged: (value) {
                            if (_passwordErrorMessage != null) {
                              setState(() {
                                _passwordErrorMessage = null;
                              });
                            }
                            _password = value;
                          },
                          errorText: _passwordErrorMessage,
                        )
                      ],
                    ),
                    const Gap(30),
                    AuthElevatedButton(
                      text: 'Войти',
                      onPressed: () {
                        var emailValidate = EmailValidator.validate(_email);
                        var passwordValidate =
                            _password.length >= 6 && !_password.contains(' ');
                        if (!emailValidate) {
                          setState(() {
                            _emailErrorMessage =
                                'Неверный адрес электронной почты';
                          });
                        }
                        if (!passwordValidate) {
                          setState(() {
                            _passwordErrorMessage = 'Неверный пароль';
                          });
                        }
                        if (emailValidate && passwordValidate) {
                          BlocProvider.of<AuthenticationBloc>(context).add(
                            LoginEvent(UserData(
                                userDto: UserDto(
                                    email: _email, password: _password))),
                          );
                        }
                      },
                    ),
                    InkWell(
                      onTap: () async {
                        var result =
                            await Navigator.of(context).push<(String, String)?>(
                          MaterialPageRoute(
                            builder: (_) => BlocProvider.value(
                              value:
                                  BlocProvider.of<AuthenticationBloc>(context),
                              child: const RegistrationPage(),
                            ),
                          ),
                        );
                        if (result != null) {
                          setState(() {
                            _email = result.$1;
                            _emailController.text = _email;
                            _password = result.$2;
                            _passwordController.text = _password;
                          });
                        }
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
                    LoginViaLkButton(
                      onPressed: () async {
                        WebUri? callbackUrl = await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const IstuOauthPage(),
                          ),
                        );
                        if (callbackUrl != null && context.mounted) {
                          BlocProvider.of<AuthenticationBloc>(context)
                              .add(OauthEvent(callbackUrl));
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
            if (state is AuthenticationLoading)
              Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                ),
                child: const Center(child: CircularProgressIndicator()),
              )
          ],
        );
      },
    );
  }
}
