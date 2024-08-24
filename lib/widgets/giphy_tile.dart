import 'package:cached_network_image/cached_network_image.dart';
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
          Image.network(
            this.model.imageURL,
            errorBuilder: (context, error, stackTrace) {
              return Center(
                child: Column(
                  children: [
                    Icon(
                      Icons.broken_image,
                      color: Colors.red,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(error.toString())
                  ],
                ),
              );
            },
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;

              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
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
