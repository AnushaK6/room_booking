import 'package:flutter/material.dart';
import 'package:room_booking/pages/home.dart';
import 'package:room_booking/pages/welcome.dart';
import 'package:room_booking/pages/login.dart';
import 'package:room_booking/pages/booking.dart';
import 'package:room_booking/pages/view_bookings.dart';
import 'package:room_booking/pages/signup.dart';
import 'package:room_booking/pages/adminlogin.dart';
import 'package:room_booking/pages/admin_view.dart';
import 'package:room_booking/pages/contact.dart';

void main() {

  runApp(MaterialApp(
  initialRoute: '/welcome',
  routes: {
    '/welcome':(context)=>Welcome(),
    '/login':(context)=>Login(),
    '/home':(context)=>Home(),
    '/booking':(context)=>Booking(),
    '/view_bookings':(context)=>View_bookings(),
    '/signup':(context)=>Signup(),
    '/adminlogin':(context)=>Admin_Login(),
    '/adminview':(context)=>Admin_View(),
    '/contact':(context)=>Contact(),
  },
));
}
