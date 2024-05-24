import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pitara/pitara/config/routes/routes.dart';
import 'package:pitara/pitara/config/theme/app_theme.dart';
import 'package:pitara/pitara/quiz/presentation/screens/Homepage.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  try{
    await dotenv.load(fileName: "key.env");
  }catch(e){
    ArgumentError("File Not found: Try creating a key.env file and put it in the root folder and add - key.env in assets in pubspec.yaml");
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: appTheme(),
      onGenerateRoute: AppRoutes.onGenerateRoutes,
      home: HomePage()
    );
  }
}
