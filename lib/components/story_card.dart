import 'package:flutter/material.dart';
import 'package:mbank_app/models/story.dart';

class StoryCard extends StatelessWidget {
  final Story story;
  const StoryCard({super.key, required this.story});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: Container(
        width: 90,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(story.imgPath), 
                fit: BoxFit.cover
                ),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.white,
            width: 2.0, 
          ),
        ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(story.title, style: const TextStyle(fontWeight: FontWeight.bold),),
            ),
          )
      ),
    );
  }
}