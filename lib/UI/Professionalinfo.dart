import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:sal_user/Utils/Colors.dart';
import 'package:sal_user/Utils/SizeConfig.dart';
import 'Home.dart';

bool anxiety = false;
bool relationship = false;
bool depression = false;
bool grief = false;
bool lifeCoaching = false;
bool anger = false;
bool parenting = false;
bool stress = false;
bool motivation = false;
bool others = false;
bool selected = false;
var list=[];
class ProfessionalInfo1 extends StatefulWidget {
  const ProfessionalInfo1({Key key}) : super(key: key);

  @override
  _ProfessionalInfo1State createState() => _ProfessionalInfo1State();
}

class _ProfessionalInfo1State extends State<ProfessionalInfo1> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: SizeConfig.screenHeight * 0.15,
            ),
            Container(
              margin: EdgeInsets.only(
                left: SizeConfig.screenWidth * 0.05,
                right: SizeConfig.screenWidth * 0.05,
              ),
              child: Text(
                "What's Bring You To SAL?",
                style: GoogleFonts.openSans(
                    fontSize: SizeConfig.blockSizeVertical * 4,
                    fontWeight: FontWeight.bold,
                    color: Color(fontColorSteelGrey)),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: SizeConfig.screenWidth * 0.05,
                right: SizeConfig.screenWidth * 0.05,
              ),
              child: Text(
                "Choose topics to focus On",
                style: TextStyle(color: Color(fontColorGray)),
              ),
            ),
            Container(
              width: SizeConfig.screenWidth,
              height: SizeConfig.blockSizeVertical * 6,
              margin: EdgeInsets.only(
                top: SizeConfig.blockSizeVertical,
                left: SizeConfig.screenWidth * 0.05,
                right: SizeConfig.screenWidth * 0.05,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: (){
                      setState(() {
                        // anxiety = true;
                        selected = true;
                        if(anxiety==true&&selected==true){
                          setState(() {
                            anxiety=false;
                            list.remove("Anxiety Management");
                          });}
                        else{
                          anxiety=true;
                          list.add("Anxiety Management");
                        }

                      });
                    },
                    child: Container(
                      child: Text("Anxiety Management",style: GoogleFonts.openSans(
                          color: anxiety == true && selected == true ? Colors.white : Color(fontColorGray),
                          fontSize: SizeConfig.blockSizeVertical * 2
                      ),),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: anxiety == true && selected == true ? Colors.blue : Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                              color: anxiety == true && selected == true ? Colors.blue : Color(fontColorGray),
                              width: 1.0
                          )
                      ),
                      height: SizeConfig.blockSizeVertical * 5,
                      padding: EdgeInsets.only(
                        left: SizeConfig.blockSizeHorizontal * 3,
                        right: SizeConfig.blockSizeHorizontal * 3,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.blockSizeHorizontal * 5,
                  ),
                  InkWell(
                    onTap: (){
                      setState(() {
                        selected == true;
                        if(relationship==true&&selected==true){
                          setState(() {
                            relationship=false;
                            list.remove("Relationship");
                          });}
                        else{
                          relationship=true;
                          list.add("Relationship");
                        }

                      });
                    },
                    child: Container(
                      child: Text("Relationship",style: GoogleFonts.openSans(
                          color: relationship == true  ? Colors.white : Color(fontColorGray),
                          fontSize: SizeConfig.blockSizeVertical * 2
                      ),),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: relationship == true  ? Colors.blue : Colors.white,
                          border: Border.all(
                              color:relationship == true ? Colors.blue : Color(fontColorGray),
                              width: 1.0
                          )
                      ),
                      height: SizeConfig.blockSizeVertical * 5,
                      padding: EdgeInsets.only(
                        left: SizeConfig.blockSizeHorizontal * 3,
                        right: SizeConfig.blockSizeHorizontal * 3,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: SizeConfig.screenWidth,
              height: SizeConfig.blockSizeVertical * 6,
              margin: EdgeInsets.only(
                top: SizeConfig.blockSizeVertical,
                left: SizeConfig.screenWidth * 0.05,
                right: SizeConfig.screenWidth * 0.05,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: (){
                      selected = true;
                      setState(() {
                        selected = true;
                        if(depression==true&&selected==true){
                          setState(() {
                            depression=false;
                            list.remove("Depression");
                          });}
                        else{
                          depression=true;
                          list.add("Depression");
                        }

                      });
                    },
                    child: Container(
                      child: Text("Depression",style: GoogleFonts.openSans(
                          color: depression == true && selected == true? Colors.white : Color(fontColorGray),
                          fontSize: SizeConfig.blockSizeVertical * 2
                      ),),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: depression == true && selected == true? Colors.blue : Colors.white,
                          border: Border.all(
                              color: depression == true && selected == true? Colors.blue : Color(fontColorGray),
                              width: 1.0
                          )
                      ),
                      height: SizeConfig.blockSizeVertical * 5,
                      padding: EdgeInsets.only(
                        left: SizeConfig.blockSizeHorizontal * 3,
                        right: SizeConfig.blockSizeHorizontal * 3,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.blockSizeHorizontal * 5,
                  ),
                  InkWell(
                    onTap: (){
                      setState(() {
                        selected = true;
                        if(grief==true&&selected==true){
                          setState(() {
                            grief=false;
                            list.remove("Grief");
                          });}
                        else{
                          grief=true;
                          list.add("Grief");
                        }
                      });
                    },
                    child: Container(
                      child: Text("Grief",style: GoogleFonts.openSans(
                          color: grief==true && selected == true?Colors.white:Color(fontColorGray),
                          fontSize: SizeConfig.blockSizeVertical * 2
                      ),),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: grief == true && selected == true?Colors.blue:Colors.white,
                          border: Border.all(
                              color: grief == true && selected == true ? Colors.blue : Color(fontColorGray),
                              width: 1.0
                          )
                      ),
                      height: SizeConfig.blockSizeVertical * 5,
                      padding: EdgeInsets.only(
                        left: SizeConfig.blockSizeHorizontal * 3,
                        right: SizeConfig.blockSizeHorizontal * 3,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.blockSizeHorizontal * 5,
                  ),
                  InkWell(
                    onTap: (){
                      setState(() {
                        selected = true;
                        if(lifeCoaching==true&&selected==true){
                          setState(() {
                            lifeCoaching=false;
                            list.remove("Life Coaching");
                          });}
                        else{
                          lifeCoaching=true;
                          list.add("Life Coaching");
                        }                      });
                    },
                    child: Container(
                      child: Text("Life Coaching",style: GoogleFonts.openSans(
                          color: lifeCoaching==true && selected == true? Colors.white : Color(fontColorGray),
                          fontSize: SizeConfig.blockSizeVertical * 2
                      ),),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: lifeCoaching == true && selected == true? Colors.blue : Colors.white,
                          border: Border.all(
                              color: lifeCoaching == true && selected == true ? Colors.blue : Color(fontColorGray),
                              width: 1.0
                          )
                      ),
                      height: SizeConfig.blockSizeVertical * 5,
                      padding: EdgeInsets.only(
                        left: SizeConfig.blockSizeHorizontal * 3,
                        right: SizeConfig.blockSizeHorizontal * 3,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: SizeConfig.screenWidth,
              height: SizeConfig.blockSizeVertical * 6,
              margin: EdgeInsets.only(
                top: SizeConfig.blockSizeVertical,
                left: SizeConfig.screenWidth * 0.05,
                right: SizeConfig.screenWidth * 0.05,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: (){
                      setState(() {
                        selected = true;
                        if(anger==true&&selected==true){
                          setState(() {
                            anger=false;
                            list.remove("Anger Management");
                          });}
                        else{
                          anger=true;
                          list.add("Anger Management");
                        }
                      });
                    },
                    child: Container(
                      child: Text("Anger Management",style: GoogleFonts.openSans(
                          color: anger == true && selected == true ? Colors.white : Color(fontColorGray),
                          fontSize: SizeConfig.blockSizeVertical * 2
                      ),),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: anger == true && selected == true ? Colors.blue : Colors.white,
                          border: Border.all(
                              color: anger == true && selected == true ? Colors.blue : Color(fontColorGray),
                              width: 1.0
                          )
                      ),
                      height: SizeConfig.blockSizeVertical * 5,
                      padding: EdgeInsets.only(
                        left: SizeConfig.blockSizeHorizontal * 3,
                        right: SizeConfig.blockSizeHorizontal * 3,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.blockSizeHorizontal * 5,
                  ),
                  InkWell(
                    onTap: (){
                      setState(() {
                        selected = true;
                        if(parenting==true&&selected==true){
                          setState(() {
                            parenting=false;
                            list.remove("Parenting");

                          });}
                        else{
                          list.add("Parenting");
                          parenting=true;
                        }
                      });
                    },
                    child: Container(
                      child: Text("Parenting",style: GoogleFonts.openSans(
                          color: parenting == true && selected == true ? Colors.white : Color(fontColorGray),
                          fontSize: SizeConfig.blockSizeVertical * 2
                      ),),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: parenting == true && selected == true ? Colors.blue : Colors.white,
                          border: Border.all(
                              color: parenting == true && selected == true ? Colors.blue : Color(fontColorGray),
                              width: 1.0
                          )
                      ),
                      height: SizeConfig.blockSizeVertical * 5,
                      padding: EdgeInsets.only(
                        left: SizeConfig.blockSizeHorizontal * 3,
                        right: SizeConfig.blockSizeHorizontal * 3,
                      ),
                    ),
                  ),
                ],
              ),

            ),
            Container(
              width: SizeConfig.screenWidth,
              height: SizeConfig.blockSizeVertical * 6,
              margin: EdgeInsets.only(
                top: SizeConfig.blockSizeVertical,
                left: SizeConfig.screenWidth * 0.05,
                right: SizeConfig.screenWidth * 0.05,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: (){
                      setState(() {
                        selected = true;
                        if(stress==true&&selected==true){
                          setState(() {
                            stress=false;
                            list.remove("Stress");

                          });}
                        else{
                          stress=true;
                          selected=true;
                        list.add("Stress");

                        }
                      });
                    },
                    child: Container(
                      child: Text("Stress",style: GoogleFonts.openSans(
                          color: stress == true && selected == true ? Colors.white : Color(fontColorGray),
                          fontSize: SizeConfig.blockSizeVertical * 2
                      ),),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: stress == true && selected == true ? Colors.blue : Colors.white,
                          border: Border.all(
                              color: stress == true && selected == true ? Colors.blue : Color(fontColorGray),
                              width: 1.0
                          )
                      ),
                      height: SizeConfig.blockSizeVertical * 5,
                      padding: EdgeInsets.only(
                        left: SizeConfig.blockSizeHorizontal * 3,
                        right: SizeConfig.blockSizeHorizontal * 3,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.blockSizeHorizontal * 5,
                  ),
                  InkWell(
                    onTap: (){
                      setState(() {
                        selected = true;
                        if(motivation==true&&selected==true){
                          setState(() {

                            motivation=false;
                            list.remove("Self Motivation");

                          });}
                        else{
                          motivation=true;
                          list.add("Self Motivation");

                        }
                      });
                    },
                    child: Container(
                      child: Text("Self Motivation",style: GoogleFonts.openSans(
                          color:motivation == true && selected == true ? Colors.white : Color(fontColorGray),
                          fontSize: SizeConfig.blockSizeVertical * 2
                      ),),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: motivation == true && selected == true ? Colors.blue : Colors.white,
                          border: Border.all(
                              color: motivation == true && selected == true ? Colors.blue : Color(fontColorGray),
                              width: 1.0
                          )
                      ),
                      height: SizeConfig.blockSizeVertical * 5,
                      padding: EdgeInsets.only(
                        left: SizeConfig.blockSizeHorizontal * 3,
                        right: SizeConfig.blockSizeHorizontal * 3,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.blockSizeHorizontal * 5,
                  ),
                  InkWell(
                    onTap: (){
                      selected=true;
                      setState(() {
                        if(others==true&&selected ==true){
                          setState(() {
                            selected = true;
                            others=false;
                            list.remove("Others");

                            // selected=false;
                          });}
                        else{
                          others=true;
                          list.add("Others");

                          // selected=true;
                        }
                      });
                    },
                    child: Container(
                      child: Text("Others",style: GoogleFonts.openSans(
                          color: others == true && selected == true ? Colors.white : Color(fontColorGray),
                          fontSize: SizeConfig.blockSizeVertical * 2
                      ),),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: others == true && selected == true ? Colors.blue : Colors.white,
                          border: Border.all(
                              color: others == true && selected == true ? Colors.blue : Color(fontColorGray),
                              width: 1.0
                          )
                      ),
                      height: SizeConfig.blockSizeVertical * 5,
                      padding: EdgeInsets.only(
                        left: SizeConfig.blockSizeHorizontal * 3,
                        right: SizeConfig.blockSizeHorizontal * 3,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.arrow_forward_ios,
          color: Colors.white,
        ),
        backgroundColor: selected == true ? Colors.blue : Colors.grey,
        onPressed: () {
if(selected==true){
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => HomeMain()));
}
else{
  toast("Please Select Value first");
}

        },
      ),
    ));
  }
}
