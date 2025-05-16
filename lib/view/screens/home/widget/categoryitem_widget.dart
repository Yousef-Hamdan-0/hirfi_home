import 'package:flutter/material.dart';

Widget buildCategoryItem({
    required String image,
    required String label,
    required Color color,
  }) {
    return Column(
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Stack(
            children:[
              Padding(
              padding: const EdgeInsets.all(10),
              child: Image.asset(
                image,
                fit: BoxFit.contain,
               
              ),
            ),
            Positioned(
                left: -50,top: -50,
                child: Container(width: 90,height: 90
                ,decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.3)
                ,borderRadius: BorderRadius.all(Radius.circular(100)))
                ,))
            ] ,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }