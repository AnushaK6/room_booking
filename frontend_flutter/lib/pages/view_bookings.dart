import 'package:flutter/material.dart';
import 'package:room_booking/services/room.dart';

class View_bookings extends StatefulWidget {
  const View_bookings({super.key});

  @override
  State<View_bookings> createState() => _View_bookingsState();
}

class _View_bookingsState extends State<View_bookings> {
  @override
  Widget build(BuildContext context) {
    Map data=ModalRoute.of(context)!.settings.arguments as Map;
    String username=data['username'];

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: FutureBuilder(
          future: Room.getRooms(username),
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

