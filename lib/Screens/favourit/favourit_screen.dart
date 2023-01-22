import 'package:db_sql/Provider/favourite_provider.dart';
import 'package:db_sql/Screens/favourit/selcted_fav_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    final favouriteProvider =
        Provider.of<FavouriteItemsProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("Favourite Screen"),
        actions: [
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return SelectedFavouriteScreen();
              }));
            },
            child: Icon(Icons.favorite),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(itemBuilder: (context, index) {
              return Consumer<FavouriteItemsProvider>(
                  builder: (context, value, child) {
                return ListTile(
                  onTap: () {
                    if (value.selcted_items.contains(index)) {
                      value.removeItem(index);
                    } else {
                      value.addItem(index);
                    }
                    // setState(() {});
                  },
                  title: Text('Item $index'),
                  trailing: Icon(
                    value.selcted_items.contains(index)
                        ? Icons.favorite
                        : Icons.favorite_border_outlined,
                  ),
                );
              });
            }),
          )
        ],
      ),
    );
  }
}
