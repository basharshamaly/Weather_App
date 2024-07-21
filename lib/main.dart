import 'package:flutter/material.dart';
import 'package:weather_app/screens/daily_screen.dart';
import 'package:weather_app/screens/hourly_screen.dart';

// function to trigger app build
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  final appTitle = 'Weather App';

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: MyHomePage(title: appTitle),
    ); // MaterialApp
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title,style: const TextStyle(color: Colors.black87)),
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black87),
        elevation: 0,
      ),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ), //BoxDecoration
              child: UserAccountsDrawerHeader(
                accountName: Text(
                  "Weather App",
                  style: TextStyle(fontSize: 18),
                ),
                accountEmail: Text(""),
              ), //UserAccountDrawerHeader
            ), //DrawerHeader
            const ListTile(
              title: Text('Home'),
            ),
            ListTile(
              title: const Text('Hourly Forecast'),
                onTap: () async {
                  // dynamic result = await Navigator.pushNamed(context, '/contact_us_screen');
                  String? result = await Navigator.push(
                    context,
                    MaterialPageRoute<String>(
                      builder: (context) => const HourlyForecast(),
                    ),
                  );
                }
            ),
            ListTile(
              title: const Text('Daily Forecast'),
                onTap: () async {
                  // dynamic result = await Navigator.pushNamed(context, '/contact_us_screen');
                  String? result = await Navigator.push(
                    context,
                    MaterialPageRoute<String>(
                      builder: (context) => const DailyForecast(),
                    ),
                  );
                }
            ),
            ListTile(
              title: const Text('Places'),
                onTap: () async {
                  // dynamic result = await Navigator.pushNamed(context, '/contact_us_screen');
                }
            ),
          ],
        ),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
          Text('London',style: TextStyle(fontSize: 25)),
          SizedBox(height: 10),
          Icon(Icons.sunny,color: Colors.yellow,size: 45) ,
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Text('7',style: TextStyle(fontSize: 20)),
          ),
          Text('Light rain')
        ]),
      ),//Drawer
    );
  }
}