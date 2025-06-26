import 'package:flutter/material.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        contentPadding:
        const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        hintText: 'Search for fruit salad combos!',
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16)
        ),
      ),
    );
  }
}
