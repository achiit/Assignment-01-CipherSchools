import 'package:flutter/material.dart';

enum _MenuValues {
  home,
  content,
  live_review,
  community,
  explore,
  signin
}

AppBar app_bar(BuildContext context) {
  return AppBar(
    elevation: 0.7,
    title: Text(
      "CipherSchools",
      textAlign: TextAlign.left,
      style: TextStyle(
          color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold),
    ),
    leading: Padding(
      padding: const EdgeInsets.only(left: 8.0, top: 8, bottom: 8),
      child: Image.asset("assets/icons/logo.png"),
    ),
    actions: <Widget>[
      Theme(
        data: Theme.of(context).copyWith(
          iconTheme: IconThemeData(color: Colors.black)
        ),
        child: PopupMenuButton<_MenuValues>(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          icon: Icon(Icons.menu),
          itemBuilder: (BuildContext context) => [
            PopupMenuItem(
              child: Text('Home'),
              value: _MenuValues.home,
              
            ),
            PopupMenuItem(
              child: Text('Creator Access'),
              value: _MenuValues.content,
            ),
            PopupMenuItem(
              child: Text('Live Reviews'),
              value: _MenuValues.live_review,
            ),
            PopupMenuItem(
              child: Text('Community'),
              value: _MenuValues.community,
            ),
            PopupMenuItem(
              child: Text('Explore Courses'),
              value: _MenuValues.explore,
            ),
            PopupMenuItem(
              child: Text('SignIn'),
              value: _MenuValues.signin,
            ),
          ],
          onSelected: (value) {
            switch (value) {
              case _MenuValues.home:
                /* Navigator.of(context)
                    .push(MaterialPageRoute(builder: (c) => SecondPage(),),); */
                break;
              case _MenuValues.content:
                /* Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (c) => SettingsPage(),
                  ),
                ); */
                break;
                case _MenuValues.live_review:
                /* Navigator.of(context)
                    .push(MaterialPageRoute(builder: (c) => SecondPage(),),); */
                break;
                case _MenuValues.community:
                /* Navigator.of(context)
                    .push(MaterialPageRoute(builder: (c) => SecondPage(),),); */
                break;
                case _MenuValues.explore:
                /* Navigator.of(context)
                    .push(MaterialPageRoute(builder: (c) => SecondPage(),),); */
                break;
                case _MenuValues.signin:
                /* Navigator.of(context)
                    .push(MaterialPageRoute(builder: (c) => SecondPage(),),); */
                break;
            }
          },
        ),
      )
    ],
    backgroundColor: Colors.white,
  );
}
