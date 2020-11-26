import 'package:flutter/material.dart';
import 'package:test_app/tabs/home_tab.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          bottomNavigationBar: TabBar(
            controller: _controller,
            labelStyle: Theme.of(context).textTheme.bodyText2,
            tabs: [
              Tab(
                icon: Icon(Icons.home),
                text: 'Home',
              ),
              Tab(
                icon: Icon(Icons.chat),
                text: 'Chats',
              ),
              Tab(
                // icon: Icon(Icons.alternate_email),
                text: 'Mentions',
                icon: Stack(
                  children: <Widget>[
                    Icon(Icons.alternate_email),
                    Positioned(
                      top: -2,
                      right: -2,
                      child: Stack(
                        children: <Widget>[
                          Icon(
                            Icons.brightness_1,
                            size: 17.0,
                            color: Colors.blue[900],
                          ),
                          Positioned(
                            top: 2.0,
                            right: 4.0,
                            child: Text(
                              "3",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Tab(
                icon: Icon(Icons.search),
                text: 'Browse',
              )
            ],
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.transparent,
          ),
          body: TabBarView(
            controller: _controller,
            children: [
              HomeTabScreen(),
              Container(
                color: Colors.orange,
              ),
              Container(
                color: Colors.lightGreen,
              ),
              Container(
                color: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
