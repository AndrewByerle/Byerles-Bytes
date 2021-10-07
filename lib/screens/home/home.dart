import 'package:flutter/material.dart';
import 'package:meal_prep_app/components/background.dart';
import 'package:meal_prep_app/screens/weekView/weekView.dart';
// import 'components/background.dart';

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
            children: [
              Title(),
              SubHeader(),
              SizedBox(height: 400),
              StartButton()
            ],
          ),
        ),
      ],
    ));
  }
}

class SubHeader extends StatelessWidget {
  const SubHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Text("Meal Planner",
          style: TextStyle(color: Colors.white, fontSize: 26)),
    );
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
            child: Text("Byerle's Bytes",
                style: TextStyle(color: Colors.white, fontSize: 50))),
      ],
    );
  }
}
