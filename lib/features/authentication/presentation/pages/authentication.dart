import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:istu_map/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:istu_map/features/authentication/presentation/pages/authorizaiton_screen.dart';

import '../../authentication_injection_container.dart';

class Authentication extends StatelessWidget {
  const Authentication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthenticationBloc>(
      create: (_) => sl<AuthenticationBloc>()..add(const InitEvent()),
      child: BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            Navigator.of(context).pushReplacementNamed('/map');
          }
        },
        child: const AuthorizaitonScreen(),
      ),
    );
  }
}
