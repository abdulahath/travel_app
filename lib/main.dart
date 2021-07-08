import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:travel_app/providers/location_data_provider.dart';
import 'package:travel_app/screens/location_list_screen.dart';

void main () async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(TravelApp());
}
class TravelApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: providers,
      child: MaterialApp(
          title: "Travel App",
          theme: ThemeData(appBarTheme: AppBarTheme(backgroundColor: Colors.green)),
          home: LocationListScreen(
          )
      ),
    );
  }
}

List<SingleChildWidget> providers = [
  ChangeNotifierProvider<LocationDataProvider>(create: (_) => LocationDataProvider())
];