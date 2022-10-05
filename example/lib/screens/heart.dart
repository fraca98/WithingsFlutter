import 'package:flutter/material.dart';
import 'package:withings_flutter/withings_flutter.dart';

class Heart extends StatelessWidget {
  Heart({super.key});

  String? accessToken =
      'd1bded114d610f1750cc7faeec11ebf197008c51'; //put here the accessToken from WithingsCredentials

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () async {
            final listheartdata = await WithingsHeartListDataManager().fetch(
              WithingsHeartAPIURL.list(
                  //startdate: 1661873383,
                  //enddate: 1661884183,
                  accessToken: accessToken!),
            ) as WithingsHeartListData; //Working */
            print(listheartdata);
          },
          child: Text('List Heart'),
        ),
        SizedBox(
          width: 20,
        ),
        ElevatedButton(
          onPressed: () async {
            final getheartdata = await WithingsHeartGetDataManager()
                .fetch(WithingsHeartAPIURL.get(
              accessToken: accessToken!,
              signalId: 157847052,
            )) as WithingsHeartGetData; //Working */
            print(getheartdata);
          },
          child: Text('Get Heart'),
        ),
      ],
    );
  }
}
