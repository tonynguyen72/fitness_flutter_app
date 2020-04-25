import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import 'exercise_hub.dart';
import 'exercise_screen.dart';

class ExerciseStartScreen extends StatefulWidget {
  final Exercises exercises;

  ExerciseStartScreen({@required this.exercises});
  @override
  _ExerciseStartScreenState createState() => _ExerciseStartScreenState();
}

class _ExerciseStartScreenState extends State<ExerciseStartScreen> {
  //?
  int seconds = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Hero(
          tag: widget.exercises.id,
          // child: Image(
          //   width: MediaQuery.of(context).size.width - 100,
          //   height: MediaQuery.of(context).size.height,
          //   image: NetworkImage(widget.exercises.thumbnail),
          //   fit: BoxFit.cover,
          // ),
          child: Stack(
            children: [
              CachedNetworkImage(
                imageUrl: widget.exercises.thumbnail,
                placeholder: (context, url) => Image(
                  image: AssetImage("assets/placeholder.png"),
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
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
              Positioned(
                bottom: 40,
                left: 0,
                right: 0,
                child: Container(
                  width: 200,
                  height: 200,
                  child: SleekCircularSlider(
                    appearance: CircularSliderAppearance(),
                    onChange: (double val) {
                      print(val);
                      setState(() {
                        seconds = val.toInt();
                      });
                    },
                    initialValue: 30,
                    max: 60,
                    min: 10,
                    innerWidget: (v) => Container(
                      alignment: Alignment.center,
                      child: Text(
                        "${v.toInt()} S",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
              //
              Container(
                alignment: Alignment.center,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) => ExerciseScreen(
                                  exercises: widget.exercises,
                                  seconds: seconds,
                                )));
                  },
                  child: Text('Start Exercise', style: TextStyle(fontSize: 20)),
                  color: Color(0xffE83350),
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  splashColor: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
