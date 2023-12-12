// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:singleclinic/screens/shop/widgets/AccountScreen.dart';

// import '../../../main.dart';

// class ProfileEditScreen extends StatefulWidget {
//   @override
//   _ProfileEditScreenState createState() => _ProfileEditScreenState();
// }

// class _ProfileEditScreenState extends State<ProfileEditScreen> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   String _editedName = '';
//   String _editedEmail = '';

//   void _submitForm() {}

//   void _showPictureOption() {
//     showModalBottomSheet(
//       context: context,
//       builder: (BuildContext context) {
//         return Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             ListTile(
//               leading: Icon(Icons.camera_alt),
//               title: Text('Take a Photo'),
//               onTap: () {
//                 Navigator.pop(context);
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.photo),
//               title: Text('Choose from Gallery'),
//               onTap: () {
//                 // Implement your gallery selection logic here
//                 Navigator.pop(context);
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   saveData() async {
//     var pref = await SharedPreferences.getInstance();
//     pref.setString("name", _editedName);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Edit Profile')),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               GestureDetector(
//                 onTap: _showPictureOption,
//                 child: CircleAvatar(
//                   radius: 50,
//                   backgroundImage: AssetImage("assets/tabBar/support.png"),
//                   backgroundColor: Colors.grey,
//                 ),
//               ),
//               TextFormField(
//                 initialValue: _editedName,
//                 decoration: InputDecoration(labelText: 'Name'),
//                 validator: (value) {
//                   if (value.isEmpty) {
//                     return 'Please enter your name';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) {
//                   _editedName = value;
//                 },
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   setState(() {
//                     if (_formKey.currentState.validate()) {
//                       _formKey.currentState.save();
//                       saveData();
//                       Navigator.push(context,
//                           MaterialPageRoute(builder: (context) {
//                         return RootScreen();
//                       }));
//                     }
//                   });
//                 },
//                 child: Text('Save Changes'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
