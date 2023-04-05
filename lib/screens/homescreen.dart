import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:floating_navbar/floating_navbar.dart';
import 'package:floating_navbar/floating_navbar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

import '../components/appbar.dart';
import '../components/contentincards.dart';
import '../components/stardisplay.dart';

class HomeScreen extends StatelessWidget {
  List RandomImages = [
    'assets/images/hello.png',
    'assets/images/hello2.png',
    'assets/images/hello3.png'
  ];
  List<Product> productList = [
    Product('Mentors',
        'Start learning from the mentors coming from giant corporations like Microsoft, Google, Amazon, Paypal, etc!'),
    Product('Mentors',
        'Start learning from the mentors coming from giant corporations like Microsoft, Google, Amazon, Paypal, etc!'),
    Product('Mentors',
        'Start learning from the mentors coming from giant corporations like Microsoft, Google, Amazon, Paypal, etc!'),
    Product('Mentors',
        'Start learning from the mentors coming from giant corporations like Microsoft, Google, Amazon, Paypal, etc!'),
    Product('Mentors',
        'Start learning from the mentors coming from giant corporations like Microsoft, Google, Amazon, Paypal, etc!'),
    Product('Mentors',
        'Start learning from the mentors coming from giant corporations like Microsoft, Google, Amazon, Paypal, etc!'),
    Product('Mentors',
        'Start learning from the mentors coming from giant corporations like Microsoft, Google, Amazon, Paypal, etc!'),
    Product('Mentors',
        'Start learning from the mentors coming from giant corporations like Microsoft, Google, Amazon, Paypal, etc!'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: app_bar(context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 60,
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Welcome to ',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                  children: const <TextSpan>[
                    TextSpan(
                      text: 'the ',
                      style: TextStyle(
                          color: Colors.orange,
                          fontSize: 32,
                          fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: 'Future',
                      style: TextStyle(
                          color: Colors.orange,
                          fontSize: 32,
                          fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: ' of Learning!',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 32,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Start Learning by best creators for",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedTextKit(
                    isRepeatingAnimation: true,
                    repeatForever: true,
                    animatedTexts: [
                      TyperAnimatedText(
                        speed: Duration(milliseconds: 100),
                        'absolutely Free',
                        textStyle: TextStyle(
                          color: Colors.orange,
                          fontSize: 18,
                        ),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int i = 0; i < RandomImages.length; i++)
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 0),
                            child: Align(
                                widthFactor: 0.6,
                                child: CircleAvatar(
                                  radius: 35,
                                  backgroundColor: Colors.white,
                                  child: CircleAvatar(
                                    radius: 30,
                                    backgroundImage: AssetImage(
                                      RandomImages[i],
                                    ),
                                  ),
                                )),
                          ),
                        SizedBox(
                          width: 27,
                        ),
                        Column(
                          children: [
                            Container(
                              width: 60,
                              child: RichText(
                                textAlign: TextAlign.start,
                                text: TextSpan(
                                  text: '50+ ',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 21,
                                      fontWeight: FontWeight.bold),
                                  children: const <TextSpan>[
                                    TextSpan(
                                      text: 'Mentors ',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        VerticalDivider(
                          thickness: 0.8,
                          color: Colors.grey,
                        ),
                        Column(
                          children: [
                            Container(
                              width: 60,
                              child: Text(
                                textAlign: TextAlign.center,
                                '4.8/5 ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  //fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                            IconTheme(
                              data: IconThemeData(
                                color: Color.fromARGB(255, 241, 184, 12),
                                size: 19,
                              ),
                              child: StarDisplay(value: 4),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    fixedSize: Size(250, 50), // specify width, height
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                      10,
                    ))),
                onPressed: () {},
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Start Learning Now',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        //fontWeight: FontWeight.bold
                      ),
                    ), // <-- Text
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      // <-- Icon
                      Icons.arrow_circle_right,
                      size: 30.0,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              SizedBox(
                height: 250,
                child: ScrollSnapList(
                  focusOnItemTap: true,
                  itemBuilder: _buildListItem,
                  itemCount: productList.length,
                  itemSize: 150,
                  onItemFocus: (index) {},
                  dynamicItemSize: true,
                  reverse: true,
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                         
                          children: [
                            Text(
                              "15K+",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 24, color: Colors.orange,fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Students",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 16, color: Colors.black,fontWeight: FontWeight.normal),
                            ),

                          ],
                        ),
                        /* SizedBox(
                          width: 60,
                        ), */
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "10K+",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 24, color: Colors.orange,fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Certificates Delivered",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 16, color: Colors.black,fontWeight: FontWeight.normal),
                            ),

                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                     
                      children: [
                        Text(
                          "450K+",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 24, color: Colors.orange,fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Streamed Minutes",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16, color: Colors.black,fontWeight: FontWeight.normal),
                        ),

                      ],
                    ),
                    /* SizedBox(
                      width: 60,
                    ), */
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "12TB+",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 24, color: Colors.orange,fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Content Streamed",
                          softWrap: false,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16, color: Colors.black,fontWeight: FontWeight.normal),
                        ),

                      ],
                    ),
                  ],
                ),
                 
                ],
              ),
              SizedBox(
                height: 200,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListItem(BuildContext context, int index) {
    Product product = productList[index];
    return SizedBox(
      width: 150,
      height: 300,
      child: Card(
        color: Color.fromARGB(255, 59, 59, 59),
        elevation: 12,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage('assets/images/hello.png'),
                      maxRadius: 20,
                    ),
                  ),
                  SvgPicture.asset(
                    "assets/images/free.svg",
                    height: 20,
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Text(
                      product.title,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  /// mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      product.content,
                      style: const TextStyle(color: Colors.white, fontSize: 10),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
