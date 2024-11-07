import 'package:flutter/material.dart';
import 'package:yesnoapp_210124/widgets/chat/her_message_bubble.dart';
import 'package:yesnoapp_210124/widgets/chat/my_message.dart';
import 'package:yesnoapp_210124/widgets/shared/message_field_box.dart';




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
                'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSbuFxPqe0mw4RLo3fN6dzht7E1qo05WWphLNDQevOzt4_YOO58'),
          ),
        ),
        title: const Text('Mi amor ♥️'),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    itemCount: 100,
                    itemBuilder: (context, index) {
                      return ( index % 2 == 0 )
                        ? const HerMessageBubble()
                        : const MyMessageBubble();
                    })),

            /// Caja de texto de mensajes
            const MessageFieldBox(),
          ],
        ),
      ),
    );
  }
}
