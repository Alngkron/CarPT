import 'dart:convert';

import 'package:carpt/models/car.dart';
import 'package:flutter/material.dart';
import 'package:carpt/data/car_api.dart';
// import 'package:carpt/data/car_data.dart';
import 'package:carpt/pages/car_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Car> cars = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getCars();
  }

  Future<void> getCars() async {
    cars = await CarApi().fetchCars() ?? [];
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.car_rental),
            SizedBox(
              width: 10,
            ),
            Text('Car Rental'),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: cars.length,
        itemBuilder: (context, index) {
          return RecipeCard(
            title: cars[index].name,
            rating: cars[index].rating.toString(),
            cookTime: cars[index].totalTime,
            thumbnailUrl: cars[index].images,
          );
        },
      ),
    );
  }
}
