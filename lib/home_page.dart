// ignore_for_file: camel_case_types, non_constant_identifier_names, avoid_print, prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'dart:convert';

import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import 'package:movie_info/information_page.dart';

class home_page extends StatefulWidget {
  const home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  List popular_movie_info = [];
  List Tv_show_info = [];
  List Animation_movie_info = [];

  popular_movie_api() async {
    var response = await http.get(
        Uri.parse(
            "https://api.themoviedb.org/3/trending/movie/week?language=ta-IN&"),
        headers: {
          "accept": "application/json",
          "Authorization":
              "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkOTVkYmU4NjA3Y2NmZDg0ZTE2YTM4N2MwMGQ4NGE1ZSIsInN1YiI6IjY2MTU1MjUxMGJiMDc2MDBjOTJmYTNmNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.WeOCSGZcBjrC7-3Yjyakh7AeS6OFK1wQTkWy2Ulomzw"
        });

    if (response.statusCode == 200) {
      var JsonResponse = json.decode(response.body);

      setState(() {
        popular_movie_info = JsonResponse["results"];
      });
    } else {
      print(response.statusCode);
    }
  }

  Tv_show_api() async {
    var response = await http.get(
        Uri.parse(
            "https://api.themoviedb.org/3/trending/tv/day?language=en-US"),
        headers: {
          "accept": "application/json",
          "Authorization":
              "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkOTVkYmU4NjA3Y2NmZDg0ZTE2YTM4N2MwMGQ4NGE1ZSIsInN1YiI6IjY2MTU1MjUxMGJiMDc2MDBjOTJmYTNmNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.WeOCSGZcBjrC7-3Yjyakh7AeS6OFK1wQTkWy2Ulomzw"
        });

    if (response.statusCode == 200) {
      var JsonResponse = json.decode(response.body);

      setState(() {
        Tv_show_info = JsonResponse["results"];
      });
    } else {
      print(response.statusCode);
    }
  }

  animation_movie_api() async {
    var response = await http.get(
        Uri.parse(
            "https://api.themoviedb.org/3/search/movie?query=spider%20man&include_adult=false&language=en-US&page=1"),
        headers: {
          "accept": "application/json",
          "Authorization":
              "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkOTVkYmU4NjA3Y2NmZDg0ZTE2YTM4N2MwMGQ4NGE1ZSIsInN1YiI6IjY2MTU1MjUxMGJiMDc2MDBjOTJmYTNmNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.WeOCSGZcBjrC7-3Yjyakh7AeS6OFK1wQTkWy2Ulomzw"
        });

    if (response.statusCode == 200) {
      var JsonResponse = json.decode(response.body);
      print(JsonResponse);
      setState(() {
        Animation_movie_info = JsonResponse["results"];
      });
    } else {
      print(response.statusCode);
    }
  }

  @override
  void initState() {
    popular_movie_api();
    Tv_show_api();
    animation_movie_api();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Trending Movie",
                    style: TextStyle(color: Colors.orange, fontSize: 20),
                  )),
            ),
            SizedBox(
              height: 500,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: popular_movie_info.length,
                  itemBuilder: (((contex, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (contex) {
                            return information_page(
                              movie_image: "https://image.tmdb.org/t/p/w500/" +
                                  popular_movie_info[index]['poster_path'],
                              movie_name: popular_movie_info[index]["title"],
                              over_view: popular_movie_info[index]["overview"],
                            );
                          }));
                        },
                        child: Container(
                          height: 500,
                          width: 500,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "https://image.tmdb.org/t/p/w500/" +
                                                  popular_movie_info[index]
                                                      ['poster_path'] !=
                                              "null"
                                          ? "https://image.tmdb.org/t/p/w500/" +
                                              popular_movie_info[index]
                                                  ['poster_path']
                                          : "https://images.unsplash.com/photo-1597389935051-2f9dc0f05456?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dGFtaWwlMjBuYWR1fGVufDB8fDB8fHww"),
                                  fit: BoxFit.fill,
                                  filterQuality: FilterQuality.high)),
                        ),
                      ),
                    );
                  }))),
            ),

            /////////////////////////Tv_show//////////////////////////////////////////////////////////////////////////////
            Padding(
              padding: const EdgeInsets.all(15),
              child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Top show",
                    style: TextStyle(color: Colors.orange, fontSize: 20),
                  )),
            ),
            SizedBox(
              height: 500,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: Tv_show_info.length,
                  itemBuilder: (((contex, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (contex) {
                            return information_page(
                              movie_image: "https://image.tmdb.org/t/p/w500/" +
                                  Tv_show_info[index]['poster_path'],
                              movie_name: Tv_show_info[index]["name"],
                              over_view: Tv_show_info[index]["overview"],
                            );
                          }));
                        },
                        child: Container(
                          height: 500,
                          width: 500,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "https://image.tmdb.org/t/p/w500/" +
                                          Tv_show_info[index]['poster_path']),
                                  fit: BoxFit.fill,
                                  filterQuality: FilterQuality.high)),
                        ),
                      ),
                    );
                  }))),
            ),

            //////////////////////////////////////////////////animation_movie/////////////////////////////////////////////////////
            Padding(
              padding: const EdgeInsets.all(15),
              child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Spiderman collection",
                    style: TextStyle(color: Colors.orange, fontSize: 20),
                  )),
            ),
            SizedBox(
              height: 500,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: Animation_movie_info.length,
                  itemBuilder: (((contex, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (contex) {
                            return information_page(
                              movie_image: "https://image.tmdb.org/t/p/w500/" +
                                  Animation_movie_info[index]['poster_path'],
                              movie_name: Animation_movie_info[index]
                                  ["original_title"],
                              over_view: Animation_movie_info[index]
                                  ["overview"],
                            );
                          }));
                        },
                        child: Container(
                          height: 500,
                          width: 500,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "https://image.tmdb.org/t/p/w500/" +
                                          Animation_movie_info[index]
                                              ['poster_path']),
                                  fit: BoxFit.fill,
                                  filterQuality: FilterQuality.high)),
                        ),
                      ),
                    );
                  }))),
            ),

            ///////////////////////////////////////////////////
          ],
        ),
      ),
    );
  }
}
