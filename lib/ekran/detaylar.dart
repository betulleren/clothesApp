
import 'package:flutter/material.dart';
import 'package:forclothes/data/clothes.dart';

class Detaylar extends StatefulWidget {
  Clothes clothes;
  Detaylar({required this.clothes});

  @override
  State<Detaylar> createState() => _DetaylarState();
}

class _DetaylarState extends State<Detaylar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text(widget.clothes.ad),),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:[
            Image.asset("resimler/${widget.clothes.resim}"),
            Text("${widget.clothes.fiyat}\$",style: const TextStyle(fontSize:40,fontFamily: "poppins"),),
          ],
        ),
      ),
    );
  }
}