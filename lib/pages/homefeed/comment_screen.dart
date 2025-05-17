// comment_screen.dart
import 'package:flutter/material.dart';

class CommentScreen extends StatefulWidget {
  final int postId; // You can use this to fetch or track comments by post

  const CommentScreen({super.key, required this.postId});

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  final TextEditingController _controller = TextEditingController();
  List<String> comments = [];

  void _addComment() {
    final text = _controller.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        comments.add(text);
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Comments')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: comments.length,
              itemBuilder: (_, index) => ListTile(
                leading: const Icon(Icons.comment),
                title: Text(comments[index]),
              ),
            ),
          ),
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Write a comment...',
                      border: OutlineInputBorder(),
                      isDense: true,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _addComment,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
