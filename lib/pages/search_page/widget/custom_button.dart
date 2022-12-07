import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final Widget title;
  final Color? color;
  final void Function()? onPressed;
  const CustomButton({
    Key? key,
    required this.title,
    this.color,
    this.onPressed,
  }) : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: widget.color,
      elevation: 4,
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        onTap: widget.onPressed,
        child: Container(
          width: 200,
          height: 45,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
          ),
          child: widget.title,
        ),
      ),
    );
  }
}








// class CustomElevatedButton extends StatefulWidget {
//   final void Function()? onPressed;
//   final String title;
//   final Color buttonColor;
//   const CustomElevatedButton(
//       {Key? key,
//       this.onPressed,
//       required this.buttonText,
//       required this.buttonColor})
//       : super(key: key);

//   @override
//   State<CustomElevatedButton> createState() => _CustomElevatedButtonState();
// }

// class _CustomElevatedButtonState extends State<CustomElevatedButton> {
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: widget.onPressed,
//       child: Text(
//         widget.buttonText,
//       ),
//     );
//   }
// }
