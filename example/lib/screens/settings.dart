import 'package:flutter/material.dart';
import 'package:withings_flutter/withings_flutter.dart';
import '../utils/strings.dart';

class Settings extends StatelessWidget {
  Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
              onPressed: () async {
                // Authorize the app
                List<String?> tokens = await WithingsConnector.authorize(
                    context: context,
                    clientID: Strings.withingsClientID,
                    clientSecret: Strings.withingsClientSecret,
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
      ],
    );
  }
}