import 'package:flutter/material.dart';
import 'package:room_booking/services/user.dart';
import 'package:room_booking/services/aduser.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _LoginState();
}

class _LoginState extends State<Signup> {

  final _formGlobalKey = GlobalKey<FormState>();
  String? _username;
  String? _passwd;
  bool checkboxValue=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Signup",
                  style: TextStyle(
                    fontSize: 54,
                    color: Colors.purple,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 50,),
                Form(
                    key: _formGlobalKey,
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                              label: Text('Email')
                          ),
                          validator: (v) {
                            if (v == null || v.isEmpty) {
                              return 'You must enter email';
                            }
                            return null;
                          },
                          onSaved: (value){
                            _username=value!;
                          },
                        ),
                        SizedBox(height: 20,),
                        TextFormField(
                          obscureText: true,
                          decoration: const InputDecoration(
                              label: Text('Password')
                          ),
                          validator: (v) {
                            if (v == null || v.isEmpty) {
                              return 'You must enter password';
                            }
                            return null;
                          },
                          onSaved: (value){
                            _passwd=value!;
                          },
                        ),
                        CheckboxListTile(
                          value: checkboxValue,
                          onChanged: (val) {
                            if (checkboxValue == false) {
                              setState(() {
                                checkboxValue = true;
                              });
                            } else if (checkboxValue == true) {
                              setState(() {
                                checkboxValue = false;
                              });
                            }
                          },
                          title: new Text('Sign up as admin', style: TextStyle(fontSize: 14.0),),
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: Colors.green,
                        ),
                        const SizedBox(height: 50),
                        FilledButton(
                          onPressed: () {
                            if(_formGlobalKey.currentState!.validate()){
                              _formGlobalKey.currentState!.save();

                              final snackBar = SnackBar(
                                content: const Text('Yay! Successfully signed up'),
                                backgroundColor: Colors.green,
                              );

                              if(checkboxValue==true){
                                Admin.signAdmin(_username.toString(), _passwd.toString());
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                Navigator.pushReplacementNamed(context, '/adminview');}
                              }
                              else{
                                User.signUser(_username.toString(), _passwd.toString());
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  content: const Text('Yay! Successfully signed up'),
                                  backgroundColor: Colors.green,
                                ));
                                Navigator.of(context).pushReplacementNamed('/home', arguments: {'username':_username});}
                          },
                          style: FilledButton.styleFrom(
                            backgroundColor: Colors.grey[800],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          child: const Text('Signup'),
                        ),
                      ],
                    ))
              ],
            ),
          ),
        )
    );
  }
}