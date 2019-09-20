import 'package:flutter/material.dart';
import 'grid_item.dart';
import 'animated_builder.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Widgets Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

// This is the type used by the popup menu below.
enum WhyFarther { harder, smarter, selfStarter }

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _index = 0;
  bool selected = false;
  int _selectedIndex = 0;
  String dropdownValue = 'One';
  double _volume = 0.0;
  String _imageUrl =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRRRd8HH7mf2V8ee2YhATvvxV28kb4QcjjhCwl0zhe-KqlMRmvdcA';
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  AlignmentGeometry _alignment = Alignment.topRight;
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  void _changeAlignment() {
    setState(() {
      _alignment = _alignment == Alignment.topRight
          ? Alignment.bottomLeft
          : Alignment.topRight;
    });
  }

  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
              child: Center(
                child: SizedBox(
                  width: 60.0,
                  height: 60.0,
                  child: CircleAvatar(
                    child: FlutterLogo(),
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.change_history),
              title: Text('Change history'),
              onTap: () {
                // change app state...
                Navigator.pop(context); // close the drawer
              },
            )
          ],
        ),
      ),

      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: <Widget>[
          GridItem(
            widgetName: 'Text',
            widget: Text(
              'Pushed FAB $_counter times',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          GridItem(
            widgetName: 'AnimatedContainer',
            widget: GestureDetector(
              onTap: () {
                setState(() {
                  selected = !selected;
                });
              },
              child: AnimatedContainer(
                width: selected ? 100.0 : 80.0,
                height: selected ? 80.0 : 100.0,
                color: selected ? Colors.red : Colors.blue,
                alignment: selected
                    ? Alignment.center
                    : AlignmentDirectional.topCenter,
                duration: Duration(seconds: 1),
                curve: Curves.fastOutSlowIn,
                child: FlutterLogo(size: 100),
              ),
            ),
          ),
          GridItem(
            widgetName: 'Center',
            widget: Center(
              child: _widgetOptions.elementAt(_selectedIndex),
            ),
          ),
          GridItem(
            widgetName: 'Chip',
            widget: Chip(
              avatar: CircleAvatar(
                backgroundColor: Colors.yellow,
                child: Text('SS'),
              ),
              label: Text('Flutter Developer'),
              backgroundColor: Colors.cyan,
            ),
          ),
          GridItem(
            widgetName: 'AnimatedCrossFade',
            widget: AnimatedCrossFade(
              duration: const Duration(seconds: 3),
              firstChild: const FlutterLogo(
                  style: FlutterLogoStyle.horizontal, size: 100.0),
              secondChild: const FlutterLogo(
                  style: FlutterLogoStyle.stacked, size: 100.0),
              crossFadeState: CrossFadeState.showFirst,
            ),
          ),
          GridItem(
            widgetName: 'DecoratedBox',
            widget: DecoratedBox(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: const Alignment(-0.5, -0.6),
                  radius: 0.15,
                  colors: <Color>[
                    const Color(0xFFEEEEEE),
                    const Color(0xFF111133),
                  ],
                  stops: <double>[0.9, 1.0],
                ),
              ),
            ),
          ),
          GridItem(
            widgetName: 'DropdownButton',
            widget: DropdownButton<String>(
              value: dropdownValue,
              icon: Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String newValue) {
                setState(() {
                  dropdownValue = newValue;
                });
              },
              items: <String>['One', 'Two', 'Three', 'Four']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          GridItem(
            widgetName: 'FlatButton',
            widget: FlatButton(
              color: Colors.blue,
              textColor: Colors.white,
              disabledColor: Colors.grey,
              disabledTextColor: Colors.black,
              padding: EdgeInsets.all(8.0),
              splashColor: Colors.blueAccent,
              onPressed: () {
                /*...*/
              },
              child: Text(
                "Flat Button",
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ),
          GridItem(
            widgetName: 'Icon',
            widget: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const <Widget>[
                Icon(
                  Icons.favorite,
                  color: Colors.pink,
                  size: 24.0,
                  semanticLabel: 'Text to announce in accessibility modes',
                ),
                Icon(
                  Icons.audiotrack,
                  color: Colors.green,
                  size: 30.0,
                ),
                Icon(
                  Icons.beach_access,
                  color: Colors.blue,
                  size: 36.0,
                ),
              ],
            ),
          ),
          GridItem(
            widgetName: 'IconButton',
            widget: Ink(
              decoration: ShapeDecoration(
                color: Colors.lightBlue,
                shape: CircleBorder(),
              ),
              child: IconButton(
                icon: Icon(
                  Icons.android,
                  size: 60,
                ),
                color: Colors.white,
                onPressed: () {
                  print("filled background");
                },
              ),
            ),
          ),
          GridItem(
            widgetName: 'Image',
            widget: Image(
              image: NetworkImage(
                  'http://downloads.saibaba.com/publications/pubLogo.png'),
            ),
          ),
          GridItem(
            widgetName: 'RaisedButton',
            widget: RaisedButton(
              onPressed: () {},
              textColor: Colors.white,
              padding: const EdgeInsets.all(0.0),
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[
                      Color(0xFF0D47A1),
                      Color(0xFF1976D2),
                      Color(0xFF42A5F5),
                    ],
                  ),
                ),
                padding: const EdgeInsets.all(10.0),
                child: const Text('Gradient Button',
                    style: TextStyle(fontSize: 20)),
              ),
            ),
          ),
          GridItem(
            widgetName: 'RichText',
            widget: RichText(
              text: TextSpan(
                text: 'Hello ',
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(
                      text: 'bold',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                  TextSpan(text: ' world!'),
                ],
              ),
            ),
          ),
          GridItem(
            widgetName: 'RotatedBox',
            widget: RotatedBox(
              quarterTurns: 3,
              child: const Text('Hello World!'),
            ),
          ),
          GridItem(
            widgetName: 'AnimatedAlign',
            widget: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  height: 80.0,
                  width: 80.0,
                  color: Colors.blue[50],
                  child: AnimatedAlign(
                    alignment: _alignment,
                    curve: Curves.ease,
                    duration: Duration(seconds: 2),
                    child: FlutterLogo(
                      size: 60,
                    ),
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    _changeAlignment();
                  },
                  child: Text(
                    "Click Me!",
                  ),
                )
              ],
            ),
          ),
          GridItem(
            widgetName: 'AnimatedBuilder',
            widget: Spinner(),
          ),
          GridItem(
            widgetName: 'AspectRatio',
            widget: Container(
              height: 100,
              child: new AspectRatio(
                aspectRatio: 4 / 3,
                child: new Container(
                  color: Colors.red,
                ),
              ),
            ),
          ),
          GridItem(
            widgetName: 'Banner',
            widget: Center(
              child: Container(
                margin: const EdgeInsets.all(10.0),
                color: Colors.yellow,
                height: 100,
                child: ClipRect(
                  child: Banner(
                    message: "hello",
                    location: BannerLocation.topEnd,
                    color: Colors.red,
                    child: Container(
                      color: Colors.yellow,
                      height: 100,
                      child: Center(
                        child: Text("Hello, banner!"),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          GridItem(
            widgetName: 'BottomSheet',
            widget: RaisedButton(
              child: const Text('SHOW BOTTOM SHEET'),
              onPressed: () {
                showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        child: Padding(
                          padding: const EdgeInsets.all(32.0),
                          child: Text(
                            'This is the modal bottom sheet. Slide down to dismiss.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontSize: 24.0,
                            ),
                          ),
                        ),
                      );
                    });
              },
            ),
          ),
          GridItem(
            widgetName: 'ButtonBar',
            widget: ButtonBar(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                FlatButton(
                  child: Text('OK'),
                  color: Colors.blue,
                  onPressed: () {/** */},
                ),
                FlatButton(
                  child: Text('Cancel'),
                  color: Colors.blue,
                  onPressed: () {/** */},
                ),
              ],
            ),
          ),
          GridItem(
            widgetName: 'Card',
            widget: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    leading: Icon(Icons.album),
                    title: Text('The Enchanted Nightingale'),
                    subtitle:
                        Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
                  ),
                  ButtonTheme.bar(
                    // make buttons use the appropriate styles for cards
                    child: ButtonBar(
                      children: <Widget>[
                        FlatButton(
                          child: const Text('BUY TICKETS'),
                          onPressed: () {/* ... */},
                        ),
                        FlatButton(
                          child: const Text('LISTEN'),
                          onPressed: () {/* ... */},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          GridItem(
            widgetName: 'CircularProgressIndicator',
            widget: CircularProgressIndicator(),
          ),
          GridItem(
            widgetName: 'ClipOval',
            widget: ClipOval(
              child: SizedBox(
                width: 120,
                height: 100,
                child: Image.network(
                  _imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          GridItem(
            widgetName: 'ClipRRect',
            widget: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: SizedBox(
                width: 100,
                height: 100,
                child: Image.network(
                  _imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          GridItem(
            widgetName: 'ClipRect',
            widget: ClipRect(
              child: Align(
                alignment: Alignment.bottomCenter,
                heightFactor: 0.8,
                widthFactor: 0.7,
                child: Image.network(_imageUrl),
              ),
            ),
          ),
          GridItem(
            widgetName: 'IconButton',
            widget: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.volume_up),
                  tooltip: 'Increase volume by 10',
                  onPressed: () {
                    setState(() {
                      _volume += 10;
                    });
                  },
                ),
                Text('Volume : $_volume')
              ],
            ),
          ),
          GridItem(
            widgetName: 'LinearProgressIndicator',
            widget: LinearProgressIndicator(),
          ),
          GridItem(
            widgetName: 'OutlineButton',
            widget: OutlineButton(
              onPressed: () {
                /*...*/
              },
              child: Text(
                "Outline Button",
              ),
            ),
          ),
          GridItem(
            widgetName: 'PhysicalModel',
            widget: PhysicalModel(
              elevation: 6.0,
              shape: BoxShape.rectangle,
              shadowColor: Colors.black,
              color: Colors.white,
              child: Container(
                height: 100.0,
                width: 100.0,
                color: Colors.blue[50],
                child: FlutterLogo(
                  size: 60,
                ),
              ),
            ),
          ),
          GridItem(
            widgetName: 'PlaceHolder',
            widget: Container(
              width: 100,
              height: 100,
              color: Colors.white,
              child: Placeholder(
                color: Colors.blue[50],
              ),
            ),
          ),
          GridItem(
            widgetName: 'PopupMenuButton',
            widget: PopupMenuButton<WhyFarther>(
              onSelected: (WhyFarther result) {
                setState(() {});
              },
              itemBuilder: (BuildContext context) =>
                  <PopupMenuEntry<WhyFarther>>[
                const PopupMenuItem<WhyFarther>(
                  value: WhyFarther.harder,
                  child: Text('Work'),
                ),
                const PopupMenuItem<WhyFarther>(
                  value: WhyFarther.smarter,
                  child: Text('Think'),
                ),
                const PopupMenuItem<WhyFarther>(
                  value: WhyFarther.selfStarter,
                  child: Text('Start'),
                ),
              ],
            ),
          ),
          GridItem(
            widgetName: 'Stack',
            widget: Stack(children: <Widget>[
              Container(
                width: 100,
                height: 100,
                color: Colors.red,
              ),
              Container(
                width: 90,
                height: 90,
                color: Colors.green,
              ),
              Container(
                width: 80,
                height: 80,
                color: Colors.blue,
              ),
            ]),
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title: Text('Business'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('School'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
