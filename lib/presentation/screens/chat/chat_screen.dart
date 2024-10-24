import 'package:flutter/material.dart';
import 'package:yes_no_app/presentation/views/chat/chat_view.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  ChatScreenState createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  String? userName;
  int? userAge;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _askForUserNameAndAge();
    });
  }

  void _askForUserNameAndAge() {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController ageController = TextEditingController();

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Ingresa tus datos'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(hintText: 'Tu nombre'),
            ),
            TextField(
              controller: ageController,
              decoration: const InputDecoration(hintText: 'Tu edad'),
              keyboardType: TextInputType.number,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              final int? age = int.tryParse(ageController.text);
              if (age != null && age > 0) {
                setState(() {
                  userName = nameController.text;
                  userAge = age;
                });
                Navigator.of(context).pop();
              }
            },
            child: const Text('Aceptar'),
          ),
        ],
      ),
    );
  }

  void _clearChat() {
    final chatProvider = context.read<ChatProvider>();
    chatProvider.messageList.clear();
    // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
    chatProvider.notifyListeners();

    setState(() {
      userName = null;
      userAge = null;
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _askForUserNameAndAge();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(userName != null ? 'Chat de $userName y Natalie' : 'Natalie'),
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Natalie_Portman_Vogue_2024.jpg/220px-Natalie_Portman_Vogue_2024.jpg',
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.restore),
            onPressed: _clearChat,
          ),
        ],
      ),
      body: (userAge != null && userAge! >= 18)
          ? const ChatView()
          : const Center(
              child: Text('Debes ser mayor de 18 años para chatear'),
            ),
    );
  }
}
