import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

import 'exercise_hub.dart';
import 'exercise_start_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //?
  String apiUrl =
      "https://raw.githubusercontent.com/codeifitech/fitness-app/master/exercises.json";

  ExerciseHub exerciseHub;

  @override
  void initState() {
    super.initState();
    getExercises();
  }

  void getExercises() async {
    var response = await http.get(apiUrl);
    var body = response.body;
    var decodedJson = jsonDecode(body);
    exerciseHub = ExerciseHub.fromJson(decodedJson);
    print(exerciseHub.exercises[3].title);
    setState(() {});
  }

  //?
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fitness App'),
        centerTitle: true,
      ),
      body: Container(
        child: exerciseHub != null
            ? ListView(
                children: exerciseHub.exercises.map((e) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) =>
                                  ExerciseStartScreen(exercises: e)));
                    },
                    child: Hero(
                      tag: e.id,
                      child: Container(
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          // color: Colors.red,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Stack(
                          children: [
                            // FadeInImage
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              // child: FadeInImage(
                              //   placeholder:
                              //       AssetImage('assets/placeholder.png'),
                              //   image: NetworkImage(e.thumbnail),
                              //   width: double.infinity,
                              //   height: 250,
                              //   fit: BoxFit.cover,
                              // ),
                              child: CachedNetworkImage(
                                imageUrl: e.thumbnail,
                                placeholder: (context, url) => Image(
                                  image: AssetImage("assets/placeholder.png"),
                                  fit: BoxFit.cover,
                                  height: 250,
                                  width: MediaQuery.of(context).size.width,
                                ),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                                fit: BoxFit.cover,
                                height: 250,
                                width: MediaQuery.of(context).size.width,
                              ),
                            ),

                            //
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Container(
                                width: double.infinity,
                                height: 250,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                  colors: [
                                    Color(0xff000000),
                                    Color(0x00000000),
                                  ],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.center,
                                )),
                              ),
                            ),
                            Container(
                              height: 250,
                              padding: EdgeInsets.only(
                                left: 10,
                                bottom: 10,
                              ),
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                e.title,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              )
            : LiquidLinearProgressIndicator(
                value: 0.25, // Defaults to 0.5.
                valueColor: AlwaysStoppedAnimation(Colors
                    .green), // Defaults to the current Theme's accentColor.
                backgroundColor: Colors
                    .white, // Defaults to the current Theme's backgroundColor.
                borderColor: Colors.amber,
                borderWidth: 2.0,
                borderRadius: 8.0,
                direction: Axis
                    .vertical, // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.horizontal.
                center: Text("Right now..."),
              ),
      ),
    );
  }
}
