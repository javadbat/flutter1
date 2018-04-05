import 'package:hello_world/models/joze_class.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuranCalculation{
  List<Joze> jozeList;
  int currentJoz = 0 ;
  int currentHezb = 0;
  QuranCalculation();
  getCalculatedData() async{
    this.jozeList = getJozeList();
    int jozeStartId,hezbStartId;
    String periodStartDateString ;
    var v = await this.loadUserData();
    jozeStartId = v[0];
    hezbStartId = v[1];
    periodStartDateString = v[2];
    DateTime periodStartDate = DateTime.parse(periodStartDateString);
    var today = new  DateTime.now();
    int diffDay = today.difference(periodStartDate).inDays;
    int hezbDiff = diffDay%4;
    int jozdiff = (diffDay/4).floor();
    if(hezbDiff + hezbStartId >4){
      hezbDiff = hezbDiff + hezbStartId -4;
      jozdiff++;
    }
    
    this.currentHezb = (hezbStartId + hezbDiff)%30;
    this.currentJoz = jozeStartId + jozdiff;
    return([this.currentHezb,this.currentJoz]);
    //find current day read hezb


  }
  void saveUserData(int jozeStartId, int hezbStartId,DateTime periodStartDate) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('jozeStartId', jozeStartId);
    prefs.setInt('hezbStartId', hezbStartId);
    prefs.setString('periodStartDate',  periodStartDate.toIso8601String());
  }
    loadUserData() async{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var jozeStartId =prefs.getInt('jozeStartId');
      var hezbStartId =prefs.getInt('hezbStartId');
      var periodStartDate =prefs.getString('periodStartDate');
      return [jozeStartId,hezbStartId,periodStartDate];
  }

}