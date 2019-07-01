# 应用内事件

## 概述

Adsforce 应用内事件可以让广告主追踪应用安装后事件并将其归入原始媒体渠道。

如果您的用户进行注册、将商品添加至购物车或进行购买等，应用内事件可显示相关数据。

**应用内事件可确认用户价值以及不同的媒体渠道所带来的流量与质量**。

使用应用内事件可以让广告平台高效优化网络流量，因此 Adsforce 强烈建议您使用应用内事件。  

![img](hybrID-app-in-app-event.png)

## Trackevent&ensp;API

应用内事件包括事件名称和事件参数。

可选择已有的事件名称。但 Adsforce 的 SDK 是通过枚举和定义推荐事件名称 。

事件名称区分大小写, 例如, 发送 purchase_revenue 和 purchase_REVENUE 两个事件名称将创建两个单独的事件。

语法：

### **iOS**

```
- (void) trackEvent:(NSString *)eventName withValues:(NSDictionary*)values 
```

-  eventName         

  用于定义事件名称的任何字符串。         

- 值

  组成详细事件的事件参数。

### **Android**

```
public static void trackEvent(Context context, String eventName, Map eventValues)
```

-  Context

  使用 `getApplicationContext()`

- eventName

  用于定义事件名称的任何字符串。

- eventValues

  组成详细事件的时间参数。

## 配置内购事件

![img](purchase event.png)

### 收益参数

可使用任何参数和事件发送收益值。但须使用 **xh_revenue** 参数在 Adsforce 的原始和聚合数据中注册收益。

使用此参数能够真实的展示获得收益的应用内事件。

### 多个商品

可在单笔交易中添加多个商品，用逗号隔开多个商品描述，无需让每个事件参数对应。

**示例**

在同一笔交易中，A. Force 先生从某家美国线上商店购买了两件完全一样的衬衫，一双鞋和一顶帽子。

列明各商品的序列必须与各参数完全一致。

`xh_content_id: ["123","988","399"]`
 `xh_quantity: [2,1,1]`
 `xh_price: [25,50,10]`
 `xh_revenue: [110]`
 `xh_currency: USD`

对于多个商品，代码显示如下：

```
Map<String,Object> eventData = new HashMap<>();
eventData.put(xhInAppEventParameterName.CONTENT_ID, new String[] {"123","988","399"});
eventData.put(xhInAppEventParameterName.QUANTITY, new int[] {2, 1, 1});
eventData.put(xhInAppEventParameterName.PRICE,new int[] {25, 50, 10});
eventData.put(xhInAppEventParameterName.CURRENCY,"USD");
eventData.put(xhInAppEventParameterName.REVENUE,110);
AdsforceLib.getInstance().trackEvent(AdsforceTestActivity.this, xhInAppEventType.PURCHASE,eventData);
```

> **[warning] 注意**
>
> 多商品描述可以在以下应用内事件中使用：
> 
>    `xh_add_to_cart`、`xh_add_to_wishlist`、`xh_tutorial_completion`、`xh_initiated_checkout`、  `purchase_revenue`、`xh_rate`、`xh_spent_credits `、`xh_content_view`、`xh_travel_booking`、`xh_update`

### 复杂应用内事件

应用内事件可允许一个 API 调用多个发送事件。

应用内事件能有效查看关联密切的用户操作，例如在单个会话中将若干产品添加到购物车。

**示例**

```
{
  "xh_revenue":"50.87",
  "xh_currency":"USD",
  "xh_receipt_id":"57601333",
  "product":[ 
   { 
     "xh_content_id":"1164_8186",
     "xh_price":"8.97",
     "xh_quantity":"1"
   },
   { 
     "xh_content_id":"1164_8186",
     "xh_price":"8.97",
     "xh_quantity":"1"
   },
   { 
     "xh_content_id":"1164_8186",
     "xh_price":"8.97",
     "xh_quantity":"1"
   },
   { 
     "xh_content_id":"1177_8185",
     "xh_price":"8.97",
     "xh_quantity":"1"
   },
   { 
     "xh_content_id":"0153_9077",
     "xh_price":"14.99",
     "xh_quantity":"1"
   }
  ]
}
```

> **[danger] 警告**
>
> 应用内事件会引起 Facebook 和 Criteo 出现回传问题。如需事件与 Facebook 和 Criteo 全部展示，可按照各用户操作发送单独事件。
> 例如按照各添加的商品发送到”添加到购物车“应用事件，应用内事件将会把这些事件分为一组。

离线追踪事件

如果用户在网络连接不可用时启动了事件，Adsforce 仍可追踪该事件. 以下是其原理:

###### 1. SDK 将事件发送到 Adsforce 服务器并等待响应。
###### 2. 如果 SDK 没有收到响应 200, 则该事件将存储在缓存中。
###### 3. 收到下一个响应 200 后, 存储的事件将重新发送到服务器。
###### 4. 如果缓存中有多个事件, 将按序号发送到服务器。


> **[warning] 注意**
>
> SDK 的缓存最多可以存储 40 个事件, 这意味着只保存脱机发生的前 40 个事件。之后所有的事件都会被丢弃，直到下一个相应 200。

### 事件去重

Adsforce 有一套应用内事件去重的机制。它会检查所有应用内事件，以查看同一个 Adsforce_ID 是否 10 秒内有同一个应用内事件。如果找到此类事件, 该机制将删除重复项。

如果两个事件中的以下字段相同, 则两个事件被视为相同:

- eventName
- Event value
- App ID
- Adsforce ID

> **[warning] 注意**
>
> * 去重工作仅适用于从 SDK 发送的应用内事件；
> * 服务器对服务器的应用内事件不会去重。

## 事件类型

### 内购收益

**事件名称：**xh_purchase 
**描述：**用于追踪内购事件（并将其与收益相关联）
**事件参数（Android）：** `XHInAppEventType.PURCHASE` 
**事件参数（iOS）：** `XHEventPurchase` 
**Facebook **映射事件**：** fb_mobile_purchase
**Twitter **映射事件**: ** PURCHASE内购
**Criteo **映射事件**: ** transactionConfirmation 确认交易
**Google** 映射事件**: ** in_app_purchase 应用内购买
**Snapchat** 映射事件**: ** PURCHASE 内购
**推荐属性**：xh_content_type,xh_content_id,xh_content,xh_currency,xh_quantity,xh_order_id,xh_price
**属性映射：**

| Adsforce                    | Facebook                    | Twitter        | Criteo         | Google         | Snapchat |
| :-------------------------- | :-------------------------- | :------------- | :------------- | :------------- | :------- |
| xh_revenue*                 | _valueToSum                 | price_micro**  | ui_revenue     | value          | -        |
| xh_content_type             | fb_content_type             | content_type   | -              | item_category  | -        |
| xh_content_id               | fb_content_id               | content_id     | id             | item_id        | -        |
| xh_content                  | fb_content                  | -              | -              | -              | -        |
| xh_currency                 | fb_currency                 | price_currency | currency       | currency_code  | -        |
| xh_quantity                 | fb_num_items                | number_items   | quantity       | quantity       | -        |
| xh_validated                | -                           | -              | -              | validated      | -        |
| xh_receipt_id               | -                           | -              | transaction_id | transaction_id | -        |
| xh_order_id                 | fb_order_id                 | -              | -              | order_id       | -        |
| xh_content_list             | fb_content_id               | -              | -              | item_id        | -        |
| xh_date_a                   | fb_checkin_date             | -              | din            | start_date     | -        |
| xh_date_b                   | fb_checkout_date            | -              | dout           | end_date       | -        |
| xh_departing_departure_date | fb_departing_departure_date | -              | -              | -              | -        |
| xh_returning_departure_date | fb_returning_departure_date | -              | -              | -              | -        |
| xh_destination_a            | fb_origin_airport           | -              | -              | origin         | -        |
| xh_destination_b            | fb_destination_airport      | -              | -              | destination    | -        |
| xh_destination_list         | fb_destination_ids          | -              | -              | -              | -        |
| xh_city                     | fb_city                     | -              | -              | -              | -        |
| xh_region                   | fb_region                   | -              | -              | -              | -        |
| xh_country                  | fb_country                  | -              | -              | -              | -        |
| xh_departing_arrival_date   | fb_departing_arrival_date   | -              | -              | -              | -        |
| xh_returning_arrival_date   | fb_returning_arrival_date   | -              | -              | -              | -        |
| xh_suggested_destinations   | fb_suggested_destinations   | -              | -              | -              | -        |
| xh_travel_start             | fb_travel_start             | -              | -              | -              | -        |
| xh_travel_end               | fb_travel_end               | -              | -              | -              | -        |
| xh_num_adults               | fb_num_adults               | -              | -              | -              | -        |
| xh_num_children             | fb_num_children             | -              | -              | -              | -        |
| xh_num_infants              | fb_num_infants              | -              | -              | -              | -        |
| xh_class                    | fb_travel_class             | -              | -              | travel_class   | -        |
| xh_suggested_hotels         | fb_suggested_hotels         | -              | -              | -              | -        |
| xh_user_score               | fb_user_score               | -              | -              | -              | -        |
| xh_hotel_score              | fb_hotel_score              | -              | -              | -              | -        |
| xh_price                    | fb_purchase_value           | -              | price**        | price          | -        |
| xh_purchase_currency        | fb_purchase_currency        | -              | -              | -              | -        |
| xh_preferred_star_ratings   | fb_preferred_star_ratings   | -              | -              | -              | -        |
| xh_preferred_price_range    | fb_preferred_price_range    | -              | -              | -              | -        |
| xh_preferred_neighborhoods  | fb_preferred_neighborhoods  | -              | -              | -              | -        |
| xh_preferred_num_stops      | fb_preferred_num_stops      | -              | -              | -              | -        |

### 用户购买

#### 添加付款信息

**事件名称：**xh_add_payment_info

**描述：**用于追踪付款信息配置状态

**推荐属性：**xh_success

| *平台*                | *映射事件*                    |
| :------------------------ | :-------------------------------- |
| **Adsforce（Android）**    | XHInAppEventType.ADD_PAYMENT_INFO |
| **Adsforce（iOS）**       | XHEventAddPaymentInfo             |
| **Facebook 映射事件** | fb_mobile_add_payment_info        |
| **Twitter 映射事件** | -                                 |
| **Criteo 映射事件** | -                                 |
| **Google 映射事件** | add_payment_info                  |
| **Snapchat 映射事件** | ADD_BILLING                       |

​																			**属性映射**

| Adsforce   | Facebook   | Twitter           | Criteo | Google           | Snapchat |
| :--------- | :--------- | :---------------- | :----- | :--------------- | :------- |
| xh_success | fb_success | user_payment_info | -      | add_payment_info | -        |



#### 加入购物车

**事件名称：**xh_add_to_cart

**描述：**用于追踪将特定项目加入购物车的事件

**推荐属性：**xh_price, xh_content_type, xh_content_id, xh_content, xh_currency, xh_quantity

| *平台*                    | *映射事件*               |
| :------------------------ | :--------------------------- |
| **Adsforce(Android)**     | XHInAppEventType.ADD_TO_CART |
| **Adsforce(iOS)**         | XHEventAddToCart             |
| **Facebook 映射事件** | fb_mobile_add_to_cart        |
| **Twitter 映射事件** | ADD_TO_CART                  |
| **Criteo 映射事件** | viewBasket                   |
| **Google 映射事件** | add_to_cart                  |
| **Snapchat 映射事件** | ADD_CART                     |

​																			**属性映射**

| Adsforce        | Facebook        | Twitter        | Criteo   | Google        | Snapchat |
| :-------------- | :-------------- | :------------- | :------- | :------------ | :------- |
| xh_price        | _valueToSum     | price_micro*   | price**  | price         | -        |
| xh_content_type | fb_content_type | content_type   | -        | item_category | -        |
| xh_content_id   | fb_content_id   | content_id     | id       | item_id       | -        |
| xh_content      | fb_content      | -              | -        | -             | -        |
| xh_currency     | fb_currency     | price_currency | currency | currency_code | -        |
| xh_quantity     | -               | number_items   | quantity | quantity      | -        |

#### 添加收藏

**事件名称：**xh_add_to_wishlist

**描述：**用于追踪特定商品的”添加至收藏夹“事件。

**推荐属性：** xh_price, xh_content_type, xh_content_id, xh_content, xh_currency, xh_quantity

| *平台*                    | *映射事件*                    |
| :------------------------ | :-------------------------------- |
| **Adsforce(Android)**     | XHInAppEventType.ADD_TO_WISH_LIST |
| **Adsforce(iOS)**         | XHEventAddToWishlist              |
| **Facebook 映射事件** | fb_mobile_add_to_wishlist         |
| **Twitter 映射事件** | ADD_TO_WISHLIST                   |
| **Criteo 映射事件** | -                                 |
| **Google 映射事件** | add_to_wishlist                   |
| **Snapchat 映射事件** | -                                 |

​																			**属性映射**

| Adsforce        | Facebook        | Twitter        | Criteo | Google        | Snapchat |
| :-------------- | :-------------- | :------------- | :----- | :------------ | :------- |
| xh_price        | _valueToSum     | price_micro*   | -      | Price         | -        |
| xh_content_type | fb_content_type | content_type   | -      | itemcategory  | -        |
| xh_content_id   | fb_content_id   | content_id     | -      | item_id       | -        |
| xh_content      | fb_content      | -              | -      | -             | -        |
| xh_currency     | fb_currency     | price_currency | -      | currency_code | -        |
| xh_quantity     | -               | number_items   | -      | quantity      | -        |



#### 发起付款

**事件名称：**xh_initiated_checkout

**描述：**用于追踪付款事件

**推荐属性：**xh_price, xh_content_type, xh_content_id, xh_content, xh_currency, xh_quantity, xh_payment_info_available

| *平台*                | *映射事件*                          |
| :-------------------- | :---------------------------------- |
| **Adsforce(Android)** | XHInAppEventType.INITIATED_CHECKOUT |
| **Adsforce(iOS)**     | XHEventInitiatedCheckout            |
| **Facebook 映射事件** | fb_mobile_initiated_checkout        |
| **Twitter 映射事件**  | CHECKOUT_INITIATED                  |
| **Criteo 映射事件**   | viewBasket                          |
| **Google 映射事件**   | begin_checkout                      |
| **Snapchat 映射事件** | START_CHECKOUT                      |

​																			**属性映射**

| Adsforce                                   | Facebook                                   | Twitter                          | Criteo                  | Google                                | Snapchat |
| :----------------------------------------- | :----------------------------------------- | :------------------------------- | :---------------------- | :------------------------------------ | :------- |
| <small>xh_price</small>                    | <small>fb_purchase_value</small>           | <small>price_micro*</small>      | <small>price</small>    | <small>price</small>                  | -        |
| <small>xh_content_type</small>             | <small>fb_content_type</small>             | <small>content_type</small>      | -                       | <small>item_category</small>          | -        |
| <small>xh_content_id</small>               | <small>fb_content_id</small>               | <small>content_id</small>        | <small>id</small>       | <small>item_id</small>                | -        |
| <small>xh_content</small>                  | <small>fb_content</small>                  | -                                | -                       | -                                     | -        |
| <small>xh_currency</small>                 | <small>fb_currency</small>                 | <small>price_currency</small>    | <small>currency</small> | <small>currency_code</small>          | -        |
| <small>xh_quantity</small>                 | <small>fb_num_items</small>                | <small>number_items</small>      | <small>quantity</small> | <small>quantity</small>               | -        |
| <small>xh_payment_info_available</small>   | <small>fb_payment_info_available</small>   | <small>user_payment_info</small> | -                       | <small>payment_info_available</small> | -        |
| <small>xh_content_list</small>             | <small>fb_content_id</small>               | -                                | -                       | <small>item_id</small>                | -        |
| <small>xh_date_a</small>                   | <small>fb_checkin_date</small>             | -                                | <small>din</small>      | <small>start_date</small>             | -        |
| <small>xh_date_b</small>                   | <small>fb_checkout_date</small>            | -                                | <small>dout</small>     | <small>end_date</small>               | -        |
| <small>xh_departing_departure_date</small> | <small>fb_departing_departure_date</small> | -                                | -                       | -                                     | -        |
| <small>xh_returning_departure_date</small> | <small>fb_returning_departure_date</small> | -                                | -                       | -                                     | -        |
| <small>xh_destination_a</small>            | <small>fb_origin_airport</small>           | -                                | -                       | <small>origin</small>                 | -        |
| <small>xh_destination_b</small>            | <small>fb_destination_airport</small>      | -                                | -                       | <small>destination</small>            | -        |
| <small>xh_destination_list</small>         | <small>fb_destination_ids</small>          | -                                | -                       | -                                     | -        |
| <small>xh_city</small>                     | <small>fb_city</small>                     | -                                | -                       | -                                     | -        |
| <small>xh_region</small>                   | <small>fb_region</small>                   | -                                | -                       | -                                     | -        |
| <small>xh_country</small>                  | <small>fb_country</small>                  | -                                | -                       | -                                     | -        |
| <small>xh_departing_arrival_date</small>   | <small>fb_departing_arrival_date</small>   | -                                | -                       | -                                     | -        |
| <small>xh_returning_arrival_date</small>   | <small>fb_returning_arrival_date</small>   | -                                | -                       | -                                     | -        |
| <small>xh_suggested_destinations</small>   | <small>fb_suggested_destinations</small>   | -                                | -                       | -                                     | -        |
| <small>xh_travel_start</small>             | <small>fb_travel_start</small>             | -                                | -                       | -                                     | -        |
| <small>xh_travel_end</small>               | <small>fb_travel_end</small>               | -                                | -                       | -                                     | -        |
| <small>xh_num_adults</small>               | <small>fb_num_adults</small>               | -                                | -                       | -                                     | -        |
| <small>xh_num_children</small>             | <small>fb_num_children</small>             | -                                | -                       | -                                     | -        |
| <small>xh_num_infants</small>              | <small>fb_num_infants</small>              | -                                | -                       | -                                     | -        |
| <small>xh_class</small>                    | <small>fb_travel_class</small>             | -                                | -                       | <small>travel_class</small>           | -        |
| <small>xh_suggested_hotels</small>         | <small>fb_suggested_hotels</small>         | -                                | -                       | -                                     | -        |
| <small>xh_user_score</small>               | <small>fb_user_score</small>               | -                                | -                       | -                                     | -        |
| <small>xh_hotel_score</small>              | <small>fb_hotel_score</small>              | -                                | -                       | -                                     | -        |
| <small>xh_purchase_currency</small>        | <small>fb_purchase_currency</small>        | -                                | -                       | -                                     | -        |
| <small>xh_preferred_star_ratings</small>   | <small>fb_preferred_star_ratings</small>   | -                                | -                       | -                                     | -        |
| <small>xh_preferred_price_range</small>    | <small>fb_preferred_price_range</small>    | -                                | -                       | -                                     | -        |
| <small>xh_preferred_neighborhoods</small>  | <small>fb_preferred_neighborhoods</small>  | -                                | -                       | -                                     | -        |
| <small>xh_preferred_num_stops</small>      | <small>fb_preferred_num_stops</small>      | -                                | -                       | -                                     | -        |

#### 花费积分

**事件名称：**xh_spent_credits

**描述：**用于追踪积分花费事件

**推荐属性：**xh_price, xh_content_type, xh_content_id, xh_content

| *平台*                | *映射事件*                    |
| :-------------------- | :---------------------------- |
| **Adsforce(Android)** | XHInAppEventType.SPENT_CREDIT |
| **Adsforce(iOS)**     | XHEventSpentCredits           |
| **Facebook 映射事件** | fb_mobile_spent_credits       |
| **Twitter 映射事件**  | SPENT_CREDITS                 |
| **Criteo 映射事件**   | transactionConfirmation       |
| **Google 映射事件**   | spend_virtual_currency        |
| **Snapchat 映射事件** | -                             |

​																			**属性映射**

| Adsforce        | Facebook        | Twitter      | Criteo  | Google        | Snapchat |
| :-------------- | :-------------- | :----------- | :------ | :------------ | :------- |
| xh_price        | _valueToSum     | price_micro* | price** | price         | -        |
| xh_content_type | fb_content_type | content_type | -       | item_category | -        |
| xh_content_id   | fb_content_id   | content_id   | item_id | item_id       | -        |
| xh_content      | fb_content      | -            | -       | -             | -        |

### 基本功能

#### 广告点击

**事件名称：**xh_ad_click

**描述：**用于追踪应用中展示广告的点击次数

**推荐属性：**xh_adrev_ad_type

| *平台*                | *映射事件*                |
| :-------------------- | :------------------------ |
| **Adsforce(Android)** | XHInAppEventType.AD_CLICK |
| **Adsforce(iOS)**     | XHEventAdClick            |
| **Facebook 映射事件** | AdClick                   |
| **Twitter 映射事件**  | -                         |
| **Criteo 映射事件**   | -                         |
| **Google 映射事件**   | -                         |
| **Snapchat 映射事件** | -                         |

​																			**属性映射**   

| Adsforce         | Facebook    | Twitter | Criteo | Google | Snapchat |
| :--------------- | :---------- | :------ | :----- | :----- | :------- |
| xh_adrev_ad_type | ad_type     | -       | -      | -      | -        |
| xh_currency      | fb_currency | -       | -      | -      | -        |



#### 广告展示

**事件名称：**xh_ad_view

**描述：**用于追踪应用中展示广告的展示次数

**推荐属性：**xh_adrev_ad_type

| *平台*                | *映射事件*               |
| :-------------------- | :----------------------- |
| **Adsforce(Android)** | XHInAppEventType.AD_VIEW |
| **Adsforce(iOS)**     | XHEventAdView            |
| **Facebook 映射事件** | AdView                   |
| **Twitter 映射事件**  | -                        |
| **Criteo 映射事件**   | -                        |
| **Google 映射事件**   | -                        |
| **Snapchat 映射事件** | -                        |

​																			**属性映射**

| Adsforce         | Facebook    | Twitter | Criteo | Google | Snapchat |
| :--------------- | :---------- | :------ | :----- | :----- | :------- |
| xh_adrev_ad_type | ad_type     | -       | -      | -      | -        |
| xh_currency      | fb_currency | -       | -      | -      | -        |



#### 实现解锁

**事件名称: ****xh_achievement_unlocked**

**描述：**用于追踪实现解锁事件

**推荐属性：**xh_description

| *平台*                | *映射事件*                            |
| :-------------------- | :------------------------------------ |
| **Adsforce(Android)** | XHInAppEventType.ACHIEVEMENT_UNLOCKED |
| **Adsforce(iOS)**     | XHEventAchievementUnlocked            |
| **Facebook 映射事件** | fb_mobile_achievement_unlocked        |
| **Twitter 映射事件**  | ACHIEVEMENT_UNLOCKED                  |
| **Criteo 映射事件**   | achievement                           |
| **Google 映射事件**   | unlock_achievement                    |
| **Snapchat 映射事件** | -                                     |

​																			**属性映射** 

| Adsforce       | Facebook       | Twitter     | Criteo         | Google      | Snapchat |
| :------------- | :------------- | :---------- | :------------- | :---------- | :------- |
| xh_description | fb_description | description | ui_achievement | description | -        |



#### 完成注册

**事件名称：**xh_complete_registration

**描述：**用于追踪用户注册方式

**推荐属性：**xh_registration_method

| *平台*                | *映射事件*                             |
| :-------------------- | :------------------------------------- |
| **Adsforce(Android)** | XHInAppEventType.COMPLETE_REGISTRATION |
| **Adsforce(iOS)**     | XHEventCompleteRegistration            |
| **Facebook 映射事件** | fb_mobile_complete_registration        |
| **Twitter 映射事件**  | SIGN_UP                                |
| **Criteo 映射事件**   | -                                      |
| **Google 映射事件**   | sign_up                                |
| **Snapchat 映射事件** | SIGN_UP                                |

​																			**属性映射**

| Adsforce                              | Facebook                              | Twitter                            | Criteo | Google                             | Snapchat |
| :------------------------------------ | :------------------------------------ | :--------------------------------- | :----- | :--------------------------------- | :------- |
| <small>xh_registration_method</small> | <small>fb_registration_method</small> | <small>registration_method</small> | -      | <small>registration_method</small> | -        |



#### 达到级别

**事件名称：**xh_level_achieved

**描述：**用于追踪游戏等级事件

**推荐属性：**xh_level, xh_score

| *平台*                | *映射事件*                      |
| :-------------------- | :------------------------------ |
| **Adsforce(Android)** | XHInAppEventType.LEVEL_ACHIEVED |
| **Adsforce(iOS)**     | XHEventLevelAchieved            |
| **Facebook 映射事件** | fb_mobile_level_achieved        |
| **Twitter 映射事件**  | LEVEL_ACHIEVED                  |
| **Criteo 映射事件**   | userLevel                       |
| **Google 映射事件**   | level_up                        |
| **Snapchat 映射事件** | LEVEL_COMPLETE                  |

​																			**属性映射**

| Adsforce | Facebook | Twitter | Criteo   | Google   | Snapchat |
| :------- | :------- | :------ | :------- | :------- | :------- |
| xh_level | fb_level | level   | ui_level | level_up | -        |
| xh_score | -        | -       | -        | score    | -        |



#### **登录**

**事件名称：**xh_login

**描述：**用于追踪用户登录事件

**推荐属性：**-

| *平台*                | *映射事件*             |
| :-------------------- | :--------------------- |
| **Adsforce(Android)** | XHInAppEventType.LOGIN |
| **Adsforce(iOS)**     | XHEventLogin           |
| **Facebook 映射事件** |                        |
| **Twitter 映射事件**  | LOGIN                  |
| **Criteo 映射事件**   |                        |
| **Google 映射事件**   | login                  |
| **Snapchat 映射事件** |                        |

​																			**属性映射**

| Adsforce | Facebook | Twitter | Criteo | Google | Snapchat |
| :------- | :------- | :------ | :----- | :----- | :------- |
| -        | -        | -       | -      | -      | -        |



#### **开始试用**

**事件名称：**xh_start_trial

**描述：**用于追踪开始免费试用产品的事件

**推荐属性：**xh_price, xh_currency

| *平台*                | *映射事件*                   |
| :-------------------- | :--------------------------- |
| **Adsforce(Android)** | XHInAppEventType.START_TRIAL |
| **Adsforce(iOS)**     | XHEventStartTrial            |
| **Facebook 映射事件** | StartTrial                   |
| **Twitter 映射事件**  | -                            |
| **Criteo 映射事件**   | -                            |
| **Google 映射事件**   | -                            |
| **Snapchat 映射事件** | -                            |

​																			**属性映射**

| Adsforce    | Facebook    | Twitter | Criteo | Google | Snapchat |
| :---------- | :---------- | :------ | :----- | :----- | :------- |
| xh_price    | _valueToSum | -       | -      | -      | -        |
| xh_currency | fb_currency | -       | -      | -      | -        |



#### **教程完成**

**事件名称：**xh_tutorial_completion

**描述：**用于追踪教程完成情况

**推荐属性：**xh_success, xh_content_id, xh_content

| *平台*                | *映射事件*                           |
| :-------------------- | :----------------------------------- |
| **Adsforce(Android)** | XHInAppEventType.TUTORIAL_COMPLETION |
| **Adsforce(iOS)**     | XHEventTutorial_completion           |
| **Facebook 映射事件** | fb_mobile_tutorial_completion        |
| **Twitter 映射事件**  | TUTORIAL_COMPLETE                    |
| **Criteo 映射事件**   | -                                    |
| **Google 映射事件**   | tutorial_complete                    |
| **Snapchat 映射事件** | -                                    |

​																			**属性映射**

| Adsforce      | Facebook      | Twitter    | Criteo | Google  | Snapchat |
| :------------ | :------------ | :--------- | :----- | :------ | :------- |
| xh_success    | fb_success    | -          | -      | success | -        |
| xh_content_id | fb_content_id | content_id | -      | item_id | -        |
| xh_content    | fb_content    | -          | -      | -       | -        |



#### **内容视图**

**事件名称：**xh_content_view

**描述：**用于追踪内容视图事件

**推荐属性：**xh_price, xh_content_type, xh_content_id, xh_content, xh_currency

| *平台*                | *映射事件*                    |
| :-------------------- | :---------------------------- |
| **Adsforce(Android)** | XHInAppEventType.CONTENT_VIEW |
| **Adsforce(iOS)**     | XHEventContentView            |
| **Facebook 映射事件** | fb_mobile_content_view        |
| **Twitter 映射事件**  | CONTENT_VIEW                  |
| **Criteo 映射事件**   | viewProduct                   |
| **Google 映射事件**   | view_item                     |
| **Snapchat 映射事件** | VIEW_CONTENT                  |

​																			**属性映射**

| Adsforce                                   | Facebook                                   | Twitter                       | Criteo                  | Google                       | Snapchat |
| :----------------------------------------- | :----------------------------------------- | :---------------------------- | :---------------------- | :--------------------------- | :------- |
| <small>xh_price</small>                    | <small>fb_purchase_value</small>           | <small>price_micro*</small>   | <small>price</small>    | <small>price</small>         | -        |
| <small>xh_content_type</small>             | <small>fb_content_type</small>             | <small>content_type</small>   | -                       | <small>item_category</small> | -        |
| <small>xh_content_id</small>               | <small>fb_content_id</small>               | <small>content_id</small>     | <small>id</small>       | <small>item_id</small>       | -        |
| <small>xh_content</small>                  | <small>fb_content</small>                  | -                             | -                       | -                            | -        |
| <small>xh_currency</small>                 | <small>fb_currency</small>                 | <small>price_currency</small> | <small>currency</small> | <small>currency_code</small> | -        |
| <small>xh_content_list</small>             | <small>fb_content_id</small>               | -                             | -                       | <small>item_id</small>       | -        |
| <small>xh_date_a</small>                   | <small>fb_checkin_date</small>             | -                             | <small>din</small>      | <small>start_date</small>    | -        |
| <small>xh_date_b</small>                   | <small>fb_checkout_date</small>            | -                             | <small>dout</small>     | <small>end_date</small>      | -        |
| <small>xh_departing_departure_date</small> | <small>fb_departing_departure_date</small> | -                             | -                       | -                            | -        |
| <small>xh_returning_departure_date</small> | <small>fb_returning_departure_date</small> | -                             | -                       | -                            | -        |
| <small>xh_destination_a</small>            | <small>fb_origin_airport</small>           | -                             | -                       | <small>origin</small>        | -        |
| <small>xh_destination_b</small>            | <small>fb_destination_airport</small>      | -                             | -                       | <small>destination</small>   | -        |
| <small>xh_destination_list</small>         | <small>fb_destination_ids</small>          | -                             | -                       | -                            | -        |
| <small>xh_city</small>                     | <small>fb_city</small>                     | -                             | -                       | -                            | -        |
| <small>xh_region</small>                   | <small>fb_region</small>                   | -                             | -                       | -                            | -        |
| <small>xh_country</small>                  | <small>fb_country</small>                  | -                             | -                       | -                            | -        |
| <small>xh_departing_arrival_date</small>   | <small>fb_departing_arrival_date</small>   | -                             | -                       | -                            | -        |
| <small>xh_returning_arrival_date</small>   | <small>fb_returning_arrival_date</small>   | -                             | -                       | -                            | -        |
| <small>xh_suggested_destinations</small>   | <small>fb_suggested_destinations</small>   | -                             | -                       | -                            | -        |
| <small>xh_travel_start</small>             | <small>fb_travel_start</small>             | -                             | -                       | -                            | -        |
| <small>xh_travel_end</small>               | <small>fb_travel_end</small>               | -                             | -                       | -                            | -        |
| <small>xh_num_adults</small>               | <small>fb_num_adults</small>               | -                             | -                       | -                            | -        |
| <small>xh_num_children</small>             | <small>fb_num_children</small>             | -                             | -                       | -                            | -        |
| <small>xh_num_infants</small>              | <small>fb_num_infants</small>              | -                             | -                       | -                            | -        |
| <small>xh_class</small>                    | <small>fb_travel_class</small>             | -                             | -                       | <small>travel_class</small>  | -        |
| <small>xh_suggested_hotels</small>         | <small>fb_suggested_hotels</small>         | -                             | -                       | -                            | -        |
| <small>xh_user_score</small>               | <small>fb_user_score</small>               | -                             | -                       | -                            | -        |
| <small>xh_hotel_score</small>              | <small>fb_hotel_score</small>              | -                             | -                       | -                            | -        |
| <small>xh_purchase_currency</small>        | <small>fb_purchase_currency</small>        | -                             | -                       | -                            | -        |
| <small>xh_preferred_star_ratings</small>   | <small>fb_preferred_star_ratings</small>   | -                             | -                       | -                            | -        |
| <small>xh_preferred_price_range</small>    | <small>fb_preferred_price_range</small>    | -                             | -                       | -                            | -        |
| <small>xh_preferred_neighborhoods</small>  | <small>fb_preferred_neighborhoods</small>  | -                             | -                       | -                            | -        |
| <small>xh_preferred_num_stops</small>      | <small>fb_preferred_num_stops</small>      | -                             | -                       | -                            | -        |



#### **列表视图**

**事件名称：**xh_list_view

**描述：**用于追踪列表视图事件

**推荐属性：**xh_content_type, xh_content_list

| *平台*                | *映射事件*                            |
| :-------------------- | :------------------------------------ |
| **Adsforce(Android)** | use the string "xh_list_view" instead |
| **Adsforce(iOS)**     | XHEventListView                       |
| **Facebook 映射事件** |                                       |
| **Twitter 映射事件**  |                                       |
| **Criteo 映射事件**   | viewListing                           |
| **Google 映射事件**   | view_item_list                        |
| **Snapchat 映射事件** |                                       |

​																			**属性映射**

| Adsforce        | Facebook | Twitter | Criteo | Google        | Snapchat |
| :-------------- | :------- | :------ | :----- | :------------ | :------- |
| xh_content_type | -        | -       | -      | item_Category | -        |
| xh_content_list | -        | -       | -      | item_id       | -        |



#### **用户唤醒**

**事件名称：**xh_re_engage

**描述：**用于追踪用户的重参与事件

**推荐属性：**-

| *平台*                | *映射事件*                 |
| :-------------------- | :------------------------- |
| **Adsforce(Android)** | XHInAppEventType.RE_ENGAGE |
| **Adsforce(iOS)**     | XHEventReEngage            |
| **Facebook 映射事件** | -                          |
| **Twitter 映射事件**  | RE_ENGAGE                  |
| **Criteo 映射事件**   | -                          |
| **Google 映射事件**   | custom_event               |
| **Snapchat 映射事件** | -                          |

​																			**属性映射**

| Adsforce       | Facebook | Twitter     | Criteo | Google      | Snapchat |
| :------------- | :------- | :---------- | :----- | :---------- | :------- |
| xh_description | -        | description | -      | description | -        |



#### **搜索**

**事件名称：**xh_search

**描述：**用于追踪搜索事件

**推荐属性：**xh_content_type, xh_search_string, xh_success

| *平台*                | *映射事件*              |
| :-------------------- | :---------------------- |
| **Adsforce(Android)** | XHInAppEventType.SEARCH |
| **Adsforce(iOS)**     | XHEventSearch           |
| **Facebook 映射事件** | fb_mobile_search        |
| **Twitter 映射事件**  | SEARCH                  |
| **Criteo 映射事件**   | viewSearch              |
| **Google 映射事件**   | SEARCH                  |
| **Snapchat 映射事件** | -                       |

​																			**属性映射**

| Adsforce                                   | Facebook                                   | Twitter                      | Criteo              | Google                       | Snapchat |
| :----------------------------------------- | :----------------------------------------- | :--------------------------- | :------------------ | :--------------------------- | :------- |
| <small>xh_content_type</small>             | <small>fb_content_type</small>             | <small>content_type</small>  | -                   | <small>item_category</small> | -        |
| <small>xh_search_string</small>            | <small>fb_search_string</small>            | <small>search_string</small> | -                   | <small>search_term</small>   | -        |
| <small>xh_date_a</small>                   | <small>fb_checkin_date</small>             | -                            | <small>din</small>  | <small>start_date</small>    | -        |
| <small>xh_date_b</small>                   | <small>fb_checkout_date</small>            | -                            | <small>dout</small> | <small>end_date</small>      | -        |
| <small>xh_destination_a</small>            | <small>fb_origin_airport</small>           | -                            | -                   | <small>origin</small>        | -        |
| <small>xh_destination_b</small>            | <small>fb_destination_airport</small>      | -                            | -                   | <small>destination</small>   | -        |
| <small>xh_success</small>                  | <small>fb_success</small>                  | -                            | -                   | <small>success</small>       | -        |
| <small>xh_content_list</small>             | <small>fb_content_id</small>               | -                            | -                   | <small>item_id</small>       | -        |
| <small>xh_departing_departure_date</small> | <small>fb_departing_departure_date</small> | -                            | -                   | -                            | -        |
| <small>xh_returning_departure_date</small> | <small>fb_returning_departure_date</small> | -                            | -                   | -                            | -        |
| <small>xh_destination_list</small>         | <small>fb_destination_ids</small>          | -                            | -                   | -                            | -        |
| <small>xh_city</small>                     | <small>fb_city</small>                     | -                            | -                   | -                            | -        |
| <small>xh_region</small>                   | <small>fb_region</small>                   | -                            | -                   | -                            | -        |
| <small>xh_country</small>                  | <small>fb_country</small>                  | -                            | -                   | -                            | -        |
| <small>xh_departing_arrival_date</small>   | <small>fb_departing_arrival_date</small>   | -                            | -                   | -                            | -        |
| <small>xh_returning_arrival_date</small>   | <small>fb_returning_arrival_date</small>   | -                            | -                   | -                            | -        |
| <small>xh_suggested_destinations</small>   | <small>fb_suggested_destinations</small>   | -                            | -                   | -                            | -        |
| <small>xh_travel_start</small>             | <small>fb_travel_start</small>             | -                            | -                   | -                            | -        |
| <small>xh_travel_end</small>               | <small>fb_travel_end</small>               | -                            | -                   | -                            | -        |
| <small>xh_num_adults</small>               | <small>fb_num_adults</small>               | -                            | -                   | -                            | -        |
| <small>xh_num_children</small>             | <small>fb_num_children</small>             | -                            | -                   | -                            | -        |
| <small>xh_num_infants</small>              | <small>fb_num_infants</small>              | -                            | -                   | -                            | -        |
| <small>xh_class</small>                    | <small>fb_travel_class</small>             | -                            | -                   | <small>travel_class</small>  | -        |
| <small>xh_suggested_hotels</small>         | <small>fb_suggested_hotels</small>         | -                            | -                   | -                            | -        |
| <small>xh_user_score</small>               | <small>fb_user_score</small>               | -                            | -                   | -                            | -        |
| <small>xh_hotel_score</small>              | <small>fb_hotel_score</small>              | -                            | -                   | -                            | -        |
| <small>xh_price</small>                    | <small>fb_purchase_value</small>           | -                            | -                   | <small>price</small>         | -        |
| <small>xh_purchase_currency</small>        | <small>fb_purchase_currency</small>        | -                            | -                   | -                            | -        |
| <small>xh_preferred_star_ratings</small>   | <small>fb_preferred_star_ratings</small>   | -                            | -                   | -                            | -        |
| <small>xh_preferred_price_range</small>    | <small>fb_preferred_price_range</small>    | -                            | -                   | -                            | -        |
| <small>xh_preferred_neighborhoods</small>  | <small>fb_preferred_neighborhoods</small>  | -                            | -                   | -                            | -        |
| <small>xh_preferred_num_stops</small>      | <small>fb_preferred_num_stops</small>      | -                            | -                   | -                            | -        |



### 高级功能

#### **邀请**

**事件名称：**xh_invite

**描述：**用于追踪邀请（社交）事件

**推荐属性：**-

| *平台*                | *映射事件*              |
| :-------------------- | :---------------------- |
| **Adsforce(Android)** | XHInAppEventType.INVITE |
| **Adsforce(iOS)**     | XHEventInvite           |
| **Facebook 映射事件** | -                       |
| **Twitter 映射事件**  | INVITE                  |
| **Criteo 映射事件**   | -                       |
| **Google 映射事件**   | invite                  |
| **Snapchat 映射事件** | -                       |

​																			**属性映射**

| Adsforce       | Facebook | Twitter     | Criteo | Google      | Snapchat |
| :------------- | :------- | :---------- | :----- | :---------- | :------- |
| xh_description | -        | description | -      | description | -        |



#### 从推送通知打开

**事件名称：**xh_opened_from_push_notification

**描述：**用于追踪从推送通知打开应用的事件

**推荐属性：**-

| *平台*                  | *映射事件*                                     |
| :---------------------- | :--------------------------------------------- |
| **Adsforce（Android）** | XHInAppEventType.OPENED_FROM_PUSH_NOTIFICATION |
| **Adsforce（iOS）**     | XHEventOpenedFromPushNotification              |
| **Facebook 映射事件**   |                                                |
| **Twitter 映射事件**    |                                                |
| **Criteo 映射事件**     |                                                |
| **Google 映射事件**     | notification_open                              |
| **Snapchat 映射事件**   |                                                |

​																			**属性映射**

| Adsforce | Facebook | Twitter | Criteo | Google | Snapchat |
| :------- | :------- | :------ | :----- | :----- | :------- |
| -        | -        | -       | -      | -      | -        |



#### **评级**

**事件名称：**xh_rate

**描述：**用于追踪应用/商品评级事件。

**推荐属性：**xh_rating_value, xh_content_type, xh_content_id, xh_content,  xh_max_rating_value

| *平台*                  | *映射事件*            |
| :---------------------- | :-------------------- |
| **Adsforce（Android）** | XHInAppEventType.RATE |
| **Adsforce（iOS）**     | XHEventRate           |
| **Facebook 映射事件**   | fb_mobile_rate        |
| **Twitter 映射事件**    | RATED                 |
| **Criteo 映射事件**     |                       |
| **Google 映射事件**     | submit_rating         |
| **Snapchat 映射事件**   |                       |

​																			**属性映射**

| Adsforce            | Facebook                           | Twitter                        | Criteo | Google       | Snapchat |
| :------------------ | :--------------------------------- | :----------------------------- | :----- | :----------- | :------- |
| xh_rating_value     | <small>_valueToSum</small>         | <small>price_micro</small>     | value  | -            | -        |
| xh_content_type     | <small>fb_content_type</small>     | <small>content_type</small>    | -      | content_type | -        |
| xh_content_id       | <small>fb_content_id</small>       | <small>content_id</small>      | -      | content_id   | -        |
| xh_content          | <small>fb_content</small>          | -                              | -      | -            | -        |
| xh_max_rating_value | <small>fb_max_rating_value</small> | <small>max_rated_value</small> | -      | max_rating   | -        |



#### **分享**

**事件名称：**xh_share

**描述：**用于追踪分享事件

**推荐属性：**xh_description

| *平台*                  | *映射事件*             |
| :---------------------- | :--------------------- |
| **Adsforce（Android）** | XHInAppEventType.SHARE |
| **Adsforce（iOS）**     | XHEventShare           |
| **Facebook 映射事件**   | -                      |
| **Twitter 映射事件**    | SHARE                  |
| **Criteo 映射事件**     | -                      |
| **Google 映射事件**     | share                  |
| **Snapchat 映射事件**   | -                      |

​																			**属性映射**

| Adsforce       | Facebook | Twitter     | Criteo | Google      | Snapchat |
| :------------- | :------- | :---------- | :----- | :---------- | :------- |
| xh_description | -        | description | -      | description | -        |



#### **订阅**

**事件名称：**xh_subscribe

**描述：**用于追踪付费订阅购买

**推荐属性：**xh_currency

| *平台*                  | *映射事件*                 |
| :---------------------- | :------------------------- |
| **Adsforce（Android）** | XHInAppEventType.SUBSCRIBE |
| **Adsforce（iOS）**     | XHEventSubscribe           |
| **Facebook 映射事件**   | Subscribe                  |
| **Twitter 映射事件**    | -                          |
| **Criteo 映射事件**     | -                          |
| **Google 映射事件**     | -                          |
| **Snapchat 映射事件**   | -                          |

​																			**属性映射****

| Adsforce    | Facebook    | Twitter | Criteo | Google | Snapchat |
| :---------- | :---------- | :------ | :----- | :----- | :------- |
| xh_revenue  | _valueToSum | -       | -      | -      | -        |
| xh_currency | fb_currency | -       | -      | -      | -        |



#### **旅行预订**

**事件名称：**xh_travel_booking

**描述：**用于追踪旅行预订事件（及相关收入）

**推荐属性：**xh_customer_user_id, xh_content_type, xh_content_id, xh_class, xh_date_a, 

​                                                    xh_date_b, xh_destination_a, xh_destination_b

| *平台*                  | *映射事件*                      |
| :---------------------- | :------------------------------ |
| **Adsforce（Android）** | XHInAppEventType.TRAVEL_BOOKING |
| **Adsforce（iOS）**     | XHEventTravelBooking            |
| **Facebook 映射事件**   | fb_mobile_purchase              |
| **Twitter 映射事件**    | PURCHASE                        |
| **Criteo 映射事件**     | transactionConfirmation         |
| **Google 映射事件**     | ecommerce_purchase              |
| **Snapchat 映射事件**   | -                               |

​																			**属性映射**

| Adsforce                                   | Facebook                                   | Twitter                      | Criteo                  | Google                          | Snapchat |
| :----------------------------------------- | :----------------------------------------- | :--------------------------- | :---------------------- | :------------------------------ | :------- |
| <small>xh_revenue*</small>                 | <small>_valueToSum</small>                 | <small>price_micro**</small> | <small>price***</small> | <small>value</small>            | -        |
| <small>xh_customer_user_id</small>         | -                                          | -                            | <small>cid</small>      | <small>customer_user_id</small> | -        |
| <small>xh_content_type</small>             | <small>fb_content_type</small>             | <small>content_type</small>  | -                       | <small>item_category</small>    | -        |
| <small>xh_content_id</small>               | <small>fb_content_id</small>               | <small>content_id</small>    | -                       | <small>item_id</small>          | -        |
| <small>xh_class</small>                    | <small>fb_travel_class</small>             | -                            | -                       | <small>travel_class</small>     | -        |
| <small>xh_date_a</small>                   | <small>fb_checkin_date</small>             | -                            | <small>din</small>      | <small>start_date</small>       | -        |
| <small>xh_date_b</small>                   | <small>fb_checkout_date</small>            | -                            | <small>dout</small>     | <small>end_date</small>         | -        |
| <small>xh_destination_a</small>            | <small>fb_origin_airport</small>           | -                            | -                       | <small>origin</small>           | -        |
| <small>xh_destination_b</small>            | <small>fb_destination_airport</small>      | -                            | -                       | <small>destination</small>      | -        |
| <small>xh_success</small>                  | <small>fb_success</small>                  | -                            | -                       | <small>success</small>          | -        |
| <small>xh_content_list</small>             | <small>fb_content_ids</small>              | -                            | -                       | <small>item_id</small>          | -        |
| <small>xh_departing_departure_date</small> | <small>fb_departing_departure_date</small> | -                            | -                       | -                               | -        |
| <small>xh_returning_departure_date</small> | <small>fb_returning_departure_date</small> | -                            | -                       | -                               | -        |
| <small>xh_destination_list</small>         | <small>fb_destination_ids</small>          | -                            | -                       | -                               | -        |
| <small>xh_city</small>                     | <small>fb_city</small>                     | -                            | -                       | -                               | -        |
| <small>xh_region</small>                   | <small>fb_region</small>                   | -                            | -                       | -                               | -        |
| <small>xh_country</small>                  | <small>fb_country</small>                  | -                            | -                       | -                               | -        |
| <small>xh_departing_arrival_date</small>   | <small>fb_departing_arrival_date</small>   | -                            | -                       | -                               | -        |
| <small>xh_returning_arrival_date</small>   | <small>fb_returning_arrival_date</small>   | -                            | -                       | -                               | -        |
| <small>xh_suggested_destinations</small>   | <small>fb_suggested_destinations</small>   | -                            | -                       | -                               | -        |
| <small>xh_travel_start</small>             | <small>fb_travel_start</small>             | -                            | -                       | -                               | -        |
| <small>xh_travel_end</small>               | <small>fb_travel_end</small>               | -                            | -                       | -                               | -        |
| <small>xh_num_adults</small>               | <small>fb_num_adults</small>               | -                            | -                       | -                               | -        |
| <small>xh_num_children</small>             | <small>fb_num_children</small>             | -                            | -                       | -                               | -        |
| <small>xh_num_infants</small>              | <small>fb_num_infants</small>              | -                            | -                       | -                               | -        |
| <small>xh_suggested_hotels</small>         | <small>fb_suggested_hotels</small>         | -                            | -                       | -                               | -        |
| <small>xh_user_score</small>               | <small>fb_user_score</small>               | -                            | -                       | -                               | -        |
| <small>xh_hotel_score</small>              | <small>fb_hotel_score</small>              | -                            | -                       | -                               | -        |
| <small>xh_price</small>                    | <small>fb_purchase_value</small>           | -                            | -                       | <small>price</small>            | -        |
| <small>xh_purchase_currency</small>        | <small>fb_purchase_currency</small>        | -                            | -                       | -                               | -        |
| <small>xh_preferred_star_ratings</small>   | <small>fb_preferred_star_ratings</small>   | -                            | -                       | -                               | -        |
| <small>xh_preferred_price_range</small>    | <small>fb_preferred_star_ratings</small>   | -                            | -                       | -                               | -        |
| <small>xh_preferred_neighborhoods</small>  | <small>fb_preferred_neighborhoods</small>  | -                            | -                       | -                               | -        |
| <small>xh_preferred_num_stops</small>      | <small>fb_preferred_num_stops</small>      | -                            | -                       | -                               | -        |
| <small>xh_order_id</small>                 | <small>fb_order_id</small>                 | -                            | -                       | <small>order_id</small>         | -        |





#### **更新**

**事件名称：**xh_update

**描述：**用于追踪更新事件

**推荐属性：**xh_content_id

| *平台*                  | *映射事件*              |
| :---------------------- | :---------------------- |
| **Adsforce（Android）** | XHInAppEventType.UPDATE |
| **Adsforce（iOS）**     | XHEventUpdate           |
| **Facebook 映射事件**   |                         |
| **Twitter 映射事件**    | UPDATE                  |
| **Criteo 映射事件**     | -                       |
| **Google 映射事件**     | app_update              |
| **Snapchat 映射事件**   | -                       |

​																			**属性映射**

| Adsforce      | Facebook | Twitter    | Criteo | Google  | Snapchat |
| :------------ | :------- | :--------- | :----- | :------ | :------- |
| xh_content_id | -        | content_id | -      | item_id | -        |


