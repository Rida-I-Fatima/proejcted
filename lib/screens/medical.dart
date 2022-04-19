import 'package:flutter/material.dart';
import 'package:flutterproject/screens/home_page.dart';
import 'package:flutterproject/screens/menu.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class medical extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: PreferredSize(
        preferredSize: Size.fromHeight(120.0),
        child: AppBar(
        elevation: 0.0,
        toolbarHeight: 150,
        backgroundColor: const Color(0xFF2E454B),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
          },
    child: Icon(
      Icons.arrow_back,
          color: Colors.white,
          size: 40,
        ),
        ),
        actions: [
          GestureDetector(
             onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
             },
            child: Container(
              margin: EdgeInsets.only(right: 10),
              
              child: Icon(
                Icons.home,
                color: Colors.white,
                size: 40,
                
              ),
            ),
          )
        
        ],
        title:  Container(
                  height: 120,
                  margin: EdgeInsets.only(left: 20, right: 30),

                  child: Row(
                           mainAxisAlignment : MainAxisAlignment.center,
                           
                    children: <Widget>[
                      CircleAvatar(
                        radius: 80,
                        backgroundImage: AssetImage('assets/images/logo.png'),
                        
                      )
                    ]
                  ),
                ),
        
        ),
      ),
        
        
      backgroundColor: const Color(0xFF2E454B),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              addDoctor(
                context,
                image: './assets/images/doctor.png',
                name: 'Dr. name',
                designation: '..........',
                degree: '..........',
                hospital: '..........',
                call: '+923407664008',
                whatsapp: '923407664008',
                messenger: '..........',
                email: 'rida@gmail.com',
              ),
              addDoctor(
                context,
                image: './assets/images/doctor.png',
                name: 'Dr. name',
                designation: '..........',
                degree: '..........',
                hospital: '..........',
                call: '+923407664008',
                whatsapp: '923407664008',
                messenger: '..........',
                email: 'rida@gmail.com',
              ),
              addDoctor(
                context,
                image: './assets/images/doctor.png',
                name: 'Dr. name',
                designation: '..........',
                degree: '..........',
                hospital: '..........',
                call: '+923407664008',
                whatsapp: '923407664008',
                messenger: '..........',
                email: 'rida@gmail.com',
              ),
              addDoctor(
                context,
                image: './assets/images/doctor.png',
                name: 'Dr. name',
                designation: '..........',
                degree: '..........',
                hospital: '..........',
                call: '+923407664008',
                whatsapp: '923407664008',
                messenger: '..........',
                email: 'rida@gmail.com',
              ),
            ],
          ),
        ));
  }
}

addDoctor(BuildContext context,
    {image,
    name,
    designation,
    degree,
    hospital,
    call,
    whatsapp,
    messenger,
    email}) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 5.0,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        //* Potrait Card Layout
        child: context.isPhone
            ? context.isPortrait
                ? verticalCard(image, name, designation, degree, hospital, call,
                    whatsapp, messenger, email)
                : horizontalCard(image, name, designation, degree, hospital,
                    call, whatsapp, messenger, email)
            : horizontalCard(image, name, designation, degree, hospital, call,
                whatsapp, messenger, email),
      ),
    ),
  );
}

ListTile horizontalCard(image, name, designation, degree, hospital, call,
    whatsapp, messenger, email) {
  return ListTile(
    leading: Container(
      width: 50.0,
      height: 50.0,
      decoration: BoxDecoration(
        border: Border.all(
          width: 2.0,
          color: Color(0xFF2E454B),
        ),
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.contain,
          image: AssetImage(image),
        ),
      ),
    ),
    title: Text(name),
    subtitle: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [Text(designation), Text(degree), Text(hospital)],
    ),
    trailing: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
            tooltip: 'Audio Call',
            icon: Icon(
              Icons.call,
            ),
            onPressed: () => launch('tel:' + call)),
        IconButton(
            tooltip: 'WhatsApp',
            icon: FaIcon(
              FontAwesomeIcons.whatsapp,
            ),
            onPressed: () => launch('https://wa.me/' + whatsapp)),
        IconButton(
            tooltip: 'Facebook Messenger',
            icon: FaIcon(
              FontAwesomeIcons.facebookMessenger,
            ),
            onPressed: () => launch('https://m.me/' + messenger)),
        IconButton(
            tooltip: 'Email',
            icon: Icon(
              Icons.email,
            ),
            onPressed: () => launch('mailto:' + email))
      ],
    ),
  );
}

ListTile verticalCard(image, name, designation, degree, hospital, call,
    whatsapp, messenger, email) {
  return ListTile(
    leading: Container(
      width: 50.0,
      height: 50.0,
      decoration: BoxDecoration(
        border: Border.all(
          width: 2.0,
          color: Color(0xFF2E454B),
        ),
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.contain,
          image: AssetImage(image),
        ),
      ),
    ),
    title: Text(name),
    subtitle: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(designation),
        Text(degree),
        Text(hospital),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: IconButton(
                  tooltip: 'Audio Call',
                  icon: Icon(
                    Icons.call,
                    size: 20,
                  ),
                  onPressed: () => launch('tel:' + call)),
            ),
            Expanded(
              child: IconButton(
                  tooltip: 'WhatsApp',
                  icon: FaIcon(
                    FontAwesomeIcons.whatsapp,
                    size: 20,
                  ),
                  onPressed: () => launch('https://wa.me/' + whatsapp)),
            ),
            Expanded(
              child: IconButton(
                  tooltip: 'Facebook Messenger',
                  icon: FaIcon(
                    FontAwesomeIcons.facebookMessenger,
                    size: 20,
                  ),
                  onPressed: () => launch('https://m.me/' + messenger)),
            ),
            Expanded(
              child: IconButton(
                  tooltip: 'Email',
                  icon: Icon(
                    Icons.email,
                    size: 20,
                  ),
                  onPressed: () => launch('mailto:' + email)),
            )
          ],
        ),
      ],
    ),
  );
}
