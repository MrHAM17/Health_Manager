import 'package:flutter/material.dart';

class BlogCard extends StatelessWidget {
  final String title;
  final String author;
  final String date;
  final String content;

  const BlogCard({
    Key? key,
    required this.title,
    required this.author,
    required this.date,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'By $author - $date',
              style: TextStyle(
                color: Colors.grey[700],
              ),
            ),
          ),
          SizedBox(height: 8.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              content,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
