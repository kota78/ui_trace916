import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_trace916/food_category.dart';
import 'package:ui_trace916/burgerData.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

Burger burger = Burger();
FoodCategory foodCategory = FoodCategory();
int foodNumber = 0;

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          color: Colors.black,
          iconSize: 40,
          icon: Icon(Icons.expand_more),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            color: Colors.black,
            icon: Icon(
              Icons.tune,
            ),
            onPressed: () {},
          ),
        ],
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Pick-Up from",
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14.0,
              ),
            ),
            Text(
              "6201 Hollywood (cross st...",
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),

      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: foodCategory.categoryIcon.length,
                    itemBuilder: (BuildContext context, int index) {
                      return listIcon(index);
                    }
                    ),
            ),
          ),
        SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            foodCategory.categoryName[foodNumber],
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "No hormones or antibiotics ever, our 100%\nbeef is humanely raised and gazed in USA",
            style: TextStyle(
              color: Colors.grey[700]
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Container(
            child: ListView.builder(
                itemCount: burger.url.length,
                itemBuilder: (BuildContext context, int index) {
                  return pictureCard(index);
                }
            ),
          ),
        ),
      ],),
    );
  }

  Widget listIcon (int value){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          print("onTaped");
          setState(() {
            foodNumber = value;
          });
        },
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            shape: BoxShape.circle,
            color: foodNumber == value ? Colors.green : Colors.white,
          ),
          child: Icon(
            foodCategory.categoryIcon[value],
            color: foodNumber == value ? Colors.white : Colors.green,
            size: 40,
          ),
        ),
      ),
    );
  }


  Widget pictureCard(int itemNumber) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(16),
            ),
            child: Image.network(burger.url[itemNumber]),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              burger.name[itemNumber],
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              "Cheeseburger topped with freshly sliced avocado,\nNiman Ranch applewood-smoked bacon,\nShackSauce",
              style: TextStyle(
                  color: Colors.grey
              ),
            ),
          ),
          SizedBox(height: 40,),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "" + burger.price[itemNumber],
                  style: TextStyle(
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(burger.calorie[itemNumber] + "cal"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


