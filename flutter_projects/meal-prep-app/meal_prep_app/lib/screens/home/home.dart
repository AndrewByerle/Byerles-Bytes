import 'package:flutter/material.dart';
import 'package:meal_prep_app/screens/planner/weekView.dart';
import 'components/background.dart';
// import 'package:simple_animations/simple_animations.dart';
// import 'package:supercharged/supercharged.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Center(child: GradientBackground()),
        SingleChildScrollView(
          child: Column(
            children: [Title(), SizedBox(height: 400), StartButton()],
          ),
        ),
      ],
    ));
  }
}

class StartButton extends StatelessWidget {
  const StartButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => WeekView()));
      },
      elevation: 4.0,
      fillColor: Colors.lightBlue,
      child: Text('Start',
          style: TextStyle(
            fontSize: 45,
            color: Colors.white,
          )),
      padding: EdgeInsets.fromLTRB(60, 15, 60, 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    );
  }
}

class Title extends StatelessWidget {
  const Title({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
            padding: EdgeInsets.fromLTRB(0, 125, 0, 0),
            child: Text('Meal Planner',
                style: TextStyle(color: Colors.white, fontSize: 50)))
      ],
    );
  }
}
