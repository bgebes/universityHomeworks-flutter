// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class MasterListFragment extends StatelessWidget {
  MasterListFragment({
    super.key,
    this.orientation = Orientation.portrait,
    this.listItemClickAction = print,
    required this.changeNumber,
  });

  Orientation orientation;
  ValueChanged<int> changeNumber;
  Function(bool) listItemClickAction;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      color: Colors.grey[100],
      height: size.height,
      width: orientation == Orientation.portrait ? size.width : size.width / 2,
      child: ListView.builder(
        itemCount: 20,
        itemBuilder: ((context, index) {
          return Padding(
            padding: const EdgeInsets.all(3.0),
            child: Card(
              child: ListTile(
                title: Text(
                  "$index",
                ),
                onTap: () {
                  changeNumber(index);
                  listItemClickAction(true);
                },
              ),
            ),
          );
        }),
      ),
    );
  }
}

class DetailFragment extends StatelessWidget {
  DetailFragment({
    super.key,
    this.orientation = Orientation.portrait,
    required this.number,
  });

  Orientation orientation;
  int number;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double containerWidth =
        orientation == Orientation.portrait ? size.width : size.width / 2;

    Color primaryColor = Theme.of(context).primaryColor;
    Color containerColor = orientation == Orientation.portrait
        ? primaryColor.withAlpha(200)
        : primaryColor;

    return Container(
      color: containerColor,
      height: size.height,
      width: containerWidth,
      child: Center(
        child: Text(
          "$number",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 40,
          ),
        ),
      ),
    );
  }
}
