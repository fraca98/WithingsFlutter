import 'package:flutter/material.dart';
import 'package:withings_flutter/withings_flutter.dart';

class Heart extends StatelessWidget {
  Heart({super.key});

  String? accessToken = ''; //put here the accessToken from WithingsCredentials

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () async {
            WithingsHeartListDataManager withingsHeartListDataManager =
                WithingsHeartListDataManager();
            WithingsHeartAPIURL withingsHeartAPIURLList =
                WithingsHeartAPIURL.list(
              accessToken: accessToken!,
              //startdate: , //Not necessary: UNIX Timestamp startdate
              //enddate: , //Not necessary: UNIX Timestamp enddate
              //offset: , //Not necessary: use it if in the previous response more = true and insert here the value of offset
            );
            WithingsHeartListData listheartdata =
                await withingsHeartListDataManager
                    .fetchAutoOffset(withingsHeartAPIURLList);
            print(listheartdata);
          },
          child: Text('List Heart'),
        ),
        SizedBox(
          width: 20,
        ),
        ElevatedButton(
          onPressed: () async {
            WithingsHeartGetDataManager withingsHeartGetDataManager =
                WithingsHeartGetDataManager();
            WithingsHeartAPIURL withingsHeartAPIURLget =
                WithingsHeartAPIURL.get(
              accessToken: accessToken!,
              signalId: 157847052,
            );
            WithingsHeartGetData getheartdata =
                await withingsHeartGetDataManager.fetch(withingsHeartAPIURLget);
            print(getheartdata);
          },
          child: Text('Get Heart'),
        ),
      ],
    );
  }
}
