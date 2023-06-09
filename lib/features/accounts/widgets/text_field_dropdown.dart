import 'package:dropdown_search/dropdown_search.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';

class TextFieldDropdown extends StatefulWidget {
  const TextFieldDropdown({Key? key}) : super(key: key);

  @override
  State<TextFieldDropdown> createState() => _TextFieldDropdownState();
}

class _TextFieldDropdownState extends State<TextFieldDropdown> {
  late SingleValueDropDownController _controller;

  @override
  void initState() {
    super.initState();
    _controller = SingleValueDropDownController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return
    // DropdownSearch<String>(
    //     popupProps: const PopupProps.menu(
    //       showSearchBox: true,
    //     ),
    //     items: const [
    //       'Item 1',
    //       'Item 2',
    //       'Item 3',
    //     ]
    // );
    const DropDownTextField(
      clearOption: true,
      dropDownList: [
        DropDownValueModel(name: 'name1', value: "value1"),
        DropDownValueModel(name: 'name2', value: "value2"),
        DropDownValueModel(name: 'name3', value: "value3"),
      ],
      enableSearch: true,
      searchAutofocus: true,
    );
  }
}
