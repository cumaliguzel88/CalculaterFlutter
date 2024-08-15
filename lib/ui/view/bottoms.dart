import 'package:flutter/material.dart';

class Bottoms extends StatelessWidget {
  //uc adet değişken oluştrdum bunlar bana lazım
  //şimdi bunu gesturedocatır ile sarmalıyacam ki dokuna bilim
  final color;
  final textColor;
  final String bottomText;
  final buttonTapped;
  Bottoms(this.color, this.textColor, this.bottomText, this.buttonTapped);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTapped,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            color: color,
            child: Center(
              child: Text(
                bottomText,
                style: TextStyle(color: textColor, fontSize: 20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
