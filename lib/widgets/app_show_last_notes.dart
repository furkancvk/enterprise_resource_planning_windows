import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../design/app_colors.dart';
import '../design/app_text.dart';
import '../states/states.dart';

class AppShowNotes extends StatefulWidget {
  const AppShowNotes({Key? key}) : super(key: key);

  @override
  State<AppShowNotes> createState() => _AppShowNotesState();
}

String createdDate =
    DateTime.parse(DateTime.now().toString()).toLocal().toString();
String date = createdDate.substring(0, createdDate.indexOf(" "));
String time =
    createdDate.substring(createdDate.indexOf(" "), createdDate.length - 7);

class _AppShowNotesState extends State<AppShowNotes> {
  @override
  Widget build(BuildContext context) {
    Function setTasks = Provider.of<States>(context).setTasks;

    List tasks = Provider.of<States>(context).tasks;
    return Column(
      children: [
        Dismissible(
            key: UniqueKey(),
            onDismissed: (value) {
              setState(() {
                tasks.removeAt(tasks.length - 1);
                setTasks(tasks);
              });
            },
            child: Builder(builder: (BuildContext context) {
              return tasks.isNotEmpty
                  ? Container(
                      width: MediaQuery.of(context).size.width,
                      height: 192,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: AssetImage('assets/images/logo-blue.png'),
                            opacity: 0.1),
                        color: AppColors.lightGrey,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      FluentIcons.calendar_edit_24_regular,
                                      size: 16,
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Text(date),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      FluentIcons.clock_24_regular,
                                      size: 16,
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Text(time),
                                  ],
                                ),
                              ],
                            ),
                            const Divider(
                              thickness: 1,
                              color: AppColors.lightPrimary,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                tasks[tasks.length - 1],
                                style: AppText.labelSemiBold,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  : Container();
            })),
        const SizedBox(
          height: 16,
        ),
        Dismissible(
            key: UniqueKey(),
            onDismissed: (value) {
              setState(() {
                tasks.removeAt(tasks.length - 2);
                setTasks(tasks);
              });
            },
            child: Builder(builder: (BuildContext context) {
              return tasks.length > 1
                  ? Container(
                      width: MediaQuery.of(context).size.width,
                      height: 192,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                            image:  AssetImage('assets/images/logo-blue.png'),
                            opacity: 0.1),
                        color: AppColors.lightGrey,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      FluentIcons.calendar_edit_24_regular,
                                      size: 16,
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Text(date),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      FluentIcons.clock_24_regular,
                                      size: 16,
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Text(time),
                                  ],
                                ),
                              ],
                            ),
                            const Divider(
                              thickness: 1,
                              color: AppColors.lightPrimary,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                tasks[tasks.length - 2],
                                style: AppText.labelSemiBold,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  : Container();
            })),
      ],
    );
  }
}
