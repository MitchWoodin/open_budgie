import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class TextFieldDropdown extends StatelessWidget {
  const TextFieldDropdown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<String>(
        popupProps: const PopupProps.menu(
          showSearchBox: true,
        ),
        items: const [
          'Item 1',
          'Item 2',
          'Item 3',
        ]
    );
  }
}
