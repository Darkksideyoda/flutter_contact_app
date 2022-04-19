import 'dart:io';

import 'package:contact_app/screens/homePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class AddContact extends StatefulWidget {
  const AddContact({Key? key}) : super(key: key);

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  TextEditingController contactNameController = TextEditingController();
  TextEditingController contactSurnameController = TextEditingController();
  TextEditingController contactPhoneController = TextEditingController();
  TextEditingController contactEmailController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            "Add New Contact",
            style: GoogleFonts.poppins(
              color: Colors.grey,
            ),
          ),
          centerTitle: false,
          leading: BackButton(
            color: Colors.grey,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
          ),
          backgroundColor: Color.fromARGB(255, 14, 14, 14),
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: 30, left: 10, right: 10, bottom: 20),
                    child: TextField(
                      controller: contactNameController,
                      style: GoogleFonts.poppins(color: Colors.white),
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.person,
                            color: Color.fromARGB(255, 76, 182, 157),
                          ),
                          prefixIconColor: Color.fromARGB(255, 76, 182, 157),
                          fillColor: Colors.black,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                            color: Color.fromARGB(255, 76, 182, 157),
                          )),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                            color: Color.fromARGB(255, 76, 182, 157),
                          )),
                          labelText: 'Name',
                          labelStyle: GoogleFonts.poppins(
                            color: Color.fromARGB(255, 76, 182, 157),
                          ),
                          hintText: 'Enter Your Contact Name',
                          hintStyle: GoogleFonts.poppins(
                              color: Colors.grey, fontSize: 12)),
                    ),
                  ),
                  //////////////////SURNAME////////////////////////////
                  Padding(
                    padding: EdgeInsets.only(
                        top: 20, left: 10, right: 10, bottom: 20),
                    child: TextField(
                      controller: contactSurnameController,
                      style: GoogleFonts.poppins(color: Colors.white),
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.group,
                            color: Color.fromARGB(255, 76, 182, 157),
                          ),
                          prefixIconColor: Color.fromARGB(255, 76, 182, 157),
                          fillColor: Colors.black,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                            color: Color.fromARGB(255, 76, 182, 157),
                          )),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                            color: Color.fromARGB(255, 76, 182, 157),
                          )),
                          labelText: 'Surname',
                          labelStyle: GoogleFonts.poppins(
                            color: Color.fromARGB(255, 76, 182, 157),
                          ),
                          hintText: 'Enter Your Contact Surname',
                          hintStyle: GoogleFonts.poppins(
                              color: Colors.grey, fontSize: 12)),
                    ),
                  ),
                  /////////////////////PHONE NUMBER////////////////////////
                  Padding(
                    padding: EdgeInsets.only(
                        top: 20, left: 10, right: 10, bottom: 20),
                    child: TextField(
                      controller: contactPhoneController,
                      style: GoogleFonts.poppins(color: Colors.white),
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.phone,
                            color: Color.fromARGB(255, 76, 182, 157),
                          ),
                          prefixIconColor: Color.fromARGB(255, 76, 182, 157),
                          fillColor: Colors.black,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                            color: Color.fromARGB(255, 76, 182, 157),
                          )),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                            color: Color.fromARGB(255, 76, 182, 157),
                          )),
                          labelText: 'Phone Number',
                          labelStyle: GoogleFonts.poppins(
                            color: Color.fromARGB(255, 76, 182, 157),
                          ),
                          hintText: 'Enter Your Contact Phone',
                          hintStyle: GoogleFonts.poppins(
                              color: Colors.grey, fontSize: 12)),
                    ),
                  ),

                  /////////////////////////EMAIL////////////////////////////

                  Padding(
                    padding: EdgeInsets.only(
                        top: 20, left: 10, right: 10, bottom: 20),
                    child: TextField(
                      controller: contactEmailController,
                      style: GoogleFonts.poppins(color: Colors.white),
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.email,
                            color: Color.fromARGB(255, 76, 182, 157),
                          ),
                          prefixIconColor: Color.fromARGB(255, 76, 182, 157),
                          fillColor: Colors.black,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                            color: Color.fromARGB(255, 76, 182, 157),
                          )),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                            color: Color.fromARGB(255, 76, 182, 157),
                          )),
                          labelText: 'E-Mail',
                          labelStyle: GoogleFonts.poppins(
                            color: Color.fromARGB(255, 76, 182, 157),
                          ),
                          hintText: 'Enter Your Contact E-Mail',
                          hintStyle: GoogleFonts.poppins(
                              color: Colors.grey, fontSize: 12)),
                    ),
                  ),

                  //////////////////////INSERT CONTACT BUTTON//////////////////

                  Padding(
                    padding: EdgeInsets.only(
                        top: 60, bottom: 20, left: 20, right: 20),
                    child: ElevatedButton(
                      child: const Text(
                        'ADD CONTACT',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        final newContact = Contact();
                        newContact.name.first = contactNameController.text;
                        newContact.name.last = contactSurnameController.text;
                        newContact.phones = [
                          Phone(contactPhoneController.text)
                        ];
                        newContact.emails = [
                          Email(contactEmailController.text)
                        ];
                        await newContact.insert();

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );

                    
                        Fluttertoast.showToast(
                          msg: "Contact Added Successfully !",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          backgroundColor: Color.fromARGB(255, 76, 182, 157),
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );

                     
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 76, 182, 157),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
