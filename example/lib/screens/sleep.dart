import 'package:flutter/material.dart';
import 'package:withings_flutter/withings_flutter.dart';

class Sleep extends StatelessWidget {
  Sleep({super.key});

  String? accessToken = ''; //put here the accessToken from WithingsCredentials

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () async {
            WithingsSleepGetDataManager withingsSleepGetDataManager =
                WithingsSleepGetDataManager();
            WithingsSleepAPIURL withingsSleepAPIURLGet =
                WithingsSleepAPIURL.get(
                    startdate: 1662854063,
                    enddate: 1662900863,
                    dataFields: 'hr,rr,snoring,sdnn_1,rmssd',
                    accessToken: accessToken!);
            WithingsSleepGetData getsleepdata =
                await withingsSleepGetDataManager.fetch(withingsSleepAPIURLGet);
            print(getsleepdata);
          },
          child: Text('Get Sleep'),
        ),
        SizedBox(
          width: 5,
        ),
        ElevatedButton(
          onPressed: () async {
            WithingsSleepGetSummaryDataManager
                withingsSleepGetSummaryDataManager =
                WithingsSleepGetSummaryDataManager();
            WithingsSleepAPIURL withingsSleepAPIURLGetSummaryRange =
                WithingsSleepAPIURL.getSummaryRange(
              offset: 2,
              accessToken: accessToken!,
              startdateymd: '2022-09-06',
              enddateymd: '2022-09-10',
              //dataFields:'hr_average,hr_max,night_events,remsleepduration', //necessary?
            );
            WithingsSleepGetSummaryData getsummaryrangesleepdata =
                await withingsSleepGetSummaryDataManager
                    .fetch(withingsSleepAPIURLGetSummaryRange); //Working
            print(getsummaryrangesleepdata);
          },
          child: Text('GetSummaryRange Sleep'),
        ),
        SizedBox(
          width: 5,
        ),
        ElevatedButton(
          onPressed: () async {
            WithingsSleepGetSummaryDataManager
                withingsSleepGetSummaryDataManager =
                WithingsSleepGetSummaryDataManager();
            WithingsSleepAPIURL withingsSleepAPIURLGetSummaryLastUpdate =
                WithingsSleepAPIURL.getSummaryLastupdate(
              lastupdate: 1662422035,
              accessToken: accessToken!,
              //dataFields:'hr_average,hr_max,night_events,remsleepduration', //necessary?
            ); //Working
            WithingsSleepGetSummaryData getsummarylastupdatesleepdata =
                await withingsSleepGetSummaryDataManager
                    .fetch(withingsSleepAPIURLGetSummaryLastUpdate); //Working
            print(getsummarylastupdatesleepdata);
          },
          child: Text('GetSummaryUpdate Sleep'),
        ),
      ],
    );
  }
}
