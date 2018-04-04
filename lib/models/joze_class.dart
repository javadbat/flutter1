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
  defineJoze(data,1,1,7,11,17,22);
  defineJoze(data,2,22,27,32,37,42);
  defineJoze(data,3,42,46,51,56,62);
  defineJoze(data,4,62,67,72,77,82);
  defineJoze(data,5,82,87,92,97,102);
  defineJoze(data,6,102,106,112,117,121);
  defineJoze(data,7,121,127,132,137,142);
  defineJoze(data,8,142,146,152,156,162);
  defineJoze(data,9,162,167,172,177,182);
  defineJoze(data,10,182,187,192,196,201);
  defineJoze(data,11,201,206,212,217,222);
  defineJoze(data,12,222,226,231,236,242);
  defineJoze(data,13,242,247,252,256,262);
  defineJoze(data,14,262,267,272,277,282);
  defineJoze(data,15,282,287,292,297,302);
  defineJoze(data,16,302,306,312,317,322);
  defineJoze(data,17,322,326,332,336,342);
  defineJoze(data,18,342,347,352,356,362);
  defineJoze(data,19,362,367,371,377,382);
  defineJoze(data,20,382,386,392,396,402);
  defineJoze(data,21,402,407,413,418,422);
  defineJoze(data,22,422,426,431,436,442);
  defineJoze(data,23,442,446,451,456,462);
  defineJoze(data,24,462,467,472,477,482);
  defineJoze(data,24,462,467,472,477,482);
  defineJoze(data,25,482,486,492,496,502);
  defineJoze(data,26,502,507,513,517,522);
  defineJoze(data,27,522,526,531,536,542);
  defineJoze(data,28,542,547,553,557,562);
  defineJoze(data,29,562,566,572,577,582);
  defineJoze(data,30,582,587,591,596,602);//last page is not true
  return data;
}
void defineJoze(List<Joze> jozeList, jozeId , int hezb1StartPage, int hezb2StartPage,int hezb3StartPage,int hezb4StartPage,int hezb4EndPage){
 /* start joz define */
    var joze = new Joze();
    joze= new Joze();
    joze.jozeId = jozeId;
    joze.startPage = hezb1StartPage;
    joze.endPage = hezb4EndPage;
    joze.hezbList = new List<Hezb>();
    //define hzb
    defineHezbForjoze(joze, hezb1StartPage,hezb2StartPage,hezb3StartPage,hezb4StartPage,hezb4EndPage);
    jozeList.add(joze);
  /* end of joze define*/
}
void defineHezbForjoze( Joze joze ,int hezb1StartPage, int hezb2StartPage,int hezb3StartPage,int hezb4StartPage,int hezb4EndPage){
      var hezb1 = new Hezb();
      hezb1.hezbId = 1;
      hezb1.startPage = hezb1StartPage;
      hezb1.endPage = hezb2StartPage;
      joze.hezbList.add(hezb1);
    //define hzb
      var hezb2 = new Hezb();
      hezb2.hezbId = hezb2StartPage;
      hezb2.startPage = hezb3StartPage;
      hezb2.endPage = 11;
      joze.hezbList.add(hezb2);
    //define hzb
      var hezb3 = new Hezb();
      hezb3.hezbId = 3;
      hezb3.startPage = hezb3StartPage;
      hezb3.endPage = hezb4StartPage;
      joze.hezbList.add(hezb3);
    //define hzb
      var hezb4 = new Hezb();
      hezb4.hezbId = 4;
      hezb4.startPage = hezb4StartPage;
      hezb4.endPage = hezb4EndPage;
      joze.hezbList.add(hezb4);
    //end of define hezb
}