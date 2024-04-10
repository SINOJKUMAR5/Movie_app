// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';

class information_page extends StatefulWidget {
  final String movie_name;
  final String over_view;
  final String movie_image;
  const information_page(
      {super.key,
      required this.movie_name,
      required this.over_view,
      required this.movie_image});

  @override
  State<information_page> createState() => _information_pageState();
}

class _information_pageState extends State<information_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(fit: StackFit.expand, children: [
        Image.asset(
          "assets/a.jpg",
          fit: BoxFit.cover,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 100,
            ),
            Center(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Image.network(widget.movie_image)),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 180),
              child: Text(
                "title",
                style: TextStyle(color: Colors.orange, fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 180),
              child: Text(
                widget.movie_name,
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 180),
              child: Text("OverView",
                  style: TextStyle(color: Colors.orange, fontSize: 20)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 180),
              child: Text(
                widget.over_view,
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ]),
    );
  }
}
