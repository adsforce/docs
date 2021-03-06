# Facebook 追踪配置

* Facebook 是 Adsforce 的集成合作伙伴之一，为广告主提供精确的目标用户和用户习惯；
* 除点击效果分析外，Facebook 还提供成本、广告收益和曝光效果分析。

## Facebook 追踪配置

如需配置 Facebook 请按以下步骤操作。

### 打开 **Facebook** 配置窗口

###### 1. [登录 Adsforce 应用](<https://demo-portal.adsforce.io/login>)；

###### 2. 在“我的应用”列表项下，单击并选择需配置的应用程序；

![adsforce](adsforce.png)

###### 3. 在“配置管理” > “媒体平台”配置页面，搜索 “Facebook” 并点击“编辑”；

![select-facebook](select-facebook.png)

###### 4. 进入 **Facebook** 配置窗口。

![configuration](configuration.png)

 

Facebook 配置窗口包括 4 个选项：`渠道对接`、`成本`、`广告收益` 和 `延迟深度链接`。

### 渠道对接配置

###### 1. 输入[Facebook 应用编号和密钥](facebook-app-id-facebook-app-secret-configuration/README.md)；

###### 2. 选择并配置 Facebook 应用内事件（如需要）。

 ![02](02.png)
 
> **[success] 提示**
>
> **发送应用内时间选项**
> 
> *Facebook 仅支持回传所有合作平台应用内事件。*
>
> * 如**仅回传 ** Facebook 中的应用内事件，请选择`Only event attributed to this partner`
> * 如**回传所有**合作平台应用内事件，请选择`Event attributed to any partner or oranganic`
>
> **事件名称**
> * 第一次启用 Facebook 应用程序内事件时，SDK 中将自动映射到 Facebook 的预定义事件列表；
> * 事件名称，Adsforce 从应用程序中集成的 SDK 或从服务器事件收到的事件名称；
> * 单击“添加事件”，渠道方事件标志将会默认添加；
> * 不选择发送值时，Adsforce 将会把应用内事件所有参数发送给合作伙伴，但收入值除外；
> * 选择发送值时，Adsforce 会发送所有参数，包括收入值；
> * 更新后的数据窗口将于保存后立即生效。
>

### 成本配置

通过成本对接，可优化您的 Facebook 推广成本数据。
> **[info] 重要信息**
>
> 在启用 Facebook 成本数据之前，请确保已授权 Facebook。


 ![03](03.png)

###### 1. 获取成本数据

   如需获取 Facebook 类成本数据，则需打开“获取成本数据”开关。

###### 2. 绑定 Facebook

&ensp;&ensp;1）点击“去 Facebook 授权”按钮，进入 Facebook 授权页面；

&ensp;&ensp;2）请使用 Facebook 的 Business 广告账号进行授权。
> **[info] 重要信息**
>
> 如超过 10 个广告账户，请绑定对应的应用广告账户以快速读取数据。


### 广告收益

通过广告收益对接，可从 Facebook 受众网络（Audience Network）获取广告收益数据。

> **[warning] 注意**
>
> 在启用 Facebook 广告收益之前，请确保已授权 Facebook。

 ![04](04.png)

###### 1. 获取广告收益数据

  如需获取 Facebook 类广告收益数据，则需打开“获取广告收益数据”开关。

###### 2. 绑定 Facebook

   点击“去 Facebook 授权”按钮，进入 Facebook 授权页面。

### 延迟深度链接

深度链接适用于市场推广活动。
可通过以下方式单条验证或手动批量验证延迟深度链接：

#### 单条验证延迟深度链接

###### 1. 完成 Facebook 授权；

###### 2. 默认生成一条延迟深度链接（Deferred Deeplink）；
![05](05.png)

> **[warning] 注意**
> - 可直接修改深度链接；
> - 点击![17](17.png)，复制深度链接。

###### 3. 通过登录 Facebook 账户 > 创建某一广告系列（campaign）> 创建广告组页签 > 创建某一广告组（adset）> 进入广告（Ad）选中某一广告，将复制的延迟深度链接（Deferred Deeplink）粘贴到 Facebook 账号的“延迟深度链接”处；
![23](23.png)

###### 4. 在 Adsforce “配置管理” > “媒体平台” > “Facebook” 配置页面中，点击“验证”可验证延迟深度链接是否关联。

![06](06.png)

> **[warning] 注意**
>
> * 验证的链接应与粘贴到 Facebook 账户中的链接对应（Facebook 账户 > 广告Ad > “延迟深度链接”）；
> * 点击“验证”即可验证是否已关联；
> * 状态显示“已验证”，即完成一次配置；
> * 直接复制或编辑生成的延迟深度链接（Deferred Deeplink）后，将该链接粘贴到 Facebook 账号 Ad 的指定位置；
> * 不同的 Campaign 不能共用同一个延迟深度链接（Deferred Deeplink）；
> * 更新后的数据窗口将于保存后即刻生效。

#### 手动批量验证延迟深度链接
###### 1. 在 Facebook 中设置广告页面，勾选需推广的广告并在<span style="color: blue;">更多</span>项下选择<span style="color: blue;">导出选中内容</span>，以 Excel 形式批量导出广告;

![12](12.png)

###### 2. 在 Adsforce “配置管理” > “媒体平台” > “Facebook” 配置页面中，批量新增链接，并导出经过筛选的链接；

![13](13.png)

###### 3. 将导出的链接批量粘贴在广告 Excel 的 Mobile App Deep Link 栏目下；

![14](14.png)

###### 4. 将 Excel 批量导入 Facebook；

![15](15.png)

###### 5. 返回 Adsforce 的“Facebook” 配置页面，批量验证，在备注中自动生成 Facebook 的广告 ID。

![16](16.png)

### 验证状态流程图与操作


![11](11.png)

> **[success] 提示**
> 
> - 蓝色矩形符号表示状态；
> 
> - 白色菱形符号表示系统判断；
> 
> - 黑色字体表示操作或系统操作。
