import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:istu_map/config/constants/api_constants.dart';

class IstuOauth extends StatelessWidget {
  const IstuOauth({super.key, this.body});
  final Widget? body;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InAppWebView(
        shouldOverrideUrlLoading: (controller, navigationAction) async {
          if (navigationAction.request.url?.path ==
              ApiConstants.canselUriPath) {
            Navigator.of(context).pop(navigationAction.request.url);
            return NavigationActionPolicy.CANCEL;
          }
          return NavigationActionPolicy.ALLOW;
        },
        initialUrlRequest: URLRequest(
          url: WebUri(ApiConstants.istuLogin),
        ),
      ),
    );
  }
}
