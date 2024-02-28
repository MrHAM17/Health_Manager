import 'package:flutter/material.dart';

class questions extends StatefulWidget {
  const questions({super.key});

  @override
  State<questions> createState() => _questionsState();
}

class _questionsState extends State<questions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:Container(
        decoration: BoxDecoration(

        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20,vertical: 50),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
              child: Column(
                children: [
                  Text( "Have you noticed any unexplained weight loss or gain recently?"
                  ),
                  Row(
                    children: [
                      CheckboxButton(
                        label: 'Yes',
                      ),
                      SizedBox(height: 20),
                      CheckboxButton(
                        label: 'No',
                      ),
                    ],
                  ),

                  Text("Do you often feel fatigued or have low energy levels throughout the day?"
                  ),
                  Row(
                    children: [
                      CheckboxButton(
                        label: 'Yes',
                      ),
                      SizedBox(height: 20),
                      CheckboxButton(
                        label: 'No',
                      ),
                    ],
                  ),

                  Text( "Have you experienced any blurry vision or slow-healing cuts or bruises lately?"),
                  Row(
                    children: [
                      CheckboxButton(
                        label: 'Yes',
                      ),
                      SizedBox(height: 20),
                      CheckboxButton(
                        label: 'No',
                      ),
                    ],
                  ),



                ],
              ),
            ),
            // Container(
            //   margin: EdgeInsets.symmetric(horizontal: 20,vertical: 50),
            //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
            //   child: Column(
            //     children: [
            //       Text( "Do you experience shortness of breath on a daily basis?"
            //       ),
            //       Row(
            //         children: [
            //           CheckboxButton(
            //             label: 'Yes',
            //           ),
            //           SizedBox(height: 20),
            //           CheckboxButton(
            //             label: 'No',
            //           ),
            //         ],
            //       ),
            //
            //       Text("Do you frequently wheeze or cough, especially at night or early in the morning?"
            //       ),
            //       Row(
            //         children: [
            //           CheckboxButton(
            //             label: 'Yes',
            //           ),
            //           SizedBox(height: 20),
            //           CheckboxButton(
            //             label: 'No',
            //           ),
            //         ],
            //       ),
            //
            //       Text( " Have you noticed any tightness or pressure in your chest lately?"),
            //       Row(
            //         children: [
            //           CheckboxButton(
            //             label: 'Yes',
            //           ),
            //           SizedBox(height: 20),
            //           CheckboxButton(
            //             label: 'No',
            //           ),
            //         ],
            //       ),
            //
            //
            //
            //     ],
            //   ),
            // ),


            // Container(
            //   margin: EdgeInsets.symmetric(horizontal: 20,vertical: 50),
            //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
            //   child: Column(
            //     children: [
            //       Text("Have you experienced frequent headaches, particularly in the morning?"
            //
            //       ),
            //       Row(
            //         children: [
            //           CheckboxButton(
            //             label: 'Yes',
            //           ),
            //           SizedBox(height: 20),
            //           CheckboxButton(
            //             label: 'No',
            //           ),
            //         ],
            //       ),
            //
            //       Text("Do you ever feel dizzy or lightheaded, especially when standing up quickly?"
            //
            //       ),
            //       Row(
            //         children: [
            //           CheckboxButton(
            //             label: 'Yes',
            //           ),
            //           SizedBox(height: 20),
            //           CheckboxButton(
            //             label: 'No',
            //           ),
            //         ],
            //       ),
            //
            //       Text(  "Have you noticed any changes in your vision, such as blurred vision seeing spots?"),
            //       Row(
            //         children: [
            //           CheckboxButton(
            //             label: 'Yes',
            //           ),
            //           SizedBox(height: 20),
            //           CheckboxButton(
            //             label: 'No',
            //           ),
            //         ],
            //       ),
            //
            //
            //
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );

  }
}
class CheckboxButton extends StatefulWidget {
  final String label;

  CheckboxButton({required this.label});

  @override
  _CheckboxButtonState createState() => _CheckboxButtonState();
}

class _CheckboxButtonState extends State<CheckboxButton> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
          value: isChecked,
          onChanged: (value) {
            setState(() {
              isChecked = value!;
            });
          },
        ),
        Text(
          widget.label,
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}