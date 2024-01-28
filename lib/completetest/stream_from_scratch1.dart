// import 'dart:async';

Stream<int> timedCounter(Duration interval, [int? maxCount=10]) async* {
  int i = 0;
  while (true) {
    await Future.delayed(interval);
    yield i++;
    if (i == maxCount) break;
  }
}


void main() {


  Stream<int> counterStream = timedCounter(const Duration(seconds: 1));

  // Listen to the stream and print each value.
  counterStream.listen((int value) {
    print(value);
  });


}
