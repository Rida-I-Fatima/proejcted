import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject/provider/signin.dart';
import 'package:flutterproject/screens/about.dart';
import 'package:flutterproject/screens/home_page.dart';
import 'package:flutterproject/screens/profile.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final user = FirebaseAuth.instance.currentUser;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(''),
            accountEmail: Text(' '),
            
            decoration: BoxDecoration(
               image: DecorationImage(
            image: AssetImage(
                    'assets/images/logo.png'
                    ),
            fit: BoxFit.cover
        )
            ),
          ),
          ListTile(
              leading: Icon(Icons.login),
              title: Text('Sign in'),
              onTap: () async {
                final provider =
                    Provider.of<GoogleSignInProvider>(context, listen: false);
                await provider.googleLogin();
                var user = FirebaseAuth.instance.currentUser;
                if (user!=null) {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder:(context) => profile()));
                } else {
                  // No user is signed in.
                }
              }),
          Divider(),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('About Us'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => about()));
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.mail),
            title: Text('Contact Us'),
            onTap: () => launch('mailto:tanzanadeem61@gmail.com'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.admin_panel_settings),
            title: Text('Admin Panel'),
            onTap: () => null,
          ),
          Divider(),
          ListTile(
            title: Text('Exit'),
            leading: Icon(Icons.exit_to_app),
            onTap: () => null,
           
          ),
        ],
      ),
    );
  }
}
