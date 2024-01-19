import 'package:flutter/material.dart';

class BottomWidget extends StatelessWidget {
  final String text;
  final String buttonText;
  final Function() onTap;
  const BottomWidget({
    super.key,
    required this.text,
    required this.buttonText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
      decoration: const BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          MaterialButton(
            height: MediaQuery.sizeOf(context).width * 0.1,
            textColor: Colors.white,
            color: Colors.blueAccent,
            shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            onPressed: () {
              onTap();
            },
            child: Text(buttonText),
          ),
        ],
      ),
    );
  }
}
