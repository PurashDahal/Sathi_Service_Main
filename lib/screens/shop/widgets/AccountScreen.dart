// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:modal_progress_hud/modal_progress_hud.dart';
// import 'package:singleclinic/common/widgets/drawer.dart';
// import 'package:singleclinic/utils/colors.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import '../../../main.dart';
// import 'EditAccount.dart';

// class AccountScreen extends StatefulWidget {
//   const AccountScreen({Key key}) : super(key: key);

//   @override
//   State<AccountScreen> createState() => _AccountScreenState();
// }

// class _AccountScreenState extends State<AccountScreen> {
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//   String name = "";
//   bool _isSnipping = true;
//   void getName() async {
//     var pref = await SharedPreferences.getInstance();
//     setState(() {
//       name = pref.getString("name");
//     });
//   }

//   List<String> button = ['My Appointments', "My Subscriptions", "My Orders"];

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     getName();
//     Timer(Duration(seconds: 2), () {
//       setState(() {
//         _isSnipping = false;
//       });
//     });
//   }

//   Widget build(BuildContext context) {
//     var dHeight = MediaQuery.of(context).size.height;
//     var dWidht = MediaQuery.of(context).size.width;

//     return ModalProgressHUD(
//       inAsyncCall: _isSnipping,
//       child: Scaffold(
//         key: _scaffoldKey,
//         drawer: DrawerWidget(),
//         appBar: AppBar(
//           backgroundColor: WHITE,
//           title: Text("Account",
//               style: GoogleFonts.poppins().copyWith(color: Colors.black)),
//           leading: IconButton(
//             onPressed: () => _scaffoldKey.currentState.openDrawer(),
//             icon: Icon(
//               Icons.menu,
//               color: primaryColor,
//               size: 30,
//             ),
//           ),
//           actions: [
//             IconButton(
//               icon: Icon(Icons.edit),
//               onPressed: () =>
//                   Navigator.push(context, MaterialPageRoute(builder: (context) {
//                 return ProfileEditScreen();
//               })),
//               color: primaryColor,
//             ),
//             SizedBox(
//               width: 10,
//             ),
//           ],
//         ),
//         body: _isSnipping == true
//             ? Container(
//                 color: WHITE,
//                 width: double.infinity,
//                 height: double.infinity,
//               )
//             : SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     Container(
//                       height: MediaQuery.of(context).size.height * 0.25,
//                       child: Stack(
//                         children: [
//                           Container(
//                             width: double.infinity,
//                             height: 150,
//                             decoration: BoxDecoration(
//                                 color: primaryColor,
//                                 borderRadius: BorderRadius.only(
//                                     bottomLeft: Radius.circular(55),
//                                     bottomRight: Radius.circular(55))),
//                           ),
//                           Positioned(
//                             top: MediaQuery.of(context).size.width * 0.16,
//                             left: MediaQuery.of(context).size.width * 0.3,
//                             child: Center(
//                               child: Padding(
//                                 padding: const EdgeInsets.all(0),
//                                 child: Container(
//                                   decoration: BoxDecoration(
//                                       // color: Colors.amber,
//                                       border:
//                                           Border.all(width: 4, color: WHITE),
//                                       shape: BoxShape.circle),
//                                   child: CircleAvatar(
//                                     radius: 65,
//                                     backgroundColor: Colors.grey,
//                                     backgroundImage: null,
//                                     // AssetImage(
//                                     //   "assets/tabBar/support.png",
//                                     // ),
//                                     child: Icon(
//                                       Icons.person,
//                                       size: 90,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(height: 20),
//                     Text(
//                       '$name',
//                       style:
//                           TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                     ),
//                     SizedBox(height: 10),
//                     // Expanded(
//                     //   child: GridView.builder(
//                     //       itemCount: 3,
//                     //       gridDelegate:
//                     //           SliverGridDelegateWithFixedCrossAxisCount(
//                     //               crossAxisCount: 2),
//                     //       itemBuilder: (BuildContext context, index) {
//                     //         return SizedBox(
//                     //           height: 50,
//                     //           child: ElevatedButton(
//                     //               onPressed: () {}, child: Text(button[index])),
//                     //         );
//                     //       }),
//                     // )
//                     Container(
//                       height: 500,
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: SizedBox(
//                           // height: dHeight * 0.4,
//                           height: 200,
//                           width: dWidht * 0.8,
//                           child: ListView.builder(
//                               itemCount: button.length,
//                               itemBuilder: (builder, index) {
//                                 return Card(
//                                   child: Text("${button[index]}"),
//                                 );
//                               }),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//       ),
//     );
//   }
// }
