import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lastfm/application/home/home_cubit.dart';
import 'package:lastfm/resources/color_palette.dart';
import 'package:lastfm/resources/dimensions.dart';
import 'package:lastfm/resources/font_sizes.dart';
import 'package:lastfm/resources/strings.dart';

class NoAlbums extends StatelessWidget {
  const NoAlbums({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.search,
            color: ColorPalette.black,
            size: 70,
          ),
          const SizedBox(height: Dimensions.medium),
          const Text(
            Strings.noResultsFound,
            style:
                TextStyle(fontWeight: FontWeight.bold, fontSize: FontSizes.big),
          ),
          const SizedBox(height: Dimensions.small),
          const Text(Strings.noItemsMatchingSearch),
          const SizedBox(height: Dimensions.small),
          Text(
            context.read<HomeCubit>().lastQuery ?? '',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
