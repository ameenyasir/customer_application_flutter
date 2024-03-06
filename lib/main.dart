import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LipSlay',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        scaffoldBackgroundColor: Colors.pinkAccent,
      ),
      home: MyBottomNavigationBar(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<String> images = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTIZccfNPnqalhrWev-Xo7uBhkor57_rKbkw&usqp=CAU",
    "https://wallpaperaccess.com/full/2637581.jpg"
  ];

  final List<Category> categories = [
    Category(
      title: 'Category 1',
      image: 'images/category/Bleach.png',
    ),
    Category(
      title: 'Category 2',
      image: 'images/category/Facial.png',
    ),
    Category(
      title: 'Category 3',
      image: 'images/category/Hair.png',
    ),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LipSlay Home Services'),
      ),
      body: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: 200.0,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              viewportFraction: 0.8,
            ),
            items: images.map((url) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        url,
                        fit: BoxFit.cover,
                        width: 1000.0,
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
          SizedBox(height: 20.0), // Add spacing between the slider and the button
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CheckBookingPage(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 100.0), // Adjust padding for size
            ),
            child: Text('Check Booking'),
          ),
          SizedBox(height: 20.0),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CategoryPage(
                          category: categories[index],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: AssetImage(categories[index].image),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        categories[index].title,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.pinkAccent,
              child: Center(
                child: Text(
                  'Home Page Content',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Container(
        color: Colors.pinkAccent,
        child: Center(
          child: Text(
            'Search Page Content',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Container(
        color: Colors.pinkAccent,
        child: Center(
          child: Text(
            'Cart Page Content',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class WishlistPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wishlist'),
      ),
      body: Container(
        color: Colors.pinkAccent,
        child: Center(
          child: Text(
            'Wishlist Page Content',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class CheckBookingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Check Booking'),
      ),
      body: Container(
        color: Colors.pinkAccent,
        child: Center(
          child: Text(
            'Check Booking Page Content',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Text(
            'Menu Page Content',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}

class Category {
  final String title;
  final String image;

  Category({
    required this.title,
    required this.image,
  });
}

class CategoryPage extends StatelessWidget {
  final Category category;

  CategoryPage({required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: Center(
        child: Text('${category.title} Page Content'),
      ),
    );
  }
}

class MyBottomNavigationBar extends StatefulWidget {
  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    SearchPage(),
    CartPage(),
    WishlistPage(),
    CheckBookingPage(),
    MenuPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.pinkAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
            backgroundColor: Colors.pinkAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
            backgroundColor: Colors.pinkAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Wishlist',
            backgroundColor: Colors.pinkAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Booking',
            backgroundColor: Colors.pinkAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menu',
            backgroundColor: Colors.pinkAccent,
          ),
        ],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.pinkAccent,
      ),
    );
  }
}
