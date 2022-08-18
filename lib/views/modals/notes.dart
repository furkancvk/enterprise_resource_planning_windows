import 'package:erp_windows/design/app_colors.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../design/app_text.dart';
import '../../states/states.dart';

class NotePad extends StatefulWidget {
  NotePad({Key? key}) : super(key: key);

  @override
  State<NotePad> createState() => _NotePadState();
}

class _NotePadState extends State<NotePad> {
  @override
  Widget build(BuildContext context) {
    List tasks = Provider.of<States>(context).tasks;
    String input = Provider.of<States>(context).input;

    return tasks.length != 0
        ? ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (BuildContext context, index) {
              return Dismissible(
                onDismissed: (value) {
                setState(() {
                  tasks.removeAt(index);
                });
              },
                  key: Key(tasks[index]),
                  child: Card(
                    color: AppColors.lightSecondary,
                    elevation: 4,
                    margin: EdgeInsets.all(4),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                    child: ListTile(
                      title: Text(
                        tasks[index],
                        style: AppText.context,
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          FluentIcons.delete_24_regular,
                        ),
                        onPressed: () {
                          setState(() {
                            tasks.removeAt(index);
                          });
                        },
                      ),
                    ),
                  )

              );

            },
          )
        : AlertDialog(
            content: Container(
            height: 50,
            width: 50,
            child: Center(
              child: Text(
                "Gösterilecek Not Yok",
                style: AppText.contextSemiBold,
              ),
            ),
          ));
  }
}
