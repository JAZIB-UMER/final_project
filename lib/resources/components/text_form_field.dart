import 'package:flutter/material.dart';
Widget customTextField({String?  labelText,String? hintText,IconData? icon,BuildContext? context,double? height,double? width}){
return Padding(
  padding: const EdgeInsets.only(left: 20,right: 20),
  child: Container(
      width: MediaQuery.of(context!).size.width * width!, // 0.9
    height : MediaQuery.of(context).size.height * height!,  // 0.08

    decoration: BoxDecoration(
      boxShadow: const [
        BoxShadow(
            blurRadius: 8,
            offset: Offset(5, 5)),
      ],
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
    ),

    child: TextFormField(
      maxLines: null,
      minLines: null,
      expands: true,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon:  Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          //   borderSide: const BorderSide(color: Colors.cyan),
        ),
      ),
    ),
  ),
);
}