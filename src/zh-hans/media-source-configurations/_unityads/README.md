# unityAds 追踪配置

## 概述

* Unity Ads 是 Adsforce 的集成合作伙伴之一，为广告主提供于 iOS 和 Android 的视频推广；

* 除基于点击的移动效果分析外，Unity Ads 还提供费用，广告收入和浏览效果分析。

## unityAds 追踪配置

  如需配置  Unity Ads，请按以下步骤操作。

### 打开 **unityAds** 配置窗口

  1. [登录 Adsforce 应用](<https://demo-portal.adsforce.io/login>)；

  2. 在“我的应用”列表项下，单击并选择需配置的应用程序；

     ![adsforce](adsforce.png)

  3. 在“配置管理 > 媒体平台”配置页面，搜索 “unityAds”并点击“编辑”；

     ![img](1.png)

  5. 进入 **unityAds** 配置窗口。


![configuration](configuration.png)

Unity Ads配置窗口包括5个选项：`渠道对接`、`追踪链接`、`成本`、`广告收益`和`延迟深度链接`      

### 渠道对接配置

> **[info] 重要信息**
> 
> * 渠道对接完成后，便可获取**广告效果分析数据**；
> * IDFA 须包含在您的应用中才能成功跟踪 Unity Ads 效果分析；
> * 请确保在集成参数部分中正确配置了 Unity Ads 游戏 ID；
> * 可在 Unity Ads [信息中心](https://unityads.unity3d.com/admin/#/games)获取游戏 ID；
> * 激活后，Unity Ads 会要求我们向他们发送通知，详细说明每个应用安装的设备 ID；
> * 有关更多详细信息，请参阅 Unity Ads 的隐私政策。

![img](2.png) 

#### Unity Ads Game ID

* Adsforce 是通过 Unity Ads Game ID 与 Unity Ads 连接；

* [Unity Ads Game ID](unity-ads-game-id/README.md) 需从 Unity Ads 中获取。

#### 启用曝光效果分析

如需属性为 Unity Ads 的 view-through 安装。请将此选项切换为 **ON**。

#### 默认回传链接

* 如**仅回传** Unity Ads 中的效果分析数据，请选择`Only event attributed to this partner`

* 如**回传所有**合作平台效果分析数据，请选择`Event attributed to any partner or oranganic`

### 追踪链接

* 在此界面添加的所有参数只会生成一条**追踪链接**；

* 此追踪链接仅适用于 Unity Ads；

* 使用追踪链接可以对您的产品进行更深入的分析研究。

![img](3.png) 

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

![img](clicklink.png)

#### 展示效果分析

* 此滑块允许您自定义设置**展示到安装**的时间；

* 您可以自定义设置 1~23 小时或 1~30 天；

* 此处设置的时间或日期将会在下方追踪链接中显示。

#### 展示追踪链接

* 此处链接显示了你设置的所有信息；

* 需复制展示追踪链接链接至 UnityAds。

![img](showlink.png) 

### 成本

* 通过成本对接，可优化您的 UnityAds 推广成本数据；

* 在启用 UnityAds 启用成本数据之前，请确保已获取 API Key 和组织 ID。 

![img](4.png) 

#### 获取成本数据

如使用的成本数据效果分析来自 Unity Ads，则需打开“获取成本数据”。

#### API key

* 广告主用于验证**成本报表**中的 API ；

* 更新后的数据窗口将于保存后立即生效。

![img](apikey.png) 

#### 组织 Id

* 广告主用于抓取**成本报表**中的组织 Id；

* 更新后的数据窗口将于保存后立即生效。

![img](organid.png) 

### 广告收益

* 通过广告收益对接，可从 Unity Ads 获广告收益数据；

* 在启用 Unity Ads 广告收益之前，请确保已获取 GAME ID 和 API Key。

![img](5.png) 

#### 获取广告收益数据

此项功能可切换广告收益数据的效果分析设置。

#### GAME ID

* 广告主用于验证在**广告收益**中产生收益的详细 GAME ID；

* 更新后的数据窗口将于保存后即刻生效。

![img](gameid.png)

#### API Key

查询在 Unity Ads 应用程序的 **API Key** 并输入。

![img](apikey.png)
