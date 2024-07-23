import 'package:flutter/material.dart';

class HelperSection extends StatelessWidget {
  const HelperSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 15,
      ),
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 175, 120, 255),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(7),
              topRight: Radius.circular(7),
              bottomRight: Radius.circular(7))),
      child: const Row(
        children: [
          Column(
            children: [
              Text(
                "Need help?",
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
