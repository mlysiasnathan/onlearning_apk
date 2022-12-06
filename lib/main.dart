import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:introduction_screen/introduction_screen.dart';
// import 'package:toast/toast.dart';

final List<String> imgList = [
  'assets/images/15.jpg',
  'assets/images/22.png',
  'assets/images/12.jpg',
  'assets/images/19.jpg',
];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'OnLearning',
      theme: ThemeData(
        fontFamily: 'Poppins',
        primarySwatch: Colors.blue,
      ),
      home: AnimatedSplashScreen(
        duration: 3000,
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: Colors.white,
        splash: Column(
          children: [
            SizedBox(
              height: 100,
              width: 100,
              child: Image.asset('assets/images/playstore.png'),
            ),
            const Text(
              'OnLearning',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 180),
              child: const Text(
                'Powered by LysNBrain',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.blue,
                ),
                textAlign: TextAlign.end,
              ),
            ),
          ],
        ),
        nextScreen: OnBoardingPage(),
      ),
    );
  }
}

class OnBoardingPage extends StatelessWidget {
  OnBoardingPage({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) => SafeArea(
        child: IntroductionScreen(
          pages: [
            PageViewModel(
              title: 'A reader lives a thousand lives',
              body: 'The man who never reads lives only one.',
              image: buildImage('assets/ebook.png'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Featured Books',
              body: 'Available right at your fingerprints',
              image: buildImage('assets/readingbook.png'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Simple UI',
              body: 'For enhanced reading experience',
              image: buildImage('assets/manthumbs.png'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Today a reader, tomorrow a leader',
              body: 'Start your journey',
              image: buildImage('assets/learn.png'),
              decoration: getPageDecoration(),
            ),
          ],
          done: const Text('Start Reading',
              style: TextStyle(fontWeight: FontWeight.w600)),
          onDone: () {
            // ignore: non_constant_identifier_names
            TextEditingController UserNameTF = TextEditingController();
            // ignore: non_constant_identifier_names
            TextEditingController PassTF = TextEditingController();
            showGeneralDialog(
                context: context,
                barrierDismissible: true,
                barrierLabel: '',
                transitionDuration: const Duration(milliseconds: 300),
                transitionBuilder: (BuildContext context, Animation<double> a1,
                        Animation<double> a2, Widget child) =>
                    SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(1, 0),
                        end: Offset.zero,
                      ).animate(a1),
                      child: Dialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: SizedBox(
                            height: 330,
                            child: Column(
                              children: <Widget>[
                                ListTile(
                                  title: const Text(
                                    "Log In",
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  trailing: IconButton(
                                    icon: const Icon(Icons.close),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ),
                                const Divider(),
                                const Text(
                                  'Log in with your Email address',
                                  textAlign: TextAlign.start,
                                ),
                                Form(
                                  key: _formKey,
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        SizedBox(
                                          height: 45,
                                          child: TextFormField(
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle2,
                                            decoration: const InputDecoration(
                                              labelText: "Email address :",
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.only(
                                                  topLeft:
                                                      Radius.circular(10.0),
                                                  topRight:
                                                      Radius.circular(10.0),
                                                ),
                                              ),
                                            ),
                                            controller: UserNameTF,
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'Please Enter Your Email !';
                                              }
                                            },
                                          ),
                                        ),
                                        Container(
                                          height: 45,
                                          margin: const EdgeInsets.only(
                                              top: 8, bottom: 10),
                                          child: TextFormField(
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle2,
                                            decoration: const InputDecoration(
                                              labelText: "Password :",
                                              fillColor: Colors.blue,
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(10.0),
                                                  bottomRight:
                                                      Radius.circular(10.0),
                                                ),
                                              ),
                                            ),
                                            obscureText: true,
                                            controller: PassTF,
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'Please Enter Your Password!';
                                              }
                                            },
                                          ),
                                        ),
                                        SizedBox(
                                          width: double.infinity,
                                          child: ElevatedButton(
                                            child: const Text('Log in'),
                                            onPressed: () {
                                              if (_formKey.currentState!
                                                  .validate()) {
                                                Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const MyHomePage(
                                                              title:
                                                                  "OnLearning")),
                                                );
                                              } else {
                                                // Scaffold.of(context)
                                                //     .showSnackBar(
                                                //   SnackBar(
                                                //       backgroundColor:
                                                //           Colors.red,
                                                //       content: Text(
                                                //           'Information Not Validated')),
                                                // );
                                              }
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const Text(
                                  'Forgot Password ?',
                                  textAlign: TextAlign.start,
                                ),
                                const Text(
                                  'Click here',
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ),
                pageBuilder: (context, anim1, anim2) {
                  return Transform.rotate(
                    angle: anim1.value,
                  );
                });
          },
          showSkipButton: true,
          skip: const Text('Skip'),
          next: const Icon(Icons.arrow_forward),
          dotsDecorator: getDotDecoration(),
          // ignore: avoid_print
          onChange: (index) => print('Page $index selected'),
          globalBackgroundColor: Colors.white,
          skipFlex: 0,
          nextFlex: 0,
          // isProgressTap: false,
          // isProgress: false,
          // showNextButton: false,
          // freeze: true,
          // animationDuration: 1000,
        ),
      );

  void goToHome(context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (_) => const MyHomePage(
                  title: 'OnLearning',
                )),
      );

  Widget buildImage(String path) =>
      Center(child: Image.asset(path, width: 350));

  DotsDecorator getDotDecoration() => DotsDecorator(
        color: const Color(0xFFBDBDBD),
        //activeColor: Colors.orange,
        size: const Size(10, 10),
        activeSize: const Size(22, 10),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      );

  PageDecoration getPageDecoration() => PageDecoration(
        titleTextStyle:
            const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        bodyTextStyle: const TextStyle(fontSize: 17),
        descriptionPadding: const EdgeInsets.all(16).copyWith(bottom: 0),
        imagePadding: const EdgeInsets.all(24),
        pageColor: Colors.white,
      );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    const drawerHeader = UserAccountsDrawerHeader(
      accountName: Text('Lysias Nathan'),
      accountEmail: Text('user@g.c'),
      currentAccountPicture: CircleAvatar(
        backgroundColor: Colors.white,
        child: FlutterLogo(size: 42.0),
      ),
    );
    final drawerItems = ListView(
      children: <Widget>[
        drawerHeader,
        ListTile(
          title: const Text('My Marksheet'),
          onTap: () => Navigator.of(context).push(_NewPage1()),
        ),
        ListTile(
          title: const Text('Edit My Profil'),
          onTap: () => Navigator.of(context).push(_NewPage2()),
        ),
        ListTile(
          title: const Text('Log out'),
          onTap: () {},
        ),
      ],
    );

    final List<Widget> imageSliders = imgList
        .map((item) => Container(
              margin: const EdgeInsets.only(bottom: 1, top: 50),
              child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                  child: Stack(
                    children: <Widget>[
                      Image.asset(
                        item,
                        fit: BoxFit.cover,
                        width: 1000.0,
                        height: 1000,
                      ),
                      Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(200, 0, 0, 0),
                                Color.fromARGB(0, 0, 0, 0),
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          child: Text(
                            'No. ${imgList.indexOf(item)} image',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ))
        .toList();
    int _current = 5;
    final CarouselController _controller = CarouselController();
    final _kTabPages = <Widget>[
      SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            CarouselSlider(
              items: imageSliders,
              carouselController: _controller,
              options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 1,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imgList.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: Container(
                    width: 18.0,
                    height: 5.0,
                    margin: const EdgeInsets.symmetric(
                        vertical: 2.0, horizontal: 6.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: (Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black)
                            .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                  ),
                );
              }).toList(),
            ),

            // const Text(
            //   'You have pushed the button this many times:',
            // ),
            // Text(
            //   '$_counter',
            //   style: Theme.of(context).textTheme.headline4,
            // ),
            Card(
              margin: const EdgeInsets.all(20),
              color: const Color.fromRGBO(255, 255, 255, 0.4),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              elevation: 10.0,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 180.0,
                    child: Stack(
                      children: <Widget>[
                        Positioned.fill(
                          top: 15.0,
                          child: Image.asset(
                            'assets/images/playstore.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    child: Text(
                      'Become Future-Proof',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    width: 330,
                    child: Text(
                      'Get the skills of tomorrow Learn to learn efficiently Take control of your life from now',
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

// page--courses
      ListView(
        padding: const EdgeInsets.all(12.0),
        children: <Widget>[
          Card(
            margin: const EdgeInsets.only(bottom: 30),
            color: Colors.white,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            elevation: 10.0,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 180.0,
                  child: Stack(
                    children: <Widget>[
                      Positioned.fill(
                        top: 15.0,
                        child: Image.asset(
                          'assets/images/1.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 1.0,
                        left: 16.0,
                        right: 16.0,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '',
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(color: Colors.blue),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.start,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        var alert = AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            title: const Text(
                              "Overview",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                            content: SizedBox(
                              height: 396,
                              child: Column(
                                children: const <Widget>[
                                  Divider(
                                    color: Colors.black,
                                  ),
                                  Text("1.Introduction: "),
                                  Text(
                                    "The defense system consists of a wide variety of"
                                    "cells and molecules that have evolved to protect animals from "
                                    "invading pathogenic microorganisms and cancer. Recognition and "
                                    "response are two major activities of immune system. Immune "
                                    "recognition is quite specific.Moreover, it is able to discriminate"
                                    "between foreign molecules and the body’s own cells and proteins. "
                                    "After the recognition of a foreign organism, it mounts an effector"
                                    "response through recruiting a variety of cells and molecules to "
                                    "eliminate the invader organism.",
                                  ),
                                ],
                              ),
                            ));

                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return alert;
                            });
                      },
                      child: const Text('Overview'),
                    ),
                  ],
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.start,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Get Reading'),
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          primary: Colors.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7.0)),
                          side: const BorderSide(
                            width: 2,
                            color: Colors.blue,
                          )),
                      onPressed: () {
                        showGeneralDialog(
                            context: context,
                            barrierDismissible: false,
                            barrierLabel: '',
                            transitionDuration:
                                const Duration(milliseconds: 300),
                            transitionBuilder: (BuildContext context,
                                    Animation<double> a1,
                                    Animation<double> a2,
                                    Widget child) =>
                                SlideTransition(
                                  position: Tween<Offset>(
                                    begin: const Offset(0, -1),
                                    end: Offset.zero,
                                  ).animate(a1),
                                  child: Dialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: SizedBox(
                                        height: 200,
                                        child: Column(
                                          children: <Widget>[
                                            ListTile(
                                              title: const Text(
                                                "Examination Paper of Imune system",
                                                style: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.blue,
                                                ),
                                              ),
                                              trailing: IconButton(
                                                icon: const Icon(Icons.close),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                              ),
                                            ),
                                            const Divider(),
                                            const Text(
                                              'No Exam available',
                                              textAlign: TextAlign.start,
                                            ),
                                            const Divider(),
                                          ],
                                        ),
                                      )),
                                ),
                            pageBuilder: (context, anim1, anim2) {
                              return Transform.rotate(
                                angle: anim1.value,
                              );
                            });
                      },
                      child: const Text('Exam'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Card(
            margin: const EdgeInsets.only(bottom: 20),
            color: Colors.white,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            elevation: 10.0,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 180.0,
                  child: Stack(
                    children: <Widget>[
                      Positioned.fill(
                        top: 15.0,
                        child: Image.asset(
                          'assets/images/2.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 1.0,
                        left: 16.0,
                        right: 16.0,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '',
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(color: Colors.blue),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.start,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        var alert = AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            title: const Text(
                              "Overview",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                            content: SizedBox(
                              height: 340,
                              child: Column(
                                children: const <Widget>[
                                  Divider(
                                    color: Colors.black,
                                  ),
                                  Text("1.Introduction: "),
                                  Text(
                                    "Generally, nutrients are classified as either macro- or micronutrients, based on the"
                                    "amounts we require from the diet (Gibney et al.,2009)."
                                    "Some nutrients can be stored (e.g., glucose as glycogen in the liver, fat-soluble vitamins"
                                    "in fat reserves)"
                                    "while others areequired more or less continuously. There are, however,"
                                    "also differences between individuals, meaning some may require specific"
                                    "nutrients more frequently.",
                                  ),
                                ],
                              ),
                            ));

                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return alert;
                            });
                      },
                      child: const Text('Overview'),
                    ),
                  ],
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.start,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Get Reading'),
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7.0)),
                          primary: Colors.blue,
                          side: const BorderSide(width: 2, color: Colors.blue)),
                      onPressed: () {
                        showGeneralDialog(
                            context: context,
                            barrierDismissible: false,
                            barrierLabel: '',
                            transitionDuration:
                                const Duration(milliseconds: 300),
                            transitionBuilder: (BuildContext context,
                                    Animation<double> a1,
                                    Animation<double> a2,
                                    Widget child) =>
                                SlideTransition(
                                  position: Tween<Offset>(
                                    begin: const Offset(0, -1),
                                    end: Offset.zero,
                                  ).animate(a1),
                                  child: Dialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: SizedBox(
                                        height: 200,
                                        child: Column(
                                          children: <Widget>[
                                            ListTile(
                                              title: const Text(
                                                "Examination Paper of Nutrition & Health",
                                                style: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.blue,
                                                ),
                                              ),
                                              trailing: IconButton(
                                                icon: const Icon(Icons.close),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                              ),
                                            ),
                                            const Divider(),
                                            const Text(
                                              'No Exam available',
                                              textAlign: TextAlign.start,
                                            ),
                                            const Divider(),
                                          ],
                                        ),
                                      )),
                                ),
                            pageBuilder: (context, anim1, anim2) {
                              return Transform.rotate(
                                angle: anim1.value,
                              );
                            });
                      },
                      child: const Text('Exam'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ];
    final _kTabs = <Tab>[
      const Tab(text: 'My Home'),
      const Tab(text: 'My Courses'),
    ];

    return DefaultTabController(
      length: _kTabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Colors.blue,
          bottom: TabBar(
            tabs: _kTabs,
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.red, Colors.blue])),
          child: TabBarView(
            children: _kTabPages,
          ),
        ),
        drawer: Drawer(
          child: drawerItems,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class _NewPage1 extends MaterialPageRoute<void> {
  _NewPage1()
      : super(builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('My Marksheet'),
              elevation: 1.0,
            ),
            body: Container(
              height: 1000,
              width: 1000,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.red, Colors.blue])),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: const [
                    DataColumn(
                        label: Text(
                      'Name of course',
                      style: TextStyle(color: Colors.black),
                    )),
                    DataColumn(
                        label: Text(
                      'Marks',
                      style: TextStyle(color: Colors.black),
                    )),
                  ],
                  rows: const [
                    DataRow(cells: [
                      DataCell(Text(
                        '1.Fondamentals of the Immune System',
                        style: TextStyle(color: Colors.white),
                      )),
                      DataCell(Text(
                        '60/100',
                        style: TextStyle(color: Colors.white),
                      )),
                    ]),
                    DataRow(cells: [
                      DataCell(Text(
                        '2.Nutrition & Health',
                        style: TextStyle(color: Colors.white),
                      )),
                      DataCell(Text(
                        '40/100',
                        style: TextStyle(color: Colors.white),
                      )),
                    ])
                  ],
                ),
              ),
            ),
          );
        });
}

class _NewPage2 extends MaterialPageRoute<void> {
  _NewPage2()
      : super(builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Edit My Profil'),
              elevation: 1.0,
            ),
            body: Container(
              height: 1000,
              width: 1000,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.red, Colors.blue])),
              child: Text(''),
            ),
          );
        });
}
