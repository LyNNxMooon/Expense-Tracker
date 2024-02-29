import 'package:expense_tracker/data/vo/item_vo.dart';
import 'package:expense_tracker/data/vo/monthly_cost_vo.dart';
import 'package:expense_tracker/persistent/hive_constant.dart';
import 'package:expense_tracker/screens/navigator_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Hive.initFlutter();
  Hive.registerAdapter(ItemVOAdapter());
  Hive.registerAdapter(MonthlyCostVOAdapter());
  await Hive.openBox<Map<String, ItemVO>>(kDailyExpenseBox);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const NavigatorPage(),
      theme: ThemeData(fontFamily: 'Quicksand'),
    );
  }
}
