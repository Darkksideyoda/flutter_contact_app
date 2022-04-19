import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({Key? key}) : super(key: key);

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  List<Contact>? _contacts;
  bool _permissionDenied = false;

  List<Contact>? contacts;
  @override
  void initState() {
    super.initState();
    getContact();
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
      padding: EdgeInsets.only(bottom: 10, top: 10, left: 15, right: 15),
      child: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: contacts!.length,
              itemBuilder: (context, index) {
                String phoneNums = (contacts![index].phones.isNotEmpty)
                    ? (contacts![index].phones.first.number)
                    : "--";
                String mailContact = (contacts![index].emails.isNotEmpty)
                    ? (contacts![index].emails.first.address)
                    : "--";
                String ContactId = (contacts![index].id);
                return GestureDetector(
                  onTap: () {
                    print("ID:" + ContactId);
                    print(contacts![index].displayName);
                    if (contacts![index].phones.isNotEmpty) {
                      launch('tel: ${phoneNums}');
                    }
                  },
                  child: Card(
                    margin: EdgeInsets.all(5),
                    elevation: 0,
                    color: Color.fromARGB(255, 83, 83, 83),
                    child: Slidable(
                      key: const ValueKey(0),
                      endActionPane: ActionPane(
                        motion: ScrollMotion(),
                        children: [
                          SlidableAction(
                            onPressed: (context) {
                              if (contacts![index].phones.isNotEmpty) {
                                launch('sms: ${phoneNums}');
                              }
                            },
                            backgroundColor: Color.fromARGB(255, 255, 174, 0),
                            foregroundColor: Color.fromARGB(255, 187, 187, 187),
                            icon: Icons.sms,
                            label: 'SMS',
                          ),
                          SlidableAction(
                            onPressed: (context) {
                              if (contacts![index].emails.isNotEmpty) {
                                launch('mailto: ${mailContact}');
                              } else {
                                Fluttertoast.showToast(
                                  msg: "Contact Has No Email !",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  backgroundColor:
                                      Color.fromARGB(255, 182, 76, 76),
                                  textColor: Colors.white,
                                  fontSize: 16.0,
                                );
                              }
                            },
                            backgroundColor: Color.fromARGB(255, 0, 101, 141),
                            foregroundColor: Color.fromARGB(255, 187, 187, 187),
                            icon: Icons.mail,
                            label: 'Mail',
                          ),
                        ],
                      ),
                      startActionPane: ActionPane(
                        motion: ScrollMotion(),
                        dismissible: DismissiblePane(onDismissed: () async {
                          Contact? contact1 = await FlutterContacts.getContact(
                              contacts![index].id);
                          contact1!.delete();
                          Fluttertoast.showToast(
                            msg: "Contact Deleted Successfully !",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            backgroundColor:
                                const Color.fromARGB(255, 76, 182, 157),
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );
                        }),
                        children: [
                          SlidableAction(
                            onPressed: (context) async {
                              Contact? contact1 =
                                  await FlutterContacts.getContact(
                                      contacts![index].id);
                              contact1!.delete();
                              Fluttertoast.showToast(
                                msg: "Contact Deleted Successfully !",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                backgroundColor:
                                    Color.fromARGB(255, 76, 182, 157),
                                textColor: Colors.white,
                                fontSize: 16.0,
                              );
                            },
                            backgroundColor: Color.fromARGB(255, 163, 0, 54),
                            foregroundColor: Color.fromARGB(255, 187, 187, 187),
                            icon: Icons.delete,
                            label: 'Delete',
                          ),
                          SlidableAction(
                            onPressed: (context) {
                              if (contacts![index].phones.isNotEmpty) {
                                launch('tel: ${phoneNums}');
                              }
                            },
                            backgroundColor: Color.fromARGB(255, 76, 182, 157),
                            foregroundColor: Color.fromARGB(255, 187, 187, 187),
                            icon: Icons.call,
                            label: 'Call',
                          ),
                        ],
                      ),
                      child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Color.fromARGB(255, 76, 182, 157),
                            child: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                            radius: 15,
                          ),
                          subtitle: Text(
                            phoneNums,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold),
                          ),
                          title: Text(
                            //1347
                            contacts![index].displayName,
                            style: GoogleFonts.poppins(color: Colors.white),
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.add),
                            color: Color.fromARGB(255, 76, 182, 157),
                            onPressed: () {},
                          )),
                    ),
                  ),
                );
              },
            )
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
