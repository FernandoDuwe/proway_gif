import 'package:flutter/material.dart';
import 'package:proway_gif/models/giphy_model.dart';

class GiphyTile extends StatelessWidget {
  final GiphyModel model;

  const GiphyTile({required this.model, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(model.imageURL),
          SizedBox(
            height: 40,
          ),
          Text(
            "@" + model.username,
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            model.title,
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
