import 'package:flutter/material.dart';
import 'package:test_app/models/portfolio_model.dart';

final PORTFOLIOS = [
  PortfolioData(
    title: 'Paypal',
    description: 'Lorem Ipsum',
    icon: 'https://www.paypalobjects.com/webstatic/icon/pp258.png',
    counter: 0,
    percentageValue: 2.3,
    isPositive: true,
  ),
  PortfolioData(
    title: 'Twitter',
    description: 'Lorem Ipsum',
    icon: 'https://help.twitter.com/content/dam/help-twitter/brand/logo.png',
    counter: 4,
    percentageValue: 25.3,
    isPositive: false,
  ),
  PortfolioData(
    title: 'Tesla',
    description: 'Lorem Ipsum',
    icon:
        'https://i.pinimg.com/originals/7b/80/b3/7b80b3276866f2258b570aa6c07e54ca.jpg',
    counter: 2,
    percentageValue: 65.8,
    isPositive: true,
  ),
  PortfolioData(
    title: 'Facebook',
    description: 'Lorem Ipsum',
    icon:
        'https://i.pinimg.com/originals/b1/85/9b/b1859bdac7d42d4a0a5a673bc4265564.png',
    counter: 0,
    percentageValue: 45.8,
    isPositive: false,
  )
];

class PortFolio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
              bottom: 10,
            ),
            child: Text(
              'Portfolio',
              style: Theme.of(context).textTheme.subtitle1.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (ctx, index) {
              final portfolio = PORTFOLIOS[index];
              return PortfolioItem(
                portfolio: portfolio,
              );
            },
            itemCount: PORTFOLIOS.length,
          ),
        ],
      ),
    );
  }
}

class PortfolioItem extends StatelessWidget {
  final PortfolioData portfolio;
  PortfolioItem({this.portfolio});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 5,
        bottom: 5,
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              right: 8,
            ),
            child: Image.network(
              portfolio.icon,
              width: 30,
              height: 30,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Text(
                          portfolio.title,
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                                fontSize: 14,
                              ),
                        ),
                        portfolio.counter > 0
                            ? Container(
                                margin: EdgeInsets.only(
                                  left: 5,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  shape: BoxShape.circle,
                                ),
                                padding: EdgeInsets.all(5),
                                child: Text(
                                  '${portfolio.counter}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption
                                      .copyWith(
                                        fontSize: 10,
                                        color: Colors.white,
                                      ),
                                ),
                              )
                            : Container(),
                      ],
                    ),
                    Text(
                      portfolio.description,
                      style: Theme.of(context).textTheme.caption.copyWith(
                            fontSize: 14,
                          ),
                    ),
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 5.75,
                  padding: EdgeInsets.all(3),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: portfolio.isPositive ? Colors.green : Colors.red,
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  child: RichText(
                    text: TextSpan(
                      style: Theme.of(context).textTheme.caption.copyWith(
                            color: Colors.white,
                          ),
                      children: [
                        WidgetSpan(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 2.0),
                            child: Icon(
                              portfolio.isPositive
                                  ? Icons.arrow_upward
                                  : Icons.arrow_downward,
                              color: Colors.white,
                              size: 15,
                            ),
                          ),
                        ),
                        TextSpan(text: '${portfolio.percentageValue}%'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
