import 'package:flutter_learn_13/object_box/user_model_box.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../objectbox.g.dart';

class ObjectBox {
  /// The Store of this app.
  late final Store store;
  late final Box<UserBox> userBox;
  late final Box<AddressBox> addressBox;

  ObjectBox._create(this.store) {
    userBox = Box<UserBox>(store);
    addressBox = Box<AddressBox>(store);

    // Add any additional setup code, e.g. build queries.
  }

  /// Create an instance of ObjectBox to use throughout the app.
  static Future<ObjectBox> create() async {
    final docsDir = await getApplicationDocumentsDirectory();
    // Future<Store> openStore() {...} is defined in the generated objectbox.g.dart
    final store = await openStore(directory: p.join(docsDir.path, "o"));
    return ObjectBox._create(store);
  }
}