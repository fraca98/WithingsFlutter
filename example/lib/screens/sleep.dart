import 'package:flutter/material.dart';
import 'package:withings_flutter/withings_flutter.dart';

class Sleep extends StatelessWidget {
  Sleep({super.key});

  String? accessToken = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () async {
            final getsleepdata =
                await WithingsSleepGetDataManager(accessToken: 'accessToken!')
                    .fetch(WithingsSleepAPIURL.get(
              accessToken: accessToken!,
              startdate: 1662854063,
              enddate: 1662900863,
              dataFields: 'hr,rr,snoring,sdnn_1,rmssd',
            )) as WithingsSleepGetData; //
            print(getsleepdata);
          },
          child: Text('Get Sleep'),
        ),
        SizedBox(
          width: 5,
        ),
        ElevatedButton(
          onPressed: () async {
            final getsummaryrangesleepdata =
                await WithingsSleepGetSummaryDataManager(
                        accessToken: accessToken!)
                    .fetch(WithingsSleepAPIURL.getSummaryRange(
              accessToken: accessToken!,
              startdateymd: '2022-09-06',
              enddateymd: '2022-09-10',
              //dataFields:'hr_average,hr_max,night_events,remsleepduration', //necessary?
            )) as WithingsSleepGetSummaryData; //Working
            print(getsummaryrangesleepdata);
          },
          child: Text('GetSummaryRange Sleep'),
        ),
        SizedBox(
          width: 5,
        ),
        ElevatedButton(
          onPressed: () async {
            final getsummarylastupdatesleepdata =
                await WithingsSleepGetSummaryDataManager(
                        accessToken: accessToken!)
                    .fetch(WithingsSleepAPIURL.getSummaryLastupdate(
              accessToken: accessToken!,
              lastupdate: 1662422035,
            )) as WithingsSleepGetSummaryData; //Working
            print(getsummarylastupdatesleepdata);
          },
          child: Text('GetSummaryUpdate Sleep'),
        ),
      ],
    );
  }
}
