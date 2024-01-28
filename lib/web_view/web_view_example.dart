import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';



class WebViewExample extends StatefulWidget {
  const WebViewExample({super.key});

  static const String kLocalExamplePage = '''
<!DOCTYPE html>
<html lang="en">
<head>
<title>Load file or HTML string example</title>
</head>
<body>

<h1>Local demo page</h1>
<p>
  This is an example page used to demonstrate how to load a local file or HTML
  string using the <a href="https://pub.dev/packages/webview_flutter">Flutter
  webview</a> plugin.
</p>

</body>
</html>
''';

  @override
  State<WebViewExample> createState() => _WebViewExampleState();
}

class _WebViewExampleState extends State<WebViewExample> {
  var loadingvalue=0;
  late WebViewController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            setState(() {
              loadingvalue=0;
            });
          },
          onProgress: (int progress) {
            setState(() {
              loadingvalue=progress;
            });
          },
          onPageFinished: (String url) {
            setState(() {
              loadingvalue=100;
            });
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.amazon.com') || request.url.contains('facebook.com')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://google.com'));
    // ..loadHtmlString(kLocalExamplePage);

  }

  Future<void> launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

   callLuncher(Uri url) {
    launchInBrowser(url);
  }

  @override
  Widget build(BuildContext context) {
    final Uri toLaunch =
    Uri(scheme: 'https', host: 'www.google.com', path: '/');

    return Scaffold(
      appBar: AppBar(
          title: const Expanded(
            flex: 1,
              child: Text('WebView')
          ),
          actions: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    _controller.goBack();
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_forward),
                  onPressed: () {
                    _controller.goForward();
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.refresh),
                  onPressed: () {
                    _controller.reload();
                  },
                ),

              ],
            )
          ],
      ),
      body: Stack(
        children:[
          WebViewWidget(
          controller: _controller,
        ),
          if(loadingvalue<100)
            LinearProgressIndicator(
              value: loadingvalue/100,
            ),
          // if(loadingvalue<100)
          // Center(
          //   child: CircularProgressIndicator(
          //     value: loadingvalue/100,
          //   ),
          // ),

          Positioned(
            bottom: 0,
            child: Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  TextButton(onPressed:(){
                    launchInBrowser(toLaunch);
                    } , child: const Text('Open in browser')),
                  TextButton(onPressed:(){
                    Share.share(toLaunch.toString());
                    } , child: const Text('share'))
                ],
              ),
            ),
          )
        ]

      ),

      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     launchInBrowser(toLaunch);
      //   },
      //   child: const Icon(Icons.open_in_browser),
      // ),
    );
  }
}
