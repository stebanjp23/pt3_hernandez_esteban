import 'package:flutter/material.dart';
import 'list_sport.dart';
import 'sports.dart';
import 'teams_screen.dart';

class Home_Screen extends StatelessWidget {
  const Home_Screen({super.key});
  

  List<Card> buildCard(BuildContext context,List<Sports> deportes) {
    return deportes.map((deporte) {
      return Card(
        child: InkWell(
          onTap: (){ 
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => Teams_Screen(
                sportName: deporte.name.toLowerCase()
                )
            ));
          },
        child: Column(
          mainAxisSize: MainAxisSize.min, 
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            AspectRatio(
              aspectRatio: 12/10,
              child: Image.network(deporte.img) 
            ),
            Text(deporte.name,  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ],
        ),)

      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Deportes App'), centerTitle: true),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 5, 
        mainAxisSpacing: 10,
        padding: const EdgeInsets.all(10), 
        children: buildCard(context,deportes)
        ),
    );
  }
}
