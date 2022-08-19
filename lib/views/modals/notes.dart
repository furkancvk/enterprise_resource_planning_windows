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
        ? GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemCount: tasks.length,
            itemBuilder: (BuildContext context, index) {
              String createdDate = DateTime.parse(DateTime.now().toString())
                  .toLocal()
                  .toString();
              String date = createdDate.substring(0, createdDate.indexOf(" "));
              String time = createdDate.substring(
                  createdDate.indexOf(" "), createdDate.length - 7);

              return Dismissible(
                  onDismissed: (value) {
                    setState(() {
                      tasks.removeAt(index);
                    });
                  },
                  key: UniqueKey(),
                  child: AlertDialog(
                    content: Container(
                      decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/logo-blue.png',),opacity: 0.1,scale: 0.5)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [

                                  Icon(FluentIcons.calendar_edit_24_regular,size: 24,),
                                  SizedBox(width: 4,),
                                  Text(date),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(FluentIcons.clock_24_regular,size: 24,),
                                  SizedBox(width: 4,),
                                  Text(time),
                                ],
                              ),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      tasks.removeAt(index);
                                    });
                                  },
                                  icon: Icon(FluentIcons.delete_24_regular))
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Divider(
                                thickness: 1,
                                color: AppColors.lightPrimary,
                              ),
                              Text(
                                tasks[index],
                                style: AppText.context,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ));
            },
          )
        : AlertDialog(
            content: Container(
            height: 300,
            width: 300,
            child: Center(
              child: Column(
                children: [
                  Image.asset('assets/images/no-data.png'),
                  Text(
                    "Gösterilecek Not Yok",
                    style: AppText.contextSemiBold,
                  ),
                ],
              ),
            ),
          ));
  }
}
