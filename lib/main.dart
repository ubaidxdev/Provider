import 'package:db_sql/Provider/count_provider.dart';
import 'package:db_sql/Provider/example_one_provider.dart';
import 'package:db_sql/Provider/favourite_provider.dart';
import 'package:db_sql/Provider/theme_changer_provider.dart';
import 'package:db_sql/Screens/count_exampe.dart';
import 'package:db_sql/Screens/example_one.dart';
import 'package:db_sql/Screens/favourit/favourit_screen.dart';
import 'package:db_sql/Screens/home_screen.dart';
import 'package:db_sql/Screens/stateless_widget/notify_listener.dart';
import 'package:db_sql/Screens/theme/dark_theme.dart';
import 'package:db_sql/Screens/why_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CountProvider()),
        ChangeNotifierProvider(create: (_) => ExampleOneProvider()),
        ChangeNotifierProvider(create: (_) => FavouriteItemsProvider()),
        ChangeNotifierProvider(create: (_) => ThemeChangerProvider()),
      ],
      child: Builder(
        builder: (BuildContext context) {
          final themeChanger = Provider.of<ThemeChangerProvider>(context);
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            themeMode: themeChanger.themeMode,
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              primarySwatch: Colors.red,
              primaryColor: Colors.red,
              iconTheme: IconThemeData(color: Colors.pinkAccent),
            ),
            theme: ThemeData(
                primarySwatch: Colors.red, primaryColor: Colors.redAccent),
            home: NotifyListenerScreen(),
          );
        },
      ),
    );
  }
}

//Single Provider

// return ChangeNotifierProvider(
//       create: (_) => CountProvider(),
//       child: MaterialApp(
//         title: 'Flutter Demo',
//         debugShowCheckedModeBanner: false,
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//         ),
//         home: ExampleOneScreen(),
//       ),
//     );
