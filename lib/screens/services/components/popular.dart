import 'package:flutter/material.dart';

class Popular extends StatelessWidget {
  final IconData icon;
  final String title;

  const Popular({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        children: [
           Icon(
            icon,
            size: 30,
          ),  
          const SizedBox(width: 10),
          Expanded(
            child: Container(
              height: 50,
              decoration: const BoxDecoration(
                border:
                    Border(bottom: BorderSide(width: 1.2, color: Colors.grey)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title, style: const TextStyle(fontSize: 16)),
                  const Icon(Icons.arrow_forward_ios_rounded, size: 12)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
