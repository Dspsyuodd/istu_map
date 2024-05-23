import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../authentication_injection_container.dart';
import '../bloc/authentication_bloc.dart';

class Logout extends StatelessWidget {
  const Logout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthenticationBloc>(),
      child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          return ElevatedButton(
              onPressed: () {
                BlocProvider.of<AuthenticationBloc>(context)
                    .login
                    .tokenRepository
                    .clearStorage();
              },
              child: const Text('Выйти'));
        },
      ),
    );
  }
}
