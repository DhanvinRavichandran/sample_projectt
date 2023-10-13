import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'listpage.dart';

class statuspage extends StatefulWidget {
  const statuspage({super.key});

  @override
  State<statuspage> createState() => _statuspageState();
}

class _statuspageState extends State<statuspage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: IconButton(onPressed: (){
        Navigator.pop(context);
      },icon: Icon(Icons.arrow_back_ios),),
        title: Text("Current Orders"),),
      body: SingleChildScrollView(
        child: Center(child: Column(children: [Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(width: 100.0.w,height: 80.0.h,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.black12),
            child: Column(children: [SizedBox(height:15,),
              CircleAvatar(radius: 60,backgroundImage: AssetImage("Image/bsimage.jpg"),),
              SizedBox(height: 1.0.h,),
              Expanded(child: Center(child: MyContainer(),)),
              Row(
                children: [SizedBox(width: 50,),Text("Status"),
                  Text(":"),
                  Container(width: 150,height: 50,decoration: BoxDecoration(borderRadius:
                  BorderRadius.circular(20)),
                  child: MyDropdownApp(),)
                ],
              )
              ,SizedBox(height: 10,)],),),
        ),
        ],),),
      ),
    );
  }
}



class MyDropdownApp extends StatefulWidget {
  @override
  _MyDropdownAppState createState() => _MyDropdownAppState();
}

class _MyDropdownAppState extends State<MyDropdownApp> {
  String selectedValue = 'Out of Delivery';
  List<String> dropdownItems = ['Out of Delivery', 'On the Way', 'Delivered', 'Return'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.green),
        child: Center(
          child: Column( mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[Row(
              children: [SizedBox(width:5.0.w,),
                DropdownButton<String>(
                  value: selectedValue,
                  onChanged: (String? newValue) { // Use String? as the data type
                    setState(() {
                      selectedValue = newValue!;
                    });
                  },
                  items: dropdownItems.map((String item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),
                ),],
            )

            ],
          ),
        ),
      ),
    );
  }
}



