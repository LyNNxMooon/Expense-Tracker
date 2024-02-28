import 'package:expense_tracker/persistent/hive_constant.dart';
import 'package:hive/hive.dart';
part 'monthly_cost_vo.g.dart';

@HiveType(typeId: kMonthlyCostTypeID)
class MonthlyCostVO {
  @HiveField(0)
  final double total;
  @HiveField(1)
  final double electricBill;
  @HiveField(2)
  final double waterBill;
  @HiveField(3)
  final double internetBill;
  @HiveField(4)
  final Map<String, double> dailyCosts;

  MonthlyCostVO(
      {required this.total,
      required this.electricBill,
      required this.waterBill,
      required this.internetBill,
      required this.dailyCosts});
}
