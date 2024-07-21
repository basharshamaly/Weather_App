import 'package:flutter/material.dart';
import '../main.dart';
import 'daily_screen.dart';
import 'hourly_screen.dart';

class PlacesScreen extends StatelessWidget {
  final appTitle = 'City Weather';
  const PlacesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: MyHomePage3(title: appTitle),
    ); // MaterialApp
  }
}

class MyHomePage3 extends StatelessWidget {
  final String title;

  const MyHomePage3({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title,style: const TextStyle(color: Colors.black87)),
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.black87),
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
              ListTile(
                  title: const Text('Home'),
                  onTap: () async {
                    String? result = await Navigator.push(
                      context,
                      MaterialPageRoute<String>(
                        builder: (context) =>  const MyHomePage(title: 'Weather App',),
                      ),
                    );
                  }
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
                    String? result = await Navigator.push(
                      context,
                      MaterialPageRoute<String>(
                        builder: (context) => const PlacesScreen(),
                      ),
                    );
                  }
              ),
            ],
          ),
        ),
        body: ListView.builder(
          itemCount: 5,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text('City $index'),
                trailing: const Icon(Icons.sunny,size: 40,color: Colors.yellow),
                subtitle: const Text('25C'),
              ),
            );
          },
        )
//Drawer
    );
  }
}


