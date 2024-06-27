import "/config/config.dart";

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Tic-Tac-Toe",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            brightness: Brightness.dark,
            primarySwatch: Colors.orange,
            primaryColor: Colors.deepPurple,
            useMaterial3: true),
        home: Home(),
        );
    }
}