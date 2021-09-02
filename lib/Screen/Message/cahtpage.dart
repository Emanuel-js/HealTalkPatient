// import 'package:flutter/material.dart';
// import 'package:healTalkpatient/index.dart';

// class ChatPage extends StatefulWidget {
//   final Patient user;

//   const ChatPage({
//     @required this.user,
//     Key key,
//   }) : super(key: key);

//   @override
//   _ChatPageState createState() => _ChatPageState();
// }

// class _ChatPageState extends State<ChatPage> {
//   @override
//   Widget build(BuildContext context) => Scaffold(
//         extendBodyBehindAppBar: true,
//         backgroundColor: Colors.blue,
//         body: SafeArea(
//           child: Column(
//             children: [
//               // ProfileHeaderWidget(name: widget.user.name),
//               Expanded(
//                 child: Container(
//                   padding: EdgeInsets.all(10),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(25),
//                       topRight: Radius.circular(25),
//                     ),
//                   ),
//                   child: MessagesWidget(idUser: widget.user.pId),
//                 ),
//               ),
//               NewMessageWidget(idUser: widget.user.pId)
//             ],
//           ),
//         ),
//       );
// }
