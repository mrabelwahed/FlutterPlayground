import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        title: const Text('data'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notification_important),
            onPressed: () {
              print("notification button is clicked");
            },
          ),
          IconButton(
              onPressed: () {
                print("search button is clicked");
              },
              icon: const Icon(Icons.search))
        ],
        backgroundColor: Colors.red,
      ),
      body: Container(
        color: Colors.white,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(20)
              ),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  const Image(
                    image: NetworkImage(
                        "https://kidlingoo.com/wp-content/uploads/flowers_name_in_english.jpg"
                    ),
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    color: Colors.black.withOpacity(.7),
                    width: 200,
                    child: const Text(
                      "Flower",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                      fontSize: 30,
                      color: Colors.white
                    ),),
                  )
        ]
              ),
            ),
          ],
        ),
      ),
    );
  }
}
