# Chartboost s2s  追踪配置

* Chartboost s2s 是 Adsforce 的集成合作伙伴之一，为广告主提供数据分析、广告服务等功能；

* 除点击效果分析外，Chartboost s2s 还提供成本、广告收益和曝光效果分析。


## Chartboost s2s 追踪配置

如需配置 Chartboost s2s 请按以下步骤操作：

### 打开 Chartboost s2s 配置窗口

##### 1. [登录 Adsforce App](<https://demo-portal.adsforce.io/login>)；

##### 2. 在“我的应用”列表项下，单击并选择需配置的应用程序；

![adsforce](adsforce.png)

##### 3. 在“配置管理” > “媒体平台”配置页面，搜索 “Chartboost s2s” 并点击“编辑”；

![1](1.png)

##### 4. 进入 **Chartboost s2s** 配置窗口。 

![configuration](configuration.png)

Chartboost s2s 配置窗口包括 5 个选项：`渠道对接`、`跟踪链接`、`成本`、`广告收益` 和 `延迟深度链接`。

### 渠道对接

> **[info] 重要信息**
>
> 渠道对接完成后，便可获取**广告效果分析数据**。

![2](2.png)

#### Chartboost s2s 应用 ID

* Chartboost s2s 应用 ID 需从 Chartboost s2s 中获取；

* Adsforce 是通过 Chartboost s2s 应用 ID 与 Chartboost s2s 连接。  

  Chartboost s2s 应用 ID 获取方式如下：

######&ensp;&ensp;&ensp;&ensp;1. [登录 Chartboost](https://dashboard.chartboost.com/login)；

######&ensp;&ensp;&ensp;&ensp;2. 在 “应用设置” > “基本设置”页面，获取应用 ID。

![img](appid.png)

#### Chartboost s2s_signature

* Chartboost s2s_signature 需从 Chartboost s2s 中获取；

* Adsforce 是通过 Chartboost s2s_signature 与 Chartboost s2s 连接。 

  Chartboost s2s 应用签名获取方式如下：

######&ensp;&ensp;&ensp;&ensp;1. [登录 Chartboost](https://dashboard.chartboost.com/login)；

######&ensp;&ensp;&ensp;&ensp;2. 在 “应用设置” > “基本设置”页面，获取应用签名。

![img](appsignature.png)

#### 启用曝光效果分析

如需属性为 Chartboost s2s 的曝光安装。请将此选项切换为 **ON**。

#### 默认回传链接

* 如**仅回传 ** Chartboost s2s 中的效果分析数据，请选择`Only event attributed to this partner`

* 如**回传所有**合作平台效果分析数据，请选择`Event attributed to any partner or oranganic`

### 追踪链接

* 在此界面添加的所有参数只会生成一条**追踪链接**；

* 此追踪链接仅适用于 Chartboost s2s；

* 使用追踪链接可更深入的分析研究产品。



![c3](c3.png)

#### 跟踪链接参数

* 添加的参数将会**在下方**追踪链接中显示；

* 在此添加参数可深入研究分析产品；

* 此处增删参数都可以重新定义在跟踪链接上已添加的参数。

#### 点击效果分析

* 此滑块允许您自定义设置**点击到安装**的时间；

* 可自定义设置 1~23 小时或 1~30 天；

* 此处设置的时间或日期将会在下方追踪链接中显示。

#### 点击追踪链接

* 此处链接可显示设置的所有信息；
* 需复制点击追踪链接链接至 Chartboost。

######&ensp;&ensp;&ensp;&ensp;1. 点击“复制内容”；

![click-link](click-link.png)

######&ensp;&ensp;&ensp;&ensp;2. 将复制的链接发送至 Chartboost s2s。

&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;1）[登录Chartboost](https://dashboard.chartboost.com/login)；

&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;2）选择“应用设置” > “基本设置”;

&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;3）在“高级设置”编辑页面，将复制的“点击追踪链接”粘贴至 “点击数据传输”。

![img](clicklink.png)

#### 展示效果分析

* 此滑块允许自定义设置**展示到安装**的时间；

* 可自定义设置 1~23 小时或 1~30 天；

* 此处设置的时间或日期将会在下方追踪链接中显示。

#### 展示追踪链接

* 此处链接可显示设置的所有信息；
* 此链接可**激活**观看相同类型的广告用户。

######&ensp;&ensp;&ensp;&ensp;1. 点击“复制内容”；

![copyshowlink](copyshowlink.png)

######&ensp;&ensp;&ensp;&ensp;2. 将复制的链接发送至 Chartboost s2s。

&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;1）[登录Chartboost](https://dashboard.chartboost.com/login)；

&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;2）选择“应用设置” > “基本设置”;

&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;3）在“高级设置”编辑页面，将复制的“点击追踪链接”粘贴至“查看完成数据传输”。

![show-link](show-link.png)

### 成本

* 通过成本对接，可优化您的 Chartboost s2s 推广成本数据；

* 在启用 Chartboost s2s 成本数据前，请确保已获取 Chartboost s2s 的 API Key。

![c4](c4.png)

#### 获取成本数据

如需获取 Chartboost s2s 类成本数据，则需打开“获取成本数据”开关。

### 广告收益

* 通过广告收益对接，可从 Chartboost s2s 获广告收益数据；

* 在启用 Chartboost s2s 广告收益之前，请确保您已经获取用户 ID 和应用 ID。   

![c5](c5.png)

#### 获取广告收益数据

此处可切换广告收益数据的效果分析设置。

 如需获取 Chartboost 类广告收益数据，则需打开“获取广告收益数据”开关。

#### 用户 ID

通过 "Chartboost" > "工具" > "API 浏览器"获取用户 ID，用户 ID 用于验证**广告收益报表**中的 API。 

![id](id.png)

#### App ID

通过 “Chartboost” > “应用设置” > “基本设置”，获取应用 ID，以验证**广告收益报表**中的 API。

![appid](appid.png)

#### 用户签名

通过 "Chartboost" > "工具" > "API 浏览器"，查询用户签名信息并输入。

![signature](signature.png)
