class Joze{
  int jozeId;
  int startPage;
  int endPage;
  List<Hezb> hezbList;
  
}
class Hezb{
    int hezbId;
    int startPage;
    int endPage;
}
List<Joze> getJozeList(){

  var data = new List<Joze>();
  /* start joz define */
    var joze1 = new Joze();
    joze1= new Joze();
    joze1.jozeId = 1;
    joze1.startPage = 1;
    joze1.endPage = 1;
    joze1.hezbList = new List<Hezb>();
    //define hzb
    {
      var hezb1 = new Hezb();
      hezb1.hezbId = 1;
      hezb1.startPage = 1;
      hezb1.endPage = 7;
      joze1.hezbList.add(hezb1);
    //define hzb
      var hezb2 = new Hezb();
      hezb2.hezbId = 2;
      hezb2.startPage = 7;
      hezb2.endPage = 11;
      joze1.hezbList.add(hezb2);
    //define hzb
      var hezb3 = new Hezb();
      hezb3.hezbId = 3;
      hezb3.startPage = 11;
      hezb3.endPage = 17;
      joze1.hezbList.add(hezb3);
    //define hzb
      var hezb4 = new Hezb();
      hezb4.hezbId = 4;
      hezb4.startPage = 17;
      hezb4.endPage = 22;
      joze1.hezbList.add(hezb4);
    //end of define hezb
    }
  data.add(joze1);
  /* end of joze define*/
  return data;
}
void defineHezbForjoze(Joze joze ,int hezb1StartPage, int hezb2StartPage,int hezb3StartPage,int hezb4StartPage){

}