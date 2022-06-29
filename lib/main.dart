import 'package:flutter/material.dart';

import 'package:flutter_basics/ui/home/screen/home_page.dart';
import 'package:flutter_basics/ui/home/store/home_store.dart';
import 'package:flutter_basics/utils/app_color.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeStore>(
          create: (context) => HomeStore(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme:
              ColorScheme.fromSwatch().copyWith(primary: AppColor.eastBay),
          scaffoldBackgroundColor: AppColor.aquaSpring,
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        home: HomePage(),
      ),
    );
  }
}
