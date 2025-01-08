import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final int id;
  final String name;
  final int score;

  const CardWidget({required this.id, required this.name, required this.score, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          child: Text(name[0]),
        ),
        title: Text(name),
        subtitle: Text("Score: $score"),
        trailing: Text("ID: $id"),
      ),
    );
  }
}