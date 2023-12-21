import 'dart:developer';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:animation_search_bar/animation_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/Page/ReelsPage.dart';
import 'package:untitled1/Page/Setings.dart';
import 'i.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),
        ),
        scaffoldBackgroundColor: const Color.fromARGB(30, 30, 30, 30),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Anim search bar Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _pageController = PageController(initialPage: 0);
  final _controller = NotchBottomBarController(index: 0);
  int maxCount = 5;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  final List<Widget> bottomBarPages = [
    const Page1(),
    const Page2(),
    const Page3(),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black26,
        title: AnimationSearchBar(
          onChanged: (text) => debugPrint(text),
          searchTextEditingController: SearchController(),
          previousScreen: null,
          closeIconColor: Colors.white,
          centerTitle: 'Web Chat',
          hintText: 'Search',
          centerTitleStyle: const TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
          hintStyle:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          textStyle:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
          cursorColor: Colors.black54,
          duration: const Duration(milliseconds: 450),
          searchFieldHeight: 35,
          searchBarHeight: 50,
          searchBarWidth: MediaQuery.of(context).size.width - 50,
          horizontalPadding: 5,
          verticalPadding: 0,
          searchIconColor: Colors.white.withOpacity(.7),
          searchFieldDecoration: BoxDecoration(
              color: Colors.white24,
              border:
                  Border.all(color: Colors.black.withOpacity(.2), width: .5),
              borderRadius: BorderRadius.circular(15)),
        ),
      ),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
            bottomBarPages.length, (index) => bottomBarPages[index]),
      ),
      extendBody: true,
      bottomNavigationBar: (bottomBarPages.length <= maxCount)
          ? AnimatedNotchBottomBar(
              notchBottomBarController: _controller,
              color: Colors.black54,
              showLabel: false,
              notchColor: Colors.transparent,
              removeMargins: false,
              bottomBarWidth: 700,
              durationInMilliSeconds: 130,
              bottomBarItems: const [
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.video_collection,
                    color: Colors.white,
                    size: 30,
                  ),
                  activeItem: Icon(
                    Icons.video_collection_outlined,
                    color: Colors.white,
                  ),
                  itemLabel: 'Page 1',
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.chat,
                    color: Colors.white,
                    size: 30,
                  ),
                  activeItem: Icon(
                    Icons.chat_bubble_outline,
                    color: Colors.white,
                  ),
                  itemLabel: 'Page 2',
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.account_circle_outlined,
                    size: 30,
                    color: Colors.white,
                  ),
                  activeItem: Icon(
                    Icons.account_circle_rounded,
                    color: Colors.white,
                  ),
                  itemLabel: 'Page 5',
                ),
              ],
              onTap: (index) {
                log('current selected index $index');
                _pageController.jumpToPage(index);
              },
            )
          : null,
    );
  }
}
