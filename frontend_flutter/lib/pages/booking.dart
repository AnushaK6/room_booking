import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:room_booking/services/room.dart';

class Booking extends StatefulWidget {
  const Booking({super.key});

  @override
  State<Booking> createState() => _LoginState();
}

class _LoginState extends State<Booking> {
  final _formGlobalKey = GlobalKey<FormState>();
  String? _selectedtype;
  String? _clubname;
  String? _purpose;
  int? _numGuests;
  String _name = "";
  TextEditingController _dateController1 = TextEditingController();
  TextEditingController _dateController2 = TextEditingController();
  DateTime? _fromDate;
  DateTime? _toDate;

  @override
  Widget build(BuildContext context) {

    Map data=ModalRoute.of(context)!.settings.arguments as Map;
    String username=data['username'];

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            child: Column(
              children: <Widget>[
                Text(
                  "Booking",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.purple,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 30,
                ),
                Form(
                    key: _formGlobalKey,
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(label: Text('Name')),
                          validator: (v) {
                            if (v == null || v.isEmpty) {
                              return 'You must enter name';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _name = value!;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
          
                        DropdownButtonFormField(
                          decoration: const InputDecoration(
                              label: Text('Room Type')
                          ),
                          value: _selectedtype,
                          items: [
                            DropdownMenuItem(child: Text("Single"), value: "Single",),
                            DropdownMenuItem(child: Text("Double"), value: "Double",),
                            DropdownMenuItem(child: Text("King"), value: "King",),
                            DropdownMenuItem(child: Text("Suite"), value: "Suite",),
                          ],
                          onChanged: (value) {
                            setState(() {
                              _selectedtype = value!;
                            });
                          },
                          validator: (v) {
                            if (v == null) {
                              return 'You must select room type';
                            }
                            return null;
                          },
                        ),

                        SizedBox(
                          height: 20,
                        ),

                        DropdownButtonFormField(
                          decoration: const InputDecoration(
                              label: Text('Club name')
                          ),
                          value: _clubname,
                          items: [
                            DropdownMenuItem(child: Text("Lambda"), value: "Lambda",),
                            DropdownMenuItem(child: Text("Kludge"), value: "Kludge",),
                            DropdownMenuItem(child: Text("Infero"), value: "Infero",),
                            DropdownMenuItem(child: Text("Robotix"), value: "Robotix",),
                          ],
                          onChanged: (value) {
                            setState(() {
                              _clubname = value!;
                            });
                          },
                          validator: (v) {
                            if (v == null) {
                              return 'You must select club name';
                            }
                            return null;
                          },
                        ),

                        SizedBox(
                          height: 20,
                        ),

                        TextFormField(
                          decoration: const InputDecoration(label: Text('Purpose of visit')),
                          validator: (v) {
                            if (v == null || v.isEmpty) {
                              return 'You must enter purpose of visit';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _purpose = value!;
                          },
                        ),

                        ListTile(
                          title: Text("Number of rooms:"),
                        ),

                        SizedBox(
                          width: 150,
                          child: SpinBox(
                            min: 0,
                            max: 8,
                            value: 0,
                            onChanged: (value) {
                              setState(() {
                                _numGuests=value.toInt();
                              });
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a number';
                              }
                              final numValue = num.tryParse(value);
                              if (numValue == null || numValue <= 0 || numValue > 100) {
                                return 'Please enter a number between 0 and 8';
                              }
                              return null;
                            },//(text) => text!.isEmpty ? 'Invalid' : null
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.zero,
                            ),
                          ),
                        ),
          
                        Row(
          
                          children: [
                            Expanded(
                              flex: 1,
                              child: ListTile(
                                title: Text('From'),
                                subtitle: TextField(
                                  decoration: InputDecoration(
                                    filled: true,
                                    hintText: "Date",
                                    prefixIcon: Icon(Icons.calendar_month,),
                                    prefixIconConstraints: BoxConstraints(
                                      minWidth: 25,
                                      minHeight: 25,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.blue)
                                    ),
                                    contentPadding: EdgeInsets.fromLTRB(
                                        30, 10, 10, 10),
                                  ),
                                  readOnly: true,
                                  onTap: () async {
                                    _fromDate = await showDatePicker(
                                        context: context,
                                        firstDate: DateTime.now(),
                                        lastDate: DateTime.now().add(
                                            Duration(days: 365)));
                                    if (_fromDate != null) {
                                      setState(() {
                                        _dateController1.text = _fromDate.toString().split(" ")[0];
                                      });
                                    }
                                  },
                                  controller: _dateController1,
                                ),),
                            ),
                            Expanded(
                              flex: 1,
                              child: ListTile(
                                title: Text('To'),
                                subtitle: TextField(
                                  decoration: InputDecoration(
                                    hintText: "Date",
                                    filled: true,
                                    prefixIcon: Icon(Icons.calendar_month,),
                                    prefixIconConstraints: BoxConstraints(
                                      minWidth: 25,
                                      minHeight: 25,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.blue)
                                    ),
                                    contentPadding: EdgeInsets.fromLTRB(
                                        30, 10, 10, 10),
                                  ),
                                  readOnly: true,
                                  onTap: () async {
                                    _toDate = await showDatePicker(
                                        context: context,
                                        firstDate: DateTime.now(),
                                        lastDate: DateTime.now().add(
                                            Duration(days: 365)));
                                    if (_toDate != null) {
                                      setState(() {
                                        _dateController2.text = _toDate.toString().split(" ")[0];
                                      });
                                    }
                                  },
                                  controller: _dateController2,
          
                                ),),
                            ),
                          ],
                        ),

                        const SizedBox(height: 50),
                        FilledButton(
                          onPressed: () {
                            if(_dateController1.value.text.isEmpty || _dateController2.value.text.isEmpty){
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: const Text('Form fields missing, please complete the form', style: TextStyle(color: Colors.white),),
                                    backgroundColor: Colors.grey[900],
                                  )
                              );
                            }

                            else if (_formGlobalKey.currentState!.validate()) {
                              _formGlobalKey.currentState!.save();

                              final snackBar = SnackBar(
                                content: const Text('Yay! Your booking is confirmed!'),
                                backgroundColor: Colors.green,
                              );

                              Room.bookRoom(_name.toString(), _selectedtype.toString(), _clubname.toString(), _purpose.toString(), _numGuests!.toInt(), _fromDate.toString().split(" ")[0], _toDate.toString().split(" ")[0], username);
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              Navigator.of(context)!.pushReplacementNamed('/view_bookings', arguments: {'username':username});
                            }
                          },
                          style: FilledButton.styleFrom(
                            backgroundColor: Colors.grey[800],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          child: const Text('Confirm'),
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ));
  }
}

