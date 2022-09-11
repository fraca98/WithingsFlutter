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
                startdate: 1662857663,
                enddate: 1662882863,
                category: 1,
                accessToken: accessToken!,
                //meastypes: '1', // ? useful
              )) as WithingsMeasureGetMeasData; //Working
              print(getmeasrange);
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
                lastupdate: 1662920834,
                accessToken: accessToken!,
                //meastypes: '11', // ? useful
              )) as WithingsMeasureGetMeasData; // Working
              print(getmeasupdate);
            },
            child: Text('GetMeasUpdate')),
        ElevatedButton(
            onPressed: () async {
              final getactivityrange =
                  await WithingsMeasureGetActivityDataManager(
                              accessToken: accessToken!)
                          .fetch(WithingsMeasureAPIURL.getActivityRange(
                              startdateymd: '2022-09-08',
                              enddateymd: '2022-09-09',
                              //dataFields: 'hr_min',
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
                startdate: 1662738923,
                enddate: 1662746123,
                dataFields: 'heart_rate', // Gives only these value and not all in the response
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
                              startdateymd: '2022-09-09',
                              enddateymd: '2022-09-09',
                              accessToken: accessToken!))
                      as WithingsMeasureGetWorkoutsData; //
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
                              lastupdate: 1662608537,
                              accessToken: accessToken!))
                      as WithingsMeasureGetWorkoutsData; //
              print(getworkoutupdate);
            },
            child: Text('GetWorkoutUpdate')),
      ],
    );
  }
}
