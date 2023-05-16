import 'package:flutter/material.dart';
import 'package:quiz/class.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
class quiz extends StatefulWidget {
  const quiz({Key? key}) : super(key: key);

  @override
  State<quiz> createState() => _quizState();
}

class _quizState extends State<quiz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(getqus(),
              style: TextStyle(color: Colors.white, fontSize: 20,
                  fontWeight: FontWeight.bold),),
            SizedBox(
              height: 80,
            ),
            TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.lightGreen,
                    fixedSize: Size(100, 30)),
                onPressed: () {check(true);},
                child: Text('True', style: TextStyle(color: Colors.white),)),
            SizedBox(
              height: 30,
            ),
            TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Colors.red, fixedSize: Size(100, 30)),
                onPressed: () {check(false);},
                child: Text('False', style: TextStyle(color: Colors.white),)),
            SizedBox(
              height: 30,
            ),
          Row(
            children: ico,
          )
          ],
        ),
      ),
    );
  }
  List question = [
    Quiz(qus: 'car have four wheels', ans: true),
    Quiz(qus: 'bike have three wheels', ans: false),
    Quiz(qus: 'sky color is blue', ans: true),
    Quiz(qus: 'human blood color is green', ans: false),
    Quiz(qus: 'kerala is the state of america', ans: false),
    Quiz(qus: 'malayalam is the mother tongue of kerala', ans: true),
    Quiz(qus: 'lionel messi is a cricket player', ans: false),
    Quiz(qus: 'india is asian country', ans: true),
    Quiz(qus: 'cat have four legs', ans: true),
  ];

  List<Icon> ico=[];
  int count=0;
  int qusno=0;
  void nextqus() {
    if (qusno < question.length) {
      qusno++;
    }
  }
  String getqus() {
    return question[qusno].qus;
  }
  bool getans() {
    return question[qusno].ans;
  }
  bool isFinished(){
    if(qusno>=question.length-1) {
      return true;
    }
    else{
      return false;
    }
  }
  int reset(){
    qusno=0;
    count=0;
    return qusno;
  }
  void check(bool answer){
    bool value=getans();
    setState(() {
      if (isFinished() == true) {
        if (count <= 5) {
          Alert(context: context, title: 'THE END', desc: 'you are failed')
              .show();
          reset();
          ico = [];
        }
        else {
          Alert(
              context: context,
              title: 'THE END',
              desc: 'you are passed with $count marks').show();
          reset();
          ico = [];
        }
      }

      else {
        if (value == answer) {
          print(count);
          ico.add(Icon(Icons.check,
            color: Colors.green,
          ));
          count++;
        }

        else {
          ico.add(Icon(Icons.close, color: Colors.red,));
        }
        nextqus();
      }
      });
  }
        }

