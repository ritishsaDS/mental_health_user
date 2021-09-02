import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:sal_user/UI/Connect.dart';
import 'package:sal_user/Utils/Colors.dart';
import 'package:sal_user/Utils/SizeConfig.dart';
import 'package:sal_user/base/BaseRepository.dart';
import 'package:sal_user/data/api/ApiEndPoint.dart';
import 'package:sal_user/models/Successpaymentmodel.dart';
import 'package:sal_user/models/VerifyOtpModal.dart';
import 'package:shared_preferences/shared_preferences.dart';





class Eventpaymentrepo extends BaseRepository {

  // BuildContext context;
  static Future<void> diomwthod(context,mediaurl,data,therapist,date,type,screen) async {
    var types;
    //var model;


    dynamic loginwithserver = new List();

    //print(adddishmodel.toJson());
    var model = Payment(
        paymentId: data, orderId: mediaurl, paymentMethod: "phonepe");
    print(model.toJson());
    SharedPreferences prefs=await SharedPreferences.getInstance();
    try {
      final response = await post(Uri.parse(
          "https://yvsdncrpod.execute-api.ap-south-1.amazonaws.com/prod/client/event/paymentcomplete"),


          body: json.encode(model));
      print("bjkb" + response.request.toString());
      print("bjkb" + response.statusCode.toString());
      print("bjkb" + response.body.toString());
      // showToast("Dish Added Successfully");

      if (response.statusCode == 200) {
        final responseJson = json.decode(response.body);

        loginwithserver = responseJson;
        showDialog(context: context, builder: (context)  {

          return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
              ),
              backgroundColor: Colors.transparent,
              child: Container(
                width: SizeConfig.screenWidth * 0.9,
                height: SizeConfig.screenHeight * 0.4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenWidth * 0.05,
                    vertical: SizeConfig.blockSizeVertical * 2
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Your Event has been successfully scheduled!",
                      style: TextStyle(
                          color: Color(fontColorSteelGrey),
                          fontWeight: FontWeight.w600,
                          fontSize: SizeConfig.blockSizeVertical * 2.5
                      ),),
                    Container(
                      width: SizeConfig.screenWidth,
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(
                          vertical: SizeConfig.blockSizeVertical
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(prefs.getString('name'),
                            style: GoogleFonts.openSans(
                              color: Color(fontColorSteelGrey),
                            ),),
                          SizedBox(
                            width: SizeConfig.blockSizeHorizontal,
                          ),
                          Image.asset('assets/bg/circle.png',
                            height: SizeConfig.blockSizeVertical * 0.5,),
                          SizedBox(
                            width: SizeConfig.blockSizeHorizontal,
                          ),
                          // Text(type=="1"?"Counsellor":type=="2"?"Listener":"Therapist", style: GoogleFonts.openSans(
                          //   color: Color(fontColorSteelGrey),
                          // ),
                          // ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: SizeConfig.blockSizeVertical * 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("TIME",
                            style: TextStyle(
                                color: Color(fontColorGray),
                                fontWeight: FontWeight.w600
                            ),),
                          Text("DATE",
                            style: TextStyle(
                                color: Color(fontColorGray),
                                fontWeight: FontWeight.w600
                            ),)
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("8:00 AM",
                            style: TextStyle(
                              color: Color(fontColorGray),
                            ),),
                          Text(DateTime.now().toString().substring(0,10),
                            style: TextStyle(
                              color: Color(fontColorGray),
                            ),),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: SizeConfig.blockSizeVertical * 6,
                      ),
                      child: MaterialButton(onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Connect()));
                      },
                        child: Text("CONTINUE",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600
                          ),),
                        minWidth: SizeConfig.screenWidth,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)
                        ),
                        color: Color(backgroundColorBlue),),
                    ),
                  ],
                ),
              )
          );
        });
      }

      // Navigator.push(context,MaterialPageRoute(builder: (context)=>SummaryPayment(mediaUrl: mediaurl,getData:data
      //     ,sessionNumbers: session.toString(),billing:loginwithserver['billing'],order:loginwithserver['order_id'])));

      // print(loginwithserver['data']['email']);
      print(loginwithserver);

      // SharedPreferences preferences = await SharedPreferences.getInstance();
      //
      // preferences.setString("token", loginwithserver['token']['original']['access_token']);
      // preferences.setInt("chefid", loginwithserver['data'][0]['id']);
      // // preferences.setString("token", loginwithserver['token']['original']['access_token']);
      // print(preferences.getInt("chefid"));
      // print( preferences.getString("token"));
      // showToast("Login Successfully");
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyBottomBarDemo()));
      // preferences.setString("login", "cook");


      // showToast("");
      //savedata();


    } catch (e) {
      print(e);

    }
  }
}
