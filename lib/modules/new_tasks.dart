import 'package:flutter/material.dart';
import 'package:outdor_calculator/shared/components/components.dart';





// class NewTasks extends StatelessWidget {
//   String? title;
//   bool? isDone;
//   bool? isDeleted;
//   NewTasks({
//     super.key,
//     this.title,
//     this.isDone,
//     this.isDeleted,
//   }) {
//     isDone = isDone ?? false;
//     isDeleted = isDeleted ?? false;
//   }
//   NewTasks copyWith({
//     String? title,
//     bool? isDone,
//     bool? isDeleted,
//   }) {
//     return NewTasks(
//       title: title ?? this.title,
//       isDone: isDone ?? this.isDone,
//       isDeleted: isDeleted ?? this.isDeleted,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     var tasks;
//     return ListView.separated(
//         itemBuilder: (context, index) => buildTaskItem(tasks[index]),
//         separatorBuilder: (context, index) => Padding(
//               padding: const EdgeInsetsDirectional.only(
//                 start: 20.0,
//               ),
//               child: Container(
//                 width: double.infinity,
//                 height: 1,
//                 color: Colors.grey[300],
//               ),
//             ),
//         itemCount: tasks.length);
//   }
// }



// class NewTasks extends StatelessWidget {
//   const NewTasks({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//     //   return ListView.separated(
//     //       itemBuilder: (context, index) => buildTaskItem(tasks[index]),
//     //       separatorBuilder: (context, index) => Padding(
//     //             padding: const EdgeInsetsDirectional.only(
//     //               start: 20.0,
//     //             ),
//     //             child: Container(
//     //               width: double.infinity,
//     //               height: 1,
//     //               color: Colors.grey[300],
//     //             ),
//     //           ),
//     //       itemCount: tasks.length);
//     // }
//   }
// }