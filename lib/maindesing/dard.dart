
import 'package:finalimagep/poductpage.dart';
import 'package:flutter/material.dart';

class smallcard extends StatelessWidget {
  const smallcard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
       
        height: 300,
        width: 200,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/burger.png"))),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                 padding:EdgeInsets.symmetric(horizontal:10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Hamburger",style:TextStyle(fontSize:20),),
                    Text("price: \$ 50",style:TextStyle(fontSize:17),),
                    Row(
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
                    MaterialButton(
                      onPressed: () {
                        Navigator.push(context,MaterialPageRoute(builder: (context) =>poductpage(),));
                      },
                      child: Container(
                        height: 37,
                        width: double.infinity,
                        decoration: BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(50)),
                        child: Center(child: Text("buy now",style: TextStyle(fontSize:17),)),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
