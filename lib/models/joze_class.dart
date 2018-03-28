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
  var joze1 = new Joze();
  joze1= new Joze();
  joze1.jozeId = 1;
  joze1.startPage = 0;
  joze1.endPage = 1;
  joze1.hezbList = new List<Hezb>();
  var hezb1 = new Hezb();
  hezb1.hezbId = 1;
  hezb1.startPage = 0;
  hezb1.endPage = 1;
  joze1.hezbList.add(hezb1);
  data.add(joze1);
  return data;
  //data[0].hezbList

}