import 'package:flutter/material.dart';
 class AdvancedWorkout extends StatefulWidget {
   const AdvancedWorkout({Key? key}) : super(key: key);
 
   @override
   State<AdvancedWorkout> createState() => _AdvancedWorkoutState();
 }
 
 class _AdvancedWorkoutState extends State<AdvancedWorkout> {
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         backgroundColor: Colors.white,
         iconTheme: IconThemeData(color: Colors.blue[900]),
         elevation: 0.0,
       ),
       body: SingleChildScrollView(
         child:
         Padding(
           padding: const EdgeInsets.all(15.0),
           child: Row(
             children: [
               Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Row(
                     children: [
                       Image.asset("assets/jj.jpg",
                         height: 150,
                         width: 150,),
                       SizedBox(
                         width: 10,
                       ),
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text(
                             "Jumping Jacks",
                             style: TextStyle(
                               color: Colors.black,
                               fontSize: 18,
                               fontWeight: FontWeight.w400,
                             ),
                           ),
                           Text(
                             "*30 =>4reps",
                             style: TextStyle(
                               color: Colors.black,
                               fontWeight: FontWeight.w400,
                               fontSize: 18,
                             ),
                           ),
                         ],
                       ),
                     ],
                   ),
                   Row(

                     children: [
                       Image.asset("assets/pushup.jpg",
                         height: 150,
                         width: 150,
                       ),
                       const SizedBox(
                         width: 10,
                       ),

                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text('Push Up',
                             style: TextStyle(
                               color: Colors.black,
                               fontWeight: FontWeight.w400,
                               fontSize: 18,
                             ),
                           ),
                           Text(
                             "*15 =>4reps",
                             style: TextStyle(
                               color: Colors.black,
                               fontWeight: FontWeight.w400,
                               fontSize: 18,
                             ),
                           ),
                           SizedBox(
                             width: 10,
                           ),
                         ],
                       ),

                     ],
                   ),
                   const SizedBox(
                     height: 10,
                   ),
                   Row(
                     children: [
                       Image.asset(
                         'assets/squatjump.jpg',
                         height: 150,
                         width: 150,
                       ),
                       const SizedBox(
                         width: 10,
                       ),
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text('Squat Jump',
                             style: TextStyle(
                               color: Colors.black,
                               fontWeight: FontWeight.w400,
                               fontSize: 18,
                             ),
                           ),
                           Text("*30 =>3 reps",
                             style: TextStyle(
                               color: Colors.black,
                               fontWeight: FontWeight.w400,
                               fontSize: 18,
                             ),
                           ),
                           SizedBox(
                             width: 10,
                           ),
                         ],
                       ),
                     ],
                   ),
                   Row(
                     children: [
                       Image.asset(
                         'assets/lungsplitjump.jpg',
                         height: 150,
                         width: 150,
                       ),
                       const SizedBox(
                         width: 10,
                       ),
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text('Lung Split Jump',
                             style: TextStyle(
                               color: Colors.black,
                               fontWeight: FontWeight.w400,
                               fontSize: 18,
                             ),
                           ),
                           Text("*30 =>4 reps",
                             style: TextStyle(
                               color: Colors.black,
                               fontWeight: FontWeight.w400,
                               fontSize: 18,
                             ),
                           ),
                           SizedBox(
                             width: 10,
                           ),
                         ],
                       ),
                     ],
                   ),
                   Row(
                     children: [
                       Image.asset(
                         'assets/chairdips.jpg',
                         height: 150,
                         width: 150,
                       ),
                       const SizedBox(
                         width: 10,
                       ),
                       Column(
                         children: const [
                           Text('Chair Dips',
                             style: TextStyle(
                               color: Colors.black,
                               fontWeight: FontWeight.w400,
                               fontSize: 18,
                             ),
                           ),
                           Text("*20 =>4 reps",
                             style: TextStyle(
                               color: Colors.black,
                               fontWeight: FontWeight.w400,
                               fontSize: 18,
                             ),
                           ),
                           SizedBox(
                             width: 10,
                           ),
                         ],
                       ),
                     ],
                   ),
                   Row(
                     children: [
                       Image.asset(
                         'assets/russiantwist.jpg',
                         height: 150,
                         width: 150,
                       ),
                       const SizedBox(
                         width: 10,
                       ),
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text('Russian Twist',
                             style: TextStyle(
                               color: Colors.black,
                               fontWeight: FontWeight.w400,
                               fontSize: 18,
                             ),),
                           Text("*40 =>4 reps",
                             style: TextStyle(
                               color: Colors.black,
                               fontWeight: FontWeight.w400,
                               fontSize: 18,
                             ),
                           ),
                           SizedBox(
                             width: 10,
                           ),
                         ],
                       ),
                     ],
                   ),
                   Row(
                     children: [
                       Image.asset(
                         'assets/plank.jpg',
                         height: 150,
                         width: 150,
                       ),
                       const SizedBox(
                         width: 10,
                       ),
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text('Plank',
                             style: TextStyle(
                               color: Colors.black,
                               fontWeight: FontWeight.w400,
                               fontSize: 18,
                             ),),
                           Text("*30 =>4 reps",
                             style: TextStyle(
                               color: Colors.black,
                               fontWeight: FontWeight.w400,
                               fontSize: 18,
                             ),
                           ),
                           SizedBox(
                             width: 10,
                           ),
                         ],
                       ),
                     ],
                   ),
                   Row(
                     children: [
                       Image.asset(
                         'assets/calf raises.jpg',
                         height: 150,
                         width: 150,
                       ),
                       const SizedBox(
                         width: 10,
                       ),
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text('Calf Raises',
                             style: TextStyle(
                               color: Colors.black,
                               fontWeight: FontWeight.w400,
                               fontSize: 18,
                             ),),
                           Text("*25 =>4 reps",
                             style: TextStyle(
                               color: Colors.black,
                               fontWeight: FontWeight.w400,
                               fontSize: 18,
                             ),
                           ),
                           SizedBox(
                             width: 10,
                           ),
                         ],
                       ),
                     ],
                   ),
                 ],
               ),
             ],
           ),
         ),
       ),
     );
   }
 }