import 'package:flutter/material.dart';
import 'package:responsive_adaptive_apps/widgets/widgets.dart';

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2();
}

class _Screen2 extends State<Screen2> {
  int number = 0;
  bool detailsOpened = false;

  void changeNumber(int number) {
    setState(() {
      this.number = number;
    });
  }

  void changeDetailsOpened(bool detailsOpened) {
    setState(() {
      this.detailsOpened = detailsOpened;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
          leading: detailsOpened && size.width < 576
              ? IconButton(
                  onPressed: () => changeDetailsOpened(false),
                  icon: const Icon(Icons.arrow_back),
                )
              : null),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return orientation == Orientation.portrait
              ? _buildVerticalLayout(
                  [number, changeNumber],
                  [detailsOpened, changeDetailsOpened],
                  orientation,
                )
              : _buildHorizontalLayout(
                  [number, changeNumber],
                  orientation,
                );
        },
      ),
    );
  }
}

Widget _buildHorizontalLayout(
  dynamic numberHook,
  Orientation orientation,
) {
  return Row(
    children: [
      MasterListFragment(changeNumber: numberHook[1], orientation: orientation),
      DetailFragment(number: numberHook[0], orientation: orientation),
    ],
  );
}

Widget _buildVerticalLayout(
  dynamic numberHook,
  dynamic detailsOpenedHook,
  Orientation orientation,
) {
  var details = detailsOpenedHook[0]
      ? GestureDetector(
          onTap: () => detailsOpenedHook[1](false),
          child: DetailFragment(
            number: numberHook[0],
            orientation: orientation,
          ),
        )
      : null;

  var masterList = MasterListFragment(
    changeNumber: numberHook[1],
    listItemClickAction: detailsOpenedHook[1],
  );

  return details != null
      ? Stack(
          children: [
            masterList,
            details,
          ],
        )
      : masterList;
}
