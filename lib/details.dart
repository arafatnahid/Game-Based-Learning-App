import 'package:flutter/material.dart';

import 'mupuzzle.dart';

class MujibScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('৭ জন বীরশ্রেষ্ঠ'),
      ),
      body: ListView.separated(
        itemCount: 5, // Assuming you want 5 items
        separatorBuilder: (context, index) =>
            SizedBox(height: 1), // Add space between items
        itemBuilder: (context, index) {
          // Generate text based on index
          String itemText = '';
          switch (index) {
            case 0:
              itemText = 'বীরশ্রেষ্ঠ শহীদ নায়েক মুন্সী আবদুর রউফ';
              break;
            case 1:
              itemText = 'বীরশ্রেষ্ঠ শহীদ সিপাহী হামিদুর রহমান';
              break;
            case 2:
              itemText = 'বীরশ্রেষ্ঠ শহীদ ল্যান্স নায়েক নূর মোহাম্মদ শেখ';
              break;
            case 3:
              itemText = 'বীরশ্রেষ্ঠ শহীদ ফ্লাইট লেফটেন্যান্ট মতিউর রহমান';
              break;
            case 4:
              itemText = 'বীরশ্রেষ্ঠ শহীদ নায়েক মোহাম্মদ রুহুল আমিন';
              break;

            case 5:
              itemText = 'বীরশ্রেষ্ঠ শহীদ ক্যাপ্টেন মহিউদ্দিন জাহাঙ্গীর';

              break;
            case 6:
              itemText = 'বীরশ্রেষ্ঠ শহীদ সিপাহী মোস্তফা কামাল';

              break;
          }

          // Return a GestureDetector to handle tap events
          return GestureDetector(
            onTap: () {
              // Navigate to different screens based on the item clicked
              switch (index) {
                case 0:
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PuzzleScreen()),
                  );
                  break;
                case 1:
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondScreen()),
                  );
                  break;
                default:
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OtherScreen(index + 1)),
                  );
              }
            },
            child: Container(
              height: MediaQuery.of(context).size.height /
                  5, // Divide the screen height by the number of items
              color: Colors.blue[100 * (index + 1)],
              child: Center(
                child: Text(
                  itemText,
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// Screens for different items
class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
      ),
      body: Center(
        child: Text('This is the First Screen'),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: Center(
        child: Text('This is the Second Screen'),
      ),
    );
  }
}

class OtherScreen extends StatelessWidget {
  final int index;

  OtherScreen(this.index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Other Screen'),
      ),
      body: Center(
        child: Text('This is the Other Screen for item $index'),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MujibScreen(),
  ));
}
