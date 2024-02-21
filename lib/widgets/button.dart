import 'package:flutter/material.dart';
import 'package:online_market_task/util.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.deepOrangeAccent,
      borderRadius: BorderRadius.circular(10),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: showToast,
        child: SizedBox(
          width: double.infinity, child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(text, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16)),
          ),
        ),
        ),
      ),
    );
  }
}
