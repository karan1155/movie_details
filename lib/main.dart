import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_details/presentation/bloc/movie/bloc.dart';
import 'package:movie_details/presentation/ui/movies_screen.dart';
import 'package:sizer/sizer.dart';

import 'injection_container.dart';

Future main() async{
  await dotenv.load(fileName: '.env');
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => MoviesBloc(
    sl()
  ),
  child: Sizer(
    builder: (context, orientation, deviceType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(

            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const MoviesScreen(),
        );
    }
  ),
);
  }
}
