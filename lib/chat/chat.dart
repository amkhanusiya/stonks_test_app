import 'package:flutter/material.dart';

import 'chat_body.dart';

BuildContext _context;

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _context = context;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: _renderHeader(),
            ),
            ChatBody(),
            Align(
              alignment: Alignment.bottomCenter,
              child: _renderSendMessageArea(),
            )
          ],
        ),
      ),
    );
  }

  _renderSendMessageArea() {
    return Container(
        color: Colors.white,
        height: 92.0,
        alignment: Alignment.topCenter,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 8.0, right: 18.0, top: 8.0),
              child: Row(
                children: <Widget>[
                  Flexible(
                    child: TextField(
                      decoration: InputDecoration.collapsed(
                        hintText: 'Type a Message',
                      ),
                    ),
                  ),
                  Icon(
                    Icons.zoom_out_map,
                    color: Colors.grey,
                    size: 18,
                  )
                ],
              ),
            ),
            Row(
              children: <Widget>[
                Container(width: 10),
                Icon(Icons.alternate_email, color: Colors.grey, size: 18),
                Container(width: 10),
                Icon(Icons.attach_file, color: Colors.grey, size: 18),
                Container(width: 10),
                Icon(Icons.photo_camera, color: Colors.grey, size: 18),
                Spacer(),
                IconButton(
                  icon: Icon(
                    Icons.send,
                    color: Colors.grey,
                    size: 18,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ));
  }

  _renderHeader() {
    final _theme = Theme.of(_context);
    return Container(
      height: 50,
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(_context).pop();
            },
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "PayPal",
                style: _theme.textTheme.subtitle1.copyWith(
                  fontSize: 16,
                ),
              ),
              Text(
                "18,923 members",
                style: _theme.textTheme.bodyText1.copyWith(
                  color: Colors.grey,
                  fontSize: 13,
                ),
              )
            ],
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "\$243.66",
                        style: _theme.textTheme.subtitle1.copyWith(
                          fontSize: 16,
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          style: Theme.of(_context).textTheme.caption.copyWith(
                                color: Colors.green,
                              ),
                          children: [
                            WidgetSpan(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2.0),
                                child: Icon(
                                  Icons.arrow_upward,
                                  color: Colors.green,
                                  size: 15,
                                ),
                              ),
                            ),
                            TextSpan(text: '1.62%'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: 10,
                    right: 10,
                    top: 5,
                    bottom: 5,
                  ),
                  margin: EdgeInsets.only(
                    right: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Text(
                    'Trade',
                    style: _theme.textTheme.bodyText1.copyWith(
                      color: Colors.white,
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
