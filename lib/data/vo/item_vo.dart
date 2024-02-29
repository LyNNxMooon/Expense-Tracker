import 'package:expense_tracker/persistent/hive_constant.dart';
import 'package:hive/hive.dart';
part 'item_vo.g.dart';

@HiveType(typeId: KItemTypeID)
class ItemVO {
  @HiveField(0)
  String name;
  @HiveField(1)
  int qty;
  @HiveField(2)
  double price;

  ItemVO({required this.name, required this.qty, required this.price});
}
