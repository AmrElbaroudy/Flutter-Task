import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Slash.', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                  SizedBox(width: 16),
                  Text('Near City\nCairo', style: TextStyle(color: Colors.grey)),
                  SizedBox(width: 16),
                  Icon(Icons.notifications_none, color: Colors.black, size: 40),
                ],
              ),
              SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search here...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
              SizedBox(height: 16),
              Container(
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: Text('BLACK\nFRIDAY', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                ),
              ),
              SizedBox(height: 16),
              Text('Categories', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CategoryItem(icon: Icons.style, label: 'Fashion'),
                  CategoryItem(icon: Icons.sports_esports, label: 'Games'),
                  CategoryItem(icon: Icons.store, label: 'Accessories'),
                  CategoryItem(icon: Icons.book, label: 'Books'),
                  CategoryItem(icon: Icons.art_track, label: 'Artifacts'),
                  CategoryItem(icon: Icons.pets, label: 'Pets Care'),
                ],
              ),
              SizedBox(height: 16),
              SectionTitle(title: 'Best Selling'),
              SizedBox(height: 8),
              HorizontalList(items: bestSellingItems),
              SizedBox(height: 16),
              SectionTitle(title: 'New Arrival'),
              SizedBox(height: 8),
              HorizontalList(items: newArrivalItems),
              SizedBox(height: 16),
              SectionTitle(title: 'Recommended for you'),
              SizedBox(height: 8),
              HorizontalList(items: recommendedItems),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite, color: Colors.black),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart, color: Colors.black),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_3_outlined, color: Colors.black),
            label: 'Profile',
          ),
        ],

      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final IconData icon;
  final String label;

  CategoryItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey[200],
          child: Icon(icon, color: Colors.black),
        ),
        SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 12)),
      ],
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Text('See all', style: TextStyle(color: Colors.grey)),
      ],
    );
  }
}

class HorizontalList extends StatelessWidget {
  final List<Item> items;

  HorizontalList({required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(items[index].imagePath),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                SizedBox(height: 4),
                Text(items[index].label, style: TextStyle(fontSize: 12)),
                Text(items[index].price, style: TextStyle(fontSize: 12)),
              ],
            ),
          );
        },
      ),
    );
  }
}

class Item {
  final String label;
  final String price;
  final String imagePath;

  Item(this.label, this.price, this.imagePath);
}

final bestSellingItems = [
  Item('Stitch Keychain', 'EGP 55', 'assets/images/stitch_keychain.png'),
  Item('Baby Girl Dress', 'EGP 230', 'assets/images/baby_girl_dress.png'),
  Item('Infant Hat', 'EGP 90', 'assets/images/infant_hat.png'),
];

final newArrivalItems = [
  Item('Printed Bag', 'EGP 180', 'assets/images/printed_bag.png'),
  Item('Notebook', 'EGP 80', 'assets/images/notebook.png'),
  Item('Woolen Socks', 'EGP 95', 'assets/images/woolen_socks.png'),
];

final recommendedItems = [
  Item('Leather Jacket', 'EGP 340', 'assets/images/leather_jacket.png'),
  Item('Dog Medal', 'EGP 45', 'assets/images/dog_medal.png'),
  Item('Leather Bracelet', 'EGP 80', 'assets/images/leather_bracelet.png'),
];
