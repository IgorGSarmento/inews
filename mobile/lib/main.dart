import 'package:flutter/material.dart';
import 'package:iNews/pages/news_page.dart';
import 'package:iNews/pages/events_page.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

void main() => runApp(TabBarNavigation());

class TabBarNavigation extends StatefulWidget {
  @override
  _TabBarNavigationState createState() => _TabBarNavigationState();
}

class _TabBarNavigationState extends State<TabBarNavigation> {
  bool isLoggedIn = false;

  String token;

  void onLoginStatusChanged(bool isLoggedIn) {
    setState(() {
      this.isLoggedIn = isLoggedIn;
    });
  }

  void initiateFacebookLogin() async {
    final _facebookLogin = FacebookLogin();

    final result = await _facebookLogin.logInWithReadPermissions(['email']);

    switch (result.status) {
      case FacebookLoginStatus.error:
        print("Error");
        onLoginStatusChanged(false);
        break;
      case FacebookLoginStatus.cancelledByUser:
        print("CancelledByUser");
        onLoginStatusChanged(false);
        break;
      case FacebookLoginStatus.loggedIn:
        print("LoggedIn");
        onLoginStatusChanged(true);
        break;
    }
  }

  void initiateGoogleLogin() async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );

    _googleSignIn.signIn().then((GoogleSignInAccount acc) async {
      GoogleSignInAuthentication auth = await acc.authentication;
      acc.authentication.then((GoogleSignInAuthentication auth) async {
        onLoginStatusChanged(true);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "iNews",
              textAlign: TextAlign.center,
              style: GoogleFonts.oleoScriptSwashCaps(
                textStyle: TextStyle(
                  fontSize: 30,
                  color: Color(0xFF495867),
                ),
              ),
            ),
            backgroundColor: Color(0xFFF7F7FF),
          ),
          body: TabBarView(
            children: [
              NewsPage(),
              isLoggedIn
                  ? EventsPage()
                  : Container(
                      padding: EdgeInsets.fromLTRB(10, 100, 10, 0),
                      width: double.maxFinite,
                      child: Column(
                        children: [
                          Text(
                            "Faça login para vizualizar essa pagina!",
                            style: GoogleFonts.oswald(
                              textStyle: TextStyle(
                                fontSize: 25,
                              ),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          RaisedButton(
                            color: Color(0xFF577399),
                            onPressed: () => initiateFacebookLogin(),
                            child: const Text(
                              'Entrar com o Facebook',
                              style: TextStyle(
                                fontSize: 20,
                                color: Color(0xFFF7F7FF),
                              ),
                            ),
                          ),
                          RaisedButton(
                            color: Color(0xFFFE5F55),
                            onPressed: () => initiateGoogleLogin(),
                            child: const Text(
                              'Entrar com o Google',
                              style: TextStyle(
                                fontSize: 20,
                                color: Color(0xFFF7F7FF),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
            ],
          ),
          bottomNavigationBar: Container(
            color: Color(0xFFF7F7FF),
            child: TabBar(
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(
                  text: "Notícias",
                  icon: Icon(
                    Icons.article,
                    color: Colors.black,
                  ),
                ),
                Tab(
                  text: "Eventos",
                  icon: Icon(
                    Icons.event,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
