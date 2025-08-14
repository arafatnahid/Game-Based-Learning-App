import 'package:e_learning_app/model/product_model.dart';
import 'package:flutter/material.dart';

import '../../details.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'eLearning App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/mujib': (context) => MujibScreen(),
        '/programming': (context) => ProgrammingScreen(),
        '/finance': (context) => FinanceScreen(),
        '/ui_ux': (context) => UIUXScreen(),
      },
      home: Scaffold(
        appBar: AppBar(
          title: Text('Category List'),
        ),
        body: CategoryList(),
      ),
    );
  }
}

class CategoryList extends StatelessWidget {
  const CategoryList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.85,
      ),
      itemBuilder: (context, index) => CategoryCard(
        product: products[index],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () {
          print('Category tapped: ${product.id}');
          switch (product.id) {
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MujibScreen()),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProgrammingScreen()),
              );
              break;
            case 3:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FinanceScreen()),
              );
              break;
            case 4:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FinanceScreen()),
              );
              break;

            default:
              // Handle case where route is not defined
              break;
          }
        },
        child: Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: product.color,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            children: [
              Image.asset(
                product.image,
                height: 130,
                width: double.infinity,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                product.title,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProgrammingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Programming Screen'),
      ),
      body: Center(
        child: Text('Programming Content'),
      ),
    );
  }
}

class FinanceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Finance Screen'),
      ),
      body: Center(
        child: Text('FinanceScreen Content'),
      ),
    );
  }
}

class UIUXScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('UI/UX Screen Constructed');
    return Scaffold(
      appBar: AppBar(
        title: Text('UI/UX Screen'),
      ),
      body: Center(
        child: Text('UI/UX Content'),
      ),
    );
  }
}
