import 'package:flutter/material.dart';
import 'package:forclothes/data/clothes.dart';
import 'package:forclothes/ekran/detaylar.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  Future<List<Clothes>> clothesyukle() async {
    var clothesList = <Clothes>[];
    var c1 = Clothes(id: 1, ad: "Green Body", resim: "top1.png", fiyat: 42);
    var c2 = Clothes(id: 2, ad: "Halter Tops", resim: "top2.png", fiyat: 48);
    var c3 = Clothes(id: 3, ad: "Halter White", resim: "top3.png", fiyat: 48);
    var c4 = Clothes(id: 4, ad: "Special Trauser", resim: "pantolon1.png", fiyat: 60);
    var c5 = Clothes(id: 5, ad: "Trauser", resim: "pantolon2.png", fiyat: 62);
    var c6 = Clothes(id: 6, ad: "Black Jeans", resim: "pantolon3.png", fiyat: 55);
    var c7 = Clothes(id: 7, ad: "Shic Dress", resim: "elbise1.png", fiyat: 80);
    var c8 = Clothes(id: 8, ad: "Dress", resim: "elbise2.png", fiyat: 75);
    var c9 = Clothes(id: 9, ad: "Jacket", resim: "kaban2.png", fiyat: 80);
    var c10 = Clothes(id: 10, ad: "White Blazer", resim: "kaban3.png", fiyat: 65);
    var c11 = Clothes(id: 11, ad: "Sports", resim: "ayakkabı1.png", fiyat: 50);
    var c12 = Clothes(id: 12, ad: "Shoes", resim: "ayakkabı2.png", fiyat: 52);
    clothesList.add(c1);
    clothesList.add(c2);
    clothesList.add(c3);
    clothesList.add(c4);
    clothesList.add(c5);
    clothesList.add(c6);
    clothesList.add(c7);
    clothesList.add(c8);
    clothesList.add(c9);
    clothesList.add(c10);
    clothesList.add(c11);
    clothesList.add(c12);
    return clothesList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Betul's",
            style: TextStyle(fontFamily: "Elyazisi", fontSize: 32),
          ),
        ),
        body: FutureBuilder<List<Clothes>>(
          future: clothesyukle(),
          builder: (context, snapshot) {
            // Yükleniyor durumunda
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            // Hata durumu
            if (snapshot.hasError) {
              return Center(child: Text('Bir hata oluştu: ${snapshot.error}'));
            }

            // Veri mevcutsa
            if (snapshot.hasData) {
              var clothesListesi = snapshot.data;
              return ListView.builder(
                itemCount: clothesListesi!.length,
                itemBuilder: (context, i) {
                  var clothes = clothesListesi[i];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Detaylar(clothes: clothes),
                        ),
                      );
                    },
                    child: Card(
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: 128,
                              height: 128,
                              child: Image.asset("resimler/${clothes.resim}"),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${clothes.ad}",style: TextStyle(fontSize: 17),),
                              const SizedBox(height: 10),
                              Text(
                                "${clothes.fiyat}\$",
                                style: TextStyle(fontSize: 20, fontFamily: "Poppins"),
                              ),
                              const SizedBox(height: 10),
                              ElevatedButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text(
                                          "SEPET",
                                          style: TextStyle(fontSize: 20, fontFamily: "Poppins"),
                                        ),
                                        content: Text("Sepete eklendi.", style: TextStyle(fontSize: 15)),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text("Tamam", style: TextStyle(fontSize: 12)),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                  print("${clothes.ad} sepete eklendi.");
                                },
                                child: const Text("Sepete Ekle",style: TextStyle(color: Colors.brown),),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }

            // Veri yoksa
            return Center(child: Text('Veri bulunamadı'));
          },
        ));
  }
}



