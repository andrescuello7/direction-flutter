import 'package:direction/src/ui/components/post_screen.dart';
import 'package:direction/src/ui/components/posteo_screen.dart';
import 'package:direction/src/ui/screen/profile_screen.dart';
import 'package:direction/values/k_colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  int _pageActual = 0;

  // ignore: non_constant_identifier_names
  List<Widget> PageActualHome = [
    SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: const <Widget>[
          HomePost(),
          HomePosteo(),
        ],
      ),
    ),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            KGreen_Marine,
            KBlack,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: PageView(
          children: <Widget>[
            PageActualHome[_pageActual],
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: KBlack.withOpacity(0.6),
          fixedColor: KVioleta,
          unselectedItemColor: Colors.white,
          onTap: (index) {
            setState(() {
              _pageActual = index;
            });
          },
          currentIndex: _pageActual,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.people), label: "Profile"),
          ],
        ),
      ),
    );
  }
}
