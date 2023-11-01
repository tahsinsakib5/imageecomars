import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Adminpanel extends StatefulWidget {
   Adminpanel({super.key});

  @override
  State<Adminpanel> createState() => _AdminpanelState();
}

class _AdminpanelState extends State<Adminpanel> {

  
 String? imageurl;

  TextEditingController controllername =TextEditingController();

 TextEditingController controllertitle =TextEditingController();

 TextEditingController controllerprice =TextEditingController();

 TextEditingController controller =TextEditingController();

  @override

 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin panel"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller:controllername,
              decoration: InputDecoration(
                  hintText: "image name",
                  fillColor: const Color.fromARGB(255, 217, 220, 219),
                  filled: true,
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  suffix: Container(
                     padding: const EdgeInsets.all(16*0.17),
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.blue
                      ),
                      child: IconButton(
                          onPressed: ()async{
                           
                           ImagePicker imagePicker = ImagePicker();
                           
                           XFile? file = await imagePicker.pickImage(source:ImageSource.gallery);

                           Reference referenceid = await FirebaseStorage.instance.ref();

                           Reference referenceroot =referenceid.child("images");

                           Reference reference =referenceroot.child(controllername.text);

                                      await reference.putFile(File(file!.path));

                               imageurl=  await reference.getDownloadURL(); 
                          


                          },
                          icon: const Icon(
                            Icons.image,
                            color: Colors.white,
                          )))),
            ),

                     const SizedBox(
                height:12,
               ),
              TextField(
              controller:controllertitle,
              decoration: InputDecoration(
                  hintText: "image name",
                  fillColor: Color.fromARGB(255, 217, 220, 219),
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                 ),
            ),
               
               const SizedBox(
                height:12,
               ),
              Row(
              children: [
                Expanded(child: TextField(
                  controller:controllerprice,
              decoration: InputDecoration(
                
                  hintText: "image name",
                  fillColor: Color.fromARGB(255, 217, 220, 219),
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                 ),
            ),
 ),
                   
                   SizedBox(
                    width:9,
                   ),

                  Expanded(child: TextField(
                   controller:controller,
              decoration: InputDecoration(
                  hintText: "image name",
                  fillColor: Color.fromARGB(255, 217, 220, 219),
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                 ),
            ),
 )
              ],
            ),
                
                const SizedBox(
                  height:20,
                ),
            MaterialButton(onPressed: () {
              setdata();
            },child: Container(
              height:60,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(50)
              ),
              child:const Center(child: Text("submit",style: TextStyle(fontSize:18,color:Colors.white),)),
            ),)
          ],
        ),
      ),
    );
  }

Future <void>setdata()async{

 var colaction = await FirebaseFirestore.instance.collection("add_data");
  
  Map <String,dynamic> alldata ={
    "imageurl":imageurl,
    
    "title":controllertitle.text,
    "pricr":controllerprice.text,
    "others":controller.text,
  };

 colaction.add(alldata);
  

}
}
