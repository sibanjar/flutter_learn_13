import 'dart:async';

// Function to simulate a stream of chunks (strings).
Stream<String> generateChunks() async* {
  yield 'This is a \nstream of \nconsecutive\n';
  yield 'strings split into \nlines\nusing the lines function.\n';
  yield ''; // An empty string to simulate an incomplete line.
}

// Function that splits a stream of strings into lines.
Stream<String> lines(Stream<String> source) async* {
  var partial = '';
  await for (final chunk in source) {
    var lines = chunk.split('\n');
    lines[0] = partial + lines[0];
    partial = lines.removeLast();
    for (final line in lines) {
      yield line;
    }
  }
  if (partial.isNotEmpty) yield partial;
}

void main() {
  var chunksStream = generateChunks();
  var linesStream = lines(chunksStream);

  linesStream.listen((line) {
    print(line); // Print each line from the main function.
    // You can do something else with each line here.
  });
}
