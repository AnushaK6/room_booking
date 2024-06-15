import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
          child: Column(
            children: [
              Text(
                "Hotel Transalvania",
                style: TextStyle(
                  fontSize: 54,
                  color: Colors.purpleAccent,
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 30,),

              Text("Step into Paradise",
                style: TextStyle(color: Colors.grey[400]),
              ),

              Divider(
                height: 60,
                color: Colors.grey[850],
              ),

              SizedBox(height: 50,),

              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton.icon(
                    onPressed: (){
                      Navigator.pushNamed(context, '/adminlogin');
                    },
                    label: Text("Login as Admin", style: TextStyle(color: Colors.purpleAccent),),
                    icon: Icon(Icons.admin_panel_settings, color: Colors.white,),
                    style: ElevatedButton.styleFrom(backgroundColor:Colors.grey[850]),
                  ),

                  SizedBox(height: 30,),

                  ElevatedButton.icon(
                    onPressed: (){
                      Navigator.pushNamed(context, '/login');
                    },
                    label: Text("Login as client", style: TextStyle(color: Colors.purpleAccent),),
                    icon: Icon(Icons.contact_page, color: Colors.white,),
                    style: ElevatedButton.styleFrom(backgroundColor:Colors.grey[850]),
                  ),

                  SizedBox(height: 50,),

                  ElevatedButton.icon(
                    onPressed: (){
                      Navigator.pushNamed(context, '/signup');
                    },
                    label: Text("Sign Up", style: TextStyle(color: Colors.white,),),
                    icon: Icon(Icons.account_box, color: Colors.white),
                    style: ElevatedButton.styleFrom(backgroundColor:Colors.purple[300]),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
