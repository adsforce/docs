# About the SDK

### 1. The download address of SDK ？

<https://github.com/adsforce/sdk-download/archive/master.zip>

### 2. SDK Documentation

iOS: <https://github.com/adsforce/sdk-download/tree/master/ios>

Android: <https://github.com/adsforce/sdk-download/tree/master/android>

Unity: <https://github.com/adsforce/sdk-download/tree/master/unity>

### 3. SDK settings

SDK settings are for advertisers to dock with Adsforce. When creating the application, we will automatically generate new Dev Key, Track host and Android/iOS codes according to each App and copy them to the corresponding App.

#### iOS

```objective-c
// Setting parameters
NSString * devKey = @"your devKey";
NSString * publicKey = @"your publicKey";
NSString * trackUrl = @"your trackUrl";
NSString * channelId = @"your channelId";
NSString * appid = @"your appid";

// init SDK
[
    AdsforceSDK
    initWithDevKey: devKey
    publicKey: publicKey
    trackUrl: trackUrl
    channelId: channelId
    appId: appid
];
```

#### Android

```java
public class MyApplication extends Application {
   @Override
    public void onCreate() {
        super.onCreate();
        AdsforceSdk.initSdk(this,devKey,publicKey,"https://<your_track_host>/","32400");
    }
}
```

