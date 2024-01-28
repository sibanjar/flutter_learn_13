// import 'dart:async';

void main() {

  var counterStream =
  Stream<int>.periodic(const Duration(seconds: 1), (x) => x+1).take(15);


// counterStream.forEach(print);

  var doubleCounterStream = counterStream.map((int x) => x * 2);
  doubleCounterStream.forEach(print);

  // .where((int x) => x.isEven) // Retain only even integer events.
  //     .expand((var x) => [x, x]) // Duplicate each event.
      // .take(5) /


//for additional transformation
  /*Stream<List<int>> content = File('someFile.txt').openRead();
  List<String> lines = await content
      .transform(utf8.decoder)
      .transform(const LineSplitter())
      .toList();
*/

}