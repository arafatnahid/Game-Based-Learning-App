import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(200); // Adjust the height as needed

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
          top: 50, left: 20, right: 20, bottom: 20), // Added bottom padding
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.1, 0.5],
          colors: [
            Color(0xff886ff2),
            Color(0xff6849ef),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello,",
                    style: TextStyle(
                      color: Colors.white, // Set text color to white
                      fontSize: 24, // Adjust font size as needed
                      fontWeight:
                          FontWeight.bold, // Adjust font weight as needed
                    ),
                  ),
                  Text(
                    "Welcome To Gamify",
                    style: TextStyle(
                      color: Colors.white, // Set text color to white
                      fontSize: 16, // Adjust font size as needed
                      fontWeight:
                          FontWeight.bold, // Adjust font weight as needed
                    ),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3), // Set shadow color
                      spreadRadius: 1, // Adjust the spread radius
                      blurRadius: 3, // Adjust the blur radius
                      offset: Offset(0, 1), // Offset of the shadow
                    ),
                  ],
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.notifications,
                    color: Colors.white, // Set icon color to white
                    size: 30, // Adjust icon size as needed
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Text(
            "Today is a good day to learn something new!",
            style: TextStyle(
              color: Colors.white,
              wordSpacing: 2.5,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 10), // Added space after the text
        ],
      ),
    );
  }
}

class SliderWidget extends StatefulWidget {
  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  final List<String> imageUrls = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLr4fUVlqLxzWu1y3dIf82fu2ikMMuVI7Rwg&usqp=CAU',
    'https://via.placeholder.com/300',
    'https://via.placeholder.com/300',
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: PageView.builder(
        itemCount: imageUrls.length,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        itemBuilder: (context, index) {
          return Image.network(
            imageUrls[index],
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }
}
