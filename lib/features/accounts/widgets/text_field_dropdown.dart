import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class TextFieldDropdown extends StatelessWidget {
  final List<String> items;

  const TextFieldDropdown({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<String>(
      popupProps: const PopupProps.menu(
        showSearchBox: true,
      ),
      items: items,
    );
  }
}