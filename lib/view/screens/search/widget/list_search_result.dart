import 'package:flutter/material.dart';
import 'package:hirfi_home/data/model/place_model.dart';
import 'package:hirfi_home/view/screens/search/widget/place_card.dart';


class ListSearch extends StatelessWidget {
  const ListSearch({super.key, required this.data, this.duplicateList});

  final List<PlaceModel> data;
  final List? duplicateList;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(3.5),
      child: ListView.builder(
          itemCount: duplicateList!.length,
        padding: EdgeInsets.all(5),
        itemBuilder: (context, index) {
          final place = data[index];

          return PlaceCard(
            placeID: place.placeId,
            image: place.baseImage,
            text: place.placeName,
            guest: place.reviews,
            location: place.city,
            price: place.price,
            rating: place.rating,
            category: place.category,
          );
        },
      ),
    );
  }
}
