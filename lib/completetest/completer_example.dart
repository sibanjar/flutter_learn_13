
import 'dart:async';

Completer<int> completer = Completer<int>();

Future<int> someAsyncOperation() {
  // Simulating an asynchronous operation, like fetching data
  Future.delayed(Duration(seconds: 2), () {
    completer.complete(42); // Complete the Future with a value
  });

  return completer.future; // Return the Future
}

void main() {
  someAsyncOperation().then((value) {
    print("Value: $value"); // Output: Value: 42 (after 2 seconds)
  });
}
