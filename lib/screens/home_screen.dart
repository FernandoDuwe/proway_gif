import 'package:flutter/material.dart';
import 'package:proway_gif/models/giphy_model.dart';
import 'package:proway_gif/repositories/giphy_repository.dart';
import 'package:proway_gif/widgets/giphy_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget _buildGrid(List<GiphyModel> list) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, mainAxisSpacing: 0),
      itemCount: list.length,
      itemBuilder: (context, index) => GiphyTile(model: list[index]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Gifs em alta")),
      body: FutureBuilder(
        future: GiphyRepository.getTrends(),
        builder: (context, snapshot) {
          if (snapshot.hasError)
            return Center(
              child: Text(
                snapshot.error.toString(),
                style: TextStyle(color: Colors.red),
              ),
            );

          if (!snapshot.hasData)
            return Center(
              child: CircularProgressIndicator(),
            );

          return _buildGrid(snapshot.data!);
        },
      ),
    );
  }
}
