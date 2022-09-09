import 'package:flutter/material.dart';
import 'package:withings_flutter/withings_flutter.dart';

class Measures extends StatelessWidget {
  Measures({super.key});

  String? accessToken = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            onPressed: () async {
              final getmeasrange = await WithingsMeasureGetmeasDataManager(
                      accessToken: accessToken!)
                  .fetch(WithingsMeasureAPIURL.getMeasRange(
                startdate: 1662584112,
                enddate: 1662630912,
                category: 1,
                accessToken: accessToken!,
                meastypes: '135,139', // ? useful
              )) as WithingsMeasureGetmeasData; //Working
            },
            child: Text('GetMeasRage')),
        SizedBox(
          width: 5,
        ),
        ElevatedButton(
            onPressed: () async {
              final getmeasupdate = await WithingsMeasureGetmeasDataManager(
                      accessToken: accessToken!)
                  .fetch(WithingsMeasureAPIURL.getMeasLastupdate(
                lastupdate: 1662389635,
                accessToken: accessToken!,
                //meastypes: '54', // ? useful
              )) as WithingsMeasureGetmeasData; // Working
              //print(getmeasupdate);
            },
            child: Text('GetMeasUpdate')),
        ElevatedButton(
            onPressed: () async {
              final getactivityrange =
                  await WithingsMeasureGetactivityDataManager(
                              accessToken: accessToken!)
                          .fetch(WithingsMeasureAPIURL.getActivityRange(
                              startdateymd: '2022-09-05',
                              enddateymd: '2022-09-05',
                              //dataFields: 'hr_average,hr_zone_0',
                              accessToken: accessToken!))
                      as WithingsMeasureGetactivityData; // Working
              print(getactivityrange);
            },
            child: Text('GetRange activity')),
        SizedBox(
          width: 5,
        ),
        ElevatedButton(
            onPressed: () async {
              final getactivityupate =
                  await WithingsMeasureGetactivityDataManager(
                          accessToken: accessToken!)
                      .fetch(WithingsMeasureAPIURL.getActivityLastupdate(
                lastupdate: 1662335635,
                //dataFields: 'hr_average,hr_zone_0',
                accessToken: accessToken!,
              )) as WithingsMeasureGetactivityData; // Working
              print(getactivityupate);
            },
            child: Text('GetUpdate activity')),
        ElevatedButton(
            onPressed: () async {
              final getintradayactivity =
                  await WithingsMeasureGetintradayactivityDataManager(
                          accessToken: accessToken!)
                      .fetch(WithingsMeasureAPIURL.getIntradayactivity(
                startdate: 1662584112,
                enddate: 1662630912,
                dataFields: 'spo2_auto',
                accessToken: accessToken!,
              )) as WithingsMeasureGetintradayactivityData; //Working
            },
            child: Text('getIntradayActivity')),
        ElevatedButton(
            onPressed: () async {
              final getworkoutrange =
                  await WithingsMeasureGetworkoutsDataManager(
                              accessToken: accessToken!)
                          .fetch(WithingsMeasureAPIURL.getWorkoutsRange(
                              startdateymd: '2022-09-05',
                              enddateymd: '2022-09-05',
                              accessToken: accessToken!))
                      as WithingsMeasureGetworkoutsData; // Check
              print(getworkoutrange);
            },
            child: Text('getWorkoutRange')),
        SizedBox(
          width: 10,
        ),
        ElevatedButton(
            onPressed: () async {
              final getworkoutupdate =
                  await WithingsMeasureGetworkoutsDataManager(
                              accessToken: accessToken!)
                          .fetch(WithingsMeasureAPIURL.getWorkoutsLastupdate(
                              lastupdate: 1662335635,
                              accessToken: accessToken!))
                      as WithingsMeasureGetworkoutsData; // Check
              print(getworkoutupdate);
            },
            child: Text('getWorkoutUpdate')),
      ],
    );
  }
}
