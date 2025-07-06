import 'package:flutter/material.dart';
import 'package:proj/constant.dart';
import 'package:proj/home.dart';
import 'package:proj/main.dart';
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Opacity(
              opacity: 0.6,
              child: Image.asset("assets/pics/background.jpg" , fit: BoxFit.cover,)),
          Padding(padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Welcome" ,style: TextStyle(fontWeight:FontWeight.bold,fontSize:65,color: fontColor,fontFamily: 'Roboto'),),
              Text("To Our Site" ,style:TextStyle(fontWeight:FontWeight.bold,fontSize: 45,color: fontColor ,fontFamily: 'Roboto'),),
              SizedBox(height:15),
              CircleAvatar(
                radius: 140,
                child: CircleAvatar(
                  radius: 130,
                  backgroundImage: AssetImage("assets/pics/welcomepic.jpg"),
                  // child: Image.asset("assets/pics/welcomepic.jpg"),
                ),
              ),
              SizedBox(height: 25,),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
              },
                  style: ElevatedButton.styleFrom(minimumSize: Size(200,70)),
                  child:Text("START SHOPPING" , style: TextStyle(fontSize: 20),))


            ],
          ),),
        ],
      )
    );

  }
}

/* Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Welcome" ,style: TextStyle(fontSize: 25),),
          Text("To Our Site" ,style:TextStyle(fontSize: 24),),

        ],
      ),*/
