import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Application',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        child: ListView(
          children: [
            imageSection,
            titleSection,
            activitySection,
            textSection,
          ],
        ),
      ),
    );
  }
}

Widget imageSection = Image.asset(
  'images/lake.jpg',
  width: 600,
  height: 240,
  fit: BoxFit.cover,
);

Widget starsSection = Row(
  mainAxisSize: MainAxisSize.min,
  children: [
    Icon(
      Icons.star,
      color: Colors.red[500],
    ),
    const Text("41"),
  ],
);

Widget titleSection = Container(
  padding: const EdgeInsets.all(32),
  child: Expanded(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Oeschinen Lake Campground",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "Kandersteg, Switzerland",
              style: TextStyle(color: Colors.grey[500]),
            )
          ],
        ),
        starsSection,
      ],
    ),
  ),
);

Widget generateIcon(IconData icon, String title,
    {Color iconColor = Colors.blue}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(icon, color: iconColor),
      Container(
        padding: const EdgeInsets.only(top: 8.0),
        child: Text(
          title,
          style: TextStyle(color: iconColor),
        ),
      ),
    ],
  );
}

Widget activitySection = Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    generateIcon(Icons.phone, 'CALL'),
    generateIcon(Icons.near_me, 'ROUTE'),
    generateIcon(Icons.share, 'SHARE'),
  ],
);

Widget textSection = Container(
  padding: const EdgeInsets.all(32),
  child: const Text(
    'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
    'Alps. Situated 1,578 meters above sea level, it is one of the '
    'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
    'half-hour walk through pastures and pine forest, leads you to the '
    'lake, which warms to 20 degrees Celsius in the summer. Activities '
    'enjoyed here include rowing, and riding the summer toboggan run.',
    softWrap: true,
  ),
);
