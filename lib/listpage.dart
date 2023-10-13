import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  List Topics = ["Name of the Cousmter","Product brand","Product brand","Quantity","Price",""
      "Delivery range","Address","Phone Number"];
  List CoustmerDetails =["Naveen B S","Bisleri","20 lit"," 10 cans","400","5 km","Salem","7863892929"];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              itemCount: Topics.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text(Topics[index]),
                  title: Text(":"),
                  trailing: Text(CoustmerDetails[index]),
                  // You can customize the ListTile's appearance here
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}