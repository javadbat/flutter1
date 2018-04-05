import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hello_world/models/quran_calculation.dart';
import 'package:hello_world/widgets/date-picker.dart';

class InitiateAppPage extends StatefulWidget {
  InitiateAppPage({Key key, data}) : super(key: key);
  @override
  createState() => new InitiateAppPageState();
}
class InitiateAppPageState extends State<InitiateAppPage> {
  List<DropdownMenuItem<String>> jozeListItems;
  List<DropdownMenuItem<String>> hezbListItems;
  String selectedJoze = "1";
  String selectedHezb = "1";
  DateTime startDate = new DateTime.now();
  QuranCalculation data;

  InitiateAppPageState() {
    this.data = new QuranCalculation();
     calcData();
     fillDropDownList();
     getUserData();
  }
  getUserData()async {
    var v = await this.data.loadUserData();
    setState((){
    selectedJoze = v[0].toString();
    selectedHezb = v[1].toString();
    startDate = DateTime.parse(v[2]);
    });


  }
  fillDropDownList() {
    List<DropdownMenuItem<String>> jozeListItems = new List();
    for (var i = 0; i <= 30; i++) {
      jozeListItems.add(new DropdownMenuItem(
        child: new Text(i.toString()),
        value: i.toString(),
      ));
    this.jozeListItems = jozeListItems;
    //fill hezb list drop down
    List<DropdownMenuItem<String>> hezbListItems = new List();
    for (var i = 0; i <= 4; i++) {
      hezbListItems.add(new DropdownMenuItem(
        child: new Text(i.toString()),
        value: i.toString(),
      ));
    }
    this.hezbListItems = hezbListItems;
  }
  }
  calcData() async {
    await this.data.getCalculatedData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var titleStyle = new TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600);
   
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('تنظیمات اولیه دوره'),
      ),
      body:new ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(20.0),
        children: <Widget>[
          /*new Image.asset(
            'assets/images/init-banner.png',
            fit: BoxFit.cover,
          ),*/
          new Container(
            padding: new EdgeInsets.only(top: 16.0),
          ),
          new Text('لطفا اطلاعات دوره خود را وارد کنید', style: titleStyle),
          new DatePicker(
            labelText: 'تاریخ شرروع دوره',
            selectedDate: this.startDate,
            selectDate: (DateTime date) {
              setState(() {
                this.startDate = date;
              });
            },
          ),
          
          new Divider(),
          new ListTile(title: new Text('جز')),
          new ListTile(
              title: new DropdownButton<String>(
            items: this.jozeListItems,
            onChanged: onJozeValueChanged,
            value: this.selectedJoze,
          )),
          new ListTile(title: new Text('حزب')),
          new ListTile(
              title: new DropdownButton<String>(
            items: this.hezbListItems,
            onChanged: onHezbValueChanged,
            value: this.selectedHezb,
          )),
          new Text('جز:' + this.data.currentJoz.toString()),
          new Text('حزب:' + this.data.currentHezb.toString()),
          new RaisedButton(
            child: new Text('ثبت اطلاعات'),
            onPressed: saveUserBasicData,
          )

        ],
      )
    );
  }
  Future<Null> _showDialog() async {
    return showDialog<Null>(
      context: context,
      barrierDismissible: false, // user must tap button!
      child: new AlertDialog(
        title: new Text('تغییر اطلاعات'),
        content: new SingleChildScrollView(
          child: new ListBody(
            children: <Widget>[
              new Text('اطلاعات با موفقیت ویرایش یافت'),
            ],
          ),
        ),
        actions: <Widget>[
          new FlatButton(
            child: new Text('ممنون'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
  void onJozeValueChanged(String selectedJoze) {
    
    setState((){
        this.selectedJoze = selectedJoze;
    });
  }
  void onHezbValueChanged(String selectedHezb) {
    setState((){
    this.selectedHezb = selectedHezb;
    });
  }
  void saveUserBasicData() async{
    this.data.saveUserData(int.parse(this.selectedJoze), int.parse(this.selectedHezb), this.startDate);
    _showDialog();
    await this.data.getCalculatedData();
    setState((){});
  }

}