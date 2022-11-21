import 'package:flutter/material.dart';

import 'shared/components/components.dart';

class OperationPlan extends StatefulWidget {
  const OperationPlan({super.key});

  @override
  State<OperationPlan> createState() => _OperationPlanState();
}

class _OperationPlanState extends State<OperationPlan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // children: [
        //   button(
        //     width: double.infinity,
        //     text: '',
        //     function: () {
        //       Navigator.push(
        //         context,
        //         MaterialPageRoute(
        //           builder: (context) => const (),
        //         ),
        //       );
        //     },
        //   ),
        //   const SizedBox(
        //     height: 20,
        //   ),
        //           button(
        //     width: double.infinity,
        //     text: '',
        //     function: () {
        //       Navigator.push(
        //         context,
        //         MaterialPageRoute(
        //           builder: (context) =>  (),
        //         ),
        //       );
        //     },
        //   ),
        //   const SizedBox(
        //     height: 20,
        //   ),

        // ],
      ),
    );
  }
}
