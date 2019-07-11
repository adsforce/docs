# 原始数据报告

安装原始数据报告可详细展示您每个安装的原始数据。该报告提供自然安装 和非自然安装的原始数据。

您可点击控制面板列表中的“数据报告” > “数据导出”按钮进入数据导出页面。选择“原始数据报告”即可轻松导出报告。

![raw-data-reports](raw-data-reports.png)



## 字段解释

| 字段名                                         | 字段解析                                                     |
| ---------------------------------------------- | ------------------------------------------------------------ |
| Attributed Touch Type（attr_type）             | 效果分析类型：<br/>Click：点击效果分析， Impression：展示效果分析 |
| Attributed Touch Time（attributed_touch_time） | 效果分析时间（点击取点击时间，展示取展示时间，自效果分析暂无） |
| Event Time                                     | 事件时间（event_time 和 install_time 都取自 Install 表的 sts 字段） |
| Attribution Basis（match_type）                | 效果分析匹配方式                                             |
| Install Time（sts）                            | 安装时间                                                     |
| Cost Model                                     | 花费模式                                                     |
| Cost Currency                                  | 花费货币                                                     |
| Cost Value                                     | 花费金额                                                     |
| Media Source                                   | google 的 referrer 信息和 iOS 的 cookie 信息解析出来的渠道   |
| Campaign ID                                    | google 的 referrer 信息和 iOS 的 cookie 信息解析出来的子渠道 ID |
| Campaign                                       | google 的 referrer 信息和 iOS 的 cookie 信息解析出来的子渠道名称 |
| Adset ID                                       | google 的 referrer 信息和 iOS 的 cookie 信息解析出来的广告组 ID |
| Adset                                          | google 的 referrer 信息和 iOS 的 cookie 信息解析出来的广告组名称 |
| Ad ID                                          | 广告 ID                                                      |
| Ad                                             | 广告名称                                                     |
| Site ID                                        | 网站 ID                                                      |
| App ID（appid）                                | 应用程序 ID                                                  |
| Platform（pf）                                 | 平台                                                         |
| Android ID（aid）                              | 适用于 android，android_id                                   |
| Google Advertising ID（gaid）                  | 适用于 android，google advertising id                        |
| Open ID（oid）                                 | 生成的 openid                                                |
| IDFA（idfa）                                   | 适用于iOS，idfa                                              |
| IDFV（idfv）                                   | 适用于iOS，idfv                                              |
| Bundle ID（pkg）                               | 安卓对应的 pkg 包名，iOS 对应 buddle_id                      |
| OS Version（aon）                              | 安卓系统版本号                                               |
| API Level（aos）                               | 安卓系统 api 号                                              |
| Equipment Brand（b）                           | brand 机型品牌                                               |
| Equipment Model（m）                           | model 机型设备                                               |
| Channel ID（cid）                              | 渠道ID                                                       |
| Language（lang）                               | 语言                                                         |
| Device Language（local）                       | 设备语言                                                     |
| Device Name（name）                            | 设备名称                                                     |
| App Version Code（pvc）                        | 应用程序版本代码                                             |
| App Version Name（pvn）                        | 应用程序版本名称                                             |
| SDK Version（sdk_ver）                         | SDK 版本                                                     |
| Status                                         | 用户新增或者升级状态<br/>（Organic 自然安装；Organic-up 升级安装（可不要）；其他 非自然安装） |
| Google Play Referrer（referrer）               | google 的 referrer 信息和 iOS 的 cookie 信息                 |
| Xh Tracking ID（aq_tranid）                    | 由 click 生成的追踪 ID                                       |
| Click ID                                       | 生成的 clickid，用于做网盟的效果分析转化                     |
| IP                                             | 用户发送请求的 IP 地址                                       |
| Country ISO（country_iso）                     | 根据 IP 地址计算出来的国家                                   |
| City                                           | 根据 IP 地址计算出来的城市                                   |
| Carrier                                        | 运营商（移动，电信）                                         |
| Build                                          | Build                                                        |
| Time Zone（tz）                                | UTC 标准时间                                                 |
| HTTP/User Agent（user_agent）                  | HTTP / 用户代理                                              |
| Network（n）                                   | 网络                                                         |
| HTTP Request（request）                        | HTTP 请求                                                    |
| Screen Height（h）                             | 屏幕高度                                                     |
| Screen Width（w）                              | 屏幕宽度                                                     |
| Screen Density（density）                      | 屏幕密度                                                     |
| Click Lookback                                 | 从 Click 里获取：点击事件的效果分析窗口期                    |
| Customer User ID                               | 广告主自己配的用户 ID                                        |
| Google Play Download Timestamp（gp_click_ts）  | 用户点击下载按钮的时间, 用来做 CTIT 反作弊用                 |

*对应API接口使用，[请参考数据接口](../APIs/README.md)*

