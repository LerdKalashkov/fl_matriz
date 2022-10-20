import 'package:flutter/material.dart';
import 'package:fl_matriz/screens/screens.dart';

import 'package:provider/provider.dart';
import 'package:fl_matriz/providers/providers.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginFormProvider()),
        ChangeNotifierProvider(create:(_) => ButtomColoursProvider()),
        ChangeNotifierProvider(create:(_) => MatrixFunctionsProvider())
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          ///PENDIENTE TERMINAR LOS THEMAS DE LA APP
          ),
      initialRoute: 'login',
      routes: {
        'home' : (context) => const HomeScreen(),
        'login': (context) => const LoginScreen()
      },
    );
  }
}
