# How to Configure a Campaign with Adcolony

* Adcolony, one of Adsforce's integrated partners, is a premium video advertising network, providing advertisers with an engaged and responsive audience and offers monetization solutions to publishers and developers;

* In addition to click-based performance analysis, Chartboost s2s also supports other types of performance analysis such as cost, ad revenue, and view-through.

## Adcolony Integration

To configure your campaigns with Adcolony, follow the steps below.

### Set Up Adcolony

##### 1. [Login Adsforce](https://demo-portal.adsforce.io/login);

##### 2. Click your App under "My Apps";

![adsforce](adsforce.png)

##### 3. Under "Configuration" > "Integrated Partner ", search "Adcolony" and click "EDIT";

![1](1.png)

##### 4. Go to **Adcolony**'s configuration window.

![a](a.png)

Adcolony's configuration window includes 5 options: `Integration`, `Tracking Link`, `Cost`, `Ad Revenue` and `Deferred Deeplink`.

### Adcolony Integration

> **[info] Important**
>
> You can get **Performance Analytics Data** after integration.

![2](2.png)

#### SDK key

* Adsforce is connected to Adcolony via SDK key;
* You can get SDK key from Adcolony.

#### Enable View-Through Performance Analytics

Toggle this to **ON** if you want to analyze view-through installs from Adcolony. 

#### Default Postbacks

* Select `Only event attributed to this partner` for events coming **only** from users attributed to Adcolony;
* Select `Event attributed to any partner or oranganic` to have your **entire** user base available to be reported to Adcolony.

### Tracking Link

> **[info] Important**
>
> * All parameters added in this page will only generate a **tracking link**;
> * This tracking link is only available for Adcolony；
> * You can more in-depth analyze your product using the tracking link.

![a3](a3.png)

#### Tracking Link Parameters

* The added parameters will be displayed in the **Tracking link** below;
* You can in-depth analyze your product through adding parameters here;
* Adding and deleting parameters here can redefine the parameters added on the tracking link.

#### Click-Through Performance Analytics

* Configurable click performance analytics lookback window allows you to customize the performance analytics period from **click to app install**;
* Customizable settings 1~23 hours or 1~30 days;
* The time or date set here will appear in the tracking link below.

#### Click Tracking Link

* The link here shows all the setting information;

* The click tracking link will be needed to copy to link to Adcolony.

######&ensp;&ensp;&ensp;&ensp;1. Click **Copy Content**;

![click-link](click-link.png)

######&ensp;&ensp;&ensp;&ensp;2. Send the copied link to Adcolony.

&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;1）[Login Adcolony](https://clients.adcolony.com/login)；

&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;2）Paste the copied link to **Clicks** via<br>&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;**clicking advertising** > **campaign name** > **ad group name**.

![clicklink](clicklink.png)

#### Impression Performance Analytics

* Configurable impression performance analytics lookback window allows you to customize the performance analytics period from **impression to app install**;
* Customizable settings 1~23 hours or 1~30 days;
* The time or date set here will be appeared in the tracking link below.

#### Impression Tracking Link

* The link here shows all the setting information;

* Impression tracking link can **activate** the ad users viewing the same type of App.   

######&ensp;&ensp;&ensp;&ensp;1. Click **Copy Content**;

&ensp; &ensp;![show-link](show-link.png)

######&ensp;&ensp;&ensp;&ensp;2. Send the copied link to Adcolony.

&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;1）[Login Adcolony](https://clients.adcolony.com/login)；

&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;2）Paste the Impression Tracking Link to **Video Starts**<br>&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp; via clicking **advertising** > **campaign name** > **ad group name**.

![showlink](showlink.png)  

### Cost Configuration

* Your Adcolony cost data can be enhanced through cost integration;

* Make sure you have got Adcolony API Key before enabling Adcolony cost data.

![a4](a4.png)

#### Get Cost Data

To get Adcolony cost data, you need to turn on **Get Cost Data**.

#### API key

* API Key is used to verify the API in **Cost Report**;
* The updated data window will take effect until saved.

Refer to the method on getting API as below:

##### 1. Click the settings icon;

##### 2. Select "Account Settings";

![setting](setting.png)

##### 3. Get API key in "Settings" page.

![apikey](apikey.png)

### Ad Revenue

* Ad revenue data can be received from Adcolony through Ad revenue integration;
* Make sure you've got your App ID and API Key before using Ad Revenue.

![a5](a5.png)

#### Get Ad Revenue Data

Here you can set performance analysis for Ad revenue data.

To get Adcolony Ad revenue data, you need to turn on **Get Ad Revenue Data**.

#### App ID

App ID is used to verify the API in **Ads Revenue Report**.

Refer to the method on getting App ID as below:

##### 1. Click "MONETIZATION";

##### 2. Click "Apps";

##### 3. Search for your App or click "+ Setup New App" to create a new App;

![app](app.png)

##### 4. Get App ID in Apps page.

![21](21.png)

#### Enter API Key

See “API Key” in this chapter for details.
