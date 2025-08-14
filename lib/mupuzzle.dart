import 'package:collection/collection.dart'; // Import the collection package for ListEquality
import 'package:e_learning_app/testmp3.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(PuzzleApp());
}

class PuzzleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Puzzle Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PuzzleScreen(),
    );
  }
}

class PuzzleScreen extends StatefulWidget {
  @override
  _PuzzleScreenState createState() => _PuzzleScreenState();
}

class _PuzzleScreenState extends State<PuzzleScreen> {
  List<String> tiles = [];

  @override
  void initState() {
    super.initState();
    // Initialize the puzzle with tiles in random order
    initializePuzzle();
  }

  void initializePuzzle() {
    // Replace with your image paths
    tiles = [
      'assets/images/download3.jpg',
      'assets/images/download5.jpg',
      'assets/images/download2.jpg',
      'assets/images/download6.jpg',
      'assets/images/download4.jpg',
      'assets/images/download7.jpg',
      'assets/images/download8.jpg',
      'assets/images/download1.jpg',
      'assets/images/download0.jpg',
    ];
    tiles.shuffle();
  }

  void moveTile(int fromIndex, int toIndex) {
    setState(() {
      String temp = tiles[fromIndex];
      tiles[fromIndex] = tiles[toIndex];
      tiles[toIndex] = temp;
    });
    if (isSolved()) {
      showSuccessDialog();
    }
  }

  bool isSolved() {
    // Implement puzzle solved logic
    // For example, check if tiles are in correct order
    // This is just a placeholder, you need to implement your own logic
    // For simplicity, we are assuming the puzzle is solved if the tiles are in the original order
    List<String> originalOrder = [
      'assets/images/download0.jpg',
      'assets/images/download1.jpg',
      'assets/images/download2.jpg',
      'assets/images/download3.jpg',
      'assets/images/download4.jpg',
      'assets/images/download5.jpg',
      'assets/images/download6.jpg',
      'assets/images/download7.jpg',
      'assets/images/download8.jpg',
    ];
    return ListEquality().equals(tiles, originalOrder);
  }

  void showSuccessDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Congratulations!'),
        content: Text('You solved the puzzle.'),
        actions: <Widget>[
          ElevatedButton(
            // Use ElevatedButton instead of FlatButton
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TypoEffectApp(), //change here
                ),
              );
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Puzzle Game'),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
          ),
          child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemCount: tiles.length,
            itemBuilder: (context, index) {
              return Draggable<String>(
                data: tiles[index],
                child: DragTarget<String>(
                  builder: (BuildContext context, List<String?> candidateData,
                      List<dynamic> rejectedData) {
                    return Container(
                      alignment: Alignment.center,
                      width: 100,
                      height: 100,
                      color: Colors.blue,
                      child: Image.asset(
                        tiles[index]!,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                  onWillAccept: (data) => true,
                  onAccept: (data) => moveTile(tiles.indexOf(data!), index),
                ),
                feedback: Material(
                  child: Container(
                    alignment: Alignment.center,
                    width: 100,
                    height: 100,
                    color: Colors.blue.withOpacity(0.7),
                    child: Image.asset(
                      tiles[index]!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                childWhenDragging: Container(
                  width: 100,
                  height: 100,
                ),
                onDraggableCanceled: (_, __) {
                  // Do nothing
                },
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          initializePuzzle();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
