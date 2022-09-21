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

A Flutter package to make your life easier when dealing with Withings APIs.

## Getting started

### Step 1: Install Withings_flutter

To install Withings_flutter, simply add `withings_flutter: ` to the dependencies of your `pubspec.yaml` file: 

```yaml
dependencies:
    withings_flutter: #latest version
```
### Step 1a: (for Android only) Modify you manifest

Withings_flutter uses `flutter_web_auth` to let you authenticate to Withings. In Android, you need to add these lines of code to your `android/app/src/main/AndroidManifest.xml` file:
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

### Step 1b: (for Android only) Requirement: Web Browser

Wthings_flutter uses `flutter_web_auth` to let you authenticate to Withings. In order to let it work correcty please be sure that your emulator or your physical device is using Chrome, Opera, or Firefox as default web browser. 

### Step 2: Test Withings_flutter

Once installed, it is time to test drive Withings_flutter. In this example, we will use Withings_flutter to authenticate our app into Withings APIs and  ... TODO . 

#### Preliminary requirement: Register your app 

To be able to perform any operation with the Withings APIs, you must register first your application in the [developer portal of Withings](https://developer.withings.com/dashboard/) and obtain two IDs, namely the "**Client ID**" and the "**Secret**". To do so, you have to follow these steps.

* Create a Withings developer account, if you do not have one.
* Register a new app at [https://developer.withings.com/dashboard/create](https://developer.withings.com/dashboard/create) and select `Withings Public Cloud`.
  
TODO

## Usage

TODO: Include short and useful examples for package users. Add longer examples
to `/example` folder. 

```dart
const like = 'sample';
```

## Additional information

TODO: Tell users more about the package: where to find more information, how to 
contribute to the package, how to file issues, what response they can expect 
from the package authors, and more.
