
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/ui/home/controller/home_controller.dart';
import '/services/http/http_client.dart';


class DependenceInjection extends StatelessWidget {

  final Widget child;

  const DependenceInjection({
    super.key,
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => HomeController()),
      Provider<IHttpClient>(create: (context) => HttpClient()),
    ],
      child: child,
    );
  }
}