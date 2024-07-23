
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WelcomeSection extends StatelessWidget {
  const WelcomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Welcome!",
            style: TextStyle(fontSize: 33, fontWeight: FontWeight.w500),
          ),
          IconButton(
            onPressed: null,
            style: ButtonStyle(
              padding: WidgetStatePropertyAll(
                EdgeInsets.zero,
              ),
            ),
            icon: Icon(
              FontAwesomeIcons.user,
              size: 19,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
