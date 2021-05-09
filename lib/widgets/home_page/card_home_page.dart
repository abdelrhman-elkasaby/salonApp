import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
class CardHomePage extends StatelessWidget {
  final String imageUrl,operatorName,address;
  final double rating;
  const CardHomePage(
    this.imageUrl,
    this.operatorName,
    this.rating,
    this.address
  );
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      color: Colors.white,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(30),
                bottomRight: Radius.circular(30)),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              width: 120,
              height: 120,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                operatorName,
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.purple[800],
                    fontWeight: FontWeight.bold),
              ),
              SmoothStarRating(
                  allowHalfRating: false,
                  onRated: (v) {},
                  starCount: 5,
                  rating: rating,
                  size: 16.0,
                  isReadOnly: false,
                  filledIconData: Icons.star,
                  halfFilledIconData: Icons.star_half,
                  defaultIconData: Icons.star_border,
                  color: Colors.amber,
                  borderColor: Colors.amber,
                  spacing: 0.0),
              Row(
                children: [
                  Image.asset(
                    'assets/icons/placeholder.png',
                    width: 18,
                    height: 18,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width*0.5,
                    child: Text(
                      address,
                      style: TextStyle(color: Colors.purple[800], fontSize: 10),
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
