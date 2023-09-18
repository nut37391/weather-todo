import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(251, 251, 250, 1.000),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 400,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('lib/image/image222.png'),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.blue,
                ),
              ),
              Positioned(
                bottom: 50,
                left: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        "John Snow",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 40,
                        ),
                      ),
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        "Chrief Executive Officer",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 100,
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                width: 150,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color.fromRGBO(222, 222, 222, 1.000),
                      width: 2,
                    ),
                    right: BorderSide(
                      color: Color.fromRGBO(222, 222, 222, 1.000),
                      width: 2,
                    ),
                  ),
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Colors.black,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('3749 Raritan St.'),
                    Text('Denver, Colorado')
                  ],
                ),
              ),
              Container(
                width: 150,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                    color: Color.fromRGBO(222, 222, 222, 1.000),
                    width: 2,
                  )),
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.mobile_friendly,
                      color: Colors.black,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Phone Number'),
                    Text('303-477-76001')
                  ],
                ),
              ),
            ]),
          ),
          Container(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 160,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border(
                        right: BorderSide(
                      color: Color.fromRGBO(222, 222, 222, 0.986),
                      width: 2,
                    )),
                  ),
                  child: Column(
                    children: [
                      Icon(
                        Icons.email,
                        color: Colors.black,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Email Address',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        'John_s@gmail.com',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: 160,
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Icon(
                        Icons.blur_circular,
                        color: Colors.black,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Website Here'),
                      Text('webwebsite.com')
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Column(
              children: [
                TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Color.fromRGBO(71, 88, 113, 1.000),
                    ),
                    child: Text('CONNECT WITH ME'))
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Icon(
                      Icons.facebook,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Icon(
                      FontAwesomeIcons.instagram,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Icon(
                      FontAwesomeIcons.linkedin,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Icon(
                      FontAwesomeIcons.twitter,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Icon(
                      FontAwesomeIcons.googlePlus,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Icon(
                      FontAwesomeIcons.pinterest,
                    ),
                  ],
                ),
              ),
            ],
          )),
          SizedBox(
            height: 10,
          ),
          Container(
              child: Center(
            child: Text(
              '@YOURSOCIALHANDLE',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          )),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  FontAwesomeIcons.globe,
                  size: 15,
                ),
                SizedBox(
                  width: 10,
                ),
                Text('www.website.com'),
              ],
            )),
          )
        ],
      ),
    );
  }
}
