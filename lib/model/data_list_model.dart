import 'package:hive/hive.dart';

part 'data_list_model.g.dart';

@HiveType(typeId: 0)
class DataList extends HiveObject {
  @HiveField(0)
  late List<String> city;
}
