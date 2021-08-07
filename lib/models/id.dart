// 📦 Package imports:
import 'package:uuid/uuid.dart';

const _uuidGenerator = Uuid();

/// Creates a class to a unique id
class ID {
  /// Initialize the id string
  ID() {
    _id = _uuidGenerator.v4();
  }
  late String _id;

  /// Getter for the value of id
  String get value => _id;
}
