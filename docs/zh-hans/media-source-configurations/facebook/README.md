# 介绍

* Facebook是Adsforce的集成合作伙伴之一，为广告主提供精确的目标用户和用户习惯。

* 除基于点击的移动归因外，Facebook还提供费用，广告收入和浏览归因。

* 如需配置Facebook请按以下步骤操作。

* 打开应用的媒体平台，搜索“Facebook”，单击打开**Facebook**的配置窗口。

![img](01.png) 

* Applovin配置窗口包括5个选项：`渠道对接`、`成本`、`广告收益` 和 `延迟深度链接`

## 渠道对接
![img](02.png) 

### Facebook App Id

* 在Adsforce中配置Facebook App Id及Facebook App Secret

* 参数由Facebook提供，是完成集成所必需的。

### Facebook App Secret。

* 打开https://developers.facebook.com/apps，选择自己需要配置的App。

* 点击设置-基本，查看您的App ID 及App Secret并拷贝。

![img](1.png)­­

![img](2.png)

### 启用应用内事件回传

* 您若使用来自Facebook应用内事件回传，请将其打开。

### 发送应用内时间选项

* 若您想**仅回传**Facebook中的应用内事件，请选择`Only event attributed to this partner`

* 若您想**回传所有**合作平台应用内事件，请选择`Event attributed to any partner or oranganic`

* Facebook仅支持回传所有合作平台应用内事件。

### 事件名称

* 第一次启用Facebook应用程序内事件时，SDK中将自动映射到Facebook的预定义事件列表

* 事件名称，Adsforce从应用程序中集成的SDK或从服务器事件收到的事件名称。

* 单击“ 添加事件” ，渠道方事件标志将会默认添加。

* 不选择发送值时，Adsforce将会把应用内事件所有参数发送给合作伙伴，但收入值除外。

* 选择发送值时，Adsforce会发送所有参数，包括收入值。

* 更新后的数据窗口将于保存后立即生效。

## 成本

* 通过成本对接，可优化您的Facebook推广成本数据。

* 在启用Facebook启用成本数据之前，请确保您已经授权Facebook。

![img](03.png) 

### 获取成本数据

* 您若使用来自Facebook获取成本数据，请将其打开。

### 绑定Facebook

* 点击“去Facebook授权”按钮，进入Facebook授权页面。

* 请使用Facebook的Business广告账号进行授权（如果您超过10个广告账户，为了方便您更快速的读取数据，请绑定您对应的App广告账户）。

## 广告收益

* 通过广告收益对接，可从Facebook获广告收益数据。

* 在启用Facebook广告收益之前，请确保您已经授权Facebook。

![img](04.png) 

### 获取广告收益数据

* 您若使用来自Facebook获取广告收益数据，请将其打开。

### 绑定Facebook

* 点击“去Facebook授权”按钮，进入Facebook授权页面。

## 延迟深度链接

* 通过深度链接，可以帮助你做一些市场推广活动。

* 您需要三步完成操作。您已经通过 Facebook 授权，我们将默认帮你生成一条 Deferred Deeplink。
* 您可以复制到您的 Facebook 账号 Ad 的指定位置。点击“验证”我们会帮你验证是否关联上。

![img](05.png)

* 您可以把链接直接拷贝或编辑后拷贝到您Facebook账号Ad的指定位置。

* 不同的Campaign不能共用同一个Deferred Deeplinks。

* 链接最多添加10条。（编辑按钮可修改链接地址）

* 更新后的数据窗口将于保存后立即生效。

![img](8.png)

* 点击“验证”我们会帮您验证是否关联上。

* 状态变成已验证，即完成了一次配置。

## 验证状态流程图与操作。

* 蓝色按钮为状态图。白色按钮为操作。黑色字体为其他页面及系统操作。

![img](11.png)

 