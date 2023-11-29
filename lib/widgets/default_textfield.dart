import 'package:flutter/material.dart';

class DefaultTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  const DefaultTextField({super.key,  this.controller, this.hintText});

  @override
  State<DefaultTextField> createState() => _DefaultTextFieldState();
}

class _DefaultTextFieldState extends State<DefaultTextField> {
  @override
  Widget build(BuildContext context) {
    return  TextField(
      controller: widget.controller,
      decoration: InputDecoration(
          hintText: widget.hintText,
          border: const OutlineInputBorder()
      ),
    );
  }
}
