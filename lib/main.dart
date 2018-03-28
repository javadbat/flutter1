import 'package:flutter/material.dart';
import 'models/quran_calculation.dart';
void main() => runApp(new MyApp());
class InitiateAppPage extends StatefulWidget{
  @override
   createState()=> new InitiateAppPageState();
}
class InitiateAppPageState extends State<InitiateAppPage> {
   List<DropdownMenuItem<String>> jozeListItems;
   String selectedJoze = "1";
  @override
  Widget build(BuildContext context) {
    //var data = new QuranCalculation();
    var titleStyle = new TextStyle(fontSize: 18.0,fontWeight: FontWeight.w600);
    fillDropDownList();
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('title'),
      ),
      body: new Column(
        children: <Widget>[
          new Image.asset('assets/images/test.jpg',fit: BoxFit.cover,),
          new Text('please fill informtion' , style: titleStyle),
          new Divider(),
          new ListTile(title: new Text('part')),
          new ListTile(
            title: new DropdownButton<String>(
              items: this.jozeListItems,
              onChanged: onJozeValueChanged,
              value: this.selectedJoze,
            )
          ),
        ],
      ),
    );
  }
  void onJozeValueChanged(String selectedJoze){
    this.selectedJoze = selectedJoze;
  }
  fillDropDownList(){
    List<DropdownMenuItem<String>> jozeListItems = new List();
    for(var i=0; i<=30 ; i++){
      jozeListItems.add(new DropdownMenuItem(
          child: new Text(i.toString()),
          value: i.toString(),
        )
      );   
    }
    this.jozeListItems = jozeListItems;
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Welcome to Flutter',
        theme: new ThemeData.light(),
        home: new InitiateAppPage(),
        builder: (BuildContext context, Widget child) {
          return new Directionality(
            textDirection: TextDirection.rtl,
            child: child,
          );
        },
        );
        
  }
}

