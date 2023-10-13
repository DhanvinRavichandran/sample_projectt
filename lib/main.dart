import 'package:flutter/material.dart';
import 'package:sample_project/listpage.dart';
import 'package:sample_project/statuspage.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          title: 'Sizer Example',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.green,
          ),
          home: firstpage(),
        );
      },
    );
  }
}

class firstpage extends StatefulWidget {
  const firstpage({super.key});

  @override
  State<firstpage> createState() => _firstpageState();
}

class _firstpageState extends State<firstpage> {
  var selectindex=0;
  @override
  Widget build(BuildContext context) {
    return
      DefaultTabController( length: 3,
        child: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: (){},icon: Icon(Icons.shopping_cart_outlined),),
          title: Text("Orders"),
          actions: [IconButton(onPressed: (){},icon: Icon(Icons.notifications_active),)],
          bottom: TabBar(
            tabs: [
              Tab(text: "Current Orders",),
              Tab(text: "On-going Orders",),
              Tab(text: "Completed Orders",)
            ],
          )
        ),
          body: ListView.builder(itemCount: 5,itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: GestureDetector(onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>
                Currentpage()));
              },
                child: Container(width: 50.0.w,height: 15.0.h,padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.black12),
                child: Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [CircleAvatar(radius: 40,backgroundImage:
                  AssetImage("Image/bsimage.jpg"),),
                  Container(width: 30.0.w,height: 20.0.h,color:
                    Colors.transparent,child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [Text("BS NAVEEN",
                      style: TextStyle(color: Colors.black,fontSize: 15,fontWeight:FontWeight.bold),),
                    Text("Bisleri - 20 lit",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight:FontWeight.bold)),
                    Text("10 cans | 400",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight:FontWeight.bold))],
                  ),),
                    Container(width: 30.0.w,height: 20.0.h,color:
                    Colors.transparent,child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
                      Container(width: 13.0.w,height: 4.0.h,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.green),
                      child: TextButton(onPressed: (){}, child: Text("Accept",style: TextStyle(color: Colors.white,fontSize: 10),)),),
                      SizedBox(width: 2.0.w,),
                      Container(width: 13.0.w,height: 4.0.h,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.red)
                      ,child: TextButton(onPressed: (){}, child: Text("Reject",style: TextStyle(color: Colors.white,fontSize: 10),)),),],)
                    ],),)],
                ),),
              ),
            );
          }),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (position){
              setState(() {
                selectindex = position;
              });
            },
            showUnselectedLabels: true,
            currentIndex: selectindex,
            showSelectedLabels: true,
            selectedItemColor: Colors.black,
            items: [BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home",backgroundColor: Colors.green),
              BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined),label: "Orders",backgroundColor: Colors.green),
              BottomNavigationBarItem(icon: Icon(Icons.shopping_bag),label: "Products",backgroundColor: Colors.green),
              BottomNavigationBarItem(icon: Icon(Icons.more_vert),label: "More",backgroundColor: Colors.green)],
          ),
    ),
      );
  }
}
class Currentpage extends StatefulWidget {
  const Currentpage({super.key});

  @override
  State<Currentpage> createState() => _CurrentpageState();
}

class _CurrentpageState extends State<Currentpage> {
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
              Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                Container(width: 20.0.w,height: 4.0.h,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.green),
                  child: TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>
                        statuspage()));
                  }, child: Text("Accept",style: TextStyle(color: Colors.white,fontSize: 10),)),),
                SizedBox(width: 2.0.w,),
                Container(width: 20.0.w,height: 4.0.h,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.red)
                  ,child: TextButton(onPressed: (){
                    Navigator.pop(context);
                  }, child: Text("Reject",style: TextStyle(color: Colors.white,fontSize: 10),)),),],)

            ],),),
          ),
        ],),),
      ),
    );
  }
}


