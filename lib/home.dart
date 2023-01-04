import 'dart:convert';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:interview/core/utils/color_constant.dart';
import 'package:interview/core/utils/size_utils.dart';
import 'package:interview/invites.dart';
import 'package:interview/model/member.dart';
import 'package:interview/widgets/custom_button.dart';
import 'package:interview/widgets/custom_icon_button.dart';
import 'package:interview/widgets/custom_image_view.dart';
import 'package:interview/widgets/teams_two_item_widget.dart';

import 'core/utils/image_constant.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List pagecount;
  bool loading = true;
late String navdata;

  @override
  void initState() {
    super.initState();
    getdata();
  }
  var datacontacts,datainvites;
  getdata() async {
    //var url = Uri.parse('https://reqres.in/api/users?page=2');
    Map<String, String> requestHeaders = { 'Content-type': 'application/json', 'Accept': 'application/json', 'authtoken': 'eyJhbGciOiJSUzI1NiIsImtpZCI6ImNlOWI4ODBmODE4MmRkYTU1N2Y3YzcwZTIwZTRlMzcwZTNkMTI3NDciLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vbWFybG8tYmFuay1kZXYiLCJhdWQiOiJtYXJsby1iYW5rLWRldiIsImF1dGhfdGltZSI6MTY3Mjg1NzkxNiwidXNlcl9pZCI6IlJoSGdiY1U0cHZNMGR3RE90d1piTlhPOTlRMjMiLCJzdWIiOiJSaEhnYmNVNHB2TTBkd0RPdHdaYk5YTzk5UTIzIiwiaWF0IjoxNjcyODU3OTE2LCJleHAiOjE2NzI4NjE1MTYsImVtYWlsIjoieGlob2g1NTQ5NkBkaW5lcm9hLmNvbSIsImVtYWlsX3ZlcmlmaWVkIjpmYWxzZSwicGhvbmVfbnVtYmVyIjoiKzkxOTUwMDI5ODc2MiIsImZpcmViYXNlIjp7ImlkZW50aXRpZXMiOnsicGhvbmUiOlsiKzkxOTUwMDI5ODc2MiJdLCJlbWFpbCI6WyJ4aWhvaDU1NDk2QGRpbmVyb2EuY29tIl19LCJzaWduX2luX3Byb3ZpZGVyIjoicGFzc3dvcmQifX0.VoEvYlZFZFtHXsNLAH7tj6oUELFPXWqALCkXRNVpfQu5WrOj-MAXoOe495OUs3Sxb-PMgqSRI40x3VZ1Mn6EN7f0BMqumkkiD6FIr9WAi16ts7W9Se-_SwBw3VoakiFKODiEU9UL_lIf5s5KSstG4znIVz6mm05eJ0CP9FvwVIQUb_9mnyAFvSJZr5o5PLvZ5Cf46h2-ehMi5YVTvVk3MJ-aAfi4DlrZ5EChAkzua1p3z1s3gRt1IoWbYc7jbhaJT6-JhT85r0P6E9QawaSTSiedf5kqbEjsUdR4zR8-pQvpJFzC4wK90HxmgOifnKhyldJ7O_ZkWZDXp2TBjjBh_g' };
    var response = await http.get(Uri.parse('https://asia-southeast1-marlo-bank-dev.cloudfunctions.net/api_dev/company/6dc9858b-b9eb-4248-a210-0f1f08463658/teams'),headers: requestHeaders);
    print(response.statusCode);
    if (response.statusCode == 200) {
      var jsonResponse = response.body;
      var membersDetails = membersFromJson(jsonResponse);

      setState(() {
        datacontacts = membersDetails.data.contacts;
        datainvites = membersDetails.data.invites;
        loading = false;
      });
    } else {
      String data = await DefaultAssetBundle.of(context).loadString("assets/data.json");

      var membersDetails = membersFromJson(data);

      setState(() {
        datacontacts = membersDetails.data.contacts;
        datainvites = membersDetails.data.invites;

        navdata = "null";
        rout();
      });
      Flushbar(
        title:  "",
        message:  "token Faild",
        duration:  Duration(seconds: 3),
      )..show(context);

    }



  }
  rout() {

    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        loading = false;

      });


    });
  }
  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading : false,
            elevation: 0,
            backgroundColor: ColorConstant.gray100,
            title: Text("Teams", style: TextStyle(color: Color(0XFF000000),
                fontSize: 34,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w700,
                fontFamily: 'Heebo'
            )),
            actions: <Widget>[
              IconButton(
                onPressed: (){
                  print ('Search');
                },
                icon: Icon(Icons.search), color: Color(0XFF76808A),)
            ],
          ),
          body: loading ? Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 20),
              child: CircularProgressIndicator(
                value: 0.8,
              )
          ) :   SingleChildScrollView(
    child: Stack(
    children: <Widget>[ Container(
            color: ColorConstant.gray100,
            margin: EdgeInsets.only(left: 20,right: 20  ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: getPadding(
                    top: 8,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: getPadding(
                          top: 1,
                        ),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "All people",
                                style: TextStyle(
                                  color: ColorConstant.blueGray500,
                                  fontSize: getFontSize(
                                    16,
                                  ),
                                  fontFamily: 'Noto Sans',
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.25,
                                  height: 1.38,
                                ),
                              ),
                              TextSpan(
                                text: " ",
                                style: TextStyle(
                                  color: ColorConstant.blueGray500,
                                  fontSize: getFontSize(
                                    16,
                                  ),
                                  fontFamily: 'Noto Sans',
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.25,
                                  height: 1.38,
                                ),
                              ),
                              TextSpan(
                                text: datacontacts.length.toString(),
                                style: TextStyle(
                                  color: ColorConstant.blueGray500,
                                  fontSize: getFontSize(
                                    16,
                                  ),
                                  fontFamily: 'Noto Sans',
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.25,
                                  height: 1.38,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          bottom: 1,
                        ),
                        child: Text(
                          "See all",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: ColorConstant.lightBlue600,
                            fontSize: getFontSize(
                              16,
                            ),
                            fontFamily: 'Noto Sans',
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.25,
                            height: 1.38,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: getPadding(
                    top: 17,
                    right: 1,
                  ),
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: datacontacts.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: getMargin(
                          top: 4.0,
                          bottom: 4.0,
                        ),
                        padding: getPadding(
                          top: 16,
                          bottom: 16,
                        ),
                        decoration: BoxDecoration(
                          color: ColorConstant.whiteA700,
                          borderRadius: BorderRadius.circular(
                            getHorizontalSize(
                              10.00,
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomButton(
                              height: 50,
                              width: 40,
                              text: datacontacts[index].firstname.toString().substring(0,2).toUpperCase(),
                              margin: getMargin(
                                top: 1,
                                bottom: 1,

                              ),
                            ),
                            Container(
                              margin: getMargin(

                                right: 10,
                                left: 5,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: getHorizontalSize(
                                      235.00,
                                    ),

                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          datacontacts[index].firstname.toString() + " " + datacontacts[index].lastname.toString() ,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            color: ColorConstant.black900,
                                            fontSize: getFontSize(
                                              16,
                                            ),
                                            fontFamily: 'Noto Sans',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        Padding(
                                          padding: getPadding(
                                            top: 1,
                                          ),
                                          child: Text(
                                            datacontacts[index].roleName.toString(),
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              color: ColorConstant.black900,
                                              fontSize: getFontSize(
                                                14,
                                              ),
                                              fontFamily: 'Noto Sans',
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      top: 2,
                                    ),
                                    child: Text(
                                      datacontacts[index].isactive.toString() == 'true' ? 'Active' :'Inactive',
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: ColorConstant.blueGray500,
                                        fontSize: getFontSize(
                                          12,
                                        ),
                                        fontFamily: 'Noto Sans',
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: 0.25,
                                        height: 1.42,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: getPadding(
                    top: 31,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: getPadding(
                          top: 1,
                        ),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Invited people",
                                style: TextStyle(
                                  color: ColorConstant.blueGray500,
                                  fontSize: getFontSize(
                                    16,
                                  ),
                                  fontFamily: 'Noto Sans',
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.25,
                                  height: 1.38,
                                ),
                              ),
                              TextSpan(
                                text: " ",
                                style: TextStyle(
                                  color: ColorConstant.blueGray500,
                                  fontSize: getFontSize(
                                    16,
                                  ),
                                  fontFamily: 'Noto Sans',
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.25,
                                  height: 1.38,
                                ),
                              ),
                              TextSpan(
                                text: datainvites.length.toString(),
                                style: TextStyle(
                                  color: ColorConstant.blueGray500,
                                  fontSize: getFontSize(
                                    16,
                                  ),
                                  fontFamily: 'Noto Sans',
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.25,
                                  height: 1.38,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          bottom: 1,
                        ),
                        child: Text(
                          "See all",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: ColorConstant.lightBlue600,
                            fontSize: getFontSize(
                              16,
                            ),
                            fontFamily: 'Noto Sans',
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.25,
                            height: 1.38,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                 ListView.builder(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: datainvites.length,
                    itemBuilder: (context, index) {
                      return  navdata != 'null' ? Text(""): GestureDetector(
                        onTap: (){
                          if (navdata == null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                   Invitepage(
                                      email:  datainvites[index].email.toString())),
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                   Invitepage(
                                      email:  datainvites[index].email.toString())),
                            );
                          }
                        },    child:  Padding(
                        padding: getPadding(
                        top: 17,
                        right: 1,
                      ),
                      child: Container(
                        margin: getMargin(
                          top: 4.0,
                          bottom: 4.0,
                        ),
                        padding: getPadding(
                          top: 16,
                          bottom: 16,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                            getHorizontalSize(
                              10.00,
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomButton(
                              height: 50,
                              width: 40,
                              text: datainvites[index].email.toString().substring(0,2).toUpperCase(),
                              variant: ButtonVariant.FillGray600,
                              margin: getMargin(
                                top: 1,
                                bottom: 1,

                              ),
                            ),
                            Container(
                              margin: getMargin(

                                right: 10,
                                left: 5,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: getHorizontalSize(
                                      235.00,
                                    ),

                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          datainvites[index].email.toString().length >= 25 ? datainvites[index].email.toString().substring(0,25): datainvites[index].email.toString() ,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            color: ColorConstant.black900,
                                            fontSize: getFontSize(
                                              16,
                                            ),
                                            fontFamily: 'Noto Sans',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      top: 2,
                                    ),
                                    child: Text(
                                      datainvites[index].configName.toString(),
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: ColorConstant.blueGray500,
                                        fontSize: getFontSize(
                                          12,
                                        ),
                                        fontFamily: 'Noto Sans',
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: 0.25,
                                        height: 1.42,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )));
                    },
                  ),

                CustomIconButton(
                  height: 60,
                  width: 60,
                  margin: getMargin(
                    top: 230,
                    right: 16,
                  ),
                  child: CustomImageView(
                    svgPath: ImageConstant.imgPlus,
                  ),
                ),
              ],
            ),
          ),
        ]))),
      );
  }
}


