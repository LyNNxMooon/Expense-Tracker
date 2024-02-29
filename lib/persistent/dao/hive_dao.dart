import 'package:expense_tracker/data/vo/item_vo.dart';
import 'package:expense_tracker/persistent/hive_constant.dart';
import 'package:hive/hive.dart';

class HiveDAO {
  HiveDAO._();
  static final HiveDAO _singleton = HiveDAO._();
  factory HiveDAO() => _singleton;

  Box<Map<String, ItemVO>> dailyExpenseBox() =>
      Hive.box<Map<String, ItemVO>>(kDailyExpenseBox);

  Stream watchDailyExpenseBox() => dailyExpenseBox().watch();

  Stream<Map<String, ItemVO>?> get getDailyExpenseStream =>
      Stream.value(getDailyExpense);

  //save data

  void saveDailyExpense(Map<String, ItemVO> expense) {
    dailyExpenseBox().put(kDailyExpenseKey, expense);
  }

  //get data

  Map<String, ItemVO>? get getDailyExpense =>
      dailyExpenseBox().get(kDailyExpenseKey);
}
