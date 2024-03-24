
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_playground/screen/modules/news/block/AppCubit.dart';
import 'package:flutter_playground/screen/modules/news/block/AppStates.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleDetails extends StatelessWidget {
  final String url;
  const ArticleDetails(this.url,{super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    var controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {
           cubit.toggleWebViewLoading();
          },
          onPageFinished: (String url) {
            cubit.toggleWebViewLoading();
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(url));

    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state){},
      builder: (context, state) =>
        Scaffold(
          appBar: AppBar(),
          body: Stack(
            children: [
              WebViewWidget(controller: controller),
              if(cubit.isWebViewLoading) Center(child: CircularProgressIndicator())
            ],
          ),
        ),
    );
  }
}
