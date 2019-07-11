# UnityAds 追踪配置

* UnityAds 是 Adsforce 的集成合作伙伴之一，为广告主提供于 iOS 和 Android 的视频推广；

* 除点击效果分析外，UnityAds 成本、广告收益和曝光效果分析。

## UnityAds 追踪配置

  如需配置 UnityAds，请按以下步骤操作。

### 打开 **UnityAds** 配置窗口

  1. [登录 Adsforce 应用](<https://demo-portal.adsforce.io/login>)；

  2. 在“我的应用”列表项下，单击并选择需配置的应用程序；

     ![adsforce](adsforce.png)

  3. 在“配置管理” > “媒体平台”配置页面，搜索 “UnityAds”并点击“编辑”；

     ![1](1.png)

  5. 进入 **UnityAds** 配置窗口。


![configuration](configuration.png)

UnityAds 配置窗口包括 5 个选项：`渠道对接`、`追踪链接`、`成本`、`广告收益`和`延迟深度链接`      

### 渠道对接配置

> **[info] 重要信息**
> 
> * 渠道对接完成后，便可获取**广告效果分析数据**；
> * IDFA 须包含在您的应用中才能成功跟踪 UnityAds 效果分析；
> * 请确保在集成参数部分中正确配置了 UnityAds 游戏 ID；
> * 可在 UnityAds [信息中心](https://unityads.unity3d.com/admin/#/games)获取游戏 ID；
> * 激活后，UnityAds 会要求我们向他们发送通知，详细说明每个应用安装的设备 ID；
> * 有关更多详细信息，请参阅 UnityAds 的隐私政策。

![2](2.png) 

#### UnityAds Game ID

* Adsforce 是通过 UnityAds Game ID 与 UnityAds 连接；
* **UnityAds Game ID** 需从 UnityAds 中获取。

在 [UnityAds](https://unityads.unity3d.com/admin/#/games) 配置页面，通过 “Acquire” > “Campaigns” 可获取 Game ID。

![gameid](gameid.png)

#### 启用曝光效果分析

如需属性为 UnityAds 的曝光安装。请将此选项切换为 **ON**。

#### 默认回传链接

* 如**仅回传** UnityAds 中的效果分析数据，请选择 “Only event attributed to this partner”；

* 如**回传所有**合作平台效果分析数据，请选择 “Event attributed to any partner or oranganic”。

### 追踪链接

* 在此界面添加的所有参数只会生成一条**追踪链接**；

* 此追踪链接仅适用于 UnityAds；

* 使用追踪链接可以对您的产品进行更深入的分析研究。

![3](3.png) 

#### 追踪链接参数

* 添加的参数将会**在下方**追踪链接中显示；

* 在此添加参数可以使您对此进行深入研究分析；

* 此处增删参数都可以重新定义在追踪链接上已添加的参数。

#### 点击效果分析

* 此滑块允许您自定义设置**点击到安装**的时间；

* 您可以自定义设置 1~23 小时或 1~30 天 ；

* 此处设置的时间或日期将会在下方追踪链接中显示。

#### 点击追踪链接

* 此处链接显示设置的所有信息；

* 需复制点击追踪链接链接至 UnityAds。

![clicklink](clicklink.png)

#### 展示效果分析

* 此滑块允许您自定义设置**展示到安装**的时间；

* 您可以自定义设置 1~23 小时或 1~30 天；

* 此处设置的时间或日期将会在下方追踪链接中显示。

#### 展示追踪链接

* 此处链接显示了你设置的所有信息；

* 需复制展示追踪链接链接至 UnityAds。

![showlink](showlink.png) 

### 成本

* 通过成本对接，可优化您的 UnityAds 推广成本数据；

* 在启用 UnityAds 启用成本数据之前，请确保已获取 API Key 和组织 ID。 

![4](4.png) 

#### 获取成本数据

如需获取 UnityAds 类成本数据，则需打开“获取成本数据”开关。

#### API Key

* 广告主用于验证**成本报表**中的 API；

* 更新后的数据窗口将于保存后立即生效。

![apikey](apikey.png) 

#### 组织 ID

* 广告主用于抓取**成本报表**中的组织 ID；

* 更新后的数据窗口将于保存后立即生效。

![organid](organid.png) 

### 广告收益

* 通过广告收益对接，可从 UnityAds 获广告收益数据；

* 在启用 UnityAds 广告收益之前，请确保已获取 GAME ID 和 API Key。

![5](5.png) 

#### 获取广告收益数据

此项功能可切换广告收益数据的效果分析设置。

如需获取 UnityAds 类广告收益数据，则需打开“获取广告收益数据”开关。

#### GAME ID

* 需从 UnityAds 中获取（获取方法详见本章 “UnityAds Game ID” 节）；
* 广告主用于验证在**广告收益**中产生收益的详细 GAME ID；
* 更新后的数据窗口将于保存后即刻生效。


#### API Key

查询在 UnityAds 应用程序的 **API Key** 并输入。

![apikey](apikey.png)

