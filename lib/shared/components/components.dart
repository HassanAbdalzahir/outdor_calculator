// import 'dart:js';
import 'package:flutter/material.dart';

Widget button({
  required String text,
  double width = 200,
  Color background = Colors.black,
  Color textColor = Colors.white,
  bool isUpperCase = true,
  Function? function,
  IconData? icon,
  Function()? onPressed,
  TextStyle? style,
}) =>
    Container(
      width: 180,
      height: 40,
      color: background,
      child: MaterialButton(
        onPressed: () => function!(),
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            color: textColor,
          ),
        ),
      ),
    );

Widget textInBut({
  TextEditingController? controller,
  TextInputType? type,
  Function? onSubmit,
  Function? onChange,
  String? label,
  IconData? prefix,
  Function? validate,
  SizedBox? box,
  bool enabled = true,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        // SizedBox: box,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(40)),
          color: Colors.white,
        ),
        width: 100,
        height: 45,
        child: TextFormField(
          enabled: enabled,
          controller: controller,
          keyboardType: type =
              const TextInputType.numberWithOptions(decimal: true),
          decoration: InputDecoration(
            labelText: label,
            hintText: '',
            prefixIcon: Icon(prefix),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(40)),
            ),
            labelStyle: const TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
    );

Widget defaultFormField({
  TextEditingController? controller,
  required TextInputType type,
  Function(String)? onSubmit,
  Function(String)? onChange,
  Function()? onTap,
  bool isPassword = false,
  required Function validate,
  required String label,
  required IconData prefix,
  IconData? suffix,
  Function? suffixPressed,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      validator: (value) => validate(value),
      decoration: InputDecoration(
        labelText: label,
        hintText: '',
        prefixIcon: Icon(prefix),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixPressed as void Function()?,
                icon: Icon(
                  suffix,
                ),
              )
            : null,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(40)),
        ),
        labelStyle: const TextStyle(
          color: Colors.black,
        ),
      ),
    );

Widget buildTaskItem(Map model) => Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40.0,
            child: Text(
              '${model['time']}',
            ),
          ),
          const SizedBox(width: 20.0),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${model['title']}',
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${model['date']}',
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );

Widget iconButton({
  required IconData icon,
  required String text,
  MaterialColor? backgroundColor,
  required Function() onPressed,
}) =>
    ElevatedButton.icon(
      onPressed: () => onPressed(),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
      ),
      icon: Icon(icon),
      label: Text(text),
    );


//  Widget defaultButton({Text, MaterialPageRoute}) => SizedBox(
//        width: double.infinity,
//       child: MaterialButton(
//         onPressed: () => Navigator.push(
//           BuildContext,
//           MaterialPageRoute(
//             textColor: Colors.blue,
//             elevation: 5,
//             minWidth: 200,
//             height: 50,
//             // shape:
//                 RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),),
//             child: const Text(
//               'Button',
//               style: TextStyle(fontSize: 25, color: Colors.white),
//             ),
//           ),
//         ),
//       ),
//     );
