How to Configure a Campaign with ironSource
===========================================

* IronSource, one of Adsforce's integrated partners, providing advertisers with engagement and analytics;

* In addition to click-based performance analysis, IronSource also supports other types of performance analysis such as cost, ad revenue, and view-through.


## IronSource Integration

To configure your campaigns with IronSource, follow the steps below.

Set Up IronSource
-----------------

###### 1. [Login Adsforce](https://demo-portal.adsforce.io/login);

###### 2. Click your App under "My Apps";

&ensp;&ensp;![adsforce](adsforce.png)

###### 3. Under "Configuration" > "Integrated Partner ", search "IronSource" and click "EDIT";

![1](1.png)

###### 4. Go to IronSource's configuration window.

&ensp;&ensp;![configuration](configuration.png)

IronSource's configuration window includes 5 options: `Integration`, `Tracking Link`, `Cost`, `Ad Revenue` and `Deferred Deeplink`.

### IronSource Integration

> **[info] Important**
>
> You can get **Performance Analytics Data** after integration.

![2](2.png)

#### advertiserId

- Adsforce is connected to IronSource via advertiserId and password;
- You need to ask IronSource AM for advertiserId.

#### password

You can get password from IronSource.

Steps to get the password are as follows:

######1. [Login IronSource](https://platform.ironsrc.com/partners/login);

######2.  Select **My Account**;

&ensp;&ensp;![account](account.png)

#####3. Check and get the Advertiser Password under **API**.

&ensp;&ensp;![password](password.png)

#### Enable View-Through Performance Analytics

Toggle this to **ON** if you want to analyze view-through installs from IronSource. 

#### Default Postbacks

* Select `Only event attributed to this partner` for events coming **only** from users attributed to IronSource;
* Select `Event attributed to any partner or oranganic` to have your **entire** user base available to be reported to IronSource.

### Tracking Link

> **[info] Important**
>
> * All parameters added in this page will only generate a **tracking link**;
> * This tracking link is only available for IronSource;
> * You can in-depth analyze your product using the tracking link.


![3](3.png)

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

* The click tracking link will be needed to copy to link to IronSource.

######&ensp;&ensp;&ensp;&ensp;1. Click **Copy Content**;

![click-link](click-link.png)

######&ensp;&ensp;&ensp;&ensp;2. Send the copied link to IronSource.

&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;1) [Login IronSource](https://platform.ironsrc.com/partners/login)；

&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;2) Select Campaigns under **PROMOTE**;

&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;3) Paste the copied link to **Click URL** in Campaigns.

![clickl](clickl.png)

#### Impression Performance Analytics

* Configurable impression performance analytics lookback window allows you to customize the performance analytics period from **impression to app install**;

* Customizable settings 1~23 hours or 1~30 days;

* The time or date set here will be appeared in the tracking link below.

#### Impression Tracking Link

* The link here shows all the setting information;

* Impression Tracking Link can **activate** the ad users viewing the same type of App.

######&ensp;&ensp;&ensp;&ensp;1. Click **Copy Content**;

![show-link](show-link.png)

######&ensp;&ensp;&ensp;&ensp;2. Send the copied link to IronSource.

&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;1）[Login IronSource](https://platform.ironsrc.com/partners/login)；

&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;2）Click Campaigns in **PROMOTE**;

&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;3）Paste the Impression Tracking Link to Impression URL in Campaigns page.

![show](show.png)  

### Cost Configuration

> **[info] Important**
>
> * Your IronSource cost data can be enhanced through cost integration;
> * Make sure you have turned on **Get Cost Data** before enabling IronSource cost data.

![4](4.png)

#### Get Cost Data

To get IronSource cost data, you need to turn on **Get Cost Data**.

### Ad Revenue

> **[info] Important**
>
> * Ad revenue data can be received from IronSource through Ad revenue integration;
> * Make sure you've got your username and App ID before using Ad Revenue.

![5](5.png)

#### Get Ad Revenue Data

Here you can set performance analysis for Ad revenue data.

To get IronSource Ad revenue data, you need to turn on **Get Ad Revenue Data**.

#### User Name

* You can get the username in the account page to verify the API in **Advertising Revenue Report**;

* IronSource automatically will assign a username after the App is created.

  ![user-name](user-name.png)

#### App ID

You can get App ID in **Application Management** page through **APPS** > **APP Mamagement**  to verify the API in **Ads Revenue Report**.

![appkey](appkey.png)

#### Secret Key

* Check and enter **Secret Key** in IronSource;

* You need to ask IronSource AM for Secret Key.

![secretkey](secretkey.png)

