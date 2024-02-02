import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dinesync/Theme/fonts.dart';

class TextFields {
  static Widget getTextfield(TextEditingController scodecontroller,
      String heading, TextInputType type) {
    return Card(
      margin: EdgeInsets.only(
        left: 10.w,
        right: 10.w,
      ),
      child: ListTile(
        // onTap: () {},
        contentPadding: EdgeInsets.only(
          bottom: 10.h,
          top: 10.h,
          left: 5.w,
          right: 15.w,
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.drive_file_rename_outline_rounded,
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.draw_rounded,
            size: 35.h,
            color: Colors.white,
          ),
        ),
        // title: Text(
        //   heading,
        //   style: TextStyle(
        //       color: Colors.blueGrey[900],
        //       fontSize: 15.sp,
        //       fontWeight: FontWeight.w500),
        // ),
        title: CupertinoTextField(
          autofocus: false,
          controller: scodecontroller,
          placeholder: heading,
          keyboardType: type,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
      ),
    );
  }

  static Widget primaryTextfield(
      {required TextEditingController scodecontroller,
      required String heading,
      required TextInputType type,
      required IconData icon}) {
    return Card(
      margin: EdgeInsets.only(
        left: 5.w,
        right: 5.w,
      ),
      child: ListTile(
        // onTap: () {},
        contentPadding: EdgeInsets.only(
          bottom: 10.h,
          top: 10.h,
          left: 5.w,
          right: 15.w,
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: Icon(
            icon,
            color: Colors.black,
          ),
        ),
        // leading: IconButton(
        //   onPressed: () {},
        //   icon: Icon(
        //     Icons.draw_rounded,
        //     size: 35.h,
        //     color: Colors.white,
        //   ),
        // ),
        // title: Text(
        //   heading,
        //   style: TextStyle(
        //       color: Colors.blueGrey[900],
        //       fontSize: 15.sp,
        //       fontWeight: FontWeight.w500),
        // ),
        title: CupertinoTextField(
          autofocus: false,
          controller: scodecontroller,
          placeholder: heading,
          keyboardType: type,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
      ),
    );
  }

  static Widget getFormTexter(
      TextEditingController scodecontroller, String heading, TextInputType type,
      {Widget? trailing, void Function(String)? onChanged, bool? enabled}) {
    return Card(
      // color: Color.fromARGB(255, 199, 233, 255),
      elevation: 0,
      margin: EdgeInsets.only(
        left: 10.w,
        right: 10.w,
      ),
      child: ListTile(
        // onTap: () {},
        contentPadding: EdgeInsets.only(
          // bottom: 10.h,
          // top: 10.h,
          left: 5.w,
          right: 15.w,
        ),
        trailing: trailing != null
            ? trailing
            : IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.drive_file_rename_outline_rounded,
                  color: Colors.black,
                ),
              ),
        // leading: IconButton(
        //   onPressed: () {},
        //   icon: Icon(
        //     Icons.draw_rounded,
        //     size: 35.h,
        //     color: Colors.white,
        //   ),
        // ),
        // title: Text(
        //   heading,
        //   style: TextStyle(
        //       color: Colors.blueGrey[900],
        //       fontSize: 15.sp,
        //       fontWeight: FontWeight.w500),
        // ),

        title: TextField(
          enabled: enabled ?? true,
          cursorColor: Colors.black,
          cursorWidth: 0.5,
          // cursorHeight: 10.h,
          autofocus: false,
          onChanged: onChanged,
          controller: scodecontroller,
          decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.purple),
                borderRadius: BorderRadius.circular(25.7),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: Color.fromARGB(255, 184, 184, 184)),
                borderRadius: BorderRadius.circular(25.7),
              ),
              hintText: heading,
              // labelText: "Email",
              labelStyle: TextStyle(color: const Color(0xFF424242)),
              border: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 99, 99, 99)))),
        ),
      ),
    );
  }

  static Widget getTextleading(TextEditingController scodecontroller,
      String heading, TextInputType type, IconData icon,
      {Widget? trailing, void Function(String)? onChanged}) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.only(
        left: 10.w,
        right: 10.w,
      ),
      child: ListTile(
        // onTap: () {},
        contentPadding: EdgeInsets.only(
          // bottom: 10.h,
          // top: 10.h,
          left: 5.w,
          right: 15.w,
        ),
        trailing: trailing != null ? trailing : SizedBox(),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            icon,
            // size: 35.h,
            // color: Colors.white,
          ),
        ),
        // title: Text(
        //   heading,
        //   style: TextStyle(
        //       color: Colors.blueGrey[900],
        //       fontSize: 15.sp,
        //       fontWeight: FontWeight.w500),
        // ),
        title: CupertinoTextField(
          autofocus: false,
          onChanged: onChanged,
          controller: scodecontroller,
          placeholder: heading,
          keyboardType: type,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
      ),
    );
  }

  static Widget getEditableTextfield(
      TextEditingController scodecontroller, String heading, TextInputType type,
      {void Function(String)? onChanged, TextStyle? style}) {
    return CupertinoTextField(
      // autofillHints: ['d', 'asa'],
      cursorColor: Colors.black,
      cursorWidth: 0.5,
      // cursorHeight: 10.h,
      autofocus: false,
      placeholderStyle:
          TextStyle(color: Colors.grey, fontSize: style!.fontSize),
      style: style,
      onChanged: onChanged,
      controller: scodecontroller,
      placeholder: heading,
      keyboardType: type,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
    );
  }

  // static Widget getEditableTextfieldersugg(
  //     TextEditingController scodecontroller, String heading, TextInputType type,
  //     {void Function(String)? onChanged, TextStyle? style}) {
  //   return AutoCompleteTextSearchField(
  //     // cursorColor: Colors.black,
  //     // cursorWidth: 0.5,
  //     // cursorHeight: 10.h,
  //     // autofocus: false,
  //     // placeholderStyle:
  //     //     TextStyle(color: Colors.grey, fontSize: style!.fontSize),
  //     // style: style,
  //     // onChanged: onChanged,
  //     // controller: scodecontroller,
  //     // placeholder: heading,
  //     // keyboardType: type,
  //     // decoration: BoxDecoration(
  //     //   color: Colors.transparent,
  //     //   borderRadius: BorderRadius.all(
  //     //     Radius.circular(10),
  //     //   ),
  //     // ),
  //     onItemSelect: (s) {},
  //     suggestions: ['s', 'k'],
  //   );
  // }

  static Widget getEditableTextfieldMulti(
      {required TextEditingController scodecontroller,
      required String heading,
      required TextInputType type,
      void Function(String)? onChanged,
      TextStyle? style}) {
    return
        //  Card(
        // color: Colors.transparent,
        // elevation: 0,
        // margin: EdgeInsets.only(
        //   left: 10.w,
        //   right: 10.w,
        // ),
        // child: ListTile(
        // onTap: () {},
        // contentPadding: EdgeInsets.only(
        //   left: 5.w,
        //   right: 15.w,
        // ),
        // trailing: IconButton(
        //   onPressed: () {},
        //   icon: Icon(
        //     Icons.drive_file_rename_outline_rounded,
        //     color: Colors.black,
        //   ),
        // ),
        // leading: IconButton(
        //   onPressed: () {},
        //   icon: Icon(
        //     Icons.draw_rounded,
        //     size: 35.h,
        //     color: Colors.white,
        //   ),
        // ),
        // title: Text(
        //   heading,
        //   style: TextStyle(
        //       color: Colors.blueGrey[900],
        //       fontSize: 15.sp,
        //       fontWeight: FontWeight.w500),
        // ),
        // title:
        CupertinoTextField(
      expands: true,
      maxLines: null,
      maxLength: null,
      cursorColor: Colors.black,
      cursorWidth: 0.5,
      // cursorHeight: 10.h,
      autofocus: false,
      placeholderStyle: TextStyle(color: Colors.grey),
      style: style,
      onChanged: onChanged,
      controller: scodecontroller,
      placeholder: heading,
      keyboardType: type,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      // ),
      // ),
    );
  }

  static Widget getOutlinedField({
    required TextEditingController controller,
    required String label,
    required TextInputType textype,
    void Function(String)? onChanged,
  }) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
      margin: EdgeInsets.only(
        left: 20.w,
        right: 20.w,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey[300]!)),
      child: TextField(
        autocorrect: false,
        enableSuggestions: false,
        autofocus: false,
        onChanged: onChanged,
        keyboardType: textype,
        decoration: InputDecoration(
          labelStyle: Fonts.secondary(
            style: TextStyle(),
          ),
          border: InputBorder.none,
          labelText: label,
        ),
        controller: controller,
      ),
    );
  }
}
