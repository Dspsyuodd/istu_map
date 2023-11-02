import 'package:common/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class UncaughtException extends StatefulWidget {
  const UncaughtException(
      {Key? key, required this.uncaughtExceptions, required this.child})
      : super(key: key);

  final Stream<void> uncaughtExceptions;
  final Widget child;

  @override
  State<UncaughtException> createState() => _UncaughtExceptionState();
}

class _UncaughtExceptionState extends State<UncaughtException> {
  final _errors = <(Object, StackTrace)>[];

  @override
  void initState() {
    widget.uncaughtExceptions.listen(
      (event) {},
      onError: (Object error, StackTrace stackTrace) {
        setState(() {
          _errors.insert(0, (error, stackTrace));
        });
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_errors.isEmpty) return widget.child;
    if (kDebugMode) return _DebugFailed(errors: _errors);
    return _Failed(errors: _errors);
  }
}

class _DebugFailed extends StatelessWidget {
  const _DebugFailed({Key? key, required this.errors}) : super(key: key);
  final List<(Object, StackTrace)> errors;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colorScheme.error,
      body: DefaultTextStyle(
        style: TextStyle(color: colorScheme.onError),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: ListView(
            children: [
              for (final (index, (error, stackTrase)) in errors.indexed) ...[
                if (index != 0) ...[
                  const Divider(),
                ],
                Text(error.toString()),
                const SizedBox(height: 20),
                Text(stackTrase.toString()),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _Failed extends StatelessWidget {
  const _Failed({Key? key, required this.errors}) : super(key: key);
  final List<(Object, StackTrace)> errors;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(Strings.uncaughtExceptionTitle),
        ),
      ),
    );
  }
}
