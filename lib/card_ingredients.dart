import 'package:flutter/material.dart';

class CardIngredients extends StatelessWidget {
  CardIngredients({this.cardIcon, this.cardText});
  final IconData cardIcon;
  final String cardText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(cardIcon, size: 80, color: Colors.grey[400],),
        SizedBox(height: 15,),
        Text(cardText, style: TextStyle(color: Colors.grey[600], fontSize: 15),)
      ],
    );
  }
}
