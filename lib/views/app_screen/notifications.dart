import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar( title: const Text("NOTIFICATIONS"),),
      body: Center(
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                return 
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    // height: 100,
                    decoration: const BoxDecoration(
                      color: Colors.orange,
                      shape:BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(24))

                      
                    ),
                    child:  ListTile(
                      leading: IconButton(onPressed: (){
                        // show alert 
                        //disabled if already seen
                      }, icon: const Icon(Icons.notification_important_rounded)),
                      title: const Text("A New Class has been added"),
                      trailing: IconButton(onPressed: (){
                        //delete
                      }, icon: const Icon(Icons.delete)),
                      
                    ),
                  ),
                ) ;
              },
            ),
          ),
        ],
      ),
        ),
    );
  }
}