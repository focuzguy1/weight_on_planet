import "package:flutter/material.dart";

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  //to handle _wieghtController i.e input text
  final TextEditingController _weightController = new TextEditingController();
  int radioValue = 0;
  double _finalResult = 0.0;
  String _formattedText = "";
  void handleRadiovalueChanged(int value){
    setState((){
      radioValue = value;

      //switch case from 0 -2
      switch (radioValue){
        case 0:
          _finalResult = calculateWeight(_weightController.text,0.06);
          _formattedText = "Your weight for in Pluto is ${_finalResult.toStringAsFixed(1)}";
          break;

        case 1:
          _finalResult = calculateWeight(_weightController.text, 0.38);
          //toStringAsFixed is to equate the decimal to 1 here
          _formattedText = "Your weight for in Mars is ${_finalResult.toStringAsFixed(1)}";
          break;
        case 2:
        _finalResult = calculateWeight(_weightController.text, 0.91);
        _formattedText = "Your weight for in Venus is ${_finalResult.toStringAsFixed(1)}";
          break;


      }
    print(radioValue);
    });
        }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Weight On Planet X"),
          backgroundColor: Colors.black26,
          centerTitle: true,
        ),
        backgroundColor: Colors.blueGrey,
        body: new Container(
            alignment: Alignment.topCenter,
            child: new ListView(
              padding: const EdgeInsets.all(10.5),
              children: <Widget>[
                new Image.asset(
                  'images/useric.jpg',
                  height: 120.0,
                  width: 180.0,
                ),
                new Container(
                    margin: const EdgeInsets.all(3.0),
                    alignment: Alignment.center,
                    child: new Column(
                      children: <Widget>[
                        new TextField(
                          controller: _weightController,
                          keyboardType: TextInputType.number,
                          decoration: new InputDecoration(
                            labelText: "Weight On Planet",
                            hintText: 'In Pounds',
                            icon: new Icon(Icons.person_outline)),
                        ),
                        new Padding(padding: const EdgeInsets.all(5.0)),

                        new Row(
                          children: <Widget>[
                            new Radio<int>(
                              activeColor: Colors.brown,
                                value:0, groupValue: radioValue, onChanged: handleRadiovalueChanged),
                            new Text("Pluto", style: new TextStyle(color: Colors.white30)),
                            new Radio<int>(
                              activeColor: Colors.red,
                                value:1, groupValue: radioValue, onChanged: handleRadiovalueChanged ),
                            new Text("Mars", style: new TextStyle(color: Colors.white30)),
                            new Radio<int>(
                              activeColor: Colors.orangeAccent,
                                value: 2, groupValue: radioValue, onChanged: handleRadiovalueChanged),
                            new Text("Venus", style: new TextStyle(color: Colors.white30)),
                          ],
                        ),

                        new Padding(padding: new EdgeInsets.all(15.5)),
                        //Result Text
                        new Text(
                          _weightController.text.isEmpty ? "Please Enter Your Weight" : _formattedText + "lbs",
                         // " $_formattedText lbs, Respect Focuz the Software Developer",
                          style: TextStyle(color: Colors.white30, fontSize: 20.0, fontWeight: FontWeight.w500),
                        ),

                        new Padding(padding: new EdgeInsets.all(20.0)),
                        new Text("Respect focuz the Software Developer", style: new TextStyle(color:Colors.white30, fontWeight: FontWeight.bold, fontSize:15.5),
                        ),

                      ],
                    ))
              ],
            )));
  }
//we convet weight to int and also to "string" to take d advantages of is not Empty
  double calculateWeight(String  weight, double multiplier) {
    if(int.parse(weight).toString().isNotEmpty && int.parse(weight) > 0){
      return int.parse(weight) * multiplier;
    }else{
      print ("wrong");
      return int.parse("180") * 0.38;
    }
  }
}
