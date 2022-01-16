bool isNumeric(String s) {
  if (s.isEmpty) return false;
  //trans numero
  final n = num.tryParse(s);
  return (n == null) ? false : true;
}
