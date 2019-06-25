# Adsforce Unity SDK 集成


|                                                              |                                                              |
| :----------------------------------------------------------: | :----------------------------------------------------------: |
| <img src="android-ios.png" alt="drawing" style="width:300px;"/> | <img src="logo.png" alt="drawing" style="width:100px;"/> <br><br>当前版本：<span style="color: blue;">v1109</span>（[发布说明](/sdk-integrations/quick-start/Changelog/README.md)） |


## 概述
Adsforce SDK 为 Android 和 iOS 提供移动应用安装和事件跟踪功能。

可追踪安装和更新，以及跟踪安装后事件（包括内购等），以评估投资回报率和用户参与度。

在 Unity 平台上开发的移动应用程序可一次性集成 Adsforce SDK，并跟踪Android 和 iOS类应用程序。以下指南详细介绍了如何将 Adsforce SDK 集成到适用于 iOS 和 Android 应用的 Unity 代码中。

## 快速开始

### 下载 adsforce_unity.unitypackage 文件

有关 Adsforce Unity 插件的集成说明如下所示。

### 安装插件
安装 Adsforce 插件方法如下：

1. 将 adsforce_unity.unitypackage 导入 Unity 项目中；
2. 在 Assets > Import Package > Custom Package 中，选择
   adsforce_unity.unitypackage 文件。

## SDK 初始化
1. 在**[Adsforce](https://tmp-portal.adsforce.io/login)**上[创建应用](../../../get-started/Add-Apps/README.md)；

2. 并在所创建的 SDK 配置页面获取 SDK 配置参数（以Andriod应用为例）；

   1）单击选择需配置的应用；

   ![SDK1](SDK1.png)

   2）单击“集成 > SDK 配置”；

   ![SDK2](SDK2.png)

   3）在 SDK 配置页面，获取`devKey`、`publicKey`、`trackUrl`、`channelId`和`appid`参数。

   ![SDK3](SDK3.png)



3. 在 Start / Init 方法中，设置 your_dev_key、your_public_key、your_track_host、your_channel_id 和 iTunes 使用的唯一的应用 ID。

```
 **示例代码：**

void Start () {
#if UNITY_IOS && !UNITY_EDITOR
    AdsforceApi.initAdsforceSDK ("<your_dev_key>", "<your_public_key>",
"<your_track_host>", "<your_channel_id>", "<your_appid>");

#elif UNITY_ANDROID && !UNITY_EDITOR
    AdsforceApi.initAdsforceSDK ("<your_dev_key>","<your_public_key>",
    "<your_track_host>", "<your_channel_id>", "");

#endif
}
```

## 追踪收入

### Android IAP
如内购使用 google 支付，可调用以下方法生成此支付报告。
```
/**
 * In-app purchase record(Google-certified)
 *
 * @param price          Payment amount, recommended to take from the 'price' field of skudetail, can not be empty
 * @param currency       Payment currency，Payment amount, recommended to take from the 'price_currency_code' field of skudetail, can not be empty
 * @param publicKey      Public key of Google payment，can not be empty
 * @param dataSignature  Signature verification from GP payment, get from Purchase.getSignature()，can not be empty
 * @param purchaseData   Signature verification from GP payment, get from Purchase.getOriginalJson()，can not be empty
 * @param map            Other map, can be empty
 */

 AdsforceApi.googleZFReportWithProductPrice(string price, string currency, string publicKey, string dataSignature, string purchaseData, Dictionary<string, string> map)
```

### iOS IAP
如内购使用 appstore 支付，可调用以下方法生成此支付报告。
```
/**
 * In-app purchase record(iOS)
 *
 * @param productPrice          such as 6.00

 * @param productCurrencyCode   such as CNY
 * @param receiptDataString     such as your receipt data string 
 * @param pubkey                such as 48a07332496a4bcb9eea4d32e1234582(if subscription                                 is included, please ask the PM for PubKey; 
                                Or you can fill in nill)
 * @param map                   Other map, can be empty
 */

AdsforceApi.appStoreWithProductPrice(string productPrice, string productCurrencyCode, string receiptDataString, string pubkey, Dictionary<string, string> map)
```

### 第三方 IAP
如内购使用第三方支付，可调用以下方法生成此支付报告。
```
/**
 * In-app purchase record(custom)
 *
 * @param price        Payment amount, recommended to take from the 'price' field of skudetail, can not be empty
 * @param currency     Payment currency，Payment amount, recommended to take from the 'price_currency_code' field of skudetail, can not be empty
 * @param productId    Id of product，recommended to take from the 'productId' field of skudetail，can not be empty
 * @param productType  Type of product，recommended to take from the 'type' field of skudetail，can not be empty
 */

 AdsforceApi.thirdZFReportWithProductPrice(string price, string currency, string productId, string productType)
```

## 跟踪应用内事件
可生成应用程序中发生的自定义事件报告。
如需报告自定义事件，则应首先打开自定义事件报告控制器。

> **[warning] 注意**
>
> 默认情况下，自定义事件报告控制器被禁用。
```java
AdsforceApi.enableCustomerEvent(true);
```

如无需报告自定义事件，可禁用自定义报告器。

```java
AdsforceApi.enableCustomerEvent(false);
```

可根据报告的参数类型，选择以下三种方法中的任意一种进行报告。

```
/**
 * Custom event report
 *
 * @param key   Key of event
 * @param value Data for reproting
 */
AdsforceApi.customerEventWithValue(string key, string value);

/**
 * Custom event report
 *
 * @param key  Key of event
 * @param list Use Arraylist for reproting
 */
AdsforceApi.customerEventWithList(string key, List<string> list);

/**
 * Custom event report
 *
 * @param key Key of event
 * @param map Use HashMap for reproting
 */
AdsforceApi.customerEventWithMap(string key, Dictionary<string, string> dic);
```

## 追踪深度链接
如需了解深度链接信息，可在初始化后调用以下代码来获取用户的深度链接信息。
```
Action<AdsforceDeepLinkBean> callback = new Action<AdsforceDeepLinkBean> (deeplinkCallback);
AdsforceApi.getDeepLink (callback);
```

## 设置 AndroidId（仅限 android）
为确保数据的准确性，请保证用户隐私安全，并调用以下方法将AndroidId传递给我们。
```
AdsforceApi.setAndroidId(string AndroidId);

```
