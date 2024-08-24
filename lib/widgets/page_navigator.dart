import 'package:flutter/material.dart';

class PageNavigator extends StatelessWidget {
  final int currentPage;
  final VoidCallback onNextClick;
  final VoidCallback onPriorClick;

  const PageNavigator(
      {required this.currentPage,
      required this.onNextClick,
      required this.onPriorClick,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      color: Colors.blue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: (this.currentPage > 0 ? this.onPriorClick : null),
              icon: Icon(Icons.arrow_back, color: Colors.white, size: 32)),
          Text(
            "Página: ${this.currentPage + 1}",
            style: TextStyle(
                fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          IconButton(
              onPressed: this.onNextClick,
              icon: Icon(
                Icons.arrow_forward,
                color: Colors.white,
                size: 32,
              ))
        ],
      ),
    );
  }
}
