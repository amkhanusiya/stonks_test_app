import 'package:flutter/material.dart';
import 'package:test_app/home/chart_screen.dart';
import 'package:test_app/home/portfolio.dart';
import 'package:test_app/home/top_post.dart';
import 'package:test_app/routes.dart';

BuildContext _context;

class HomeTabScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _context = context;
    return SingleChildScrollView(
      child: Column(
        children: [
          _renderHeader(),
          _renderAvgDetails(),
          ChartScreen.withSampleData(),
          _renderBuyingOption(),
          PortFolio(),
          TopPosts(),
        ],
      ),
    );
  }

  _renderHeader() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Welcome back Ali'),
              Text(
                '\$1,030,881.82',
                style: Theme.of(_context).textTheme.headline5.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
          CircleAvatar(
            backgroundImage: NetworkImage(
              'https://i.pinimg.com/564x/d9/56/9b/d9569bbed4393e2ceb1af7ba64fdf86a.jpg',
            ),
            backgroundColor: Colors.transparent,
            radius: 20,
          )
        ],
      ),
    );
  }

  _renderAvgDetails() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'TODAY',
                style: Theme.of(_context).textTheme.caption,
              ),
              RichText(
                text: TextSpan(
                  style: Theme.of(_context).textTheme.bodyText1.copyWith(
                        fontSize: 18,
                        color: Colors.green,
                      ),
                  children: [
                    WidgetSpan(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                        child: Icon(
                          Icons.arrow_upward,
                          color: Colors.green,
                        ),
                      ),
                    ),
                    TextSpan(text: '3.65%'),
                  ],
                ),
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'TOTAL %',
                style: Theme.of(_context).textTheme.caption,
              ),
              RichText(
                text: TextSpan(
                  style: Theme.of(_context).textTheme.bodyText1.copyWith(
                        fontSize: 18,
                        color: Colors.green,
                      ),
                  children: [
                    WidgetSpan(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                        child: Icon(
                          Icons.arrow_upward,
                          color: Colors.green,
                        ),
                      ),
                    ),
                    TextSpan(text: '31.65%'),
                  ],
                ),
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'TOTAL \$',
                style: Theme.of(_context).textTheme.caption,
              ),
              Text(
                '\$220,964',
                style: Theme.of(_context).textTheme.bodyText1.copyWith(
                      fontSize: 18,
                    ),
              ),
            ],
          )
        ],
      ),
    );
  }

  _renderBuyingOption() {
    return InkWell(
      onTap: () {
        Navigator.of(_context).pushNamed(CHAT);
      },
      child: ListTile(
        title: Text('Buying Power'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('\$3000.03'),
            Icon(
              Icons.chevron_right,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
