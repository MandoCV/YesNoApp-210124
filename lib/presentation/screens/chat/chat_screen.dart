import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yesnoapp_210124/domain/entities/message.dart';

import 'package:yesnoapp_210124/presentation/providers/chat_provider.dart';
import 'package:yesnoapp_210124/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yesnoapp_210124/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yesnoapp_210124/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOz3pZjyjPgnY5UyMXNDKVcbCyNwLFOX4B5b0OV4Vc5ekO_uGkHPQ9cNEVP9WJdy4Hh8I&usqp=CAU'),
          ),
        ),
        title: const Text('Bad Boni ♥️'),
        centerTitle: false,
      ),// aaa
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                  controller: chatProvider.chatScrollController,
                    itemCount: chatProvider.messageList.length,
                    itemBuilder: (context, index) {
                      final message = chatProvider.messageList[index];
                       
                      return (message.fromWho == FromWho.hers)
                          ? HerMessageBubble( message: message )
                          : MyMessageBubble( message: message );
                    })),

            /// Caja de texto de mensajes
            MessageFieldBox(
              // onValue: (value) => chatProvider.sendMessage(value),
              onValue: chatProvider.sendMessage,
            ),
          ],
        ),
      ),
    );
  }
}

