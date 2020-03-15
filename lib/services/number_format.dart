String formatNumber( int myNum){
  String number = myNum.toString();
  RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  Function mathFunc = (Match match) => '${match[1]},';
  String result = number.replaceAllMapped(reg, mathFunc);
  return result;
}
