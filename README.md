<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->
# WithingsFlutter
![Pub Likes](https://img.shields.io/pub/likes/withings_flutter?logo=flutter)
![Pub Points](https://img.shields.io/pub/points/withings_flutter?logo=Flutter)
![Pub Popularity](https://img.shields.io/pub/popularity/withings_flutter?logo=Flutter)

A Flutter package to make your life easier when dealing with Withings Web APIs.

# Getting started 

## Step 1: Install WithingsFlutter

To install WithingsFlutter, simply add `withings_flutter: ` to the dependencies of your `pubspec.yaml` file: 

```yaml
dependencies:
    withings_flutter: #latest version
```

### (for Android only) Modify you manifest

WithingsFlutter uses `flutter_web_auth` to let you authenticate to Withings. In Android, you need to add these lines of code to your `android/app/src/main/AndroidManifest.xml` file:
```xml
    <activity android:name="com.linusu.flutter_web_auth.CallbackActivity"
        android:exported="true" >
      <intent-filter android:label="flutter_web_auth">
        <action android:name="android.intent.action.VIEW" />
        <category android:name="android.intent.category.DEFAULT" />
        <category android:name="android.intent.category.BROWSABLE" />
        <data android:scheme="CALLBACK_SCHEME" />
      </intent-filter>
    </activity>
```
and change ```CALLBACK_SCHEME``` with your callback scheme (in the test example below this will be ```example```)

### (for Android only) Requirement: Web Browser

WithingsFlutter uses `flutter_web_auth` to let you authenticate to Withings. In order to let it work correcty please be sure that your emulator or your physical device is using Chrome, Opera, or Firefox as default web browser. 

### (for Web only) Requirement: Create an endpoint

WithingsFlutter uses `flutter_web_auth` to let you authenticate to Withings. In order to let it work correcty, as indicated in [https://pub.dev/packages/flutter_web_auth](https://pub.dev/packages/flutter_web_auth), on the Web platform an endpoint needs to be created that captures the callback URL and sends it to the application using the JavaScript `postMessage()` method. In the `./web` folder of the project, create an HTML file with the name e.g. `auth.html` with content:
```html
<!DOCTYPE html>
<title>Authentication complete</title>
<p>Authentication is complete. If this does not happen automatically, please
close the window.
<script>
  window.opener.postMessage({
    'flutter-web-auth': window.location.href
  }, window.location.origin);
  window.close();
</script>
```
Redirection URL passed to the authentication service must be the same as the URL on which the application is running (schema, host, port if necessary) and the path must point to created HTML file, `/auth.html`in this case. The `callbackUrlScheme` parameter of the `authenticate()` method does not take into account, so it is possible to use a schema for native platforms in the code.

For the Sign in with Apple in web_message response mode, postMessage from [https://appleid.apple.com](https://appleid.apple.com) is also captured, and the authorization object is returned as a URL fragment encoded as a query string (for compatibility with other providers).

## Step 2: Test WithingsFlutter

Once installed, it is time to test drive WithingsFlutter. In this example, we will use WithingsFlutter to authenticate our app into Withings APIs and simply fetch a list of ECG records and Afib classification for a given period of time.
 

### Preliminary requirement: Register your app 

To be able to perform any operation with the Withings APIs, you must register first your application in the developer portal of Withings and obtain two IDs, namely the "**Client ID**" and the "**(Client) Secret**". To do so, you have to follow these steps. 

* Choose the environment on which your applications will be running at [https://developer.withings.com/dashboard/welcome](https://developer.withings.com/dashboard/welcome).
![Withings environment selection](https://raw.githubusercontent.com/fraca98/WithingsFlutter/gh-pages/environment.png)

* Then proceed to create a Withings account, if you do not have one, or login.

* Register a new app at [https://developer.withings.com/dashboard/create](https://developer.withings.com/dashboard/create), pressing on the button "**+ Create an application**".

![Withings create an application](https://raw.githubusercontent.com/fraca98/WithingsFlutter/gh-pages/create.png)
  
* Select the plane of integration and then accept the terms and conditions.

![Withings applicationcreation](https://raw.githubusercontent.com/fraca98/WithingsFlutter/gh-pages/applicationcreation.png)

* Then the following form will appear

![Withings information](https://raw.githubusercontent.com/fraca98/WithingsFlutter/gh-pages/information.png)

* Set the **Application name**
* Set a brief **Application Description** (e.g., "Just a simple test of an awesome package.")
* Set the **Registered URLs** to set the **Callback URLs** (e.g., "example://withings/auth").
* Upload, if you want, your **Project Logo**.
* Press on **Done** button
* In the following page, copy and save the values of the "**Client ID**" and the "**(Client) Secret**" provided by Withings for your app.
* Press on the **Confirm** button and you will see a summary of the info related to your registered app, as:
  * **ClientID**
  * **(Client) Secret**
  * **Callback URL**
  * **API Endpoint**


### App authentication 

You are now ready to authorize your application.

To do that, simply call the asynchronous method `WithingsConnector.authorize()`, within your code, as: 

```dart
WithingsCredentials? withingsCredentials = await WithingsConnector.authorize(
                clientID: Strings.withingsClientID,
                clientSecret: Strings.withingsClientSecret,
                scope: 'user.activity,user.metrics,user.sleepevents',
                redirectUri: Strings.withingsRedirectUri,
                callbackUrlScheme: Strings.withingsCallbackScheme);
```
and set in:
* clientID: the clientID obtained before
* clientSecret: the (Client) Secret obtained before
* scopes: a comma-separated list (of `Strings`) of permission scopes you want to ask your user
* redirectUri: the Callback URL obtained before, in our example `'example://withings/auth'`
* callbackUrlScheme: the callbackUrlScheme, in our example `'example'`

This will open a web view where user will be able to input his Withings credentials and login.
After the login, the web view will close and the method will return a `WithingsCredentials?` instance that contains the credentials to be used to make requests to the Withings Web API via `withings_flutter`. In particular, `withingsCredentials.userID` contains the Withings user id of the user that just authorized `withings_flutter`, `withingsCredentials.withingsAccessToken` contains the Withings access token, `withingsCredentials.withingsRefreshToken` contains the Withings refresh token and `withingsCredentials.expires` defines the access token expiry delay in seconds.

> :warning: The credentials are not stored automatically somewhere in a persistent way. You must manage such crendentials according to your strategy.

### Fetch a list of ECG records and Afib classification for a given period of time

With your app authorized, you are now ready to fetch data from Withings. In this example, we will [fetch a list of ECG records and Afib classification for a given period of time](https://developer.withings.com/api-reference/#operation/heartv2-list).

Using WithingsFlutter, this is very easy. First instanciate a `WithingsHeartListDataManager` :

```dart
WithingsHeartListDataManager withingsHeartListDataManager =
    WithingsHeartListDataManager();
```

Then fetch the desired data using the `fetch` method of `WithingsHeartListDataManager` with the proper `WithingsHeartAPIURL`:

```dart
WithingsHeartListData listheartdata = await withingsHeartListDataManager
        .fetch(WithingsHeartAPIURL.list(accessToken: withingsCredentials.accessToken));
```

That's it!

# Documentation & Guides
For more docs and guides please refer to [https://fraca98.github.io/WithingsFlutter/](https://fraca98.github.io/WithingsFlutter/)

# Support
Feel free to support my job :smile:
