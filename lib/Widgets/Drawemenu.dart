import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sal_user/UI/AboutSAL.dart';
import 'package:sal_user/UI/Assessments.dart';
import 'package:sal_user/UI/Connect.dart';
import 'package:sal_user/UI/CousellorProfile.dart';
import 'package:sal_user/UI/Exploreall.dart';
import 'package:sal_user/UI/Help.dart';
import 'package:sal_user/UI/MySessions.dart';
import 'package:sal_user/UI/Myprofile.dart';
import 'package:sal_user/UI/Sessions.dart';
import 'package:sal_user/UI/Settings.dart';
import 'package:sal_user/UI/SummaryPayment.dart';
import 'package:sal_user/UI/calander/calander_screen.dart';
import 'package:sal_user/UI/calander/components/custom_calendar.dart';
import 'package:sal_user/UI/mood.dart';
import 'package:sal_user/Utils/AlertDialog.dart';
import 'package:sal_user/Utils/Colors.dart';
import 'package:sal_user/Utils/SizeConfig.dart';
import 'package:sal_user/data/repo/upcomingappointmentrepo.dart';
import 'package:sal_user/models/bookedappointment.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({Key key}) : super(key: key);

  @override
  _DrawerMenuState createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  var upcomintAppointments = UpcomingAppointmentRepo();
  bool  isloading = true;
  List<Appointment> appointments = new List();
  var name="";
  var photo;
  void initState() {
    super.initState();
    getname();
    isloading = true;
    upcomintAppointments
        .upcomingAppointmentRepo(
      context,
    )
        .then((value) {
      print("value");
      print(value);
      if (value != null) {
        if (value.meta.status == "200") {
          setState(() {
            isloading = false;
          });
          print("jnjnjonaeno");
          appointments.addAll(value.appointments);
          print("appointments.length");
          print(appointments.length);

          //toast(value.meta.message);
          /*  SharedPreferencesTest().checkIsLogin("0");
                                          SharedPreferencesTest()
                                              .saveToken("set", value: value.token);*/

          /*  Navigator.push(context,
              MaterialPageRoute(
                  builder: (conext) {
                    return OTPScreen(
                      phoneNumber: mobileController.text,
                    );
                  }));*/
        } else {
          showAlertDialog(
            context,
            value.meta.message,
            "",
          );
        }
      } else {
        showAlertDialog(
          context,
          "No data found",
          "",
        );
      }
    }).catchError((error) {
      showAlertDialog(
        context,
        error.toString(),
        "",
      );
    });
  }
  Future<void> getname() async {
    SharedPreferences prefs=await SharedPreferences.getInstance();
    
    print(prefs.getString("name"));
    setState(() {
      name=prefs.getString("name");
      photo=  prefs.getString("photo");
    });
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: SizeConfig.screenWidth,
              height: SizeConfig.screenHeight * 0.28,
              color: Color(backgroundColorBlue),
              child: Column(
                children: [
                  Container(
                    width: SizeConfig.screenWidth,
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(
                      top: SizeConfig.blockSizeVertical * 3,
                    ),
                    child: CircleAvatar(
                      radius: SizeConfig.blockSizeVertical * 5,
                      backgroundImage:photo!=null?Image.network(photo).image: Image.network(  'https://www.pngitem.com/pimgs/m/421-4212617_person-placeholder-image-transparent-hd-png-download.png').image,
                    ),
                    ),

                  Container(
                    width: SizeConfig.screenWidth,
                    alignment: Alignment.center,
                    margin:
                        EdgeInsets.only(top: SizeConfig.blockSizeVertical * 2),
                    child: Text(
                      name==null?"":name,
                      style: GoogleFonts.openSans(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: SizeConfig.blockSizeVertical * 2),
                    ),
                  ),
                  Container(
                    width: SizeConfig.screenWidth,
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(
                      top: SizeConfig.blockSizeVertical * 1.5,
                    ),
                    child: Text(
                      "Complete your profile (60%)",
                      style: GoogleFonts.openSans(
                        color: Colors.white,
                        fontSize: SizeConfig.blockSizeVertical * 1.5,
                      ),
                    ),
                  ),
                  Container(
                    width: SizeConfig.screenWidth,
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(
                      top: SizeConfig.blockSizeVertical * 1.5,
                      left: SizeConfig.screenWidth * 0.2,
                      right: SizeConfig.screenWidth * 0.2,
                    ),
                    child: LinearProgressIndicator(
                      backgroundColor: Color(midnightBlue),
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      value: 0.6,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 3,
            ),
            ListTile(
              title: Text("My Profile"),
              leading: ImageIcon(Image.asset('assets/icons/user.png').image),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyProfile()));
              },
            ),
            ListTile(
              onTap: (){
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context)=>MySessions()));
              },
              title: Text("My Sessions"),
              leading:
                  ImageIcon(Image.asset('assets/icons/availability.png').image),
              trailing: Container(child: CircleAvatar(radius:15,child: Text(appointments.length.toString()),),),
            ),
            // ListTile(
            //   title: Text("Bookings"),
            //   leading:
            //       ImageIcon(Image.asset('assets/icons/nav booking.png').image),
            //   onTap: () {
            //     Navigator.pop(context);
            //     Navigator.push(context, MaterialPageRoute(builder: (context)=>Connect()));
            //   },
            // ),
            // ListTile(
            //   title: Text("My Content"),
            //   leading: ImageIcon(Image.asset('assets/icons/content.png').image),
            //   onTap: () {
            //     Navigator.pop(context);
            //     Navigator.push(context,
            //         MaterialPageRoute(builder: (context) => MySessions()));
            //   },
            // ),
            ListTile(
              title: Text("Assessments"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Assessments()));
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => Assessments()));
              },
              leading:
                  ImageIcon(Image.asset('assets/icons/assessments.png').image),
            ),
            ListTile(
              title: Text("My Moods"),
              leading: ImageIcon(Image.asset('assets/icons/payment.png').image),
              onTap: () {
                Navigator.pop(context);
               Navigator.push(context, MaterialPageRoute(builder: (context)=>Mood()));
              },
            ),
            ListTile(
              title: Text("Help"),
              leading: ImageIcon(Image.asset('assets/icons/help.png').image),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Help()));
              },
            ),
            ListTile(
              title: Text("About SAL"),
              leading: ImageIcon(Image.asset('assets/icons/about.png').image),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AboutSAL()));
              },
            ),
            ListTile(
              title: Text("Settings"),
              leading: ImageIcon(Image.asset('assets/icons/settings.png').image),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Settings()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
