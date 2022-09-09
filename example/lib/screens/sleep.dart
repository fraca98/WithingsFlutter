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
              startdate: 1662425635,
              enddate: 1662458035,
              dataFields: 'hr,rr,snoring,sdnn_1',
            )) as WithingsSleepGetData; // */
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
                            accessToken: 'accessToken!',
                            startdateymd: '2022-09-06',
                            enddateymd: '2022-09-08',
                            dataFields:
                                'hr_average,hr_max,night_events,remsleepduration'))
                    as WithingsSleepGetSummaryData; //Working */
          },
          child: Text('GetSumRan Sleep'),
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
            )) as WithingsSleepGetSummaryData; //Working */
          },
          child: Text('GetSumUp Sleep'),
        ),
      ],
    );
  }
}
