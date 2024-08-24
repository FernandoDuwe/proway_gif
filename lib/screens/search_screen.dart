import 'package:flutter/material.dart';
import 'package:proway_gif/models/giphy_model.dart';
import 'package:proway_gif/repositories/giphy_repository.dart';
import 'package:proway_gif/widgets/giphy_tile.dart';
import 'package:proway_gif/widgets/page_navigator.dart';

class SearchScreen extends StatefulWidget {
  final String search;

  const SearchScreen({required this.search, super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  int page = 0;

  Widget _getGrid(List<GiphyModel> list) {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemCount: list.length,
      itemBuilder: (context, index) => GiphyTile(model: list[index]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Resultados para: " + widget.search),
      ),
      body: FutureBuilder(
        future: GiphyRepository.search(widget.search, offset: this.page * 25),
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

          return _getGrid(snapshot.data!);
        },
      ),
      bottomNavigationBar: PageNavigator(
        currentPage: this.page,
        onNextClick: () {
          setState(() {
            this.page += 1;
          });
        },
        onPriorClick: () {
          this.page -= 1;
        },
      ),
    );
  }
}
