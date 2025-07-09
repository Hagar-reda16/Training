import 'package:flutter/material.dart';
import 'package:proj/common_ui/constant.dart';
import 'package:proj/feature/presentation/screens/home.dart';
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          backGround(),
          Padding(padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Welcome" ,style: TextStyle(fontWeight:FontWeight.bold,fontSize:48,color: fontColor,fontFamily: 'Roboto'),),
              Text("To Our Site" ,style:TextStyle(fontWeight:FontWeight.bold,fontSize: 38,color: fontColor ,fontFamily: 'Roboto'),),
              SizedBox(height:16),
              buildCircleAvatar(),
              SizedBox(height: 24,),
              buildElevatedButton(context)


            ],
          ),),
        ],
      )
    );

  }

  ElevatedButton buildElevatedButton(BuildContext context) {
    return ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
            },
                style: ElevatedButton.styleFrom(minimumSize: Size(200,70)),
                child:Text("START SHOPPING" , style: TextStyle(fontSize: 20),));
  }

  CircleAvatar buildCircleAvatar() {
    return CircleAvatar(
              radius: 140,
              child: CircleAvatar(
                radius: 132,
                backgroundImage: AssetImage("assets/pics/welcomepic.jpg"),
              ),
            );
  }

  Opacity backGround() {
    return Opacity(
            opacity: 0.6,
            child: Image.asset("assets/pics/background.jpg" , fit: BoxFit.cover,));
  }
}

