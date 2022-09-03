import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:withings_flutter/withings_flutter.dart';
import '../utils/strings.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  static const route = '/';
  static const routename = 'HomePage';

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
                                    '0eb4635c655c091840b537eb694c39aa5b72c695')
                            .fetch(WithingsHeartAPIURL.list(
                                startdate: 1661873383,
                                enddate: 1661884183,
                                accessToken:
                                    '0eb4635c655c091840b537eb694c39aa5b72c695'))
                        as WithingsHeartListData; //working */

                /*final getheartdata = await WithingsHeartGetDataManager(
                        accessToken: '0eb4635c655c091840b537eb694c39aa5b72c695')
                    .fetch(WithingsHeartAPIURL.get(
                  accessToken: '0eb4635c655c091840b537eb694c39aa5b72c695',
                  signalId: 157847052,
                )) as WithingsHeartGetData; //working*/
              },
              child: Text('Test heart'),
            ),
            ElevatedButton(
              onPressed: () async {
                /*final getsleepdata = await WithingsSleepGetDataManager(
                  accessToken: '8a39e1aff6f46539cb0a8b2b2738bb96e03f5acf').fetch(
                    WithingsSleepAPIURL.get(
                      accessToken: '8a39e1aff6f46539cb0a8b2b2738bb96e03f5acf', 
                      enddate: 1661843651, 
                      startdate: 1661825651,
                      dataFields: 'hr',

                    )
                  ) as WithingsSleepGetData;// */

                /*final getsummaryrangesleepdata =
                    await WithingsSleepGetSummaryDataManager(
                            accessToken:
                                'a1f1e1049fcfc9b613b4b6dbaa5f20a5b944a6ce')
                        .fetch(WithingsSleepAPIURL.getSummaryRange(
                  accessToken: 'a1f1e1049fcfc9b613b4b6dbaa5f20a5b944a6ce',
                  dataFields: 'night_events',
                  enddateymd: '2022-08-27',
                  startdateymd: '2022-08-27',
                )) as WithingsSleepGetSummaryData; //working */

                /*final getsummarylastupdatesleepdata =
                    await WithingsSleepGetSummaryDataManager(
                            accessToken:
                                '259d81023dd469c97899c9a8c97545ec48dde810')
                        .fetch(WithingsSleepAPIURL.getSummaryLastupdate(
                  accessToken: '259d81023dd469c97899c9a8c97545ec48dde8100',
                  dataFields: 'hr',
                  lastupdate: 1661908451,
                )) as WithingsSleepGetSummaryData; //working */
              },
              child: Text('Sleep test'),
            ),
          ],
        ),
      ),
    );
  } //build

} //HomePage
