import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:fswitch_nullsafety/fswitch_nullsafety.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Courses extends StatefulWidget {
  @override
  State<Courses> createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  List<String> items = [
    'Popular',
    'Latest',
  ];
  String dropdownValue = 'Popular';
  int activeIndex = 0;
  final controller = CarouselController();
  final urlImages = [
    'assets/images/1 (1).png',
    'assets/images/1 (2).png',
    'assets/images/1 (3).png',
    'assets/images/1 (4).png',
  ];
  List colorOptions = [
    "App Development",
    "Web Development",
    "Game Development",
    "Data Structures",
    "Programming",
    "Machine Learning",
    "Data Science",
    "Others",
  ];
  final _themeData = GetStorage();
  bool _isdarkMode = false;
  @override
  void initState() {
    super.initState();
    _themeData.writeIfNull("darkmode", false);
    _isdarkMode = _themeData.read("darkmode");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.8,
        title: Text(
          "CipherSchools",
          textAlign: TextAlign.start,
          style: TextStyle(
              color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 8, bottom: 8),
          child: Image.asset("assets/icons/logo.png"),
        ),
        actions: <Widget>[
          Tooltip(
            message: "",
            child: TextButton.icon(
              style: TextButton.styleFrom(
                iconColor: Colors.black, // Text Color
              ),
              icon: const Icon(Icons.menu_open_outlined),
              label: const Text(
                "Browse",
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.normal),
              ),
              onPressed: () {
                showMenu(
                  context: context,
                  position: const RelativeRect.fromLTRB(180, 100, 60, 100),
                  items: List.generate(
                    colorOptions.length,
                    (index) {
                      return PopupMenuItem(
                          value: index,
                          //onTap: () => handleTap(index),
                          child: Wrap(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(colorOptions[index]),
                                //value: _MenuValues.signin,
                              ),
                            ],
                          ));
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: SizedBox(
              height: 15,
              width: 30,
              child: SwitchListTile(
                value: _isdarkMode,
                onChanged: (value) {
                  setState(() {
                    _isdarkMode = value;
                  });
                  _isdarkMode
                      ? Get.changeTheme(ThemeData.dark())
                      : Get.changeTheme(ThemeData.light());
                  _themeData.write('darkmode', value);
                },
                /*  activeThumbImage: const AssetImage("assets/half-moon.png"),
                  inactiveThumbImage: const AssetImage("assets/sun.png"), */
                activeColor: Colors.blue,
                inactiveTrackColor: Colors.grey,
              ),
            ),
          ),
          IconButton(
            color: Colors.black,
            iconSize: 29,
            onPressed: () {},
            icon: Icon(Icons.notifications_active_outlined),
          ),
          IconButton(
            color: Colors.black,
            iconSize: 29,
            onPressed: () {},
            icon: Icon(Icons.search),
          )
        ],
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            CarouselSlider.builder(
                carouselController: controller,
                itemCount: urlImages.length,
                itemBuilder: (context, index, realIndex) {
                  final urlImage = urlImages[index];
                  return buildImage(urlImage, index);
                },
                options: CarouselOptions(
                    viewportFraction: 1,
                    height: 300,
                    autoPlay: true,
                    enableInfiniteScroll: false,
                    autoPlayAnimationDuration: Duration(seconds: 2),
                    enlargeCenterPage: true,
                    onPageChanged: (index, reason) =>
                        setState(() => activeIndex = index))),
            SizedBox(height: 12),
            buildIndicator(),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    "Recommended Courses",
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 39,
                  child: DropdownButton<String>(
                    borderRadius: BorderRadius.circular(10),
                    value: dropdownValue,
                    items: items.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                          value: value, child: Text(value));
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue ?? '';
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 287,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 8,
                  separatorBuilder: (context, _) => SizedBox(
                    width: 12,
                  ),
                  itemBuilder: (context, index) => buildCard(),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    "Latest Videos",
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 287,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 8,
                  separatorBuilder: (context, _) => SizedBox(
                    width: 12,
                  ),
                  itemBuilder: (context, index) => buildCard(),
                ),
              ),
            ),
            SizedBox(
              height: 150,
            )
          ],
        ),
      ),
    );
  }

  buildCard() => Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color.fromARGB(255, 234, 234, 234),
        ),
        child: Column(
          children: [
            Container(
              width: 200.0,
              height: 120.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/1 (1).png')),
                color: Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  "Web Development",
                  style: TextStyle(
                      fontSize: 11,
                      color: Colors.orange,
                      backgroundColor: Colors.orange[100]),
                ),
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Text(
                  'JavaScript(JS)',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Text(
                  'No. of Videos: 36',
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 11),
                )
              ],
            ),
            SizedBox(
              height: 3,
            ),
            Row(
              children: [
                Text(
                  'Course Time : 5.1 hours',
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 11),
                )
              ],
            ),
            SizedBox(
              height: 6,
            ),
            Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/images/hello.png'),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    Text(
                      "Shruti Codes",
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "Instructor",
                      textAlign: TextAlign.start,
                      style:
                          TextStyle(fontSize: 11, fontWeight: FontWeight.w300),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      );
  Widget buildIndicator() => AnimatedSmoothIndicator(
        onDotClicked: animateToSlide,
        effect: ExpandingDotsEffect(dotWidth: 15, activeDotColor: Colors.blue),
        activeIndex: activeIndex,
        count: urlImages.length,
      );

  void animateToSlide(int index) => controller.animateToPage(index);
}

Widget buildImage(String urlImage, int index) =>
    Container(child: Image.asset(urlImage, fit: BoxFit.cover));
