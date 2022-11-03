import 'package:flutter/material.dart';
import 'package:ong3/backend/backend.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import 'package:ong3/favorites/favorites.dart';

class FavoriteIconWidget extends StatefulWidget {
  const FavoriteIconWidget({Key? key, required this.productParameter}) : super(key: key);

  final ProductsRecord productParameter;

  @override
  State<StatefulWidget> createState() => new _FavoriteIconState(productParameter);
}

class _FavoriteIconState extends State<FavoriteIconWidget> {
  bool isFavorite = false;

  _FavoriteIconState(ProductsRecord product) {
    isFavorite = Favorites.isFavorite(product);
  }

  @override
  Widget build(BuildContext context) {
    return ToggleIcon(
        onPressed: () async {
          await Favorites.changeFavorite(widget.productParameter);
          setState(() => isFavorite = Favorites.isFavorite(widget.productParameter));
        },
        value: isFavorite,
        onIcon: Icon(
          Icons.favorite,
          color: Color(0xFFC84343),
          size: 20,
        ),
        offIcon: Icon(
          Icons.favorite_border,
          color: Colors.black,
          size: 20,
        ));
  }
}
