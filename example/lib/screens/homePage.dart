import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:withings_flutter/withings_flutter.dart';
import '../utils/strings.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  static const route = '/';
  static const routename = 'HomePage';

  String? accessToken = '6fafd25e5710bc4337e6599f6ff69991527a6fe3';

  @override
  Widget build(BuildContext context) {
    print('${HomePage.routename} built');
    return Scaffold(
      appBar: AppBar(
        title: Text(HomePage.routename),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                // Authorize the app
                List<String?> tokens = await WithingsConnector.authorize(
                    context: context,
                    clientID: Strings.withingsClientID,
                    clientSecret: Strings.withingsClientSecret,
                    state: 'state',
                    scope: 'user.activity,user.metrics,user.sleepevents',
                    redirectUri: Strings.withingsRedirectUri,
                    callbackUrlScheme: Strings.withingsCallbackScheme);
                print(tokens);
                accessToken = tokens[0];
              },
              child: Text('Tap to authorize'),
            ),
            ElevatedButton(
              onPressed: () async {
                List<String?> refTokens = await WithingsConnector.refreshToken(
                    clientID: Strings.withingsClientID,
                    clientSecret: Strings.withingsClientSecret,
                    WithingsRefreshToken: '...');
                print(refTokens);
              },
              child: Text('Refresh token'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    final listheartdata = await WithingsHeartListDataManager(
                                accessToken: accessToken!)
                            .fetch(WithingsHeartAPIURL.list(
                                startdate: 1661873383,
                                enddate: 1661884183,
                                accessToken: accessToken!))
                        as WithingsHeartListData; //Working */
                  },
                  child: Text('List Heart'),
                ),
                SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    final getheartdata = await WithingsHeartGetDataManager(
                            accessToken: accessToken!)
                        .fetch(WithingsHeartAPIURL.get(
                      accessToken: accessToken!,
                      signalId: 157847052,
                    )) as WithingsHeartGetData; //Working */
                  },
                  child: Text('Get Heart'),
                ),
              ],
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () async {
                    final getsleepdata = await WithingsSleepGetDataManager(
                            accessToken: accessToken!)
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
                                    accessToken: accessToken!,
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
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () async {
                      final getmeasrange =
                          await WithingsMeasureGetmeasDataManager(
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
                      final getmeasupdate =
                          await WithingsMeasureGetmeasDataManager(
                                  accessToken: accessToken!)
                              .fetch(WithingsMeasureAPIURL.getMeasLastupdate(
                        lastupdate: 1662389635,
                        accessToken: accessToken!,
                        //meastypes: '54', // ? useful
                      )) as WithingsMeasureGetmeasData; // Working
                      //print(getmeasupdate);
                    },
                    child: Text('GetMeasUpdate')),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                              .fetch(
                                  WithingsMeasureAPIURL.getActivityLastupdate(
                        lastupdate: 1662335635,
                        //dataFields: 'hr_average,hr_zone_0',
                        accessToken: accessToken!,
                      )) as WithingsMeasureGetactivityData; // Working
                      print(getactivityupate);
                    },
                    child: Text('GetUpdate activity')),
              ],
            ),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                                  .fetch(WithingsMeasureAPIURL
                                      .getWorkoutsLastupdate(
                                          lastupdate: 1662335635,
                                          accessToken: accessToken!))
                              as WithingsMeasureGetworkoutsData; // Check
                      print(getworkoutupdate);
                    },
                    child: Text('getWorkoutUpdate')),
              ],
            )
          ],
        ),
      ),
    );
  } //build

} //HomePage
