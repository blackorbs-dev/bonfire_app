import 'package:bonfire_app/colors.dart';
import 'package:bonfire_app/screens/quiz_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bonfire App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Proxima',
        scaffoldBackgroundColor: Colors.black,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: AppColors.primary,
          onPrimary: AppColors.onPrimary,
          secondary: AppColors.secondary,
          tertiary: AppColors.tertiary,
          primaryContainer: AppColors.primaryContainer,
          secondaryContainer: AppColors.secondaryContainer,
          tertiaryContainer: AppColors.tertiaryContainer,
          surface: AppColors.surface,
          onSurface: AppColors.onSurface
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(fontSize: 34, fontWeight: FontWeight.bold, color: AppColors.secondary)
        )
      ),
      home: const QuizScreen(),
    );
  }
}