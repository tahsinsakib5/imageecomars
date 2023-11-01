
import 'package:finalimagep/maindesing/dard.dart';
import 'package:flutter/material.dart';

class poductpage extends StatelessWidget {
  const poductpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("buynow"),),
      body:Column(
        children: [

          Padding(
            padding: const EdgeInsets.symmetric(horizontal:12),
            child: Card(
              child: Container(
                height:320,
                decoration: const BoxDecoration(
               
                ),
                child:Row(
                  children: [
                    Expanded(child: Container(
                      child: Container(
                        decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("assets/burger.png"))),
                      ),
                    )
                    
                    
                    
                    ),
            
                    Expanded(child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           const SizedBox(
                            height: 20,
                           ),
                          const Text("Hunburger",style: TextStyle(fontSize:30,),),
                           const SizedBox(
                            height:10,
                           ),
                          const Text("price \$ 50",style: TextStyle(fontSize:25)),
            
                           const SizedBox(
                            height:10,
                           ),
                          const Text("Hamburger, a food consisting of one or more cooked beef patties,Cheeseburger, a hamburger with ..",style: TextStyle(fontSize:15),),
            
            
                          const Row(
                            children: [
                                 Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                            ],
                          ),
          
                             SizedBox(
                              height:20,
                             ),
            
                          Row(
                            
                            children: [
                             
                             Expanded(
                               child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                    color:Colors.amber,
                                ),
                                
                                child:Center(child: Text("buy now")),
                               ),
                             ),
                              
                              SizedBox(
                                width: 6,
                              ),
                             Expanded(
                               child: Container(
                                decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(50),
                                    color:Colors.amber,
                                   
                                ),
                                height: 50,
                                
                                
          
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                  Icon(Icons.minimize,size:30,),
                                  Text("0",style: TextStyle(fontSize:25),),
          
                                  Icon(Icons.add,size:30,)
                                ],),
                               ),
                             )
            
                              
                            ],
                          )
                        ],
                      ),
                    ))
                  ],
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("product"),
          
                Text("view all"),
              ],
            ),


            
          ),

          SingleChildScrollView(
            scrollDirection:Axis.horizontal,
            child: Row(
              children: [
          
                smallcard(),
                smallcard(),
                smallcard(),
                smallcard(),
                smallcard()
              ],
            ),
          )

        ],
      ),
    );
  }
}