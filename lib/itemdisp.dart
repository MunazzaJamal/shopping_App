import 'package:flutter/material.dart';
import 'package:shop/dashboard.dart';

class ItemDisp extends StatefulWidget {
  final String imageurl;
  final String imagename;
  final String imagesub;
  final String imageprice;
  ItemDisp(
      {required this.imageurl,
      required this.imagename,
      required this.imagesub,
      required this.imageprice});

  @override
  State<ItemDisp> createState() => _ItemDispState();
}

class _ItemDispState extends State<ItemDisp> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DashboardView()));
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero, // Removes extra padding
                      minimumSize:
                          const Size(30, 30), // Sets a small minimum size
                      shape: const CircleBorder(),
                    ),
                    child: const Icon(
                      Icons.arrow_circle_left,
                      size: 30,
                      color: Colors.black,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero, // Removes extra padding
                    minimumSize:
                        const Size(30, 30), // Sets a small minimum size
                    shape: const CircleBorder(),
                  ),
                  child: const Icon(
                    Icons.shopping_bag_outlined,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
          Stack(children: [
            Container(
              height: 400,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.imageurl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Positioned(
              right: 10,
              bottom: 10,
              child: Icon(
                Icons.favorite,
                size: 20,
                color: Colors.amber,
              ),
            ),
          ]),
          Align(
            alignment: Alignment.centerLeft,
            child: customContainer(50, 300, widget.imagename, 25, Colors.black,
                f: FontWeight.bold),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: customContainer(50, 300, widget.imagesub, 20, Colors.grey,
                f: FontWeight.bold),
          ),
          const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Row(
                  children: [
                    Icon(Icons.star, size: 15),
                    Icon(Icons.star, size: 15),
                    Icon(Icons.star, size: 15),
                    Icon(Icons.star, size: 15),
                    Icon(Icons.star, size: 15),
                    SizedBox(
                        child: Text(
                      '(270 Reviews)',
                      style: TextStyle(fontSize: 10, color: Colors.black),
                    )),
                  ],
                ),
              )),
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                ),
                child: customContainer(50, 300, 'Size', 20, Colors.black,
                    f: FontWeight.bold),
              )),
          const Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Text('39', style: TextStyle(color: Colors.black)),
                ),
                SizedBox(width: 10),
                CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Text('39.5', style: TextStyle(color: Colors.black)),
                ),
                SizedBox(width: 10),
                CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Text('40', style: TextStyle(color: Colors.black)),
                ),
                SizedBox(width: 10),
                CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Text('40.5', style: TextStyle(color: Colors.black)),
                ),
                SizedBox(width: 10),
                CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Text('41.5', style: TextStyle(color: Colors.black)),
                ),
              ],
            ),
          ),
          Align(
              alignment: Alignment.centerLeft,
              child: customContainer(50, 300, 'Description', 20, Colors.black,
                  f: FontWeight.bold)),
          SizedBox(height: 10),
          Align(
              alignment: Alignment.centerLeft,
              child: customContainer(
                50,
                300,
                'Engineered to crush any movement-based workout, these On sneakers enhance the labels original Cloud Sneaker with cutting edge technologies for a pair',
                10,
                Colors.grey,
              )),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.centerLeft,
            child: customContainer(
              50,
              300,
              'Total Price',
              10,
              Colors.grey,
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: customContainer(50, 300, widget.imageprice, 20, Colors.black,
                f: FontWeight.bold),
          ),
          ElevatedButton(
              onPressed: () {},
              child: Text('Add to Cart',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)))
        ],
      ),
    );
  }
}

Widget customContainer(double h, double w, String txt, double size, Color clr,
    {FontWeight f = FontWeight.normal} // optional parameters
    ) {
  return Padding(
    padding: const EdgeInsets.only(left: 10.0),
    child: Container(
      height: h,
      width: w,
      child: Text(
        txt,
        style: TextStyle(fontSize: size, color: clr, fontWeight: f),
      ),
    ),
  );
}
