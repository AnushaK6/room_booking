import 'package:flutter/material.dart';


class RoomModel {
  String name;
  String imgPath;
  Color boxColor;

  RoomModel({
    required this.name,
    required this.imgPath,
    required this.boxColor,
  });

  static List<RoomModel> getCategories() {
    List<RoomModel> categories = [];

    categories.add(
        RoomModel(
            name: 'Single Room',
            imgPath: 'assets/room.jpg',
            boxColor: Color(0xff9DCEFF)
        )
    );

    categories.add(
        RoomModel(
            name: 'Double Room',
            imgPath: 'assets/room.jpg',
            boxColor: Color(0xffEEA4CE)
        )
    );

    categories.add(
        RoomModel(
            name: 'King Room',
            imgPath: 'assets/room.jpg',
            boxColor: Color(0xff9DCEFF)
        )
    );

    categories.add(
        RoomModel(
            name: 'Suite',
            imgPath: 'assets/room.jpg',
            boxColor: Color(0xffEEA4CE)
        )
    );
    return categories;
  }
}


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    List<RoomModel> categories = RoomModel.getCategories();
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    Map data=ModalRoute.of(context)!.settings.arguments as Map;
    String uname=data['username'];

    void _openDrawer() {
      _scaffoldKey.currentState!.openDrawer();
    }

    void _closeDrawer() {
      Navigator.of(context).pop();
    }

    return Scaffold(
      appBar: AppBar(
        actions: [ElevatedButton(onPressed: (){Navigator.of(context).pushNamed('/view_bookings', arguments: {'username':uname});}, child: Text("View bookings"),)],
        backgroundColor: Colors.purple[100],
      ),
      backgroundColor: Colors.white,
        key: _scaffoldKey,
    drawer: Drawer(
      child: ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.purple,
          ),
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Text('Menu', style: TextStyle(fontSize: 30, color: Colors.white),)),
              SizedBox(height: 10,),
              Text('Your username: ${uname}', style: TextStyle(color: Colors.white),),
            ],
          ),
        ),
        ListTile(
          title: const Text('Check bookings'),
          onTap: () {
            Navigator.of(context).pushNamed('/view_bookings', arguments: {'username':uname});
          },
        ),
        ListTile(
          title: const Text('Contact Us'),
          onTap: () {
            Navigator.pushNamed(context, '/contact');
          },
        ),
        ListTile(
          title: const Text('Logout'),
          onTap: () {
            Navigator.popUntil(context, ModalRoute.withName('/welcome'));
          },
        ),
      Padding(
        padding: const EdgeInsets.fromLTRB(5, 100, 5, 20),
        child: ElevatedButton(
          onPressed: _closeDrawer,
          child: const Text('Close Drawer'),),
      ),
      ],
    ),
    ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text("Hotel Transalvania",
                style: TextStyle(
                  fontSize: 54,
                  color: Colors.purple,
                ),
              textAlign: TextAlign.center,),
            ),

            Divider(height: 30,),
            const SizedBox(height: 30,),

            const Padding(
              padding: EdgeInsets.only(left:20),
              child: Text(
                'Our Range of Rooms',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600
                ),
              ),
            ),
            const SizedBox(height: 30,),

            Container(
              height: 150,
              child: ListView.separated(
                itemCount: categories.length,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(
                    left: 20,
                    right: 20
                ),
                separatorBuilder: (context, index) => const SizedBox(width: 25,),
                itemBuilder: (context, index) {
                  return Container(
                    width: 100,
                    decoration: BoxDecoration(
                        color: categories[index].boxColor.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8.0, 15, 8, 15),
                          child: Image.asset(categories[index].imgPath),
                        ),
                        Text(
                          categories[index].name,
                          style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              fontSize: 14
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 30,),
            const Padding(
              padding: EdgeInsets.only(left:20),
              child:Text(
                'Our facilities:',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600
                ),
              ),
            ),
            const SizedBox(height: 30,),
            SizedBox(
              width: 300,
              height: 200,
              child: ListView(
                children: const <Widget>[
                  ListTile(
                    leading: Icon(Icons.star),
                    title: Text('Swimming Pool'),
                  ),
                  ListTile(
                    leading: Icon(Icons.star),
                    title: Text('24X7 Kitchen'),
                  ),
                  ListTile(
                    leading: Icon(Icons.star),
                    title: Text('Spa and recreation room'),
                  ),
                ],
              ),
            ),
      Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.purple[800],
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
                  children: [

                    Text('Email: contact@hotel.co.in', style: TextStyle(color: Colors.white),),
                    Text('Phone: 99994444', style: TextStyle(color: Colors.white),),
                  ],
                ),
        ),
      ),],

        ),
      ),

      bottomNavigationBar: FloatingActionButton.extended(
          onPressed: (){
            Navigator.of(context).pushNamed('/booking', arguments: {'username':uname});
          },
          label: Text("Book a Room",
          style: TextStyle(fontSize: 18),)),

    );
  }
}


