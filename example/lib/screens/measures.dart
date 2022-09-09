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
              final getmeasrange = await WithingsMeasureGetMeasDataManager(
                      accessToken: accessToken!)
                  .fetch(WithingsMeasureAPIURL.getMeasRange(
                startdate: 1662584112,
                enddate: 1662630912,
                category: 1,
                accessToken: accessToken!,
                meastypes: '135,139', // ? useful
              )) as WithingsMeasureGetMeasData; //Working
            },
            child: Text('GetMeasRange')),
        SizedBox(
          width: 5,
        ),
        ElevatedButton(
            onPressed: () async {
              final getmeasupdate = await WithingsMeasureGetMeasDataManager(
                      accessToken: accessToken!)
                  .fetch(WithingsMeasureAPIURL.getMeasLastupdate(
                lastupdate: 1662389635,
                accessToken: accessToken!,
                //meastypes: '54', // ? useful
              )) as WithingsMeasureGetMeasData; // Working
              //print(getmeasupdate);
            },
            child: Text('GetMeasUpdate')),
        ElevatedButton(
            onPressed: () async {
              final getactivityrange =
                  await WithingsMeasureGetActivityDataManager(
                              accessToken: accessToken!)
                          .fetch(WithingsMeasureAPIURL.getActivityRange(
                              startdateymd: '2022-09-05',
                              enddateymd: '2022-09-05',
                              //dataFields: 'hr_average,hr_zone_0',
                              accessToken: accessToken!))
                      as WithingsMeasureGetActivityData; // Working
              print(getactivityrange);
            },
            child: Text('GetRange activity')),
        SizedBox(
          width: 5,
        ),
        ElevatedButton(
            onPressed: () async {
              final getactivityupate =
                  await WithingsMeasureGetActivityDataManager(
                          accessToken: accessToken!)
                      .fetch(WithingsMeasureAPIURL.getActivityLastupdate(
                lastupdate: 1662335635,
                //dataFields: 'hr_average,hr_zone_0',
                accessToken: accessToken!,
              )) as WithingsMeasureGetActivityData; // Working
              print(getactivityupate);
            },
            child: Text('GetUpdate activity')),
        ElevatedButton(
            onPressed: () async {
              final getintradayactivity =
                  await WithingsMeasureGetIntradayactivityDataManager(
                          accessToken: accessToken!)
                      .fetch(WithingsMeasureAPIURL.getIntradayactivity(
                startdate: 1662584112,
                enddate: 1662630912,
                dataFields: 'spo2_auto',
                accessToken: accessToken!,
              )) as WithingsMeasureGetIntradayactivityData; //Working
            },
            child: Text('GetIntradayActivity')),
        ElevatedButton(
            onPressed: () async {
              final getworkoutrange =
                  await WithingsMeasureGetWorkoutsDataManager(
                              accessToken: accessToken!)
                          .fetch(WithingsMeasureAPIURL.getWorkoutsRange(
                              startdateymd: '2022-09-05',
                              enddateymd: '2022-09-05',
                              accessToken: accessToken!))
                      as WithingsMeasureGetWorkoutsData; // Check
              print(getworkoutrange);
            },
            child: Text('GetWorkoutRange')),
        SizedBox(
          width: 10,
        ),
        ElevatedButton(
            onPressed: () async {
              final getworkoutupdate =
                  await WithingsMeasureGetWorkoutsDataManager(
                              accessToken: accessToken!)
                          .fetch(WithingsMeasureAPIURL.getWorkoutsLastupdate(
                              lastupdate: 1662335635,
                              accessToken: accessToken!))
                      as WithingsMeasureGetWorkoutsData; // Check
              print(getworkoutupdate);
            },
            child: Text('GetWorkoutUpdate')),
      ],
    );
  }
}
