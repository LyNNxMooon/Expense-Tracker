import 'package:expense_tracker/data/vo/item_vo.dart';
import 'package:expense_tracker/persistent/dao/hive_dao.dart';
import 'package:stream_transform/stream_transform.dart';

class HiveModel {
  HiveModel._();
  static final HiveModel _singleton = HiveModel._();
  factory HiveModel() => _singleton;

  HiveDAO _hiveDAO = HiveDAO();

  Stream<Map<String, ItemVO>?> get getDailyExpenseStream => _hiveDAO
      .watchDailyExpenseBox()
      .startWith(_hiveDAO.getDailyExpenseStream)
      .map((event) => _hiveDAO.getDailyExpense);

  //save data

  void saveDailyExpense(Map<String, ItemVO> expense) {
    _hiveDAO.saveDailyExpense(expense);
  }

  //get data

  Map<String, ItemVO> get getDailyExpense => _hiveDAO.getDailyExpense ?? {};
}
