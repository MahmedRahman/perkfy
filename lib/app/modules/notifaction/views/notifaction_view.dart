import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:get/get.dart';
import 'package:perkfy/shared/string.dart';

import '../controllers/notifaction_controller.dart';

import 'package:intl/intl.dart';



class NotifactionView extends GetView<NotifactionController> {
  NotifactionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        centerTitle: true,
      ),
      body: controller.obx(
        (data) {
          return ListView(
            children: List.generate(
              (data as List).length,
              (index) {
                return Slidable(
                  endActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (context) {
                          controller.deleteNotifactionById(
                            id: data.elementAt(index)["id"].toString(),
                          );
                        },
                        backgroundColor: Color(0xFFFE4A49),
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        label: 'Delete',
                      ),
                    ],
                  ),

                  // The end action pane is the one at the right or the bottom side.

                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data.elementAt(index)["message"].toString(),
                          style: TextStyle(
                            fontFamily: 'Metropolis',
                            fontSize: 15.0,
                            height: 1.2,
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            Text(
                              data.elementAt(index)["createdDate"].toString().toCustomDateFormat(),
                              style: TextStyle(
                                fontSize: 11.0,
                                color: Color(0xffA0A0A0),
                              ),
                            ),
                            Spacer(),
                            Text(
                              'View more',
                              style: TextStyle(
                                fontFamily: 'Metropolis',
                                fontSize: 13.0,
                                color: Colors.black,
                                decoration: TextDecoration.underline,
                              ),
                              textAlign: TextAlign.right,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
        onEmpty: Container(
          child: Center(
            child: Text(
              "No Notifications",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
        onError: (error) {
          return Container(
            child: Text(error.toString()),
          );
        },
      ),
    );
  }
}

// Obs((snapshot) {
//         return ListView(
//           children: [],
//         );
//       }