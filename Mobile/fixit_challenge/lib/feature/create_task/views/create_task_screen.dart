import 'package:flutter/material.dart';

import 'package:nb_utils/nb_utils.dart';

import '../../../core/base/base_view.dart';
import '../../../utils/colors.dart';
import '../../../utils/navigation.dart';
import '../../../utils/screen_size.dart';
import '../../../widgets/k_app_bar.dart';
import '../../../widgets/k_button.dart';
import '../../../widgets/k_dropdown_field.dart';
import '../../../widgets/k_textfield.dart';
import '../controllers/create_task_controller.dart';

class CreateTaskScreen extends BaseView {
  @override
  _CreateTaskScreenState createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends BaseViewState<CreateTaskScreen> {
  final TextEditingController taskTitleController = TextEditingController();
  final TextEditingController taskDetailsController = TextEditingController();
  final TextEditingController dateTimeController = TextEditingController();
  final TextEditingController priorityController =
      TextEditingController(text: 'Low');

  @override
  Widget appBar() {
    return KAppBar(
      titleText: 'New Task',
      onTap: () => Navigation.pop(context),
    );
  }

  @override
  Widget body() {
    return Stack(
      children: [

        Column(
          children: [
            SizedBox(height: ListifySize.height(40)),
            KTextFormField(
              hintText: "Task Name",
              controller: taskTitleController,
              multiline: true,
            ),
            SizedBox(height: ListifySize.height(22)),
            KTextFormField(
              hintText: "Details",
              controller: taskDetailsController,
              multiline: true,
              minimumLines: 5,
            ),
            SizedBox(height: ListifySize.height(22)),
            KTextFormField(
              hintText: "Date Time",
              controller: dateTimeController,
              isCalenderField: true,
            ),
            SizedBox(height: ListifySize.height(22)),
            KDropdownField(
              controller: priorityController,
              dropdownFieldOptions: ['Low', 'Medium', 'High'],
            ),
            SizedBox(height: ListifySize.height(90)),
            KFilledButton(
                buttonText: "Add Task",
                onPressed: () async {
                  if (taskTitleController.text.trim().isNotEmpty) {
                    await ref.read(createTaskProvider).createNewTask(
                          taskTitleController.text,
                          taskDetailsController.text,
                          dateTimeController.text,
                          priorityController.text,
                        );
                    Navigation.pop(context);
                  } else {
                    snackBar(context,
                        title: 'Please enter a task name',
                        backgroundColor: ListifyColors.charcoal);
                  }
                }) ,
            Positioned(child: Image.asset("assets/elements/Asset 9.png") , bottom: 0,),
          ],
        ),
      ],
    );
  }
}
