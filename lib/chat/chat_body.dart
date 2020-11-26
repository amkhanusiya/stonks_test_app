import 'package:flutter/material.dart';

import 'chat_list.dart';

class ChatBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return new Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        new SizedBox(
          // child: new Contacts(),
          height: deviceSize.height * 0.15,
        ),
        Flexible(
          child: ChatList(),
        )
      ],
    );
  }
}
