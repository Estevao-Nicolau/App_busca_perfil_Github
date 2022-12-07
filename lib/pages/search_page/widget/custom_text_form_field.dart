import 'package:flutter/material.dart';

class CustomFormTextFielde extends StatefulWidget {
  final IconData icon;
  final String label;
  final TextEditingController? controller;
  const CustomFormTextFielde({
    Key? key,
    required this.icon,
    required this.label,
    this.controller,
  }) : super(key: key);

  @override
  State<CustomFormTextFielde> createState() => _CustomFormTextFieldeState();
}

class _CustomFormTextFieldeState extends State<CustomFormTextFielde> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextFormField(
        controller: widget.controller,
        decoration: InputDecoration(
          prefixIcon: Icon(widget.icon),
          labelText: widget.label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
      ),
    );
  }
}
