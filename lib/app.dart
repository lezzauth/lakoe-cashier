import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Point of Sales",
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  //
                },
                child: Text("Tes"),
              ),
              ElevatedButton(
                onPressed: null,
                child: Text("Tes dsb"),
              ),
              TextField(),
              TextField(),
            ],
          ),
        ),
      ),
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      themeMode: ThemeMode.system,
    );
  }
}
