import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lastfm/application/home/home_cubit.dart';
import 'package:lastfm/presentation/widgets/app_title.dart';
import 'package:lastfm/resources/color_palette.dart';
import 'package:lastfm/resources/strings.dart';

class SearchBar extends HookWidget implements PreferredSizeWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchOpened = useState(false);
    final focusNode = useFocusNode();
    final searchQuery = useState('');
    return AppBar(
      centerTitle: true,
      backgroundColor: ColorPalette.black,
      brightness: Brightness.dark,
      title: searchOpened.value
          ? _SearchField(
              focusNode: focusNode,
              searchQuery: searchQuery,
            )
          : const AppTitle(),
      actions: [
        _SearchButton(
          focusNode: focusNode,
          searchOpened: searchOpened,
          searchQuery: searchQuery.value,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _SearchField extends StatelessWidget {
  const _SearchField({
    Key? key,
    required this.focusNode,
    required this.searchQuery,
  }) : super(key: key);

  final FocusNode focusNode;
  final ValueNotifier<String> searchQuery;

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: focusNode,
      cursorColor: ColorPalette.guardsmanRed,
      textInputAction: TextInputAction.search,
      style: const TextStyle(color: ColorPalette.white),
      decoration: const InputDecoration.collapsed(
        hintText: Strings.search,
        hintStyle: TextStyle(color: ColorPalette.white),
      ),
      onSubmitted: context.read<HomeCubit>().onQuerySubmitted,
      onChanged: (value) => searchQuery.value = value,
    );
  }
}

class _SearchButton extends StatelessWidget {
  const _SearchButton({
    Key? key,
    required this.focusNode,
    required this.searchOpened,
    required this.searchQuery,
  }) : super(key: key);

  final FocusNode focusNode;
  final ValueNotifier<bool> searchOpened;
  final String searchQuery;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.search),
      onPressed: () {
        searchOpened.value = !searchOpened.value;
        if (searchOpened.value) {
          focusNode.requestFocus();
        } else {
          context.read<HomeCubit>().onQuerySubmitted(searchQuery);
        }
      },
    );
  }
}
