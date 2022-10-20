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
            WithingsCredentials? withingsCredentials =
                await WithingsConnector.authorize(
                    clientID: Strings.withingsClientID,
                    clientSecret: Strings.withingsClientSecret,
                    scope: 'user.activity,user.metrics,user.sleepevents',
                    redirectUri: Strings.withingsRedirectUri,
                    callbackUrlScheme: Strings.withingsCallbackScheme);
            print(withingsCredentials);
          },
          child: Text('Tap to authorize'),
        ),
        ElevatedButton(
          onPressed: () async {
            WithingsCredentials? newWithingsCredentials =
                await WithingsConnector.refreshToken(
                    clientID: Strings.withingsClientID,
                    clientSecret: Strings.withingsClientSecret,
                    withingsRefreshToken: '', //insert here the refresh token
                    );
            print(newWithingsCredentials);
          },
          child: Text('Refresh token'),
        ),
      ],
    );
  }
}
