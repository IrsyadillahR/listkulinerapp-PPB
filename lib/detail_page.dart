import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:listkulinerapp/makanan.dart';
import 'package:listkulinerapp/styles.dart';

class DetailPage extends StatelessWidget{
  final Makanan makanan;

  DetailPage({super.key, required this.makanan});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: pageBgColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
            Stack(
              children:[
                Image.asset(makanan.gambarUtama, scale: 0.5,),
                Container(
                  margin: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [ButtenBack(), ButtenLike()],
                  ),
                )
              ],
            ),
            Container(
              color: headerBackColor,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text(
                makanan.nama,
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                attributesIcon(Icons.access_time_filled, makanan.waktuBuka),
                attributesIcon(Icons.local_fire_department, makanan.kalori),
                attributesIcon(Icons.monetization_on, makanan.harga),
              ],
            ),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                makanan.detail,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),
            listGambarLain(),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text("Bahan Racikan", style: textHeader1)),
            SizedBox(
              height: 100,
              child: ListView.builder(
                itemCount: makanan.bahan.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index){
                  return Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    width: 120,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Column(
                      children: [
                        Image.asset(
                          makanan.bahan[index].values.first,
                          width: 52),
                        Text(makanan.bahan[index].keys.first)
                      ],
                    ),
                  );
              }),
            )
        ],
        ),
      ),
    ),
    );
  }

  SizedBox listGambarLain() {
    return SizedBox(
            height: 150,
            child: ListView.builder(
              itemCount: makanan.gambarLain.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index){
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(makanan.gambarLain[index])),
                );
            }),
          );
  }

  Column attributesIcon(IconData icon, String teks) {
    return Column(
                children: [
                  Icon(icon, color: iconColor ),
                  Text(
                    teks,
                    style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold),
                  ),
              ],
              );
  }
}

class ButtenBack extends StatelessWidget {
  const ButtenBack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.grey,
      child: IconButton(
        onPressed: (){
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back_rounded,
          color: Colors.white,
        ),
      ),
    );
  }
}

class ButtenLike extends StatefulWidget {
  const ButtenLike({super.key,});

  @override
  State<StatefulWidget> createState() => _ButtenLike();
}

class _ButtenLike extends State<ButtenLike>{
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.grey,
      child: IconButton(
        onPressed: (){
          setState(() {
            isSelected = !isSelected;
          });
        },
        icon: Icon(
          isSelected ? Icons.favorite : Icons.favorite_outline,
          color: const Color.fromARGB(255, 205, 1, 1),
        ),
      ),
    );
  }

}