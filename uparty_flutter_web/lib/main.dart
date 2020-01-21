import 'package:flutter/material.dart';
import 'package:uparty_flutter_web/vertical_navigation_bar_clone.dart';
import 'responsive_builder_clone.dart';
import 'shifting_tabbar_clone.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'uParty',
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
      home: MyHomePage(title: 'uParty'),
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

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

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

  @override
  Widget build(BuildContext context) {
    final pageController = PageController(initialPage: 0, keepPage: true);

    final navItems = [
      SideNavigationItem(iconData: Icons.home, title: "Home"),
      SideNavigationItem(iconData: Icons.library_books, title: "About"),
      SideNavigationItem(iconData: Icons.contacts, title: "Contact Us"),
      SideNavigationItem(iconData: Icons.gavel, title: "Legal"),
    ];
    final initialTab = 0;

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      //constants for pages
      const int HOME = 0;
      const int ABOUT = 1;
      const int CONTACT = 2;
      const int LEGAL = 3;
      // Check the sizing information here and return your UI
      if (sizingInformation.deviceScreenType == DeviceScreenType.Desktop ||
          sizingInformation.deviceScreenType == DeviceScreenType.Tablet) {
        return Scaffold(
          body: Row(
            children: <Widget>[
              SideNavigation(
                navItems: navItems,
                itemSelected: (index) {
                  pageController.animateToPage(index,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.linear);
                },
                initialIndex: 0,
                actions: <Widget>[
                  //add some action button here
                ],
              ),
              Expanded(
                child: PageView.builder(
                  itemCount: 4,
                  controller: pageController,
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    switch (index) {
                      case HOME:
                        {
                          return Container(
                              color: Colors.black.withOpacity(0.8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          "Title",

                                          //textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 32,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit,\nsed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: RaisedButton(
                                            color: Colors.blue,
                                            child: Text(
                                              "Sign Up",
                                              style: TextStyle(fontSize: 20),
                                            ),
                                            onPressed: () {},
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.4,
                                          child:
                                              Image.asset('assets/ducks.png'),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ));
                          // Container(
                          //   color: Colors.red,
                          //   child: Row(
                          //     mainAxisSize: MainAxisSize.max,
                          //     children: <Widget>[
                          //       Column(
                          //         children: <Widget>[Text("FUCK")],
                          //       ),
                          //       Column(
                          //         children: <Widget>[Text("YOU")],
                          //       )
                          //     ],
                          //   ),
                          // );
                        }
                        break;
                      case ABOUT:
                        {
                          return Container(
                            color: Colors.black.withOpacity(0.8),
                            child: ListView(children: <Widget>[
                              Center(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(16, 64, 16, 32),
                                  child: Text("About Title",
                                      style: TextStyle(
                                          fontSize: 40, color: Colors.white),
                                      textAlign: TextAlign.center),
                                ),
                              ),
                              Center(
                                child: Text(
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit,\nsed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 28, color: Colors.white),
                                ),
                              ),
                            ]),
                          );
                        }
                        break;
                      case CONTACT:
                        {
                          return Container(
                            color: Colors.black.withOpacity(0.8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                _createDesktopContact(
                                    "Emmett Duck",
                                    "Chief Executive Officer",
                                    "duck",
                                    "duck",
                                    "duck",
                                    "duck"),
                                _createDesktopContact(
                                    "Ben Ducky",
                                    "Chief Technology Officer",
                                    "duck",
                                    "duck",
                                    "duck",
                                    "duck"),
                                _createDesktopContact(
                                    "Flyin Andress",
                                    "Chief Marketing Officer",
                                    "duck",
                                    "duck",
                                    "duck",
                                    "duck"),
                                _createDesktopContact(
                                    "Duckling Carrol",
                                    "Marketing Director",
                                    "duck",
                                    "duck",
                                    "duck",
                                    "duck"),
                              ],
                            ),
                          );
                        }
                        break;
                    }
                    // return Container(
                    //     color: Colors.black.withOpacity(0.8),
                    //     child: Center(
                    //       child: Text("Page " + index.toString()),
                    //     ));
                  },
                ),
              )
            ],
          ),
        );
      }

      if (sizingInformation.deviceScreenType == DeviceScreenType.Mobile) {
        return DefaultTabController(
          length: 4,
          child: Scaffold(
            appBar: ShiftingTabBar(
              color: Colors.black87,
              tabs: [
                ShiftingTab(
                  icon: Icon(Icons.home),
                  text: "Home",
                ),
                ShiftingTab(icon: Icon(Icons.library_books), text: "About"),
                ShiftingTab(icon: Icon(Icons.contacts), text: "Contact"),
                ShiftingTab(icon: Icon(Icons.gavel), text: "Legal")
              ],
            ),
            body: TabBarView(
              children: <Widget>[
                Container(
                  color: Colors.black.withOpacity(0.8),
                  child: ListView(
                    children: <Widget>[
                      Center(
                          child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                        child: Text(
                          "Title",
                          style: TextStyle(fontSize: 32, color: Colors.white),
                        ),
                      )),
                      Center(
                        child: Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit,\nsed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: RaisedButton(
                            color: Colors.blue,
                            child: Text(
                              "Sign Up",
                              style: TextStyle(fontSize: 20),
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: Image.asset('assets/ducks.png'),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  color: Colors.black.withOpacity(0.8),
                  child: ListView(children: <Widget>[
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 32, 16, 32),
                        child: Text("About Title",
                            style: TextStyle(fontSize: 32, color: Colors.white),
                            textAlign: TextAlign.center),
                      ),
                    ),
                    Center(
                      child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit,\nsed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ]),
                ),
                Container(
                  child: Center(
                    child: ListView(
                      children: <Widget>[
                        _createMobileContact(
                            "Emmett Duck",
                            "Chief Executive Officer",
                            "duck",
                            "duck",
                            "duck",
                            "duck"),
                        _createMobileContact(
                            "Ben Ducky",
                            "Chief Technology Officer",
                            "duck",
                            "duck",
                            "duck",
                            "duck"),
                        _createMobileContact(
                            "Flyin Andress",
                            "Chief Marketing Officer",
                            "duck",
                            "duck",
                            "duck",
                            "duck"),
                        _createMobileContact("Duckling Carrol",
                            "Marketing Director", "duck", "duck", "duck", "duck"),
                      ],
                    ),
                  ),
                ),
                Icon(Icons.gavel)
              ],
            ),
          ),
        );
      }

      return Container(color: Colors.purple);
    });
  }

  Widget _createDesktopContact(String name, String title, String imgPath,
      String linkedIn, String email, String instagram) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Container(
              child: Image.asset('assets/ducks.png'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
            child: Text(
              name,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
              ),
            ),
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ],
      ),
    );
  }

  Widget _createMobileContact(String name,String title,String imgPath, String linkedIn, String email, String instagram){
    return Expanded(
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                  child: Image.asset('assets/ducks.png'),
                ),
                Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
                child: Text(
                  name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                  ),
                ),
              ),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }
}
