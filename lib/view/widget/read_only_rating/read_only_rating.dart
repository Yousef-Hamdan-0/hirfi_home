import 'package:flutter/material.dart';

class ReadOnlyRating extends StatelessWidget {
  final double rating;
  final double starSize;
  final Color filledStarColor;
  final Color unfilledStarColor;

  const ReadOnlyRating({
    super.key,
    required this.rating,
    this.starSize = 20,
    this.filledStarColor = Colors.amber,
    this.unfilledStarColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(5, (index) {
        if (rating >= index + 1) {
          return Icon(Icons.star, color: filledStarColor, size: starSize);
        } else if (rating > index && rating < index + 1) {
          return Icon(Icons.star_half, color: filledStarColor, size: starSize);
        } else {
          return Icon(Icons.star_border,
              color: unfilledStarColor, size: starSize);
        }
      }),
    );
  }
}
