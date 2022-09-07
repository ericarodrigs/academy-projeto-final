import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WInappWebView extends StatelessWidget {
  const WInappWebView({required this.url, Key? key}) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    return InAppWebView(
      onEnterFullscreen: (controller) {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeRight,
          DeviceOrientation.landscapeLeft,
        ]);
      },
      onExitFullscreen: (controller) {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitDown,
          DeviceOrientation.portraitUp,
          DeviceOrientation.landscapeRight,
          DeviceOrientation.landscapeLeft,
        ]);
      },
      onPageCommitVisible: (con, uri) {
        con.goBack();
      },
      initialOptions: winAppWebViewGroupOptions(),
      initialUrlRequest: URLRequest(url: Uri.parse(url)),
    );
  }
}

InAppWebViewGroupOptions? winAppWebViewGroupOptions() {
  return InAppWebViewGroupOptions(
    android: AndroidInAppWebViewOptions(
      useHybridComposition: true,
      domStorageEnabled: true,
      databaseEnabled: true,
    ),
    ios: IOSInAppWebViewOptions(
      allowsInlineMediaPlayback: true,
    ),
    crossPlatform: InAppWebViewOptions(
      useShouldOverrideUrlLoading: true,
      mediaPlaybackRequiresUserGesture: false,
    ),
  );
}
