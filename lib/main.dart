import 'package:fahrplanauskunft/config/providers/start_point_provider.dart';
import 'package:fahrplanauskunft/config/routes/app_routes.dart';
import 'package:fahrplanauskunft/core/constants/constants.dart';
import 'package:fahrplanauskunft/features/search/presentation/screens/home/home_screen.dart';
import 'package:fahrplanauskunft/utils/app_context.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'locator.dart';

void main() async {
  await initializeDependencies();

  runApp(
    ChangeNotifierProvider(
      create: (context) => StartPointProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: locator<AppContext>().navigatorKey,
      onGenerateRoute: AppRoutes.onGenerateRoutes,
      title: APP_NAME,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: COLOR_PURPLE),
        useMaterial3: true,
        fontFamily: 'Opensans',
      ),
      home: const HomeScreen(),
    );
  }
}
