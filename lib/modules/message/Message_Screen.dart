import 'package:flutter/material.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        titleSpacing: 20.0,
        elevation: 0.0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 25.0,
              backgroundImage: NetworkImage(
                'https://scontent.fcai21-1.fna.fbcdn.net/v/t39.30808-6/384112315_1964554623911593_7602614496484570856_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=5f2048&_nc_ohc=9wn9C0KWErUAX9IHu3s&_nc_ht=scontent.fcai21-1.fna&oh=00_AfCRvn185Vhvq0XrjnGNX20hTlrNpbQnNR5H3ZRAmlI3VA&oe=653CF18D'
              ),
            ),
            SizedBox(width: 10.0,),
            Text('Chats',
            style: TextStyle(
            color: Colors.black,
              fontWeight: FontWeight.bold,

            ),
            ),
          ],
        ),
        actions: [
          Row(
            children: [
              CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: IconButton(onPressed: (){}, icon: Icon(Icons.camera_alt,
                  color: Colors.white,
                  ) )),
              SizedBox(width: 20.0,),
              CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: IconButton(onPressed: (){}, icon: Icon(Icons.edit,
                    color: Colors.white,
                  ) )),

            ],
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.grey[300],
                ),
                child: Row(
                  children: [
                    Icon(Icons.search),
                    SizedBox(width: 15.0,),
                    Text('Search'),
                  ],
                ),
              ),
              SizedBox(height: 10.0,),
              Container(
                height: 100.0,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount:15,
                  itemBuilder: (context,index)=>builderStory(),
                  separatorBuilder: ( context,  index) =>SizedBox(width: 20.0,),
                ),
              ),
              SizedBox(height: 20.0,),
              ListView.separated(itemBuilder: (context,index)=>builderChat(),
                  physics: NeverScrollableScrollPhysics(),
                  separatorBuilder: (context,index)=>SizedBox(height: 20.0,),
                  shrinkWrap: true,
                  itemCount: 60),
              // Expanded(
              //   child: SingleChildScrollView(
              //     child: Column(
              //       children: [
              //         SizedBox(height: 25.0,),
              //         Row(
              //           children: [
              //             Stack(
              //               alignment: AlignmentDirectional.bottomEnd,
              //               children: [
              //
              //                 CircleAvatar(
              //                     radius: 30.0,
              //                     backgroundImage: NetworkImage('https://scontent-hbe1-1.xx.fbcdn.net/v/t39.30808-6/384112315_1964554623911593_7602614496484570856_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=49d041&_nc_ohc=lVQJHC_ApccAX8TlO0O&_nc_ht=scontent-hbe1-1.xx&oh=00_AfCFLDaQ3AKDRYL3trqNOyDmkRgQEmeJExXwDFaxRlWzug&oe=652B254D'
              //                     )
              //                 ),
              //                 CircleAvatar(
              //                   backgroundColor: Colors.green,
              //                   radius: 7.0,
              //                 ),
              //               ],
              //             ),
              //             SizedBox(width: 10.0,),
              //            Column(
              //              crossAxisAlignment: CrossAxisAlignment.start,
              //              children: [
              //                Text('Moaz Ahmed '),
              //                Row(
              //                  children: [
              //                    Text(' Hello Moaz ahmed I like you '),
              //                    Padding(
              //                      padding: const EdgeInsets.symmetric(horizontal:50.0),
              //                      child: Container(
              //                        width: 5.0,
              //                        height: 5.0,
              //                        decoration: BoxDecoration(
              //                          color: Colors.blue,
              //                          shape: BoxShape.circle
              //                        ),
              //                      ),
              //                    ),
              //                    Text('2:00 pm'),
              //                  ],
              //                ),
              //
              //              ],
              //            ),
              //           ],
              //         ),
              //         SizedBox(height: 15.0,),
              //         Row(
              //           children: [
              //             Stack(
              //               alignment: AlignmentDirectional.bottomEnd,
              //               children: [
              //
              //                 CircleAvatar(
              //                     radius: 30.0,
              //                     backgroundImage: NetworkImage('https://scontent-hbe1-1.xx.fbcdn.net/v/t39.30808-6/384112315_1964554623911593_7602614496484570856_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=49d041&_nc_ohc=lVQJHC_ApccAX8TlO0O&_nc_ht=scontent-hbe1-1.xx&oh=00_AfCFLDaQ3AKDRYL3trqNOyDmkRgQEmeJExXwDFaxRlWzug&oe=652B254D'
              //                     )
              //                 ),
              //                 CircleAvatar(
              //                   backgroundColor: Colors.green,
              //                   radius: 7.0,
              //                 ),
              //               ],
              //             ),
              //             SizedBox(width: 10.0,),
              //             Column(
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 Text('Moaz Ahmed '),
              //                 Row(
              //                   children: [
              //                     Text(' Hello Moaz ahmed I like you '),
              //                     Padding(
              //                       padding: const EdgeInsets.symmetric(horizontal:50.0),
              //                       child: Container(
              //                         width: 5.0,
              //                         height: 5.0,
              //                         decoration: BoxDecoration(
              //                             color: Colors.blue,
              //                             shape: BoxShape.circle
              //                         ),
              //                       ),
              //                     ),
              //                     Text('2:00 pm'),
              //                   ],
              //                 ),
              //
              //               ],
              //             ),
              //           ],
              //         ),
              //         SizedBox(height: 15.0,),
              //         Row(
              //           children: [
              //             Stack(
              //               alignment: AlignmentDirectional.bottomEnd,
              //               children: [
              //
              //                 CircleAvatar(
              //                     radius: 30.0,
              //                     backgroundImage: NetworkImage('https://scontent-hbe1-1.xx.fbcdn.net/v/t39.30808-6/384112315_1964554623911593_7602614496484570856_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=49d041&_nc_ohc=lVQJHC_ApccAX8TlO0O&_nc_ht=scontent-hbe1-1.xx&oh=00_AfCFLDaQ3AKDRYL3trqNOyDmkRgQEmeJExXwDFaxRlWzug&oe=652B254D'
              //                     )
              //                 ),
              //                 CircleAvatar(
              //                   backgroundColor: Colors.green,
              //                   radius: 7.0,
              //                 ),
              //               ],
              //             ),
              //             SizedBox(width: 10.0,),
              //             Column(
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 Text('Moaz Ahmed '),
              //                 Row(
              //                   children: [
              //                     Text(' Hello Moaz ahmed I like you '),
              //                     Padding(
              //                       padding: const EdgeInsets.symmetric(horizontal:50.0),
              //                       child: Container(
              //                         width: 5.0,
              //                         height: 5.0,
              //                         decoration: BoxDecoration(
              //                             color: Colors.blue,
              //                             shape: BoxShape.circle
              //                         ),
              //                       ),
              //                     ),
              //                     Text('2:00 pm'),
              //                   ],
              //                 ),
              //
              //               ],
              //             ),
              //           ],
              //         ),
              //         SizedBox(height: 15.0,),
              //         Row(
              //           children: [
              //             Stack(
              //               alignment: AlignmentDirectional.bottomEnd,
              //               children: [
              //
              //                 CircleAvatar(
              //                     radius: 30.0,
              //                     backgroundImage: NetworkImage('https://scontent-hbe1-1.xx.fbcdn.net/v/t39.30808-6/384112315_1964554623911593_7602614496484570856_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=49d041&_nc_ohc=lVQJHC_ApccAX8TlO0O&_nc_ht=scontent-hbe1-1.xx&oh=00_AfCFLDaQ3AKDRYL3trqNOyDmkRgQEmeJExXwDFaxRlWzug&oe=652B254D'
              //                     )
              //                 ),
              //                 CircleAvatar(
              //                   backgroundColor: Colors.green,
              //                   radius: 7.0,
              //                 ),
              //               ],
              //             ),
              //             SizedBox(width: 10.0,),
              //             Column(
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 Text('Moaz Ahmed '),
              //                 Row(
              //                   children: [
              //                     Text(' Hello Moaz ahmed I like you '),
              //                     Padding(
              //                       padding: const EdgeInsets.symmetric(horizontal:50.0),
              //                       child: Container(
              //                         width: 5.0,
              //                         height: 5.0,
              //                         decoration: BoxDecoration(
              //                             color: Colors.blue,
              //                             shape: BoxShape.circle
              //                         ),
              //                       ),
              //                     ),
              //                     Text('2:00 pm'),
              //                   ],
              //                 ),
              //
              //               ],
              //             ),
              //           ],
              //         ),
              //         SizedBox(height: 15.0,),
              //         Row(
              //           children: [
              //             Stack(
              //               alignment: AlignmentDirectional.bottomEnd,
              //               children: [
              //
              //                 CircleAvatar(
              //                     radius: 30.0,
              //                     backgroundImage: NetworkImage('https://scontent-hbe1-1.xx.fbcdn.net/v/t39.30808-6/384112315_1964554623911593_7602614496484570856_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=49d041&_nc_ohc=lVQJHC_ApccAX8TlO0O&_nc_ht=scontent-hbe1-1.xx&oh=00_AfCFLDaQ3AKDRYL3trqNOyDmkRgQEmeJExXwDFaxRlWzug&oe=652B254D'
              //                     )
              //                 ),
              //                 CircleAvatar(
              //                   backgroundColor: Colors.green,
              //                   radius: 7.0,
              //                 ),
              //               ],
              //             ),
              //             SizedBox(width: 10.0,),
              //             Column(
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 Text('Moaz Ahmed '),
              //                 Row(
              //                   children: [
              //                     Text(' Hello Moaz ahmed I like you '),
              //                     Padding(
              //                       padding: const EdgeInsets.symmetric(horizontal:50.0),
              //                       child: Container(
              //                         width: 5.0,
              //                         height: 5.0,
              //                         decoration: BoxDecoration(
              //                             color: Colors.blue,
              //                             shape: BoxShape.circle
              //                         ),
              //                       ),
              //                     ),
              //                     Text('2:00 pm'),
              //                   ],
              //                 ),
              //
              //               ],
              //             ),
              //           ],
              //         ),
              //         SizedBox(height: 15.0,),
              //         Row(
              //           children: [
              //             Stack(
              //               alignment: AlignmentDirectional.bottomEnd,
              //               children: [
              //
              //                 CircleAvatar(
              //                     radius: 30.0,
              //                     backgroundImage: NetworkImage('https://scontent-hbe1-1.xx.fbcdn.net/v/t39.30808-6/384112315_1964554623911593_7602614496484570856_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=49d041&_nc_ohc=lVQJHC_ApccAX8TlO0O&_nc_ht=scontent-hbe1-1.xx&oh=00_AfCFLDaQ3AKDRYL3trqNOyDmkRgQEmeJExXwDFaxRlWzug&oe=652B254D'
              //                     )
              //                 ),
              //                 CircleAvatar(
              //                   backgroundColor: Colors.green,
              //                   radius: 7.0,
              //                 ),
              //               ],
              //             ),
              //             SizedBox(width: 10.0,),
              //             Column(
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 Text('Moaz Ahmed '),
              //                 Row(
              //                   children: [
              //                     Text(' Hello Moaz ahmed I like you '),
              //                     Padding(
              //                       padding: const EdgeInsets.symmetric(horizontal:50.0),
              //                       child: Container(
              //                         width: 5.0,
              //                         height: 5.0,
              //                         decoration: BoxDecoration(
              //                             color: Colors.blue,
              //                             shape: BoxShape.circle
              //                         ),
              //                       ),
              //                     ),
              //                     Text('2:00 pm'),
              //                   ],
              //                 ),
              //
              //               ],
              //             ),
              //           ],
              //         ),
              //         SizedBox(height: 15.0,),
              //         Row(
              //           children: [
              //             Stack(
              //               alignment: AlignmentDirectional.bottomEnd,
              //               children: [
              //
              //                 CircleAvatar(
              //                     radius: 30.0,
              //                     backgroundImage: NetworkImage('https://scontent-hbe1-1.xx.fbcdn.net/v/t39.30808-6/384112315_1964554623911593_7602614496484570856_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=49d041&_nc_ohc=lVQJHC_ApccAX8TlO0O&_nc_ht=scontent-hbe1-1.xx&oh=00_AfCFLDaQ3AKDRYL3trqNOyDmkRgQEmeJExXwDFaxRlWzug&oe=652B254D'
              //                     )
              //                 ),
              //                 CircleAvatar(
              //                   backgroundColor: Colors.green,
              //                   radius: 7.0,
              //                 ),
              //               ],
              //             ),
              //             SizedBox(width: 10.0,),
              //             Column(
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 Text('Moaz Ahmed '),
              //                 Row(
              //                   children: [
              //                     Text(' Hello Moaz ahmed I like you '),
              //                     Padding(
              //                       padding: const EdgeInsets.symmetric(horizontal:50.0),
              //                       child: Container(
              //                         width: 5.0,
              //                         height: 5.0,
              //                         decoration: BoxDecoration(
              //                             color: Colors.blue,
              //                             shape: BoxShape.circle
              //                         ),
              //                       ),
              //                     ),
              //                     Text('2:00 pm'),
              //                   ],
              //                 ),
              //
              //               ],
              //             ),
              //           ],
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
Widget builderChat()=> Row(
  children: [
    Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [

        CircleAvatar(
            radius: 30.0,
            backgroundImage: NetworkImage('https://scontent-hbe1-1.xx.fbcdn.net/v/t39.30808-6/323867259_741207813647213_163444701521061346_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=5f2048&_nc_ohc=3dWJGZtJHhsAX90Bc6H&_nc_ht=scontent-hbe1-1.xx&oh=00_AfBscTKNoH2ZnVKItbavkxNQ_TM72YDKH58yITnWgJEzRw&oe=653C8634'
            )
        ),
        CircleAvatar(
          backgroundColor: Colors.green,
          radius: 7.0,
        ),
      ],
    ),
    SizedBox(width: 10.0,),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Moaz Ahmed '),
        Row(
          children: [
            Text(' Hello Moaz ahmed I like you '),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:40.0),
              child: Container(
                width: 5.0,
                height: 5.0,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle
                ),
              ),
            ),
            Text('2:00 pm'),
          ],
        ),

      ],
    ),
  ],
);

Widget builderStory()=> Container(
  width: 60.0,
  child: Column(
    children: [
      Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage('https://scontent-hbe1-1.xx.fbcdn.net/v/t39.30808-6/323867259_741207813647213_163444701521061346_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=5f2048&_nc_ohc=3dWJGZtJHhsAX90Bc6H&_nc_ht=scontent-hbe1-1.xx&oh=00_AfBscTKNoH2ZnVKItbavkxNQ_TM72YDKH58yITnWgJEzRw&oe=653C8634'
              )
          ),
          CircleAvatar(
            backgroundColor: Colors.green,
            radius: 7.0,
          ),
        ],
      ),
      SizedBox(height: 6.0,),
      Text('Moaz Ahmed Abbas',
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    ],
  ),
);
