import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget defaultText({
  required String text,
  TextAlign? textAlign,
}) =>Expanded(
  child: SizedBox(
    width: double.infinity,
    child: Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        color: Colors.white,
        fontSize: 30.sp,
      ),
    ),
  ),
);


Widget defaultContainer({
  required Function onTap,
  required String text,
}) =>GestureDetector(
  onTap: (){
    onTap();
  },
  child: Stack(
    children: [
      Positioned.fill(
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
            child: Container(
              color: Colors.transparent,
            ),
          ),
        ),
      ),
      Container(
        margin: const EdgeInsetsDirectional.all(7),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.r),
            bottomLeft: Radius.circular(20.r),
          ),
          color: backgroundColor(text),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 23.sp,
            ),
          ),
        ),
      ),
    ],
  ),
);


Color backgroundColor(String value){
  if( value == '9' ||  value == '8' ||  value == '7' ||  value == '6' ||
      value == '5' ||  value == '4' ||  value == '3' ||  value == '2'
      ||  value == '1' ||  value == '.' ||  value == '0' ||  value == 'Ans'){
     return Colors.white.withOpacity(0.4);
  }
  else if(value == '='){
    return const Color(0xFFA91D3A);
  }
  else{
    return const Color(0xFFC73659).withOpacity(0.6);

  }
}