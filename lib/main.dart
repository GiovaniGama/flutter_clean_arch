import 'package:flutter/material.dart';
import 'package:flutter_clean_arch/routing/router.dart';
import 'package:flutter_clean_arch/utils/dependencies.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [...providers],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Meu consultor de CEP',
        routerConfig: AppRouter().router,
      ),
    );
  }
}
