import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: IconButton(
          onPressed: () {
          },
          icon: const Icon(Icons.menu)
        ),
        title: const Text('Your Cards', style:  TextStyle(fontSize:20, fontWeight: FontWeight.w500 ),),
        titleSpacing: 100.0,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
        ],
      
      ),
      body:  SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [
          0.1,
          0.9
        ],
        colors: [
          Color.fromRGBO(17, 16, 23, 1),
          Color.fromRGBO(9, 3, 32, 1),
        ])
        ),
        child: const  Column(
          children: [
          ],
        ),
      ),
    ),);
  }
}
