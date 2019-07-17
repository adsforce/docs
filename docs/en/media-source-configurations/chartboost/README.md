# How to Configure a Campaign with Chartboost s2s

* Chartboost s2s, one of Adsforce's integrated partners, providing advertisers with data analysis and advertising;
* In addition to click-based performance analysis, Chartboost s2s also supports other types of performance analysis such as cost, ad revenue, and view-through.


## Chartboost s2s Integration

To configure your campaigns with Chartboost s2s, follow the steps below.

### Set Up Chartboost s2s

##### 1. [Login Adsforce](https://demo-portal.adsforce.io/login);

##### 2. Click your App under "My Apps";

![adsforce](adsforce.png)

##### 3. Under "Configuration" > "Integrated Partner ", search "Chartboost s2s" and click "EDIT";

![1](1.png)

#####4. Go to **Chartboost s2s**' configuration window.

![configuration](configuration.png)

Chartboost s2s' configuration window includes 5 options: `Integration`, `Tracking Link`, `Cost`, `Ad Revenue` and `Deferred Deeplink`.

### Chartboost s2s Integration

> **[info] Important**
>
> You can get **Performance Analytics Data** after integration.

![2](2.png)

#### Chartboost s2s App ID

* You can get Chartboost s2s App ID from Chartboost s2s;

* Adsforce is connected to Chartboost s2s via App ID.

  Steps to get App ID are as follows:

######&ensp;&ensp;&ensp;&ensp;1. [Login Chartboost](https://dashboard.chartboost.com/login);

######&ensp;&ensp;&ensp;&ensp;2. Get App ID in **App Settings** > **Basic Settings**.

![img](appid.png)

#### Chartboost s2s_signature

* You can get Chartboost s2s_signature from Chartboost s2s;

* Adsforce is connected to Chartboost s2s via Chartboost s2s_signature.

  Steps to get the Chartboost s2s_signature are as follows:

######&ensp;&ensp;&ensp;&ensp;1. [Login Chartboost](https://dashboard.chartboost.com/login);

######&ensp;&ensp;&ensp;&ensp;2. Get App Signature in **App Settings** > **Basic Settings**.

![img](appsignature.png)

#### Enable View-Through Performance Analytics

Toggle this to **ON** if you want to analyze view-through installs from Chartboost s2s. 

#### Default Postbacks

* Select `Only event attributed to this partner` for events coming **only** from users attributed to Chartboost s2s;
* Select `Event attributed to any partner or oranganic` to have
  your **entire** user base available to be reported to Chartboost s2s.

### Tracking Link

* All parameters added in this page will only generate a **tracking link**;

* This tracking link is only available for Chartboost s2s；

* You can in-depth analyze your product using the tracking link.



![c3](c3.png)

#### Tracking Link Parameters

* The added parameters will be displayed in the **Tracking link** below;

* You can in-depth analyze your product through adding parameters here;

* Adding and deleting parameters here can redefine the parameters added on the tracking link.

#### Click-Through Performance Analytics

* Configurable click performance analytics lookback window allows you to customize the performance analytics period from **click to App install**;

* Customizable settings 1~23 hours or 1~30 days;

* The time or date set here will appear in the tracking link below.

#### Click Tracking Link

* The link here shows all the setting information;
* The click tracking link will be needed to copy to link to Chartboost.

######&ensp;&ensp;&ensp;&ensp;1. Click **Copy Content**;

![click-link](click-link.png)

######&ensp;&ensp;&ensp;&ensp;2. Send the copied link to Chartboost s2s.

&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;1）[Login Chartboost](https://dashboard.chartboost.com/login)；

&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;2）Select **App Settings** > **Basic Settings**;

&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;3）Paste the copied link to **Click Callback** in **Advanced Settings** page.

![img](clicklink.png)

#### Impression Performance Analytics

* Configurable impression performance analytics lookback window allows you to customize the performance analytics period from **impression to app install**;

* Customizable settings 1~23 hours or 1~30 days;

* The time or date set here will be appeared in the tracking link below.

#### Impression Tracking Link

* The link here shows all the setting information;
* Impression tracking link can **activate** the ad users viewing the same type of App.

######&ensp;&ensp;&ensp;&ensp;1. Click **Copy Content**;

![copyshowlink](copyshowlink.png)

######&ensp;&ensp;&ensp;&ensp;2. Send the copied link to Chartboost s2s.

&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;1）[Login Chartboost](https://dashboard.chartboost.com/login);

&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;2）Select **App Settings** > **Basic Settings**;

&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;3）Paste the copied link to **Completed View Callback** in **Advanced Settings** page.

![showlink](showlink.png)

### Cost Configuration

* Your Chartboost s2s cost data can be enhanced through cost integration;

* Make sure you have got API Key for Chartboost s2s before enabling Chartboost s2s cost data.

![c4](c4.png)

#### Get Cost Data

To get Chartboost s2s cost data, you need to turn on **Get Cost Data**.

### Ad Revenue

* Ad revenue data can be received from Chartboost s2s through Ad revenue integration;

* Make sure you've got your User ID and App ID before enabling Chartboost s2s Ad Revenue.

![c5](c5.png)

#### Get Ad Revenue Data

Here you can set performance analysis for Ad revenue data.

To get Chartboost Ad revenue data, you need to turn on **Get Ad Revenue Data**.

#### User ID

Get the user ID via Chartboost Dashboard > **Tools** > **API Explorer**, which is used to verify the API in **Ads Revenue Report**.

![id](id.png)

#### App ID

Get the App ID via Chartboost Dashboard > **App Settings** > **Basic Settings** to verify the API in **Ads Revenue Report**.

![appid](appid.png)

#### User Signature

Check and enter user signature via Chartboost Dashboard > Tools > API Explorer.

![signature](signature.png)
