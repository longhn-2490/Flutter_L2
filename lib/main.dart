import 'package:flutter/material.dart';
import 'package:flutter_lession_2/theme/text_theme.dart';
import 'package:flutter_lession_2/ui/detail/detail_view_model.dart';
import 'package:flutter_lession_2/ui/home/home_page.dart';
import 'package:provider/provider.dart';

import 'config/routes/app_routes.dart';
import 'data/repository/impl/movie_repository_impl.dart';
import 'di/injector.dart';
import 'ui/home/home_view_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        child: MaterialApp(
          theme: ThemeData(
            textTheme: textTheme,
            appBarTheme: const AppBarTheme(
              foregroundColor: Colors.black,
              backgroundColor: Colors.white,
            ),
          ),
          onGenerateRoute: AppRoutes.onGenerateRoutes,
          debugShowCheckedModeBanner: false,
          home: const HomePage(),
        ),
        providers: [
          Provider<MovieRepositoryImpl>(
            create: (context) => injector(),
          ),
          ChangeNotifierProvider<HomeViewModel>(
            create: (context) => HomeViewModel(injector()),
          ),
          ChangeNotifierProvider<DetailViewModel>(
            create: (context) => DetailViewModel(injector()),
          )
        ]);
  }
}
