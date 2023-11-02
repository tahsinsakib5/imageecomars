import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:finalimagep/maindesing/model.dart';

import 'package:finalimagep/poductpage.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            height: 200,
            decoration: const BoxDecoration(
                color: Colors.amber,
                image: DecorationImage(
                    image: AssetImage("assets/banner.png"), fit: BoxFit.cover)),
          ),
          Expanded(
              child: FutureBuilder(
                  future: getdata(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData) {
                        print("snapshort ${snapshot.data}");
                        var productlist = snapshot.data;
                        return ListView.builder(
                          itemCount: 3,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            product _product = snapshot.data![index];
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
                                                image: AssetImage(
                                                    _product.imageurl))),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              _product.title,
                                              style:
                                                  const TextStyle(fontSize: 20),
                                            ),
                                            Text(
                                              "price: \$ ${_product.pricr}",
                                              style:
                                                  const TextStyle(fontSize: 17),
                                            ),
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
                                            MaterialButton(
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          const poductpage(),
                                                    ));
                                              },
                                              child: Container(
                                                height: 37,
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                    color: Colors.blue,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50)),
                                                child: const Center(
                                                    child: Text(
                                                  "buy now",
                                                  style:
                                                      TextStyle(fontSize: 17),
                                                )),
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
                          },
                        );
                      } else {
                        return const Text("no");
                      }
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  })),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const poductpage(),
                    ));
              },
              child: const Text("save")),
        ],
      ),
    );
  }

  Future<List<product>> getdata() async {
    var colactionsnapshort =
        await FirebaseFirestore.instance.collection("add_data").get();

    print('Total Doc : ${colactionsnapshort.docs.length}');

    List<product> allproduct = [];

    for (var productmap in colactionsnapshort.docs) {
      String imageurl = productmap.get("imageurl");
      String title = productmap.get("title");
      String pricr = productmap.get("pricr");
      String others = productmap.get("others");

      product myproduct = product(
          imageurl: imageurl, title: title, pricr: pricr, others: others);

      allproduct.add(myproduct);
    }

    return allproduct;
  }
}
