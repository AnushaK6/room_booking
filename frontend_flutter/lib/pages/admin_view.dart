import 'package:flutter/material.dart';
import 'package:room_booking/services/room.dart';

class Admin_View extends StatefulWidget {
  const Admin_View({super.key});

  @override
  State<Admin_View> createState() => _Admin_ViewState();
}

class _Admin_ViewState extends State<Admin_View> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
        const DrawerHeader(
        decoration: BoxDecoration(
        color: Colors.purple,
        ),
        child: Text('Menu', style: TextStyle(fontSize: 30, color: Colors.white),),
      ),
      ListTile(
        title: const Text('Logout'),
        onTap: () {
          Navigator.popUntil(context, ModalRoute.withName('/welcome'));
        },
      ),]),),
      body: Container(
        child: FutureBuilder(
          future: Room.getAllRoom(),
          builder: (context,snapshot){
            Widget stage;
            if(snapshot.connectionState==ConnectionState.waiting){
              stage= Center(
                child: SizedBox(
                  width: 60,
                  height: 60,
                  child: CircularProgressIndicator(),
                ),
              );
            }

            else if(snapshot.data!.isEmpty){
              stage= const Center(
                child: Text('No data'),
              );
            }
            else if(snapshot.hasData){
              stage= ListView.builder(itemCount: snapshot.data?.length, itemBuilder:(
                      (context,i){
                    return Card(
                      child: ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Name: ${snapshot.data![i]['name']}"),
                            Text("Club: ${snapshot.data![i]['club']}")
                          ],
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Room: ${snapshot.data![i]['size']}"),
                            Text("Number: ${snapshot.data![i]['num']}"),
                            Text("From: ${snapshot.data![i]['from']} - To: ${snapshot.data![i]['to']}"),
                            Text("Purpose:  ${snapshot.data![i]['purpose']}"),
                          ],
                        ),
                      ),
                    );
                  }
              ),);
            }
            else{
              stage= const Center(
                child: Text('No data'),
              );
            }
            return stage;
          },
        ),
      ),
    );
  }
}