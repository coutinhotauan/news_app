import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SearchNewsField extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  String? keyword;
  Function onSearch;

  SearchNewsField({
    super.key,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.all(8),
        suffixIcon: IconButton(
          onPressed: (){
            onSearch(keyword);
          },
          icon: const Icon(
            Icons.search,
          ),
        ),
      ),
      onChanged: (value) {
        keyword = value;
      },
    );
  }
}
