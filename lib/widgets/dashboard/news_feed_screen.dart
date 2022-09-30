import 'package:flutter/material.dart';

class NewsFeedScreen extends StatefulWidget {
  const NewsFeedScreen({Key? key}) : super(key: key);

  @override
  State<NewsFeedScreen> createState() => _NewsFeedScreenState();
}

class _NewsFeedScreenState extends State<NewsFeedScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
     NewsFeedCard(),
     NewsFeedCard(),
      NewsFeedCard()
    
      ],
    );
  }
}

class NewsFeedCard extends StatelessWidget {
  const NewsFeedCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
       height: MediaQuery.of(context).size.height*0.3,
       width: MediaQuery.of(context).size.width*0.8,
       decoration:BoxDecoration(
         borderRadius:BorderRadius.circular(10),
         image: DecorationImage(image: NetworkImage("https://picsum.photos/300/200"),fit:BoxFit.cover)
       ),
       child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        
         children: [
           Container(
           
             height: 100,
             decoration: BoxDecoration(
               color: Colors.black12
             ),
             child: Padding(
               padding: const EdgeInsets.all(15.0),
               child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
               mainAxisAlignment: MainAxisAlignment.end,
                 children: [
                   Text("New feed title",style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                   ),),
                   Row(
                     children: [
                       Text("Source ",style: TextStyle(
                    fontSize: 12,
                    color: Colors.white
                   )),
                       Text("Date",style: TextStyle(
                    fontSize: 12,
                    color: Colors.white
                   ))
                     ],
                   )
                 ],
               ),
             ),
           )
         ],
       ),
      ),
    );
  }
}

