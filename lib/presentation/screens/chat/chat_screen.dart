import 'package:flutter/material.dart';
import 'package:yes_no_app/presentation/views/chat/chat_view.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Millie'),
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              'https://upload.wikimedia.org/wikipedia/commons/b/b2/Millie_Bobby_Brown_-_MBB_-_4_-_SFM5_-_July_10%2C_2022_at_Stranger_Fan_Meet_5_People_Convention_%28cropped%29.jpg',
            ),
          ),
        ),
      ),
      body: const ChatView(),
    );
  }
}
