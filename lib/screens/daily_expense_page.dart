import 'package:expense_tracker/constants/colors.dart';
import 'package:expense_tracker/constants/dimensions.dart';
import 'package:expense_tracker/controller/daily_vm_controller.dart';
import 'package:expense_tracker/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

final dailyVMController = Get.put(DailyVMController());
TextEditingController nameController = TextEditingController();
TextEditingController qtyController = TextEditingController();
TextEditingController priceController = TextEditingController();

class DailyExpensePage extends StatelessWidget {
  const DailyExpensePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: kPrimaryColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: kSP20x),
        child: ListView(
          children: [
            Gap(kSP20x),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(() => Text(
                      dailyVMController.date.value,
                      style:
                          TextStyle(color: kTextColor, fontSize: kFontSize16x),
                    )),
                IconButton(
                    onPressed: () {
                      showDatePicker(
                              barrierColor: kSecondaryColor,
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2026))
                          .then((value) {
                        dailyVMController.date.value =
                            "${value!.day} / ${value.month} / ${value.year}";
                      });
                    },
                    icon: const Icon(
                      Icons.date_range,
                      color: kTextColor,
                    )),
              ],
            ),
            Gap(kSP10x),
            Divider(
              endIndent: kSP10x,
              indent: kSP10x,
              color: kSecondaryColor,
            ),
            Gap(kSP10x),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(() => Text(
                      "${dailyVMController.total.value} \$",
                      style: TextStyle(
                          color: kExpenseColor,
                          fontSize: kFontSize18x,
                          fontWeight: FontWeight.bold),
                    )),
                IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => Dialog(
                          child: AddDialogView(),
                          backgroundColor: kSecondaryColor,
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.add,
                      color: kExpenseColor,
                    )),
              ],
            )
          ],
        ),
      ),
    ));
  }
}

class AddDialogView extends StatelessWidget {
  const AddDialogView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: addDialogWidth,
      height: addDialogHeight,
      child: Column(
        children: [
          Gap(kSP10x),
          TextFieldWidget(controller: nameController, hint: "Name"),
          TextFieldWidget(controller: qtyController, hint: "Quantity"),
          TextFieldWidget(controller: priceController, hint: "Price"),
          Gap(kSP10x),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              width: addButtonWidth,
              height: addButtonHeight,
              decoration: BoxDecoration(
                  color: kExpenseColor,
                  borderRadius: BorderRadius.circular(kSP15x)),
              child: Center(
                child: const Text("Add"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
