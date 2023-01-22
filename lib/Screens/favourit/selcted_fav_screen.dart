import 'package:db_sql/Provider/favourite_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectedFavouriteScreen extends StatefulWidget {
  const SelectedFavouriteScreen({super.key});

  @override
  State<SelectedFavouriteScreen> createState() =>
      _SelectedFavouriteScreenState();
}

class _SelectedFavouriteScreenState extends State<SelectedFavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    final favouriteItemProvider =
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
            child: ListView.builder(
                itemCount: favouriteItemProvider.selcted_items.length,
                itemBuilder: (context, index) {
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
