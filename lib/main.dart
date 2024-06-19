 import 'package:api_list_demo_wellorgs/view/list_preview_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

void main(){
  runApp(const ApiDemo());
 }
 class ApiDemo extends StatelessWidget {
   const ApiDemo({super.key});
 
   @override
   Widget build(BuildContext context) {
     return GetMaterialApp(
       debugShowCheckedModeBanner: false,
       home: ListPreviewScreen(),

     );
   }
 }
 