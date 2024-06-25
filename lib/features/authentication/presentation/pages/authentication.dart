import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import '../bloc/authentication_bloc.dart';
import 'authorizaiton_screen.dart';

import '../../authentication_injection_container.dart';

class Authentication extends StatelessWidget {
  const Authentication({Key? key}) : super(key: key);
  Future<void> initGeolocation() async {
    var status = await Permission.location.status;
    if (status.isGranted) return;
    await Permission.location.request();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthenticationBloc>(
      create: (_) => sl<AuthenticationBloc>()..add(const InitEvent()),
      child: BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) async {
          log(state.runtimeType.toString());
          if (state is LoginSuccess) {
            await initGeolocation();
            if (!context.mounted) return;
            Navigator.of(context).pushReplacementNamed('/map');
          }
        },
        child: const AuthorizaitonScreen(),
      ),
    );
  }
}
