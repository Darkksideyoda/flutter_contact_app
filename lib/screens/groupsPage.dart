import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class GroupsPage extends StatefulWidget {
  const GroupsPage({Key? key}) : super(key: key);

  @override
  State<GroupsPage> createState() => _GroupsPageState();
}

class _GroupsPageState extends State<GroupsPage> {
  List<Contact>? _contacts;
  bool _permissionDenied = false;

  List<Contact>? contacts;
  @override
  void initState() {
    super.initState();
    getContact();
    //_refreshItems();
  }


  @override
  void dispose() {
    // Closes all Hive boxes
    super.dispose();
  }



  void getContact() async {
    if (await FlutterContacts.requestPermission()) {
      contacts = await FlutterContacts.getContacts(
          withProperties: true, withPhoto: true);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_permissionDenied) return Center(child: Text("Permissin Denied!"));
    if (contacts == null)
      return Center(
        child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
          Color.fromARGB(255, 76, 182, 157),
        )),
      );
    return Padding(
      padding: EdgeInsets.only(bottom: 10, top: 20, left: 15, right: 15),
      child: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          

            Center(
                child: Column(
              children: [
                Lottie.asset('assets/images/boxEmpty.json'),
                Text("No Groups",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold, color: Colors.white)),
              ],
            ))

            // ListView.builder(
            //   physics: NeverScrollableScrollPhysics(),
            //   shrinkWrap: true,
            //   itemCount: contacts!.length,
            //   itemBuilder: (context, index) {

            //     String phoneNums = (contacts![index].phones.isNotEmpty)
            //         ? (contacts![index].phones.first.number)
            //         : "--";
            //     String ContactId = (contacts![index].id);
            //     return GestureDetector(
            //       onTap: () {
            //         print("ID:" + ContactId);
            //         print(contacts![index].displayName);
            //         if (contacts![index].phones.isNotEmpty) {
            //           launch('tel: ${phoneNums}');
            //         }
            //       },
            //       child: Card(
            //         margin: EdgeInsets.all(5),
            //         elevation: 0,
            //         color: Color.fromARGB(255, 83, 83, 83),
            //         child: Slidable(
            //           key: const ValueKey(0),

            //           startActionPane: ActionPane(
            //             motion: ScrollMotion(),

            //             dismissible: DismissiblePane(onDismissed: () async {
            //               Contact? contact1 = await FlutterContacts.getContact(
            //                   contacts![index].id);
            //               contact1!.delete();
            //               Fluttertoast.showToast(
            //                 msg: "Contact Deleted Successfully !",
            //                 toastLength: Toast.LENGTH_SHORT,
            //                 gravity: ToastGravity.CENTER,
            //                 backgroundColor:
            //                     const Color.fromARGB(255, 76, 182, 157),
            //                 textColor: Colors.white,
            //                 fontSize: 16.0,
            //               );
            //             }),

            //             children: [
            //               SlidableAction(
            //                 onPressed: (context) async {
            //                   Contact? contact1 =
            //                       await FlutterContacts.getContact(
            //                           contacts![index].id);
            //                   contact1!.delete();
            //                   Fluttertoast.showToast(
            //                     msg: "Contact Deleted Successfully !",
            //                     toastLength: Toast.LENGTH_SHORT,
            //                     gravity: ToastGravity.CENTER,
            //                     backgroundColor:
            //                         Color.fromARGB(255, 76, 182, 157),
            //                     textColor: Colors.white,
            //                     fontSize: 16.0,
            //                   );
            //                 },
            //                 backgroundColor: Color.fromARGB(255, 163, 0, 54),
            //                 foregroundColor: Color.fromARGB(255, 187, 187, 187),
            //                 icon: Icons.delete,
            //                 label: 'Delete',
            //               ),
            //               SlidableAction(
            //                 onPressed: doNothing,
            //                 backgroundColor: Color.fromARGB(255, 76, 182, 157),
            //                 foregroundColor: Color.fromARGB(255, 187, 187, 187),
            //                 icon: Icons.close,
            //                 label: 'Close',
            //               ),
            //             ],
            //           ),
            //           child: ListTile(
            //               leading: CircleAvatar(
            //                 backgroundColor: Color.fromARGB(255, 76, 182, 157),
            //                 child: Icon(
            //                   Icons.person,
            //                   color: Colors.white,
            //                 ),
            //                 radius: 15,
            //               ),
            //               subtitle: Text(
            //                 phoneNums,
            //                 style: GoogleFonts.poppins(
            //                     fontWeight: FontWeight.bold),
            //               ),
            //               title: Text(
            //                 contacts![index].displayName,
            //                 style: GoogleFonts.poppins(color: Colors.white),
            //               ),
            //               trailing: IconButton(
            //                 icon: Icon(Icons.add),
            //                 color: Color.fromARGB(255, 76, 182, 157),
            //                 onPressed: () {},
            //               )),
            //         ),
            //       ),
            //     );
            //   },
            // )
          ],
        ),
      ),
    );
  }
}

void deleteContact(BuildContext context, String ID, List Contacts) async {
  Contact? contact = await FlutterContacts.getContact(Contacts.first.ID);
}

void doNothing(BuildContext context) {}
