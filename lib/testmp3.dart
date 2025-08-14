import 'package:e_learning_app/quiz_screen.dart';
import 'package:e_learning_app/resultscreen.dart';
import 'package:flutter/material.dart';
import 'package:typewritertext/typewritertext.dart';

void main() {
  runApp(TypoEffectApp());
}

class TypoEffectApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'জীবনী',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TypoEffectPage(),
    );
  }
}

class TypoEffectPage extends StatefulWidget {
  @override
  _TypoEffectPageState createState() => _TypoEffectPageState();
}

class _TypoEffectPageState extends State<TypoEffectPage> {
  late final TypeWriterController controller;

  @override
  void initState() {
    super.initState();
    controller = TypeWriterController(
      text:
          'বাংলাদেশের মানচিত্রে দেশের ভৌগোলিক গঠন, প্রাকৃতিক বৈশিষ্ট্য ও প্রশাসনিক বিন্যাস স্পষ্টভাবে ফুটে ওঠে। দেশটি দক্ষিণ এশিয়ায় অবস্থিত এবং এর আয়তন প্রায় ১,৪৭,৫৭০ বর্গকিলোমিটার। উত্তরে, পশ্চিমে ও পূর্বে ভারত এবং দক্ষিণ-পূর্বে মিয়ানমার সীমান্তবর্তী, দক্ষিণ দিকে রয়েছে বঙ্গোপসাগর।বাংলাদেশ মোট ৮টি বিভাগ, ৬৪টি জেলা, অসংখ্য উপজেলা ও ইউনিয়নে বিভক্ত। মানচিত্রে পদ্মা, মেঘনা, যমুনা, তিস্তা, কর্ণফুলীসহ বড় বড় নদীগুলোর প্রবাহ, সুন্দরবন, চট্টগ্রাম পাহাড়ি অঞ্চল, সিলেটের চা বাগান, কক্সবাজারের সমুদ্রসৈকতসহ গুরুত্বপূর্ণ প্রাকৃতিক নিদর্শনগুলো চিহ্নিত থাকে। রাজধানী ঢাকা, প্রধান শহর চট্টগ্রাম, খুলনা, রাজশাহী, বরিশাল, সিলেট ইত্যাদির অবস্থানও মানচিত্রে স্পষ্টভাবে নির্দেশিত হয়।', // Replace this with your desired text
      duration: const Duration(milliseconds: 100),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('জীবনী'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SingleChildScrollView(
              child: TypeWriter(
                controller: controller,
                builder: (context, value) {
                  return Text(
                    value.text,
                    style: TextStyle(fontSize: 20.0),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ResultScreen(points: 8,)),
                  );
                },
                child: Text('Go To Quiz'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
