import 'package:flutter/material.dart';
import 'itemdisp.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  var currentIndex = 0;
  List items = [
    {
      'name': 'The Marc Jacobs',
      'price': '\$195.00',
      'brand': 'Traveller Tote',
      'image':
          'https://cdn.pixabay.com/photo/2016/11/19/18/06/feet-1840619_640.jpg'
    },
    {
      'name': 'Axel Arigato',
      'price': '\$245',
      'brand': 'Clean 90 Triple Sneakers',
      'image':
          'https://cdn.pixabay.com/photo/2015/11/20/03/53/package-1052370_640.jpg',
    },
    {
      'name': 'Sveston',
      'price': '\$435',
      'brand': 'Man Watch',
      'image':
          'https://cdn.pixabay.com/photo/2014/07/31/23/00/wristwatch-407096_640.jpg',
    },
    {
      'name': 'Jewelry Line',
      'price': '\$279',
      'brand': 'Necklace',
      'image':
          'https://cdn.pixabay.com/photo/2015/10/01/15/14/beads-967179_640.jpg',
    }
  ];
  List data = [
    {'label': '50% Off', 'imgpaths': 'shop.jpg'},
    {'label': '20% Off', 'imgpaths': 'shop2.jpg'},
    {'label': '30% Off', 'imgpaths': 'shop1.jpg'}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.grey,
                ),
                child: Text(
                  "Welcome Userabc",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )),
            ListTile(title: Text("Profile")),
            ListTile(title: Text("Settings")),
          ],
        ),
      ),
      body: getCurrentView(),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          selectedIconTheme: const IconThemeData(
            color: Colors.black,
            size: 30,
          ),
          unselectedIconTheme: const IconThemeData(
            color: Colors.grey,
            size: 24,
          ),
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: 'Cart'),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications), label: 'Notifications'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ]),
    );
  }

  Widget homeView() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Builder(
                builder: (context) => Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: IconButton(
                    icon: const Icon(
                      Icons.menu,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  ),
                ),
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3, // Number of items in the list
              itemBuilder: (context, index) {
                return customContainer(
                    data[index]['imgpaths'], data[index]['label'], index);
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 30.0),
                child: Text(
                  'New Arrivals',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: Text(
                  'View all',
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 350,
            child: ListView.builder(
              itemCount: 1, // Only one row will be displayed
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      itemTile(
                          items[0]['image'],
                          items[0]['name'],
                          items[0]['brand'],
                          items[0]['price']), // First item (index 0)
                      itemTile(
                          items[1]['image'],
                          items[1]['name'],
                          items[1]['brand'],
                          items[1]['price']), // Second item (index 1)
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 30.0),
                child: Text(
                  'Popular',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: Text(
                  'View all',
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 120,
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: popitems.length,
                  itemBuilder: (context, index) {
                    return popularItems(index);
                  }),
            ),
          )
        ],
      ),
    );
  }

  List popitems = [
    {
      'name': 'The Marc Jacobs',
      'price': '\$195.00',
      'brand': 'Traveller Tote',
      'image':
          'https://cdn.pixabay.com/photo/2016/11/19/18/06/feet-1840619_640.jpg'
    },
    {
      'name': 'The Marc Jacobs',
      'price': '\$195.00',
      'brand': 'Traveller Tote',
      'image':
          'https://cdn.pixabay.com/photo/2016/11/19/18/06/feet-1840619_640.jpg'
    }
  ];

  Widget popularItems(ind) {
    return Container(
        width: 400,
        margin: EdgeInsets.only(
          top: 20,
          left: ind == 0 ? 20 : 10,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey[200],
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Container(
                width: 80,
                height: 80,
                margin: const EdgeInsets.only(
                  right: 15,
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      popitems[ind]['image'],
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            Column(
              children: [
                const SizedBox(height: 20),
                SizedBox(
                  height: 25,
                  child: Text(
                    popitems[ind]['name'],
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                SizedBox(
                    height: 20,
                    child: Text(popitems[ind]['brand'],
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ))),
                const Row(
                  children: [
                    Icon(Icons.star),
                    SizedBox(
                      child: Text(
                        '(4.5)',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10, width: 40),
            SizedBox(
              height: 25,
              child: Text(
                popitems[ind]['price'],
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ));
  }

  Widget customContainer(img, txt, ind) {
    return Container(
      width: 300,
      margin: EdgeInsets.only(
        right: 15,
        left: ind == 0 ? 30 : 0,
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(img),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.2), // Adjust opacity as needed
            BlendMode.darken, // BlendMode can be lighten, overlay, etc.
          ),
        ),
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(children: [
        Positioned(
          top: 20,
          left: 20,
          child: Text(
            txt,
            style: const TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        const Positioned(
            top: 60,
            left: 20,
            child: Text('On everything today',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ))),
        const Positioned(
            top: 90,
            left: 20,
            child: Text('With Code: FSCREATION',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ))),
        Positioned(
            top: 140,
            left: 20,
            child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Background color
                  foregroundColor: Colors.white, // Text color
                  fixedSize: const Size(100, 20),
                  elevation: 5, // Button shadow elevation
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // Rounded corners
                  ),
                ),
                child: const Center(
                  child: Text('Get now',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      )),
                )))
      ]),
    );
  }

  Widget itemTile(pic, txt1, txt2, txt3) {
    return Column(children: [
      InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ItemDisp(
                        imageurl: pic,
                        imagename: txt1,
                        imagesub: txt2,
                        imageprice: txt3,
                      )));
        },
        child: Container(
          height: 250,
          width: 220,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(pic),
              fit: BoxFit.cover,
            ),
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      const SizedBox(height: 10),
      SizedBox(
        height: 25,
        child: Text(
          txt1,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
        ),
      ),
      const SizedBox(height: 3),
      SizedBox(
        height: 20,
        child: Text(
          txt2,
          style: const TextStyle(
              fontWeight: FontWeight.normal, fontSize: 15, color: Colors.grey),
        ),
      ),
      const SizedBox(height: 3),
      SizedBox(
        height: 20,
        child: Text(
          txt3,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
        ),
      ),
    ]);
  }

  Widget getCurrentView() {
    if (currentIndex == 0) {
      return homeView();
      // TextField()
    } else if (currentIndex == 1) {
      return Container(
        child: const Text("Current Index 1"),
      );
    } else if (currentIndex == 2) {
      return Container(
        child: const Text("Current Index 2"),
      );
    } else if (currentIndex == 3) {
      return Container(
        child: const Text("Current Index 3"),
      );
    } else {
      return Container(
        child: const Text("Current Index Default"),
      );
    }
  }
}
