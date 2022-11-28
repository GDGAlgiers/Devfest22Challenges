import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/base/base_view.dart';
import '../../../data/model/todo.dart';
import '../../../utils/assets.dart';
import '../../../utils/colors.dart';
import '../../../utils/navigation.dart';
import '../../../utils/screen_size.dart';
import '../../../utils/text_style.dart';
import '../../../widgets/k_app_bar.dart';
import '../../../widgets/k_button.dart';
import '../controllers/task_details_controller.dart';
import '../widgets/sub_task_card.dart';
import '../widgets/task_details_card.dart';

class DetailsScreen extends BaseView {
  @override
  ConsumerState<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends BaseViewState<DetailsScreen> {
  @override
  Widget appBar() {
    return KAppBar(
      titleText: "Task Details",
      onTap: () => Navigation.pop(context),
    );
  }

  @override
  Widget body() {
    /// TODO: When completed it should Undo complete button

    final todoState = ref.watch(taskDetailsProvider.state);

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(height: ListifySize.height(40)),
        TaskDetailsCard(),
        ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: todoState.state.subTask.length,
            itemBuilder: (context, index) {
              return SubTaskCard(key: UniqueKey(), index: index);
            }),
        KTextButton.iconText(
            buttonText: 'Add Task',
            assetIcon: ListifyAssets.add,
            onPressed: () {
              todoState.update((state) {
                state.subTask.add(SubTask());
                return state.copyWith(subTask: state.subTask);
              });
              ref.read(taskDetailsViewControllerProvider).updateSubTask();
            }),
        SizedBox(height: ListifySize.height(90)),
        KFilledButton(
          buttonText: "Complete Task",
          onPressed: () async {
            ref
                .read(taskDetailsViewControllerProvider)
                .completeTask(todoState.state.uid);
            Navigation.pop(context);
          },
        ),
        SizedBox(height: ListifySize.height(22)),
        KOutlinedButton(
          buttonText: "Delete Task",
          textStyle: ListifyTextStyle.buttonText(fontWeight: FontWeight.w500)
              .copyWith(color: ListifyColors.red.withOpacity(0.8)),
          borderColor: ListifyColors.red.withOpacity(0.8),
          onPressed: () async {
            ref
                .read(taskDetailsViewControllerProvider)
                .removeTodo(todoState.state.uid);
            Navigation.pop(context);
          },
        ),
        SizedBox(height: ListifySize.height(90)),
      ],
    );
  }
}
