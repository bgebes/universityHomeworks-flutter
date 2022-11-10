## Ondokuz Mayıs Üniversitesi Mobil Programlama Ödev 5

### Kodlar

```dart
// main.dart

import 'package:flutter/material.dart';
import 'screens/screens.dart';

void main(List<String> args) {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Responsive and Adaptive Apps',
      home: Screen1(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// screens/screens.dart

export "screen1.dart";
export "screen2.dart";
export "screen3.dart";

// screens/screen1.dart

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

// screens/screen2.dart

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

// screens/screen3.dart

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

// widgets/widgets.dart

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
```

<div style="page-break-after: always;"></div>

### Ekran Görüntüleri

#### Screen 1

![screen1_vertical](https://user-images.githubusercontent.com/72809874/201155910-d5a3dacd-48c2-4704-9a5c-a796c91928df.png)
![screen1_horizontal](https://user-images.githubusercontent.com/72809874/201155902-c51bf5f4-407c-48ea-b6d2-9c947a785a82.png)

<div style="page-break-after: always;"></div>

#### Screen 2

![screen2_vertical](https://user-images.githubusercontent.com/72809874/201156065-ab4843b2-ed29-4d80-8fb1-550a3c22bf9d.png)
![screen2_horizontal](https://user-images.githubusercontent.com/72809874/201156058-b1c0160a-15b9-41eb-bf9b-c8d570baee8e.png)

<div style="page-break-after: always;"></div>

#### Screen 3

![screen3_vertical](https://user-images.githubusercontent.com/72809874/201156158-752d6030-dae3-4c5b-9c9b-81e9dede81cb.png)
![screen3_vertical_drawer](https://user-images.githubusercontent.com/72809874/201156165-dead9e43-1dab-43cb-b3e2-692ae1dbf278.png)
![screen3_horizontal](https://user-images.githubusercontent.com/72809874/201156153-de6ec214-bb09-4784-a589-f7fc354ef1bc.png)

### Ekran Videosu(Youtube)

- Screen1: https://www.youtube.com/watch?v=bo62EDk_3YI
- Screen2: https://www.youtube.com/watch?v=83aw7abb6oY
- Screen3: https://www.youtube.com/watch?v=o97JKGOynrs

### Proje Github Link

https://github.com/bgebes/universityHomeworks-flutter/tree/master/responsive_adaptive_apps

### Kaynaklar

- https://medium.com/flutter-community/developing-for-multiple-screen-sizes-and-orientations-in-flutter-fragments-in-flutter-a4c51b849434
- https://medium.com/flutter-community/build-responsive-uis-in-flutter-fd450bd59158

## Öğrenci

- **Ad Soyad**: Berkay Gebeş
- **Bölüm**: Bilgisayar Mühendisliği
- **Numara**: 20060404
