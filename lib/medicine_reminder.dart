

//  Way 1...........................................................................

//
// import 'package:flutter/material.dart';
//
// class MedicineReminder extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(Icons.alarm, size: 100.0, color: Colors.lightBlue),
//           SizedBox(height: 20.0),
//           Text(
//             'Medicine Reminder',
//             style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: 10.0),
//           Text(
//             'Set reminders for your medicines here',
//             style: TextStyle(fontSize: 18.0),
//           ),
//         ],
//       ),
//     );
//   }
// }



//  Way 2 ...........................................................................

//
// import 'package:flutter/material.dart';
//
// class MedicineReminder extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   title: Text('Medicine Reminder'),
//       //   backgroundColor: Colors.lightBlue,
//       // ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(Icons.alarm, size: 100.0, color: Colors.lightBlue),
//             SizedBox(height: 20.0),
//             Text(
//               'Medicine Reminder',
//               style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 10.0),
//             Text(
//               'Set reminders for your medicines here',
//               style: TextStyle(fontSize: 18.0),
//             ),
//             SizedBox(height: 40.0),
//             ElevatedButton(
//               onPressed: () {
//                 // Add functionality for setting reminders
//               },
//               style: ElevatedButton.styleFrom(
//                 primary: Colors.lightBlue,
//                 padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
//               ),
//               child: Text('Set Reminder', style: TextStyle(fontSize: 18.0)),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//



//  Way 3 ...........................................................................

//
// import 'package:flutter/material.dart';
//
// class MedicineReminder extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(Icons.alarm, size: 100.0, color: Colors.lightBlue),
//               SizedBox(height: 20.0),
//               Text(
//                 'Medicine Reminder',
//                 style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 10.0),
//               Text(
//                 'Set reminders for your medicines here',
//                 style: TextStyle(fontSize: 18.0),
//               ),
//               SizedBox(height: 40.0),
//               ElevatedButton(
//                 onPressed: () {
//                   // Add functionality for setting reminders
//                 },
//                 style: ElevatedButton.styleFrom(
//                   primary: Colors.lightBlue,
//                   padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
//                 ),
//                 child: Text('Set Reminder', style: TextStyle(fontSize: 18.0)),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }




//  Way 4 ...........................................................................

//
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:timezone/timezone.dart';
//
// class MedicineReminder extends StatelessWidget {
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//   FlutterLocalNotificationsPlugin();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(Icons.alarm, size: 100.0, color: Colors.lightBlue),
//               SizedBox(height: 20.0),
//               Text(
//                 'Medicine Reminder',
//                 style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 10.0),
//               Text(
//                 'Set reminders for your medicines here',
//                 style: TextStyle(fontSize: 18.0),
//               ),
//               SizedBox(height: 40.0),
//               ElevatedButton(
//                 onPressed: () {
//                   _setReminder(context);
//                 },
//                 style: ElevatedButton.styleFrom(
//                   primary: Colors.lightBlue,
//                   padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
//                 ),
//                 child: Text('Set Reminder', style: TextStyle(fontSize: 18.0)),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Future<void> _setReminder(BuildContext context) async {
//     // Initialize the plugin
//     const AndroidInitializationSettings initializationSettingsAndroid =
//     AndroidInitializationSettings('app_icon');
//     final IOSInitializationSettings initializationSettingsIOS =
//     IOSInitializationSettings(
//         onDidReceiveLocalNotification: onDidReceiveLocalNotification);
//     final InitializationSettings initializationSettings =
//     InitializationSettings(
//         android: initializationSettingsAndroid,
//         iOS: initializationSettingsIOS);
//     await flutterLocalNotificationsPlugin.initialize(initializationSettings,
//         onSelectNotification: onSelectNotification);
//
//     // Define the notification details
//     const AndroidNotificationDetails androidPlatformChannelSpecifics =
//     AndroidNotificationDetails(
//       'your channel id',
//       'your channel name',
//       'your channel description',
//       importance: Importance.max,
//       priority: Priority.high,
//       ticker: 'ticker',
//     );
//     const NotificationDetails platformChannelSpecifics =
//     NotificationDetails(android: androidPlatformChannelSpecifics);
//
//     // Schedule the notification
//     await flutterLocalNotificationsPlugin.zonedSchedule(
//       0,
//       'Medicine Reminder',
//       'Time to take your medicine!',
//       _nextInstanceOfTenAM(),
//       platformChannelSpecifics,
//       androidAllowWhileIdle: true,
//       uiLocalNotificationDateInterpretation:
//       UILocalNotificationDateInterpretation.absoluteTime,
//       matchDateTimeComponents: DateTimeComponents.time,
//     );
//
//     // Show a confirmation snackbar
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text('Reminder set successfully'),
//       ),
//     );
//   }
//
//   tz.TZDateTime _nextInstanceOfTenAM() {
//     final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
//     tz.TZDateTime scheduledDate = tz.TZDateTime(tz.local, now.year, now.month,
//         now.day, 10, 0); // Schedule it at 10:00 AM
//     if (scheduledDate.isBefore(now)) {
//       scheduledDate = scheduledDate.add(const Duration(days: 1));
//     }
//     return scheduledDate;
//   }
//
//   Future<void> onSelectNotification(String? payload) async {
//     if (payload != null) {
//       debugPrint('notification payload: $payload');
//     }
//   }
//
//   Future<void> onDidReceiveLocalNotification(
//       int id, String? title, String? body, String? payload) async {
//     // Display the received notification as a dialog
//     showDialog(
//       // Use showDialog or Navigator.push or whatever here to show your screen when notification tapped
//       context: context,
//       builder: (_) => AlertDialog(
//         title: Text(title ?? ''),
//         content: Text(body ?? ''),
//         actions: <Widget>[
//           TextButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             child: const Text('OK'),
//           ),
//         ],
//       ),
//     );
//   }
// }
//




//  Way 5 ...........................................................................

//
//
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:timezone/data/latest.dart' as tz;
// import 'package:timezone/timezone.dart' as tz;
//
//
//
// class MedicineReminder extends StatelessWidget {
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//   FlutterLocalNotificationsPlugin();
//
//   MedicineReminder() {
//     // Initialize timezone data
//     tz.initializeTimeZones();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(Icons.alarm, size: 100.0, color: Colors.lightBlue),
//               SizedBox(height: 20.0),
//               Text(
//                 'Medicine Reminder',
//                 style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 10.0),
//               Text(
//                 'Set reminders for your medicines here',
//                 style: TextStyle(fontSize: 18.0),
//               ),
//               SizedBox(height: 40.0),
//               ElevatedButton(
//                 onPressed: () {
//                   _setReminder(context);
//                 },
//                 style: ElevatedButton.styleFrom(
//                   primary: Colors.lightBlue,
//                   padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
//                 ),
//                 child: Text('Set Reminder', style: TextStyle(fontSize: 18.0)),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Future<void> _setReminder(BuildContext context) async {
//     // Initialize the plugin
//     const AndroidInitializationSettings initializationSettingsAndroid =
//     AndroidInitializationSettings('app_icon');
//     final IOSInitializationSettings initializationSettingsIOS =
//     IOSInitializationSettings(
//         onDidReceiveLocalNotification: (id, title, body, payload) =>
//             onDidReceiveLocalNotification(context, id, title, body, payload));
//     final InitializationSettings initializationSettings =
//     InitializationSettings(
//         android: initializationSettingsAndroid,
//         iOS: initializationSettingsIOS);
//     await flutterLocalNotificationsPlugin.initialize(initializationSettings,
//         onSelectNotification: onSelectNotification);
//
//     // Define the notification details
//     const AndroidNotificationDetails androidPlatformChannelSpecifics =
//     AndroidNotificationDetails(
//       'your channel id',
//       'your channel name',
//       'your channel description',
//       importance: Importance.max,
//       priority: Priority.high,
//       ticker: 'ticker',
//     );
//     const NotificationDetails platformChannelSpecifics =
//     NotificationDetails(android: androidPlatformChannelSpecifics);
//
//     // Schedule the notification
//     await flutterLocalNotificationsPlugin.zonedSchedule(
//       0,
//       'Medicine Reminder',
//       'Time to take your medicine!',
//       _nextInstanceOfTenAM(),
//       platformChannelSpecifics,
//       androidAllowWhileIdle: true,
//       uiLocalNotificationDateInterpretation:
//       UILocalNotificationDateInterpretation.absoluteTime,
//       matchDateTimeComponents: DateTimeComponents.time,
//     );
//
//     // Show a confirmation snackbar
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text('Reminder set successfully'),
//         action: SnackBarAction(
//           label: 'Show Reminder',
//           onPressed: () {
//             // Show the set reminder details in a dialog
//             showDialog(
//               context: context,
//               builder: (_) => AlertDialog(
//                 title: Text('Set Reminder'),
//                 content: Text('Your reminder has been set for 10:00 AM.'),
//                 actions: [
//                   TextButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     child: Text('OK'),
//                   ),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
//
//   tz.TZDateTime _nextInstanceOfTenAM() {
//     final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
//     tz.TZDateTime scheduledDate = tz.TZDateTime(tz.local, now.year, now.month,
//         now.day, 10, 0); // Schedule it at 10:00 AM
//     if (scheduledDate.isBefore(now)) {
//       scheduledDate = scheduledDate.add(const Duration(days: 1));
//     }
//     return scheduledDate;
//   }
//
//   Future<void> onSelectNotification(String? payload) async {
//     if (payload != null) {
//       debugPrint('notification payload: $payload');
//     }
//   }
//
//   Future<void> onDidReceiveLocalNotification(
//       BuildContext context, int id, String? title, String? body, String? payload) async {
//     // Display the received notification as a dialog
//     showDialog(
//       // Use showDialog or Navigator.push or whatever here to show your screen when notification tapped
//       context: context,
//       builder: (_) => AlertDialog(
//         title: Text(title ?? ''),
//         content: Text(body ?? ''),
//         actions: <Widget>[
//           TextButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             child: const Text('OK'),
//           ),
//         ],
//       ),
//     );
//   }
// }




//  Way 6 ...........................................................................


//
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:timezone/data/latest.dart' as tz;
// import 'package:timezone/timezone.dart' as tz;
//
// class MedicineReminder extends StatelessWidget {
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//   FlutterLocalNotificationsPlugin();
//
//   MedicineReminder() {
//     // Initialize timezone data
//     tz.initializeTimeZones();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(Icons.alarm, size: 100.0, color: Colors.lightBlue),
//               SizedBox(height: 20.0),
//               Text(
//                 'Medicine Reminder',
//                 style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 10.0),
//               Text(
//                 'Set reminders for your medicines here',
//                 style: TextStyle(fontSize: 18.0),
//               ),
//               SizedBox(height: 40.0),
//               ElevatedButton(
//                 onPressed: () {
//                   _setReminder(context);
//                 },
//                 style: ElevatedButton.styleFrom(
//                   primary: Colors.lightBlue,
//                   padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
//                 ),
//                 child: Text('Set Reminder', style: TextStyle(fontSize: 18.0)),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Future<void> _setReminder(BuildContext context) async {
//     // Show time picker dialog
//     final TimeOfDay? pickedTime = await showTimePicker(
//       context: context,
//       initialTime: TimeOfDay.now(),
//     );
//
//     // Return if the user cancels the time picker dialog
//     if (pickedTime == null) return;
//
//     // Extract hour and minute from picked time
//     final int hour = pickedTime.hour;
//     final int minute = pickedTime.minute;
//
//     // Schedule the notification for the selected time
//     await _scheduleNotification(context, hour, minute);
//   }
//
//   Future<void> _scheduleNotification(BuildContext context, int hour, int minute) async {
//     // Initialize the plugin
//     const AndroidInitializationSettings initializationSettingsAndroid =
//     AndroidInitializationSettings('app_icon');
//     final IOSInitializationSettings initializationSettingsIOS =
//     IOSInitializationSettings(
//       onDidReceiveLocalNotification: (id, title, body, payload) =>
//           onDidReceiveLocalNotification(context, id, title, body, payload),
//     );
//     final InitializationSettings initializationSettings = InitializationSettings(
//       android: initializationSettingsAndroid,
//       iOS: initializationSettingsIOS,
//     );
//     await flutterLocalNotificationsPlugin.initialize(initializationSettings,
//         onSelectNotification: onSelectNotification);
//
//     // Define notification details
//     const AndroidNotificationDetails androidPlatformChannelSpecifics =
//     AndroidNotificationDetails(
//       'your channel id',
//       'your channel name',
//       'your channel description',
//       importance: Importance.max,
//       priority: Priority.high,
//       ticker: 'ticker',
//     );
//     const NotificationDetails platformChannelSpecifics =
//     NotificationDetails(android: androidPlatformChannelSpecifics);
//
//     // Calculate the scheduled time for the notification
//     final tz.TZDateTime scheduledDate = _nextInstanceOf(hour, minute);
//
//     // Schedule the notification
//     await flutterLocalNotificationsPlugin.zonedSchedule(
//       0,
//       'Medicine Reminder',
//       'Time to take your medicine!',
//       scheduledDate,
//       platformChannelSpecifics,
//       androidAllowWhileIdle: true,
//       uiLocalNotificationDateInterpretation:
//       UILocalNotificationDateInterpretation.absoluteTime,
//       matchDateTimeComponents: DateTimeComponents.time,
//     );
//
//     // Show confirmation snackbar
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text('Reminder set successfully for $hour:$minute'),
//       ),
//     );
//   }
//
//   tz.TZDateTime _nextInstanceOf(int hour, int minute) {
//     final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
//     tz.TZDateTime scheduledDate = tz.TZDateTime(tz.local, now.year, now.month,
//         now.day, hour, minute); // Schedule it at selected hour and minute
//     if (scheduledDate.isBefore(now)) {
//       scheduledDate = scheduledDate.add(const Duration(days: 1));
//     }
//     return scheduledDate;
//   }
//
//   Future<void> onSelectNotification(String? payload) async {
//     if (payload != null) {
//       debugPrint('notification payload: $payload');
//     }
//   }
//
//   Future<void> onDidReceiveLocalNotification(
//       BuildContext context, int id, String? title, String? body, String? payload) async {
//     // Display the received notification as a dialog
//     showDialog(
//       // Use showDialog or Navigator.push or whatever here to show your screen when notification tapped
//       context: context,
//       builder: (_) => AlertDialog(
//         title: Text(title ?? ''),
//         content: Text(body ?? ''),
//         actions: <Widget>[
//           TextButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             child: const Text('OK'),
//           ),
//         ],
//       ),
//     );
//   }
// }
//



//  Way 7 ...........................................................................


//
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:timezone/data/latest.dart' as tz;
// import 'package:timezone/timezone.dart' as tz;
//
// class MedicineReminder extends StatefulWidget {
//   @override
//   _MedicineReminderState createState() => _MedicineReminderState();
// }
//
// class _MedicineReminderState extends State<MedicineReminder> {
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//   FlutterLocalNotificationsPlugin();
//   String? selectedAlarmTime; // Initialize selectedAlarmTime to null
//
//   @override
//   void initState() {
//     super.initState();
//     // Initialize timezone data
//     tz.initializeTimeZones();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(Icons.alarm, size: 100.0, color: Colors.lightBlue),
//               SizedBox(height: 20.0),
//               Text(
//                 'Medicine Reminder',
//                 style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 10.0),
//               Text(
//                 'Set reminders for your medicines here',
//                 style: TextStyle(fontSize: 18.0),
//               ),
//               SizedBox(height: 40.0),
//               ElevatedButton(
//                 onPressed: () {
//                   _setReminder(context);
//                 },
//                 style: ElevatedButton.styleFrom(
//                   primary: Colors.lightBlue,
//                   padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
//                 ),
//                 child: Text('Set Reminder', style: TextStyle(fontSize: 18.0)),
//               ),
//               SizedBox(height: 20.0),
//               if (selectedAlarmTime != null)
//                 Card(
//                   elevation: 4.0,
//                   margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//                   child: Padding(
//                     padding: const EdgeInsets.all(15.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           'Alarm set for:',
//                           style: TextStyle(fontSize: 18.0),
//                         ),
//                         Text(
//                           selectedAlarmTime!,
//                           style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Future<void> _setReminder(BuildContext context) async {
//     // Show time picker dialog
//     final TimeOfDay? pickedTime = await showTimePicker(
//       context: context,
//       initialTime: TimeOfDay.now(),
//     );
//
//     // Return if the user cancels the time picker dialog
//     if (pickedTime == null) return;
//
//     // Extract hour and minute from picked time
//     final int hour = pickedTime.hour;
//     final int minute = pickedTime.minute;
//
//     // Schedule the notification for the selected time
//     await _scheduleNotification(context, hour, minute);
//
//     setState(() {
//       selectedAlarmTime = '$hour:$minute';
//     });
//   }
//
//   Future<void> _scheduleNotification(BuildContext context, int hour, int minute) async {
//     // Initialize the plugin
//     const AndroidInitializationSettings initializationSettingsAndroid =
//     AndroidInitializationSettings('app_icon');
//     final IOSInitializationSettings initializationSettingsIOS =
//     IOSInitializationSettings(
//       onDidReceiveLocalNotification: (id, title, body, payload) =>
//           onDidReceiveLocalNotification(context, id, title, body, payload),
//     );
//     final InitializationSettings initializationSettings = InitializationSettings(
//       android: initializationSettingsAndroid,
//       iOS: initializationSettingsIOS,
//     );
//     await flutterLocalNotificationsPlugin.initialize(initializationSettings,
//         onSelectNotification: onSelectNotification);
//
//     // Define notification details
//     const AndroidNotificationDetails androidPlatformChannelSpecifics =
//     AndroidNotificationDetails(
//       'your channel id',
//       'your channel name',
//       'your channel description',
//       importance: Importance.max,
//       priority: Priority.high,
//       ticker: 'ticker',
//     );
//     const NotificationDetails platformChannelSpecifics =
//     NotificationDetails(android: androidPlatformChannelSpecifics);
//
//     // Calculate the scheduled time for the notification
//     final tz.TZDateTime scheduledDate = _nextInstanceOf(hour, minute);
//
//     // Schedule the notification
//     await flutterLocalNotificationsPlugin.zonedSchedule(
//       0,
//       'Medicine Reminder',
//       'Time to take your medicine!',
//       scheduledDate,
//       platformChannelSpecifics,
//       androidAllowWhileIdle: true,
//       uiLocalNotificationDateInterpretation:
//       UILocalNotificationDateInterpretation.absoluteTime,
//       matchDateTimeComponents: DateTimeComponents.time,
//     );
//
//     // Show confirmation snackbar
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text('Reminder set successfully for $hour:$minute'),
//       ),
//     );
//   }
//
//   tz.TZDateTime _nextInstanceOf(int hour, int minute) {
//     final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
//     tz.TZDateTime scheduledDate = tz.TZDateTime(tz.local, now.year, now.month,
//         now.day, hour, minute); // Schedule it at selected hour and minute
//     if (scheduledDate.isBefore(now)) {
//       scheduledDate = scheduledDate.add(const Duration(days: 1));
//     }
//     return scheduledDate;
//   }
//
//   Future<void> onSelectNotification(String? payload) async {
//     if (payload != null) {
//       debugPrint('notification payload: $payload');
//     }
//   }
//
//   Future<void> onDidReceiveLocalNotification(
//       BuildContext context, int id, String? title, String? body, String? payload) async {
//     // Display the received notification as a dialog
//     showDialog(
//       // Use showDialog or Navigator.push or whatever here to show your screen when notification tapped
//       context: context,
//       builder: (_) => AlertDialog(
//         title: Text(title ?? ''),
//         content: Text(body ?? ''),
//         actions: <Widget>[
//           TextButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             child: const Text('OK'),
//           ),
//         ],
//       ),
//     );
//   }
// }



//  Way 8 ...........................................................................



//
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:timezone/data/latest.dart' as tz;
// import 'package:timezone/timezone.dart' as tz;
//
// class MedicineReminder extends StatefulWidget {
//   @override
//   _MedicineReminderState createState() => _MedicineReminderState();
// }
//
// class _MedicineReminderState extends State<MedicineReminder> {
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//   FlutterLocalNotificationsPlugin();
//   List<String> selectedAlarmTimes = []; // Initialize selectedAlarmTimes to an empty list
//
//   @override
//   void initState() {
//     super.initState();
//     // Initialize timezone data
//     tz.initializeTimeZones();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(Icons.alarm, size: 100.0, color: Colors.lightBlue),
//               SizedBox(height: 20.0),
//               Text(
//                 'Medicine Reminder',
//                 style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 10.0),
//               Text(
//                 'Set reminders for your medicines here',
//                 style: TextStyle(fontSize: 18.0),
//               ),
//               SizedBox(height: 40.0),
//               ElevatedButton(
//                 onPressed: () {
//                   _setReminder(context);
//                 },
//                 style: ElevatedButton.styleFrom(
//                   primary: Colors.lightBlue,
//                   padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
//                 ),
//                 child: Text('Set Reminder', style: TextStyle(fontSize: 18.0)),
//               ),
//               SizedBox(height: 20.0),
//               Column(
//                 children: selectedAlarmTimes.map((alarmTime) {
//                   return Card(
//                     elevation: 4.0,
//                     margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//                     child: Padding(
//                       padding: const EdgeInsets.all(15.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             'Alarm set for:',
//                             style: TextStyle(fontSize: 18.0),
//                           ),
//                           Text(
//                             alarmTime,
//                             style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 }).toList(),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Future<void> _setReminder(BuildContext context) async {
//     // Show time picker dialog
//     final TimeOfDay? pickedTime = await showTimePicker(
//       context: context,
//       initialTime: TimeOfDay.now(),
//     );
//
//     // Return if the user cancels the time picker dialog
//     if (pickedTime == null) return;
//
//     // Extract hour and minute from picked time
//     final int hour = pickedTime.hour;
//     final int minute = pickedTime.minute;
//
//     // Schedule the notification for the selected time
//     await _scheduleNotification(context, hour, minute);
//
//     setState(() {
//       selectedAlarmTimes.add('$hour:$minute');
//     });
//   }
//
//   Future<void> _scheduleNotification(BuildContext context, int hour, int minute) async {
//     // Initialize the plugin
//     const AndroidInitializationSettings initializationSettingsAndroid =
//     AndroidInitializationSettings('app_icon');
//     final IOSInitializationSettings initializationSettingsIOS =
//     IOSInitializationSettings(
//       onDidReceiveLocalNotification: (id, title, body, payload) =>
//           onDidReceiveLocalNotification(context, id, title, body, payload),
//     );
//     final InitializationSettings initializationSettings = InitializationSettings(
//       android: initializationSettingsAndroid,
//       iOS: initializationSettingsIOS,
//     );
//     await flutterLocalNotificationsPlugin.initialize(initializationSettings,
//         onSelectNotification: onSelectNotification);
//
//     // Define notification details
//     const AndroidNotificationDetails androidPlatformChannelSpecifics =
//     AndroidNotificationDetails(
//       'your channel id',
//       'your channel name',
//       'your channel description',
//       importance: Importance.max,
//       priority: Priority.high,
//       ticker: 'ticker',
//     );
//     const NotificationDetails platformChannelSpecifics =
//     NotificationDetails(android: androidPlatformChannelSpecifics);
//
//     // Calculate the scheduled time for the notification
//     final tz.TZDateTime scheduledDate = _nextInstanceOf(hour, minute);
//
//     // Schedule the notification
//     await flutterLocalNotificationsPlugin.zonedSchedule(
//       0,
//       'Medicine Reminder',
//       'Time to take your medicine!',
//       scheduledDate,
//       platformChannelSpecifics,
//       androidAllowWhileIdle: true,
//       uiLocalNotificationDateInterpretation:
//       UILocalNotificationDateInterpretation.absoluteTime,
//       matchDateTimeComponents: DateTimeComponents.time,
//     );
//
//     // Show confirmation snackbar
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text('Reminder set successfully for $hour:$minute'),
//       ),
//     );
//   }
//
//   tz.TZDateTime _nextInstanceOf(int hour, int minute) {
//     final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
//     tz.TZDateTime scheduledDate = tz.TZDateTime(tz.local, now.year, now.month,
//         now.day, hour, minute); // Schedule it at selected hour and minute
//     if (scheduledDate.isBefore(now)) {
//       scheduledDate = scheduledDate.add(const Duration(days: 1));
//     }
//     return scheduledDate;
//   }
//
//   Future<void> onSelectNotification(String? payload) async {
//     if (payload != null) {
//       debugPrint('notification payload: $payload');
//     }
//   }
//
//   Future<void> onDidReceiveLocalNotification(
//       BuildContext context, int id, String? title, String? body, String? payload) async {
//     // Display the received notification as a dialog
//     showDialog(
//       // Use showDialog or Navigator.push or whatever here to show your screen when notification tapped
//       context: context,
//       builder: (_) => AlertDialog(
//         title: Text(title ?? ''),
//         content: Text(body ?? ''),
//         actions: <Widget>[
//           TextButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             child: const Text('OK'),
//           ),
//         ],
//       ),
//     );
//   }
// }




//  Way 9 ...........................................................................



import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class MedicineReminder extends StatefulWidget {
  @override
  _MedicineReminderState createState() => _MedicineReminderState();
}

class _MedicineReminderState extends State<MedicineReminder> {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();
  List<String> selectedAlarmTimes = []; // Initialize selectedAlarmTimes to an empty list

  @override
  void initState() {
    super.initState();
    // Initialize timezone data
    tz.initializeTimeZones();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView( // Wrap your Column with SingleChildScrollView
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.alarm, size: 100.0, color: Colors.lightBlue),
                SizedBox(height: 20.0),
                Text(
                  'Medicine Reminder',
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Set reminders for your medicines here',
                  style: TextStyle(fontSize: 18.0),
                ),
                SizedBox(height: 40.0),
                ElevatedButton(
                  onPressed: () {
                    _setReminder(context);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.lightBlue,
                    padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
                  ),
                  child: Text('Set Reminder', style: TextStyle(fontSize: 18.0)),
                ),
                SizedBox(height: 20.0),
                Column(
                  children: selectedAlarmTimes.map((alarmTime) {
                    return Card(
                      elevation: 4.0,
                      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Alarm set for:',
                              style: TextStyle(fontSize: 18.0),
                            ),
                            Text(
                              alarmTime,
                              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _setReminder(BuildContext context) async {
    // Show time picker dialog
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    // Return if the user cancels the time picker dialog
    if (pickedTime == null) return;

    // Extract hour and minute from picked time
    final int hour = pickedTime.hour;
    final int minute = pickedTime.minute;

    // Schedule the notification for the selected time
    await _scheduleNotification(context, hour, minute);

    setState(() {
      selectedAlarmTimes.add('$hour:$minute');
    });
  }

  Future<void> _scheduleNotification(BuildContext context, int hour, int minute) async {
    // Initialize the plugin
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('app_icon');
    final IOSInitializationSettings initializationSettingsIOS =
    IOSInitializationSettings(
      onDidReceiveLocalNotification: (id, title, body, payload) =>
          onDidReceiveLocalNotification(context, id, title, body, payload),
    );
    final InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);

    // Define notification details
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
      'your channel id',
      'your channel name',
      'your channel description',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
    );
    const NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);

    // Calculate the scheduled time for the notification
    final tz.TZDateTime scheduledDate = _nextInstanceOf(hour, minute);

    // Schedule the notification
    await flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      'Medicine Reminder',
      'Time to take your medicine!',
      scheduledDate,
      platformChannelSpecifics,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
      UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
    );

    // Show confirmation snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Reminder set successfully for $hour:$minute'),
      ),
    );
  }

  tz.TZDateTime _nextInstanceOf(int hour, int minute) {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate = tz.TZDateTime(tz.local, now.year, now.month,
        now.day, hour, minute); // Schedule it at selected hour and minute
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    return scheduledDate;
  }

  Future<void> onSelectNotification(String? payload) async {
    if (payload != null) {
      debugPrint('notification payload: $payload');
    }
  }

  Future<void> onDidReceiveLocalNotification(
      BuildContext context, int id, String? title, String? body, String? payload) async {
    // Display the received notification as a dialog
    showDialog(
      // Use showDialog or Navigator.push or whatever here to show your screen when notification tapped
      context: context,
      builder: (_) => AlertDialog(
        title: Text(title ?? ''),
        content: Text(body ?? ''),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
