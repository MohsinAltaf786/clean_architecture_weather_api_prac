import 'package:clean_artchitecture_weather_api_prac/features/presentation/bloc/weather_bloc.dart';
import 'package:clean_artchitecture_weather_api_prac/init_dependency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/theme/app_theme.dart';
import 'features/presentation/pages/home_page.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(MultiBlocProvider(providers:[
    BlocProvider(create: (_)=>serviceLocater<WeatherBloc>())
  ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightTheme,
      home: const HomePage(),
    );
  }
}

