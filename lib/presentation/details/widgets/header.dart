import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lastfm/resources/dimensions.dart';

class Header extends HookWidget {
  const Header({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    final collapsed = useState(true);
    return GestureDetector(
      onTap: () => collapsed.value = !collapsed.value,
      child: Padding(
        padding: const EdgeInsets.all(Dimensions.medium),
        child: Text(
          text,
          maxLines: collapsed.value ? 5 : null,
          overflow: collapsed.value ? TextOverflow.ellipsis : null,
        ),
      ),
    );
  }
}
