import 'package:flutter/material.dart';

import '../../models/Story.dart';
import '../../models/chat.dart';
const String url = 'https://images.freeimages.com/images/large-previews/d71/flower-1184503.jpg';
const String url2 = 'https://images.freeimages.com/images/large-previews/f7a/light-explosion-1171387.jpg';

class MessengerScreen extends StatelessWidget {
  List<Story> stories = [
    Story(imageUrl: url, userName: "Mahmoud Ramadan Mahmoud Ramadan Mahmoud RamadanMahmoud Ramadan", isOnline: true),
    Story(imageUrl: url2, userName: "Yahia Ramadan", isOnline: true),
    Story(imageUrl: url2, userName: "Yussef Ramadan", isOnline: false),
    Story(imageUrl: url, userName: "Mahmoud Ramadan", isOnline: true),
    Story(imageUrl: url, userName: "Ahmed Ramadan", isOnline: false),
    Story(imageUrl: url, userName: "Mahmoud1 Ramadan", isOnline: false),
    Story(imageUrl: url2, userName: "Mahmoud2 Ramadan", isOnline: false),
    Story(imageUrl: url, userName: "Mahmoud22 Ramadan", isOnline: false),
    Story(imageUrl: url, userName: "Mahmoud33 Ramadan", isOnline: true),
  ];
  
  List<Chat> chats = [
    Chat(imageUrl: url, username: "Mahmoud Ramadan", lastMessage: "Hello man, when can i see you?"),
    Chat(imageUrl: url2, username: "Mahmoud Ramadan", lastMessage: "Hello man, when can i see you?"),
    Chat(imageUrl: url, username: "Mahmoud Ramadan", lastMessage: "Hello man, when can i see you?"),
    Chat(imageUrl: url, username: "Mahmoud Ramadan", lastMessage: "Hello man, when can i see you?"),
    Chat(imageUrl: url2, username: "Mahmoud Ramadan", lastMessage: "Hello man, when can i see you?"),
    Chat(imageUrl: url, username: "Mahmoud Ramadan", lastMessage: "Hello man, when can i see you?"),
    Chat(imageUrl: url2, username: "Mahmoud Ramadan", lastMessage: "Hello man, when can i see you?"),
    Chat(imageUrl: url, username: "Mahmoud Ramadan", lastMessage: "Hello man, when can i see you?"),
    Chat(imageUrl: url2, username: "Mahmoud Ramadan", lastMessage: "Hello man, when can i see you?"),
    Chat(imageUrl: url, username: "Mahmoud Ramadan", lastMessage: "Hello man, when can i see you?"),
    Chat(imageUrl: url, username: "Mahmoud Ramadan", lastMessage: "Hello man, when can i see you?"),
    Chat(imageUrl: url, username: "Mahmoud Ramadan", lastMessage: "Hello man, when can i see you?"),
    Chat(imageUrl: url, username: "Mahmoud Ramadan", lastMessage: "Hello man, when can i see you?"),
    Chat(imageUrl: url, username: "Mahmoud Ramadan", lastMessage: "Hello man, when can i see you?"),
    Chat(imageUrl: url, username: "Mahmoud Ramadan", lastMessage: "Hello man, when can i see you?"),
    Chat(imageUrl: url, username: "Mahmoud Ramadan", lastMessage: "Hello man, when can i see you?"),
    Chat(imageUrl: url, username: "Mahmoud Ramadan", lastMessage: "Hello man, when can i see you?"),
    Chat(imageUrl: url, username: "Mahmoud Ramadan", lastMessage: "Hello man, when can i see you?"),
  ];

  MessengerScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(url),
          ),
        ),
        title: const Text('Chats', style: TextStyle(
          color: Colors.black
        ),
        ),
       actions: [
         IconButton(
             onPressed: (){},
             icon:  const CircleAvatar(
               backgroundColor: Colors.blue,
               child: Icon(Icons.camera_alt),
             )
         )
        ,
         IconButton(
           onPressed: (){},
           icon: const CircleAvatar(
             backgroundColor: Colors.red,
             child: Icon(Icons.edit),

           ),
         )
       ],
      ),
      body: SingleChildScrollView(
        child: Column(
             children: [
               Padding(
                 padding: const EdgeInsets.symmetric(
                   horizontal: 8,
                   vertical: 15
                 ),
                 child: Container(
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(20),
                     color: Colors.grey[200]
                   ),
                   child: const Padding(
                     padding: EdgeInsets.all(14.0),
                     child: Row(
                       children: [
                         Icon(Icons.search),
                         Text('Search')
                       ],
                     ),
                   ),
                 ),
               ),
               const SizedBox(
                 height: 20,
               ),
               SizedBox(
                 height: 120,
                 child: ListView.separated(
                   scrollDirection: Axis.horizontal,
                     itemBuilder: (context, index) => createStoryItem(stories[index]),
                     separatorBuilder: (context, index) => const SizedBox(width: 3,),
                     itemCount: stories.length),
               ),
               const SizedBox(
                 height: 20,
               ),
               const SizedBox(
                 height: 10,
               ),
               ListView.separated(
                   physics: const NeverScrollableScrollPhysics(),
                   shrinkWrap: true,
                   itemBuilder:  (context, index) => createChatHistoryItem(chats[index]),
                   separatorBuilder: (context, index) => const SizedBox(height: 10,),
                   itemCount: chats.length
               )
             ],
        ),
      ),
    );
  }

  Widget createStoryItem(Story story) => SizedBox(
      width: 80,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(story.imageUrl,),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                      bottom: 5,
                      end: 3
                    ),
                    child: CircleAvatar(
                      radius: 5,
                      backgroundColor: story.isOnline ? Colors.green : Colors.grey,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 5,),
              Text(story.userName, maxLines: 2, overflow: TextOverflow.ellipsis,textAlign: TextAlign.center,),
            ],
          ),
        ),
    );
  Widget createChatHistoryItem(Chat chat) => Container(
    child: Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(chat.imageUrl),
          ),
          const SizedBox(width: 20,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(chat.username,maxLines: 1,overflow: TextOverflow.ellipsis,),
              Text(chat.lastMessage, maxLines: 2, overflow: TextOverflow.ellipsis,)
            ],
          )
        ],
      ),
    ),
  );
}




