import 'package:flutter/material.dart';

class CommentsCard extends StatefulWidget {
  const CommentsCard({super.key});

  @override
  _CommentsCardState createState() => _CommentsCardState();
}

class _CommentsCardState extends State<CommentsCard> {
  final TextEditingController commentsController = TextEditingController();

  @override
  void dispose() {
    commentsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: SizedBox(
        width: MediaQuery.of(context).size.width - 28,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Comments',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              const Divider(),
              const SizedBox(height: 7), // Space between Divider and TextField
              TextField(
                controller:
                    commentsController, // Assign the controller to the TextField
                decoration: const InputDecoration(
                  hintText: 'Comments',
                ),
              ),
              const SizedBox(height: 14),
            ],
          ),
        ),
      ),
    );
  }
}
