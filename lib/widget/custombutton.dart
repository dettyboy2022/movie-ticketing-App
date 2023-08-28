import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          minimumSize: const Size(300, 50),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(color: Colors.black, fontSize: 17),
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// class CustomButton extends StatelessWidget {
//   final Widget child;
//   final VoidCallback onPressed;

//   CustomButton({required this.child, required this.onPressed});

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: onPressed,
//       child: child,
//     );
//   }
// }

