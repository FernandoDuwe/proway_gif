import 'package:flutter/material.dart';
import 'package:proway_gif/models/giphy_model.dart';
import 'package:proway_gif/repositories/giphy_repository.dart';
import 'package:proway_gif/screens/search_screen.dart';
import 'package:proway_gif/widgets/giphy_tile.dart';
import 'package:proway_gif/widgets/page_navigator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int page = 0;

  TextEditingController searchController = TextEditingController();

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
      appBar: AppBar(
          title: TextField(
        controller: searchController,
        decoration: InputDecoration(
            labelText: "Pesquisar",
            suffix: IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        SearchScreen(search: searchController.text),
                  ));
                },
                icon: Icon(Icons.search))),
      )),
      body: FutureBuilder(
        future: GiphyRepository.getTrends(offset: (25 * page)),
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
      bottomNavigationBar: PageNavigator(
        currentPage: this.page,
        onNextClick: () {
          setState(() {
            this.page += 1;
          });
        },
        onPriorClick: () {
          setState(() {
            this.page -= 1;
          });
        },
      ),
    );
  }
}
