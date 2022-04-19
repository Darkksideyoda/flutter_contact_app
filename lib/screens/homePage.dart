import 'package:contact_app/screens/addContact.dart';
import 'package:contact_app/screens/contactsPage.dart';
import 'package:contact_app/screens/groupsPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; //New

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _pages = <Widget>[
    ContactsPage(),
    GroupsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    String pageName = "";
    Icon pageFloatingActBtnIcon = Icon(Icons.add);
    bool isGroup = false;
    if (_selectedIndex == 0) {
      pageName = "Contacts";
      pageFloatingActBtnIcon = Icon(Icons.person_add);
      isGroup = true;
    } else {
      pageName = "Groups";
      pageFloatingActBtnIcon = Icon(Icons.group_add);
    }
    return WillPopScope(
        child: SafeArea(
            child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            actions: [
              if (isGroup == true)
                IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return Padding(
                              padding: EdgeInsets.all(20),
                              child: Dialog(
                                child: Container(
                                  color: Color.fromARGB(255, 197, 37, 72),
                                  padding: EdgeInsets.all(20),
                                  width: double.infinity,
                                  height: 150,
                                  child: Text(
                                    "Arama Yapmak İçin İsmin Üzerine Dokunun.\nGruba Eklemek İçin Sağdaki '+' İşaretine Dokunun.",
                                    style: GoogleFonts.poppins(
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            );
                          });
                    },
                    icon: const Icon(
                      Icons.info,
                      color: Colors.grey,
                    )),
              if (isGroup == true)
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,
                      color: Colors.grey,
                    ))
            ],
            backgroundColor: Color.fromARGB(255, 14, 14, 14),
            title: Text(
              pageName,
              style: GoogleFonts.poppins(color: Colors.grey),
            ),
            centerTitle: true,
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            child: pageFloatingActBtnIcon,
            onPressed: () {
              if (_selectedIndex == 0) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddContact(),
                    ));
              } else {
                print("Group Added FloatBtn Worked");
              }
            },
            backgroundColor: Color.fromARGB(255, 76, 182, 157),
            foregroundColor: Colors.white,
            mini: false,
          ),
          bottomNavigationBar: BottomAppBar(
            shape: CircularNotchedRectangle(),
            color: Colors.transparent,
            notchMargin: 5,
            clipBehavior: Clip.antiAlias,
            elevation: 0,
            child: BottomNavigationBar(
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              elevation: 0,
              selectedLabelStyle: GoogleFonts.poppins(),
              unselectedLabelStyle: GoogleFonts.poppins(),
              selectedItemColor: Color.fromARGB(255, 76, 182, 157),
              unselectedItemColor: Colors.grey,
              backgroundColor: Color.fromARGB(255, 14, 14, 14),
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Icon(Icons.phone), label: "Contacts"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.group), label: "Groups"),
              ],
            ),
          ),
          body: Center(
            child: _pages.elementAt(_selectedIndex),
          ),
        )),
        onWillPop: () async => false);
  }
}
