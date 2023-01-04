import 'dart:convert';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:interview/bottom_nav.dart';
import 'package:interview/home.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:interview/core/app_export.dart';
import 'package:interview/widgets/custom_button.dart';
import 'package:interview/widgets/custom_text_form_field.dart';
class Invitepage extends StatefulWidget {
  final String email;
  const Invitepage({ required this.email});

  @override
  _InvitepageState createState() => _InvitepageState();

}

class _InvitepageState extends State<Invitepage> {

  final TextEditingController _emailController = TextEditingController();
  FocusNode myFocusNode = new FocusNode();
  var email ;
  bool loading = true;
  late int roleid;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      email= widget.email;
       loading = false;
    });
  }
  datapass( {required int roleid})  async {
  
    final response = await http.post(
        Uri.parse('https://jsonplaceholder.typicode.com/albums'),
        headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
          'authtoken':'eyJhbGciOiJSUzI1NiIsImtpZCI6ImNlOWI4ODBmODE4MmRkYTU1N2Y3YzcwZTIwZTRlMzcwZTNkMTI3NDciLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vbWFybG8tYmFuay1kZXYiLCJhdWQiOiJtYXJsby1iYW5rLWRldiIsImF1dGhfdGltZSI6MTY3Mjg2NTE3NSwidXNlcl9pZCI6IlJoSGdiY1U0cHZNMGR3RE90d1piTlhPOTlRMjMiLCJzdWIiOiJSaEhnYmNVNHB2TTBkd0RPdHdaYk5YTzk5UTIzIiwiaWF0IjoxNjcyODY1MTc1LCJleHAiOjE2NzI4Njg3NzUsImVtYWlsIjoieGlob2g1NTQ5NkBkaW5lcm9hLmNvbSIsImVtYWlsX3ZlcmlmaWVkIjpmYWxzZSwicGhvbmVfbnVtYmVyIjoiKzkxOTUwMDI5ODc2MiIsImZpcmViYXNlIjp7ImlkZW50aXRpZXMiOnsicGhvbmUiOlsiKzkxOTUwMDI5ODc2MiJdLCJlbWFpbCI6WyJ4aWhvaDU1NDk2QGRpbmVyb2EuY29tIl19LCJzaWduX2luX3Byb3ZpZGVyIjoicGFzc3dvcmQifX0.TxFh9YlzdhXaiZso2Tt479vgrgnhgL9Xc1ma_oBz_c1lFLd5Pi_p3E0HzeQhRos9Kxah_XMHgKevNF7hL0EunlpN-M5Eu_YDBNFIyp8AFSi-V2qYkSOG4gYrghP2IC2k8BmGsZWYO60DAHwKlCX-lg8xxujajrC6EshOpnncBKNUXBQgs3vqOyNLaeG_OoDcmumFZ_NogC-1J7kcyAY-SsOgNr_jPiLb-vnIOE_7eVpGrKSiGRU8WqnGQldN-y8LJwnLlXERrCgLWlJ2nTBj6CHeKp__FXPUlLNENBs9jiLhM3Aywo9vDLbwpFRMt5lIVhglqc5BVKfECMWugRBsWQ'
        },
        body: jsonEncode(<String, dynamic>{
          "email": widget.email,
          "role": roleid
        }),
    );
    if (response.statusCode == 200) {
      Flushbar(
        title:  "",
        message:  "Success",
        duration:  Duration(seconds: 3),
      )..show(context);
    }else{
      Flushbar(
        title:  "",
        message:  "You don't have permission",
        duration:  Duration(seconds: 3),
      )..show(context);
    }


  }
  void _handleFABPressed() {
    double _width = MediaQuery.of(context).size.width;
      showModalBottomSheet<int>(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return  Container(
             width: size.width,
             padding: getPadding(
               left: 16,
               top: 20,
               right: 16,
               bottom: 20,
             ),
             decoration: BoxDecoration(
               color: ColorConstant.gray100,
               borderRadius: BorderRadius.circular(
                 getHorizontalSize(
                   24.00,
                 ),
               ),
             ),
             child: Column(
               mainAxisSize: MainAxisSize.min,
               crossAxisAlignment: CrossAxisAlignment.start,
               mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 Align(
                   alignment: Alignment.center,
                   child: Container(
                     height: getVerticalSize(
                       5.00,
                     ),
                     width: getHorizontalSize(
                       50.00,
                     ),
                     decoration: BoxDecoration(
                       color: ColorConstant.blue100,
                       borderRadius: BorderRadius.circular(
                         getHorizontalSize(
                           2.00,
                         ),
                       ),
                     ),
                   ),
                 ),
                 Padding(
                   padding: getPadding(
                     top: 12,
                   ),
                   child: Text(
                     "Team roles",
                     overflow: TextOverflow.ellipsis,
                     textAlign: TextAlign.left,
                     style: TextStyle(
                       color: ColorConstant.black900,
                       fontSize: getFontSize(
                         16,
                       ),
                       fontFamily: 'Noto Sans',
                       fontWeight: FontWeight.w600,
                     ),
                   ),
                 ),
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
              setState(() {
                datapass(roleid : 2);
              });

            },child: Padding(
                   padding: EdgeInsets.all(
                     0,
                   ),
                   child:
                       Container(
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(10),
                       color: ColorConstant.lightBlue6003f,
                     ),

                     padding: EdgeInsets.all(
                       12,
                     ),
                     width: 327,
                     margin: getMargin(
                       top: 8,
                     ),
                     child: Text(
                       "Admin",
                       overflow: TextOverflow.ellipsis,
                       textAlign: TextAlign.left,
                       style: TextStyle(
                         color: ColorConstant.blueGray500,
                         fontSize: getFontSize(
                           16,
                         ),
                         fontFamily: 'Noto Sans',
                         fontWeight: FontWeight.w600,
                       ),
                     ),
                   ),
                 )),
                 GestureDetector(
                     onTap: (){
                       Navigator.pop(context);
                       setState(() {
                         datapass(roleid : 3);
                       });
                     },child: Padding(
                   padding: EdgeInsets.all(
                     0,
                   ),
                   child:
                   Container(
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(10),
                       color: ColorConstant.whiteA700,
                     ),

                     padding: EdgeInsets.all(
                       12,
                     ),
                     width: 327,
                     margin: getMargin(
                       top: 8,
                     ),
                     child: Text(
                       "Approver",
                       overflow: TextOverflow.ellipsis,
                       textAlign: TextAlign.left,
                       style: TextStyle(
                         color: ColorConstant.blueGray500,
                         fontSize: getFontSize(
                           16,
                         ),
                         fontFamily: 'Noto Sans',
                         fontWeight: FontWeight.w600,
                       ),
                     ),
                   ),
                 )),
                 GestureDetector(
                     onTap: (){
                       Navigator.pop(context);
                       setState(() {
                         datapass(roleid : 4);
                       });
                     },child: Padding(
                   padding: EdgeInsets.all(
                     0,
                   ),
                   child:
                   Container(
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(10),
                       color: ColorConstant.whiteA700,
                     ),

                     padding: EdgeInsets.all(
                       12,
                     ),
                     width: 327,
                     margin: getMargin(
                       top: 8,
                     ),
                     child: Text(
                       "Preparer",
                       overflow: TextOverflow.ellipsis,
                       textAlign: TextAlign.left,
                       style: TextStyle(
                         color: ColorConstant.blueGray500,
                         fontSize: getFontSize(
                           16,
                         ),
                         fontFamily: 'Noto Sans',
                         fontWeight: FontWeight.w600,
                       ),
                     ),
                   ),
                 )),
                 GestureDetector(
                     onTap: (){
                       Navigator.pop(context);
                       setState(() {
                         datapass(roleid : 5);
                       });
                     },child: Padding(
                   padding: EdgeInsets.all(
                     0,
                   ),
                   child:
                   Container(
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(10),
                       color: ColorConstant.whiteA700,
                     ),

                     padding: EdgeInsets.all(
                       12,
                     ),
                     width: 327,
                     margin: getMargin(
                       top: 8,
                     ),
                     child: Text(
                       "Viewer",
                       overflow: TextOverflow.ellipsis,
                       textAlign: TextAlign.left,
                       style: TextStyle(
                         color: ColorConstant.blueGray500,
                         fontSize: getFontSize(
                           16,
                         ),
                         fontFamily: 'Noto Sans',
                         fontWeight: FontWeight.w600,
                       ),
                     ),
                   ),
                 )),
                 GestureDetector(
                     onTap: (){
                       Navigator.pop(context);
                       setState(() {
                         datapass(roleid : 5);
                       });
                     },child: Padding(
                   padding: EdgeInsets.all(
                     0,
                   ),
                   child:
                   Container(
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(10),
                       color: ColorConstant.whiteA700,
                     ),

                     padding: EdgeInsets.all(
                       12,
                     ),
                     width: 327,
                     margin: getMargin(
                       top: 8,
                     ),
                     child: Text(
                       "Employee",
                       overflow: TextOverflow.ellipsis,
                       textAlign: TextAlign.left,
                       style: TextStyle(
                         color: ColorConstant.blueGray500,
                         fontSize: getFontSize(
                           16,
                         ),
                         fontFamily: 'Noto Sans',
                         fontWeight: FontWeight.w600,
                       ),
                     ),
                   ),
                 )),

               ],
             ),
           );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.gray100,
        body: loading ? Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 20),
            child: CircularProgressIndicator(
              value: 0.8,
            )
        ) : Container(
          width: size.width,
          padding: getPadding(
            left: 9,
            top: 37,
            right: 9,
            bottom: 37,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
              onTap: (){
        Navigator.push(
        context, MaterialPageRoute(builder: (context) => BottomNav()));


        },    child: CustomImageView(
                svgPath: ImageConstant.imgArrowleft,
                height: getSize(
                  24.00,
                ),
                width: getSize(
                  24.00,
                ),
              )),
              Padding(
                padding: getPadding(
                  left: 8,
                  top: 13,
                ),
                child: Text(
                  "Invite",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: ColorConstant.black900,
                    fontSize: getFontSize(
                      34,
                    ),
                    fontFamily: 'Heebo',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Container(
                width: getHorizontalSize(
                  327.00,
                ),
                margin: getMargin(
                  left: 7,
                  top: 17,
                ),
                padding: getPadding(
                  left: 16,
                  top: 6,
                  right: 16,
                  bottom: 6,
                ),
                decoration: BoxDecoration(
                  color: ColorConstant.blueGray50,
                  borderRadius: BorderRadius.circular(
                    getHorizontalSize(
                      10.00,
                    ),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: getPadding(
                        top: 1,
                      ),
                      child: Text(
                        "BUsiness email",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: ColorConstant.gray60001,
                          fontSize: getFontSize(
                            12,
                          ),
                          fontFamily: 'Noto Sans',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Text(
                      email,
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
                  ],
                ),
              ),
              GestureDetector(
                  onTap: (){
                    _handleFABPressed();

                  },
                  child: Container(
                    width: getHorizontalSize(
                      327.00,
                    ),
                    margin: getMargin(
                      left: 7,
                      top: 17,
                    ),
                    padding: getPadding(
                      left: 16,
                      top: 6,
                      right: 0,
                      bottom: 6,
                    ),
                    decoration: BoxDecoration(
                      color: ColorConstant.blueGray50,
                      borderRadius: BorderRadius.circular(
                        getHorizontalSize(
                          10.00,
                        ),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(bottom: 10.0,top: 10.0),
                            child: Text('Admin')
                        ),
                        SizedBox(width: getHorizontalSize(
                          235.00,
                        ),),
                        Container(
                          child: Image.asset("images/arrow.png",
                              height: 20, width: 20),
                        ),

                      ],
                    ),
                  )),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: getPadding(
            left: 16,
            right: 16,
            bottom: 32,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                height: 48,
                width: 328,
                text: "Continue",
                variant: ButtonVariant.OutlineLightblue6003f,
                padding: ButtonPadding.PaddingAll13,
                fontStyle: ButtonFontStyle.NotoSansRegular14,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
