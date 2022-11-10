import 'package:flutter/material.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1();
}

class _Screen1 extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return orientation == Orientation.portrait
              ? _buildVerticalLayout(orientation)
              : _buildHorizontalLayout(context, orientation);
        },
      ),
    );
  }
}

Widget account(Orientation orientation) {
  var customText = orientation == Orientation.landscape
      ? const Center(
          child: Text(
            "Deven Joshi",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        )
      : const Text(
          "Deven Joshi",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        );

  return Padding(
    padding: const EdgeInsets.all(14),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Icon(
              Icons.account_circle,
              size: 120,
            ),
          ),
        ),
        customText,
      ],
    ),
  );
}

Widget demoDatas({text = "Demo Data", textSize = 20, itemLength = 20}) {
  return ListView.builder(
    itemBuilder: (BuildContext context, int index) {
      return ListTile(
        title: Text(
          text,
          style: TextStyle(fontSize: textSize),
        ),
      );
    },
    itemCount: itemLength,
  );
}

Widget _buildVerticalLayout(Orientation orientation) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      account(orientation),
      Expanded(child: demoDatas()),
    ],
  );
}

Widget _buildHorizontalLayout(BuildContext context, Orientation orientation) {
  var size = MediaQuery.of(context).size;

  return Row(
    children: [
      SizedBox(width: size.width / 2, child: account(orientation)),
      Expanded(child: SizedBox(width: size.width / 2, child: demoDatas())),
    ],
  );
}
