import 'package:fahrplanauskunft/core/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  const CustomSearchBar({
    super.key,
    required this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autocorrect: false,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: _buildIcon(Icons.location_searching_rounded),
        suffixIcon: _buildIcon(Icons.search_rounded),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
      ),
    );
  }

  Icon _buildIcon(IconData icon) => Icon(icon, color: COLOR_PURPLE);
}
