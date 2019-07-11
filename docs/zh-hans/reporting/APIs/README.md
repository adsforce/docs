# 数据接口

数据报告可从“数据导出”页面进行手动下载, 也可以通过数据获取接口拉取。

此报告既可以是汇总报告，也可是原始数据报告。

## 数据接口配置

如需配置数据接口，请按以下步骤操作：

### 打开“数据接口配置”窗口

##### 1. [登录 Adsforce 应用](<https://demo-portal.adsforce.io/login>)；

##### 2. 在“我的应用”列表项下，单击并选择需配置的应用程序；

&ensp;&ensp;![select-app](select-app.png)



##### 3. 在该应用程序参数配置页面，单击“数据报告” > “数据接口”；

![api](api.png)

##### 4. 打开数据接口配置页面。

![configuration](configuration.png)

数据接口配置窗口包括 2 个选项：`数据获取接口`和`数据推送接口`。

### 数据获取接口

数据获取接口链接可以在每个 App 的“数据报告” > “数据接口”页面中获取。

![data-api](data-api.png)



#### **API Key**

- 添加应用后，API Key 自动生成；
- 每个 App 只可生成一个对应的 API Key。

#### **汇总报告**

选择相关的绩效报告 API 样本。

#### **原始数据报告**

选择相关的原始数据报告 API 样本。

### 数据推送接口

![push-data](push-data.png)



##### 1. 自主选择“安装”和“应用内事件”的安装方式；

- 自然安装

- 非自然安装

##### 2. 输入回传地址；

##### 3. 选择请求方式

- GET
- POST

##### 4. 点击“发送测试”按钮；

> **[info] 重要信息**
>
> * 我们根据 HTTP code 及接口返回内容来判断数据是否发送成功；
> * HTTP code 为200、同时接口返回内容为字符串 “ok” 则代表成功，否则失败。

##### 5. 如出现“测试通过”，点击“保存”；
> **[warning] 注意**
>
> 如保存后点击“删除”，则所保存的数据将会丢失。

![pass-test](pass-test.png)

##### 6. 出现“审核中...”状态，表示 Adsforce 人员已接收通知且正在审核；

![reviewing](reviewing.png)

##### 7. 如审核通过，状态会更新成“已开启”；

##### 8. 可点击“添加回传”按钮，增加回传。

> **[warning] 注意**
>
> 每个 App 最多可添加5个回传地址。

![add-address](add-address.png)

## 字段解释

### 数据获取接口

| 字段名                                         | 字段解析                                                     |
| ---------------------------------------------- | ------------------------------------------------------------ |
| Attributed Touch Type（attr_type）             | 效果分析类型：<br/>Click：点击效果分析， Impression：展示效果分析 |
| Attributed Touch Time（attributed_touch_time） | 效果分析时间                                                 |
| Attribution Basis（match_type）                | 效果分析匹配方式：<br/>id_matching：设备 ID 效果分析，srn：自效果分析平台通过 deeplink 效果分析，ua_fing |
| Install Time                                   | 安装时间                                                     |
| Event Time                                     | 事件时间                                                     |
| Event Name                                     | 事件名                                                       |
| Revenue（revn）                                | 收益                                                         |
| Event Revenue Currency（revn_curr）            | 事件收益货币                                                 |
| Event Revenue USD（revn_usd）                  | 事件收益美元                                                 |
| Media Source                                   | 设备归属媒体平台                                             |
| Channel  ID                                    | 渠道 ID                                                      |
| Campaign ID                                    | 活动 ID                                                      |
| Campaign                                       | 活动                                                         |
| Adset ID                                       | google 的 referrer 信息和 iOS 的 cookie 信息解析出来的广告组 ID |
| Adset                                          | google 的 referrer 信息和 iOS 的 cookie 信息解析出来的广告组名称 |
| Ad ID                                          | 广告 ID                                                      |
| Ad                                             | 广告名称                                                     |
| Site ID                                        | 网站 ID                                                      |
| App ID（appid）                                | 应用程序 ID                                                  |
| Platform（pf）                                 | 平台                                                         |
| Android ID（aid）                              | 适用于android，android_id                                    |
| GAID（gaid）                                   | 适用于android，google advertising id                         |
| Open ID（oid）                                 | 生成的 openid                                                |
| IDFA（idfa）                                   | 适用于 iOS，idfa                                             |
| IDFV（idfv）                                   | 适用于 iOS，idfv                                             |
| Bundle ID（pkg）                               | 安卓对应的 pkg 包名，iOS 对应 buddle_id                      |
| OS Version（aon）                              | 安卓系统版本号                                               |
| API Level（aos）                               | 安卓系统 api 号                                              |
| Equipment Brand（b）                           | brand 机型品牌                                               |
| Equipment Model（m）                           | model 机型设备                                               |
| Params                                         | 参数、用户上报的额外数据                                     |
| Pay Verify（pay_verify）                       | 订单验证结果                                                 |
| Language（lang）                               | 语言                                                         |
| Device Language（local）                       | 设备语言                                                     |
| Device Name（name）                            | 设备名称                                                     |
| App Version Code（pvc）                        | 应用程序版本代码                                             |
| App Version Name（pvn）                        | 应用程序版本名称                                             |
| SDK Version（sdk_ver）                         | SDK 版本                                                     |
| IP                                             | 用户发送请求的 IP 地址                                       |
| Country ISO（country_iso）                     | 根据 IP 地址计算出来的国家                                   |
| City                                           | 根据 IP 地址计算出来的城市                                   |
| Carrier                                        | 运营商（移动，电信）                                         |
| Time Zone（tz）                                | 时区                                                         |
| HTTP/User Agent（user_agent）                  | HTTP / 用户代理                                              |
| Network（n）                                   | 网络                                                         |
| Screen Height（h）                             | 屏幕高度                                                     |
| Screen Width（w）                              | 屏幕宽度                                                     |
| Screen Density（density）                      | 屏幕密度                                                     |
| Event Source（event_source）                   | 事件源                                                       |



### 数据推送接口

#### 事件报表

| 字段名                                          | 字段解析                                                     |
| ----------------------------------------------- | ------------------------------------------------------------ |
| Devkey（devkey）                                | 广告主级别 key                                               |
| App ID（appid）                                 | 产品 ID：<br/>google 是包名，iOS 是编号                      |
| Platform（pf）                                  | 平台                                                         |
| Android ID（aid）                               | Android 设备 ID                                              |
| GAID（gaid）                                    | Android 设备广告 ID                                          |
| Open ID（oid）                                  | SDK 生成的 ID                                                |
| IDFA（idfa）                                    | iOS 设备 ID（首选 / 唯一）                                   |
| IDFV（idfv）                                    | iOS 设备广告 ID（卸载安装，换 ID）                           |
| Bundle ID（pkg）                                | 产品包名                                                     |
| OS Version（aon）                               | 安卓系统版本号                                               |
| API Level（aos）                                | API 级别                                                     |
| Equipment Brand（b）                            | 设备品牌（小米，三星）                                       |
| Equipment Model（m）                            | 设备机型（苹果7，小米6）                                     |
| Channel ID（cid）                               | 渠道 ID                                                      |
| category（cat）                                 | 事件的分类（默认值为 event），仅适用于自定义事件             |
| Event ID（e_id）                                | 事件标示，仅适用于自定义事件                                 |
| Value（val）                                    | 自定义事件上报的参数（事件具体的值）                         |
| Language（lang）                                | 语言                                                         |
| Device Language（local）                        | 设备语言                                                     |
| Device Name（name）                             | 设备名称                                                     |
| App Version Code（pvc）                         | 应用程序版本代码                                             |
| App Version Name（pvn）                         | 应用程序版本名称                                             |
| SDK Version（sdk_ver）                          | SDK 版本                                                     |
| IP（ip）                                        | IP                                                           |
| Country ISO（country_iso）                      | ISO 国家码                                                   |
| City                                            | 城市                                                         |
| Carrier                                         | 运营商（移动，电信）                                         |
| Time Zone（tz）                                 | 时区                                                         |
| Timezone Abbreviation（tz_abb）                 | 时区简称                                                     |
| User Agent（user_agent）                        | HTTP / 用户代理                                              |
| Network（n）                                    | 网络                                                         |
| Screen Height（h）                              | 屏幕高度                                                     |
| Screen Width（w）                               | 屏幕宽度                                                     |
| Density                                         | 屏幕分辨率                                                   |
| Client Timestamp（cts）                         | 客户端时间                                                   |
| Server Timestamp（sts）                         | 服务器接收到的数据时间                                       |
| Attributed Touch Time（attribution_touch_time） | 效果分析时间                                                 |
| Install Time                                    | 安装时间                                                     |
| Media Source                                    | 设备归属媒体平台                                             |
| Campaign ID                                     | 活动 ID                                                      |
| Campaign                                        | 活动                                                         |
| Adset ID                                        | google 的 referrer 信息和 ios 的 cookie 信息解析出来的广告组 ID |
| Adset                                           | google 的 referrer 信息和 ios 的 cookie 信息解析出来的广告组名称 |
| Ad ID                                           | 广告 ID                                                      |
| Ad                                              | 广告名称                                                     |
| UUID                                            | 事件唯一编号（Universally Unique Identifier）                |
| Customer ID（cuid）                             | 客户自定义 ID，从安装表查询                                  |
| Province                                        | nginx log 中解析的省份                                       |
| Revenue（revn）                                 | 订单金额                                                     |
| Event Revenue Currency（revn_curr）             | 订单货币单位                                                 |
| Params                                          | 参数、用户上报的额外数据                                     |
| Pay Verify                                      | 订单验证结果                                                 |
| Receipt ID                                      | 用于支付验证                                                 |
| Event Source                                    | 默认值 SDK，事件来源                                         |



#### 原始安装报表

| 字段名                                        | 字段解析                                                     |
| --------------------------------------------- | ------------------------------------------------------------ |
| Devkey                                        | 用于标识某个开发者身份                                       |
| App ID                                        | 标识某一款产品<br/>安卓：包名，iOS：appid                    |
| Platform（pf）                                | 平台，包含 Android 和 iOS                                    |
| Android ID（aid）                             | Android 设备 ID                                              |
| GAID（gaid）                                  | Android 设备广告 ID                                          |
| Open ID（oid）                                | SDK 生成的 ID                                                |
| IDFA（idfa）                                  | iOS 设备 ID（首选 / 唯一）                                   |
| IDFV（idfv）                                  | iOS 设备广告 ID（卸载安装，换 ID）                           |
| Bundle ID（pkg）                              | 产品包名                                                     |
| OS Version（aon）                             | 安卓系统版本号                                               |
| API Level（aos）                              | API 级别                                                     |
| Equipment Brand（b）                          | 设备品牌（小米，三星）                                       |
| Equipment Model（m）                          | 设备机型（苹果7，小米6）                                     |
| Channel ID（cid）                             | 渠道 ID                                                      |
| Language（lang）                              | 语言                                                         |
| Device Language（local）                      | 设备语言                                                     |
| Device Name（name）                           | 设备名称                                                     |
| App Version Code（pvc）                       | 应用程序版本代码                                             |
| App Version Name（pvn）                       | 应用程序版本名称                                             |
| SDK Version（sdk_ver）                        | SDK 版本                                                     |
| Status                                        | 用户新增或者升级状态                                         |
| Google Play Referrer（referrer）              | google 的 referrer 信息和 iOS 的 cookie 信息                 |
| Xh Tracking ID（aq_tranid）                   | 由 click 生成的追踪 ID                                       |
| Media Source                                  | google 的 referrer 信息和 iOS 的 cookie 信息解析出来的渠道   |
| Campaign ID                                   | google 的 referrer 信息和 iOS 的 cookie 信息解析出来的子渠道 ID |
| Campaign                                      | google 的 referrer 信息和 iOS 的 cookie 信息解析出来的子渠道名称 |
| Adset ID                                      | google 的 referrer 信息和 iOS 的 cookie 信息解析出来的广告组 ID |
| Adset                                         | google 的 referrer 信息和 iOS 的 cookie 信息解析出来的广告组名称 |
| Ad                                            | 广告名称                                                     |
| Site ID                                       | google 的 referrer 信息和 iOS 的 cookie 信息解析出来的 site ID |
| Click ID                                      | 生成的 clickid，用于做网盟的效果分析转化                     |
| IP                                            | 用户发送请求的 IP 地址                                       |
| Country ISO                                   | 根据 IP 地址计算出来的国家                                   |
| City                                          | 根据 IP 地址计算出来的城市                                   |
| Carrier                                       | 运营商（移动，电信）                                         |
| Time Zone                                     | 时区                                                         |
| HTTP/User Agent                               | 用户代理                                                     |
| Network（n）                                  | net 用户联网类型：0 未连接、1 wifi、2 2G 、3 3G、4 4G、5 5G  |
| Screen Height（h）                            | 屏幕高度                                                     |
| Screen Width（w）                             | 屏幕宽度                                                     |
| Screen Density（density）                     | 屏幕分辨率                                                   |
| Client timestamp（cts）                       | 客户端时间                                                   |
| Server timestamp（sts）                       | 服务器接收到的数据时间                                       |
| click lookback                                | 从 click 里获取: 点击事件的效果分析窗口期                    |
| Customer User ID                              | 广告主自己配的用户 ID                                        |
| Cost model                                    | 花费模式                                                     |
| Cost Currency                                 | 花费货币                                                     |
| Cost Value                                    | 花费金额                                                     |
| Referrer's Timestamp（ref_click_ts）          | referrer 的时间戳, 用来做 CTIT 反作弊用                      |
| Google Play Download Timestamp（gp_click_ts） | 用户点击下载按钮的时间, 用来做 CTIT 反作弊用                 |
| Attributed Touch Type（attr_type）            | 效果分析类型：<br/>click：点击效果分析，impression：展示效果分析 |
| Attribution Basis（match_type）               | 效果分析匹配方式<br/>id_matching：设备 ID 效果分析，srn：自效果分析平台通过 deeplink 效果分析，ua_fing |
| Attributed Touch Time                         | 效果分析时间                                                 |
| UUID                                          | 记录的唯一编号                                               |
| ID                                            | 此条记录的 ID                                                |
| Customer ID                                   | 用户 ID                                                      |
| Province                                      | nginx log 中解析的省份                                       |


