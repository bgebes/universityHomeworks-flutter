import 'package:flutter/material.dart';

class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    var menu = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Container(
            height: 150,
            color: Colors.green,
            child: const Center(child: Text("Raouf Rahiche")),
          ),
        ),
        const ListTile(title: Text("Home")),
        const ListTile(title: Text("Profile")),
        const ListTile(title: Text("Calls")),
        const ListTile(title: Text("Messages")),
      ],
    );

    return Scaffold(
      appBar: AppBar(),
      drawer: size.width < 576 ? Drawer(child: menu) : null,
      body: Row(
        children: [
          size.width > 576 ? Flexible(flex: 1, child: menu) : Container(),
          Flexible(
            flex: 3,
            child: Center(
                child: Text(
              "Size ${size.width} * ${size.height}",
              style: Theme.of(context).textTheme.titleMedium,
            )),
          ),
        ],
      ),
    );
  }
}
