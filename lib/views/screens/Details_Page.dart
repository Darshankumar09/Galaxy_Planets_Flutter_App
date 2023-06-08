import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}



// TweenAnimationBuilder(
//   tween: Tween<double>(
//     begin: 0,
//     end: 2 * pi,
//   ),
//   duration: const Duration(seconds: 16),
//   child: Image.asset(
//       Provider.of<JsonDecodeProvider>(context, listen: false)
//           .galaxyDetails[index]
//           .image),
//   builder: (context, value, widget) {
//     return Transform.rotate(
//       angle: value,
//       child: widget,
//     );
//   },
// ),