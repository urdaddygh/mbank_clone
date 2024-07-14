import 'package:flutter/material.dart';

class Box extends StatelessWidget {
  const Box({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        width: 190,
        decoration: BoxDecoration(
            image: const DecorationImage(
                image: AssetImage('assets/3.jpg'), fit: BoxFit.fill),
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[850]),
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Мои бонусы',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '0 б',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ));
  }
}
