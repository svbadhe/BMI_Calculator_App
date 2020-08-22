import 'package:bmi/reusable_card.dart';
import 'package:flutter/material.dart';
import 'reusable_card.dart';

class Results extends StatelessWidget {
  Results({this.bmiResulttext, this.bmiAdviceText, this.bmiText});

  final String bmiResulttext;
  final String bmiText;
  final String bmiAdviceText;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('B.M.I Calculator')),
        ),
      backgroundColor: Color(0xFF0A0E21),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(flex: 1,child: Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: Text('Your Result', style: TextStyle(color: Colors.grey[400], fontSize: 45, fontWeight: FontWeight.w700),),
          )),
          Expanded(
            flex: 5,
            child: ReusableCard(
            color: 0xFF1D1E33,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Text(bmiResulttext, style: TextStyle(color: Colors.green)),
                ),
                Text(bmiText, style: TextStyle(color: Colors.grey[400], fontSize: 100, fontWeight: FontWeight.w700)),
                Text(bmiAdviceText, textAlign: TextAlign.center, style: TextStyle(color: Colors.grey[400]),),
                Container(
                  margin: EdgeInsets.only(top: 5, bottom: 1),
                  width: 200,
                  height: 40,
                  child: OutlineButton(
                    highlightedBorderColor: Color(0xFF0A0E21),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    borderSide: BorderSide(color: Color(0xFFEB1555), width: 1),
                    child: Text('RE-CALCULATE', style: TextStyle(color: Color(0xFFEB1555), fontSize: 20),),
                  ),
                ),
              ],
            ),
          ),
          ),
        ],
      )
    );
  }
}




