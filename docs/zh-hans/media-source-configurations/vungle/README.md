# **Vungle 追踪配置**

## 概述

* Vungle 是 Adsforce 的集成合作伙伴之一，为广告主提供面向营销人员的视频广告；

* 除基于点击的移动效果分析外，Vungle 还提供费用、广告收入和浏览效果分析。

## Vungle 追踪配置

  如需配置 Vungle 请按以下步骤操作：

### 打开 Vungle 的配置窗口

1. [登录 Adsforce 应用](<https://demo-portal.adsforce.io/login>)；

2. 在“我的应用”列表项下，单击并选择需配置的应用程序；

   ![adsforce](adsforce.png)

3. 在“配置管理 > 媒体平台”配置页面，搜索 “Vungle” 并单击“编辑”后，进入 Vungle 的配置窗口。

   ![img](1.png) 


Vungle 配置窗口包括5个选项：`渠道对接`、`追踪链接`、`成本`、`广告收益` 和 `延迟深度链接`

### 渠道对接

> **[info] 重要信息**
>
> 渠道对接完成后，便可获取**广告效果分析数据**。

![img](2.png)      

渠道对接配置步骤如下：

1. 输入 app_id
 - Adsforce 是通过 app_id 与 Vungle 连接；
 - [app-id](app-id/README.md) 需从 Vungle 中获取。  

2. 启用曝光效果分析

   如需属性为 vungel 的 view-through 安装。请将此选项切换为 **ON**。

3. 默认回传链接

 * 如**仅回传** Vungle 中的效果分析数据，请选择`Only event attributed to this partner`；

 * 如**回传所有**合作平台效果分析数据，请选择`Event attributed to any partner or oranganic`。

### **追踪链接**
> **[info] 重要信息**
>
> * 在此界面添加的所有参数只会生成一条**追踪链接**；
> * 此追踪链接仅适用于 Vungle；
> * 使用追踪链接可以对您的产品进行更深入的分析研究。

![3](3.png)

#### 追踪链接参数

* 添加的参数将会**在下方**追踪链接中显示；

* 在此添加参数可以使您对此进行深入研究分析；

* 此处增删参数均可重新定义在跟踪链接上已添加的参数。

#### 点击效果分析

* 此滑块可自定义设置**点击到安装**的时间；

* 可自定义设置 1~23 小时或 1~30 天；

* 此处设置的时间或日期会在下方追踪链接中显示。

#### 点击追踪链接

* 此处链接可显示设置的所有信息；
* 需复制点击追踪链接链接至 Vungle。

#####1. 点击“复制内容”；

![copy_link](copy_link.png)

######2. 将复制的链接发送到 Vungle > “追踪链接” > “Click URL” 中。

![img](trakinglink.png)

#### 展示效果分析

* 此滑块允许自定义设置**展示到安装**的时间；

* 可自定义设置 1~23 小时或 1~30 天；

* 此处设置的时间或日期将会在下方追踪链接中显示。

#### 展示追踪链接

* 通过成本对接，可优化 Vungle 推广成本数据；

* 在启用 Vungle 成本数据前，应确保已获取 [Vungle API_Key](api-key/README.md)；

* 此链接可显示设置的所有信息。

  ![4](4.png)

#####1. 点击“复制内容”；

![copy-show-link](copy-show-link.png)

#####2. 将复制的链接发送到 Vungle > “追踪链接” > "展示链接"，以**激活**观看相同类型的广告用户。

![show-link](show-link.png)

&ensp;&ensp;&ensp;1）“Event” - 通过下拉框可选择判定有效的条件；

&ensp;&ensp;&ensp;2）Event Tracking URL - 在“Enter URL”框中粘贴输入所复制的展示追踪链接；

&ensp;&ensp;&ensp;3）点击 “Add Event”；

&ensp;&ensp;&ensp;4）Add Events & Trackers - 如显示提示信息，即链接添加成功。

### **成本**

> **[info] 重要信息**
>
> * 通过成本对接，可优化您的 Vungle 推广成本数据；

> * 在启用 Vungle 成本数据之前，请确保已获取 API Key。

![get-cost](get-cost.png)

#### 获取成本数据

如成本数据效果分析来自 Vungle，则需打开“获取成本数据”。

#### API KEY

* [API-Key](api-key/README.md)  用于验证**成本报表**中的 API；

* 更新后的数据窗口将于保存后即刻生效。

### **广告收益**

> **[info] 重要信息**
>
> * 通过广告收益对接，可从 Vungle 获广告收益数据；

> * 在启用 Vungle 广告收益之前，请确保已获取 Secret Key Key 和 App ID。

![img](5.png) 

#### 获取广告收益数据

您能在此切换广告收益数据的效果分析设置。

#### Secret Key

* 通过查询账户页面中的 Key 来获取 Secret Key 以便验证**广告收益报表**中的 API ；

* Secret Key 需要向 Vungle 索要。

#### App ID

查询在 Vungle 应用程序的 **App ID** 并输入。

![appid](appid.png)

