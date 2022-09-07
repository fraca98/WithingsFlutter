import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:withings_flutter/withings_flutter.dart';
import '../utils/strings.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  static const route = '/';
  static const routename = 'HomePage';

  String? accessToken = '34348468631ab3e51079ab806b60a2b59ede49ef';

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
            ElevatedButton(
              onPressed: () async {
                /*final listheartdata =
                    await WithingsHeartListDataManager(
                                accessToken:
                                    accessToken!)
                            .fetch(WithingsHeartAPIURL.list(
                                startdate: 1661873383,
                                enddate: 1661884183,
                                accessToken:
                                    accessToken!))
                        as WithingsHeartListData; //working */

                /*final getheartdata = await WithingsHeartGetDataManager(
                        accessToken: accessToken!)
                    .fetch(WithingsHeartAPIURL.get(
                  accessToken: accessToken!,
                  signalId: 157847052,
                )) as WithingsHeartGetData; //working*/
              },
              child: Text('Heart Test'),
            ),
            ElevatedButton(
              onPressed: () async {
                /*final getsleepdata =
                    await WithingsSleepGetDataManager(accessToken: accessToken!)
                        .fetch(WithingsSleepAPIURL.get(
                  accessToken: accessToken!,
                  startdate: 1662425635,
                  enddate: 1662458035,
                  dataFields: 'hr,rr,snoring',
                )) as WithingsSleepGetData; // */

                /*final getsummaryrangesleepdata =
                    await WithingsSleepGetSummaryDataManager(
                            accessToken:
                                accessToken!)
                        .fetch(WithingsSleepAPIURL.getSummaryRange(
                  accessToken: accessToken!,
                  enddateymd: '2022-09-06',
                  startdateymd: '2022-09-06',
                  dataFields: 'hr_average,hr_max,night_events,remsleepduration'
                )) as WithingsSleepGetSummaryData; //working */

                /*final getsummarylastupdatesleepdata =
                    await WithingsSleepGetSummaryDataManager(
                            accessToken:
                                accessToken!)
                        .fetch(WithingsSleepAPIURL.getSummaryLastupdate(
                  accessToken: accessToken!,
                  dataFields: 'hr',
                  lastupdate: 1662422035,
                )) as WithingsSleepGetSummaryData; //Problem: data now is an array */
              },
              child: Text('Sleep Test'),
            ),
            ElevatedButton(
                onPressed: () async {
                  /*final getactivityrange =
                      await WithingsMeasureGetactivityDataManager(
                                  accessToken: accessToken!)
                              .fetch(WithingsMeasureAPIURL.getActivityRange(
                                  startdateymd: '2022-09-05',
                                  enddateymd: '2022-09-05',
                                  dataFields: 'hr_average,hr_zone_0',
                                  accessToken: accessToken!))
                          as WithingsMeasureGetactivityData; //working */
                  /*final getactivityupate =
                      await WithingsMeasureGetactivityDataManager(
                              accessToken: accessToken!)
                          .fetch(WithingsMeasureAPIURL.getActivityLastupdate(
                    lastupdate: 1662335635,
                    dataFields: 'hr_average,hr_zone_0',
                    accessToken: accessToken!,
                  )) as WithingsMeasureGetactivityData; //working */

                  /*final getintradayactivity =
                      await WithingsMeasureGetintradayactivityDataManager(
                              accessToken: accessToken!)
                          .fetch(WithingsMeasureAPIURL.getIntradayactivity(
                            startdate: 1662389635,
                            enddate: 1662404035,
                    accessToken: accessToken!,
                  )) as WithingsMeasureGetintradayactivityData;
                  print(getintradayactivity.body?.series?.timestamp?.distance); // WIP */

                  /*final getmeasrange = await WithingsMeasureGetmeasDataManager(
                          accessToken: accessToken!)
                      .fetch(WithingsMeasureAPIURL.getMeasRange(
                    startdate: 1662389635,
                    enddate: 1662404035,
                    accessToken: accessToken!,
                    meastypes: '1',
                  )) as WithingsMeasureGetmeasData; //WIP */

                  /*final getmeasupdate = await WithingsMeasureGetmeasDataManager(
                          accessToken: accessToken!)
                      .fetch(WithingsMeasureAPIURL.getMeasLastupdate(
                    lastupdate: 1662389635,
                    accessToken: accessToken!,
                    meastypes: '54',
                  )) as WithingsMeasureGetmeasData; // WIP */

                  /*final getactivityrange =
                      await WithingsMeasureGetworkoutsDataManager(
                                  accessToken: accessToken!)
                              .fetch(WithingsMeasureAPIURL.getWorkoutsRange(
                                  startdateymd: '2022-09-05',
                                  enddateymd: '2022-09-05',
                                  dataFields: 'hr_average,hr_zone_0',
                                  accessToken: accessToken!))
                          as WithingsMeasureGetworkoutsData; // working */
                  /*final getactivityupdate =
                      await WithingsMeasureGetworkoutsDataManager(
                                  accessToken: accessToken!)
                              .fetch(WithingsMeasureAPIURL.getWorkoutsLastupdate(
                                  lastupdate: 1662389635,
                                  dataFields: 'hr_average,hr_zone_0',
                                  accessToken: accessToken!))
                          as WithingsMeasureGetworkoutsData; // working  */
                },
                child: Text('Measures Test'))
          ],
        ),
      ),
    );
  } //build

} //HomePage
