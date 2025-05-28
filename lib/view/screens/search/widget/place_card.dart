// lib/view/screens/search/widget/place_card.dart
import 'package:flutter/material.dart';

class PlaceCard extends StatelessWidget {
  final int placeID;
  final String image;
  final String text;
  final int guest;
  final String location;
  final int price;
  final double rating;
  final String category; 

  const PlaceCard({
    super.key,
    required this.placeID,
    required this.image,
    required this.text,
    required this.guest,
    required this.location,
    required this.price,
    required this.rating,
    required this.category, 
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(image, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(text, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 4),
                Text(location, style: TextStyle(color: Colors.grey)),
                SizedBox(height: 4),
                Text('Category: $category', style: TextStyle(color: Colors.blue)),
                SizedBox(height: 4),
                Text('Rating: $rating', style: TextStyle(color: Colors.orange)),
                SizedBox(height: 4),
                Text('Reviews: $guest', style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}