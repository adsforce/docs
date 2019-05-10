# 介绍
​     Adsforce应用内事件可以让广告主追踪应用安装后事件将其归入原始媒体渠道。

​     如果您的用户进行注册、将商品添加至购物车或进行购买等，应用内事件可显示相关数据。

​     **应用内事件可以确认用户价值以及不同的媒体渠道所带来的流量与质量**。

​     使用应用内事件可以让广告平台高效优化网络流量，因此 Adsforce 强烈建议您使用应用内事件。  

![img](hybrid-app-in-app-event.png)

## Trackevent API

​         应用内事件由事件名称和事件参数组成。

​         您可以选择已有的事件名称。但 Adsforce 的 SDK 是通过枚举和定义推荐事件名称 。

​         事件名称区分大小写, 例如, 发送 xh_purchase 和 xh_PURCHASE 两个事件名称将创建两个单独的事件。

​         语法：

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



## 重要

![img](purchase event.png)

### 收益参数

​         您可以使用任何参数和事件发送收益值。但是必须使用 **xh_revenue** 参数在 Adsforce 的原始和聚合数据中注册收益 。使用此参数能够真实的展示获得收益的应用内事件。

### 多个商品

​         您可以在单笔交易中添加多个商品，用逗号隔开多个商品描述，无需让每个事件参数对应。

#### 示例

​         在同一笔交易中，A. Force 先生从某家美国线上商店购买了两件完全一样的衬衫，一双鞋和一顶帽子。

​         列明各商品的序列必须与各参数完全一致。

​         `xh_content_id: ["123","988","399"]`
         `xh_quantity: [2,1,1]`
         `xh_price: [25,50,10]`
         `xh_revenue: [110]`
         `xh_currency: USD`

​         对于多个商品，代码显示如下：

```
Map<String,Object> eventData = new HashMap<>();
eventData.put(xhInAppEventParameterName.CONTENT_ID, new String[] {"123","988","399"});
eventData.put(xhInAppEventParameterName.QUANTITY, new int[] {2, 1, 1});
eventData.put(xhInAppEventParameterName.PRICE,new int[] {25, 50, 10});
eventData.put(xhInAppEventParameterName.CURRENCY,"USD");
eventData.put(xhInAppEventParameterName.REVENUE,110);
AdsforceLib.getInstance().trackEvent(AdsforceTestActivity.this, xhInAppEventType.PURCHASE,eventData);
```

**注意**

​         多商品描述可以在以下应用内事件中使用：
         `xh_add_to_cart`、`xh_add_to_wishlist`、`xh_tutorial_completion`、`xh_initiated_checkout`、    
​         `xh_purchase`、`xh_rate`、`xh_spent_credits `、`xh_content_view`、`xh_travel_booking`、`xh_update`

### 复杂应用内事件

​         复杂应用内事件可以允许一个API调用多个发送事件。

​         复杂应用内事件能有效查看关联密切的用户操作，例如在单个会话中将若干产品添加到购物车。

#### **示例**

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

#### 警告

​         复杂应用内事件会引起 Facebook 和 Criteo 出现回传问题。如果您需要事件与 Facebook 和 Criteo 全部展示，您可以按照各用户操作发送单独事件。

​         例如按照各添加的商品发送到”添加到购物车“应用事件，应用内事件将会把这些事件分为一组。

### 离线追踪事件

​         如果用户在网络连接不可用时启动了事件，Adsforce仍可追踪该事件. 以下是其原理:

1. SDK 将事件发送到 Adsforce 服务器并等待响应。
2. 如果 SDK 没有收到响应200, 则该事件将存储在缓存中。
3. 收到下一个响应200后, 存储的事件将重新发送到服务器。
4. 如果缓存中有多个事件, 将按序号发送到服务器。

**注意**

​         SDK 的缓存最多可以存储40个事件, 这意味着只保存脱机发生的前40个事件。之后所有的事件都会被丢弃，直到下一个相应200。

#### 事件去重

​         Adsforce 有一套应用内事件去重的机制。它会检查所有应用内事件，以查看同一个 Adsforce_id 是否10秒内有同一个应用内事件。如果找到此类事件, 该机制将删除重复项。

​         如果两个事件中的以下字段相同, 则两个事件被视为相同:

- eventName
- Event value
- App ID
- Adsforce ID

##### 注意

​         去重工作仅适用于从 SDK 发送的应用内事件。

​         服务器对服务器的应用内事件不会去重。


## Dave Title
### Purchasing

#### Add Payment Info

**Event Name:** xh_add_payment_info

**Description:** Used to track payment info configuration status

**Recommended Attributes:** xh_success

| *Platform*                | *Mapped Event*                    |
| :------------------------ | :-------------------------------- |
| **Adsforce(Android)**     | XHInAppEventType.ADD_PAYMENT_INFO |
| **Adsforce(iOS)**         | XHEventAddPaymentInfo             |
| **Facebook Mapped Event** | fb_mobile_add_payment_info        |
| **Twitter Mapped Event**  | -                                 |
| **Criteo Mapped Event**   | -                                 |
| **Google Mapped Event**   | add_payment_info                  |
| **Snapchat Mapped Event** | ADD_BILLING                       |

​																			**Attributes Mapping**

| Adsforce   | Facebook   | Twitter           | Criteo | Google           | Snapchat |
| :--------- | :--------- | :---------------- | :----- | :--------------- | :------- |
| xh_success | fb_success | user_payment_info | -      | add_payment_info | -        |



#### Add to Cart

**Event Name:** xh_add_to_cart

**Description:** Used to track add to cart events of specific items

**Recommended Attributes:** xh_price, xh_content_type, xh_content_id, xh_content, xh_currency,                

​                                                    xh_quantity

| *Platform*                | *Mapped Event*               |
| :------------------------ | :--------------------------- |
| **Adsforce(Android)**     | XHInAppEventType.ADD_TO_CART |
| **Adsforce(iOS)**         | XHEventAddToCart             |
| **Facebook Mapped Event** | fb_mobile_add_to_cart        |
| **Twitter Mapped Event**  | ADD_TO_CART                  |
| **Criteo Mapped Event**   | viewBasket                   |
| **Google Mapped Event**   | add_to_cart                  |
| **Snapchat Mapped Event** | ADD_CART                     |

​																			**Attributes Mapping**

| Adsforce        | Facebook        | Twitter        | Criteo   | Google        | Snapchat |
| :-------------- | :-------------- | :------------- | :------- | :------------ | :------- |
| xh_price        | _valueToSum     | price_micro*   | price**  | price         | -        |
| xh_content_type | fb_content_type | content_type   | -        | item_category | -        |
| xh_content_id   | fb_content_id   | content_id     | id       | item_id       | -        |
| xh_content      | fb_content      | -              | -        | -             | -        |
| xh_currency     | fb_currency     | price_currency | currency | currency_code | -        |
| xh_quantity     | -               | number_items   | quantity | quantity      | -        |

#### Add to Wishlist

**Event Name:** xh_add_to_wishlist

**Description:** Used to track add to wishlist events of specific items.

**Recommended Attributes:** xh_price, xh_content_type, xh_content_id, xh_content, xh_currency, 

​                                                    xh_quantity

| *Platform*                | *Mapped Event*                    |
| :------------------------ | :-------------------------------- |
| **Adsforce(Android)**     | XHInAppEventType.ADD_TO_WISH_LIST |
| **Adsforce(iOS)**         | XHEventAddToWishlist              |
| **Facebook Mapped Event** | fb_mobile_add_to_wishlist         |
| **Twitter Mapped Event**  | ADD_TO_WISHLIST                   |
| **Criteo Mapped Event**   | -                                 |
| **Google Mapped Event**   | add_to_wishlist                   |
| **Snapchat Mapped Event** | -                                 |

​																			**Attributes Mapping**

| Adsforce        | Facebook        | Twitter        | Criteo | Google        | Snapchat |
| :-------------- | :-------------- | :------------- | :----- | :------------ | :------- |
| xh_price        | _valueToSum     | price_micro*   | -      | Price         | -        |
| xh_content_type | fb_content_type | content_type   | -      | itemcategory  | -        |
| xh_content_id   | fb_content_id   | content_id     | -      | item_id       | -        |
| xh_content      | fb_content      | -              | -      | -             | -        |
| xh_currency     | fb_currency     | price_currency | -      | currency_code | -        |
| xh_quantity     | -               | number_items   | -      | quantity      | -        |



#### Initiated Checkout

**Event Name:** xh_initiated_checkout

**Description:** Used to track checkout events

**Recommended Attributes:** xh_price, xh_content_type, xh_content_id, xh_content, xh_currency, 

​                                                    xh_quantity, xh_payment_info_available

| *Platform*                | *Mapped Event*                      |
| :------------------------ | :---------------------------------- |
| **Adsforce(Android)**     | XHInAppEventType.INITIATED_CHECKOUT |
| **Adsforce(iOS)**         | XHEventInitiatedCheckout            |
| **Facebook Mapped Event** | fb_mobile_initiated_checkout        |
| **Twitter Mapped Event**  | CHECKOUT_INITIATED                  |
| **Criteo Mapped Event**   | viewBasket                          |
| **Google Mapped Event**   | begin_checkout                      |
| **Snapchat Mapped Event** | START_CHECKOUT                      |

​																			**Attributes Mapping - 1111111111**

| Adsforce                                   | Facebook                                   | Twitter                          | Criteo                  | Google                                | Snapchat |
| :----------------------------------------- | :----------------------------------------- | :------------------------------- | :---------------------- | :------------------------------------ | :------- |
| <small>xh_price</small>                    | <small>fb_purchase_value</small>           | <small>price_micro*</small>      | <small>price</small>    | <small>price</small>                  | -        |
| <small>xh_content_type</small>             | <small>fb_content_type</small>             | <small>content_type</small>      | -                       | <small>item_category</small>          | -        |
| <small>xh_content_id</small>               | <<small>fb_content_id</small>              | <small>content_id</small>        | <small>id</small>       | <small>item_id</small>                | -        |
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

#### Spent Credits

**Event Name:** xh_spent_credits

**Description:** Used to track credit spend events

**Recommended Attributes:** xh_price, xh_content_type, xh_content_id, xh_content

| *Platform*                | *Mapped Event*                |
| :------------------------ | :---------------------------- |
| **Adsforce(Android)**     | XHInAppEventType.SPENT_CREDIT |
| **Adsforce(iOS)**         | XHEventSpentCredits           |
| **Facebook Mapped Event** | fb_mobile_spent_credits       |
| **Twitter Mapped Event**  | SPENT_CREDITS                 |
| **Criteo Mapped Event**   | transactionConfirmation       |
| **Google Mapped Event**   | spend_virtual_currency        |
| **Snapchat Mapped Event** | -                             |

​																			**Attributes Mapping**

| Adsforce        | Facebook        | Twitter      | Criteo  | Google        | Snapchat |
| :-------------- | :-------------- | :----------- | :------ | :------------ | :------- |
| xh_price        | _valueToSum     | price_micro* | price** | price         | -        |
| xh_content_type | fb_content_type | content_type | -       | item_category | -        |
| xh_content_id   | fb_content_id   | content_id   | item_id | item_id       | -        |
| xh_content      | fb_content      | -            | -       | -             | -        |


### Basic Features

#### Achievement Unlocked

**Event Name:** xh_achievement_unlocked

**Description:** Used to track achievement unlocking events

**Recommended Attributes:** xh_description

| *Platform*                | *Mapped Event*                        |
| :------------------------ | :------------------------------------ |
| **Adsforce(Android)**     | XHInAppEventType.ACHIEVEMENT_UNLOCKED |
| **Adsforce(iOS)**         | XHEventAchievementUnlocked            |
| **Facebook Mapped Event** | fb_mobile_achievement_unlocked        |
| **Twitter Mapped Event**  | ACHIEVEMENT_UNLOCKED                  |
| **Criteo Mapped Event**   | achievement                           |
| **Google Mapped Event**   | unlock_achievement                    |
| **Snapchat Mapped Event** | -                                     |

​																			**Attributes Mapping** 

| Adsforce       | Facebook       | Twitter     | Criteo         | Google      | Snapchat |
| :------------- | :------------- | :---------- | :------------- | :---------- | :------- |
| xh_description | fb_description | description | ui_achievement | description | -        |



#### Complete Registration

**Event Name:** xh_complete_registration

**Description:** Used to track user registration methods

**Recommended Attributes:** xh_registration_method

| *Platform*                | *Mapped Event*                         |
| :------------------------ | :------------------------------------- |
| **Adsforce(Android)**     | XHInAppEventType.COMPLETE_REGISTRATION |
| **Adsforce(iOS)**         | XHEventCompleteRegistration            |
| **Facebook Mapped Event** | fb_mobile_complete_registration        |
| **Twitter Mapped Event**  | SIGN_UP                                |
| **Criteo Mapped Event**   | -                                      |
| **Google Mapped Event**   | sign_up                                |
| **Snapchat Mapped Event** | SIGN_UP                                |

​																			**Attributes Mapping**

| Adsforce                              | Facebook                              | Twitter                            | Criteo | Google                             | Snapchat |
| :------------------------------------ | :------------------------------------ | :--------------------------------- | :----- | :--------------------------------- | :------- |
| <small>xh_registration_method</small> | <small>fb_registration_method</small> | <small>registration_method</small> | -      | <small>registration_method</small> | -        |



#### Level Achieved

**Event Name:** xh_level_achieved

**Description:** Used to track game level events

**Recommended Attributes:** xh_level, xh_score

| *Platform*                | *Mapped Event*                  |
| :------------------------ | :------------------------------ |
| **Adsforce(Android)**     | XHInAppEventType.LEVEL_ACHIEVED |
| **Adsforce(iOS)**         | XHEventLevelAchieved            |
| **Facebook Mapped Event** | fb_mobile_level_achieved        |
| **Twitter Mapped Event**  | LEVEL_ACHIEVED                  |
| **Criteo Mapped Event**   | userLevel                       |
| **Google Mapped Event**   | level_up                        |
| **Snapchat Mapped Event** | LEVEL_COMPLETE                  |

​																			**Attributes Mapping**

| Adsforce | Facebook | Twitter | Criteo   | Google   | Snapchat |
| :------- | :------- | :------ | :------- | :------- | :------- |
| xh_level | fb_level | level   | ui_level | level_up | -        |
| xh_score | -        | -       | -        | score    | -        |



#### Login

**Event Name:** xh_login

**Description:** Used to track user login events

**Recommended Attributes:** -

| *Platform*                | *Mapped Event*         |
| :------------------------ | :--------------------- |
| **Adsforce(Android)**     | XHInAppEventType.LOGIN |
| **Adsforce(iOS)**         | XHEventLogin           |
| **Facebook Mapped Event** |                        |
| **Twitter Mapped Event**  | LOGIN                  |
| **Criteo Mapped Event**   |                        |
| **Google Mapped Event**   | login                  |
| **Snapchat Mapped Event** |                        |

​																			**Attributes Mapping**

| Adsforce | Facebook | Twitter | Criteo | Google | Snapchat |
| :------- | :------- | :------ | :----- | :----- | :------- |
| -        | -        | -       | -      | -      | -        |



#### Start Trial

**Event Name:** xh_start_trial

**Description:** Used to track the start of a free trial of a product

**Recommended Attributes:** xh_price, xh_currency

| *Platform*                | *Mapped Event*               |
| :------------------------ | :--------------------------- |
| **Adsforce(Android)**     | XHInAppEventType.START_TRIAL |
| **Adsforce(iOS)**         | XHEventStartTrial            |
| **Facebook Mapped Event** | StartTrial                   |
| **Twitter Mapped Event**  | -                            |
| **Criteo Mapped Event**   | -                            |
| **Google Mapped Event**   | -                            |
| **Snapchat Mapped Event** | -                            |

​																			**Attributes Mapping**

| Adsforce    | Facebook    | Twitter | Criteo | Google | Snapchat |
| :---------- | :---------- | :------ | :----- | :----- | :------- |
| xh_price    | _valueToSum | -       | -      | -      | -        |
| xh_currency | fb_currency | -       | -      | -      | -        |



#### Tutorial Completion

**Event Name:** xh_tutorial_completion

**Description:** Used to track tutorial completions

**Recommended Attributes:** xh_success, xh_content_id, xh_content

| *Platform*                | *Mapped Event*                       |
| :------------------------ | :----------------------------------- |
| **Adsforce(Android)**     | XHInAppEventType.TUTORIAL_COMPLETION |
| **Adsforce(iOS)**         | XHEventTutorial_completion           |
| **Facebook Mapped Event** | fb_mobile_tutorial_completion        |
| **Twitter Mapped Event**  | TUTORIAL_COMPLETE                    |
| **Criteo Mapped Event**   | -                                    |
| **Google Mapped Event**   | tutorial_complete                    |
| **Snapchat Mapped Event** | -                                    |

​																			**Attributes Mapping**

| Adsforce      | Facebook      | Twitter    | Criteo | Google  | Snapchat |
| :------------ | :------------ | :--------- | :----- | :------ | :------- |
| xh_success    | fb_success    | -          | -      | success | -        |
| xh_content_id | fb_content_id | content_id | -      | item_id | -        |
| xh_content    | fb_content    | -          | -      | -       | -        |



### Additional features

#### Invite

**Event Name:** xh_invite

**Description:** Used to track invite (social) events

**Recommended Attributes:** -

| *Platform*                | *Mapped Event*          |
| :------------------------ | :---------------------- |
| **Adsforce(Android)**     | XHInAppEventType.INVITE |
| **Adsforce(iOS)**         | XHEventInvite           |
| **Facebook Mapped Event** | -                       |
| **Twitter Mapped Event**  | INVITE                  |
| **Criteo Mapped Event**   | -                       |
| **Google Mapped Event**   | invite                  |
| **Snapchat Mapped Event** | -                       |

​																			**Attributes Mapping**

| Adsforce       | Facebook | Twitter     | Criteo | Google      | Snapchat |
| :------------- | :------- | :---------- | :----- | :---------- | :------- |
| xh_description | -        | description | -      | description | -        |



#### Opened From Push Notification

**Event Name:** xh_opened_from_push_notification

**Description:** Used to track app opens from push notification events

**Recommended Attributes:** -

| *Platform*                | *Mapped Event*                                 |
| :------------------------ | :--------------------------------------------- |
| **Adsforce(Android)**     | XHInAppEventType.OPENED_FROM_PUSH_NOTIFICATION |
| **Adsforce(iOS)**         | XHEventOpenedFromPushNotification              |
| **Facebook Mapped Event** |                                                |
| **Twitter Mapped Event**  |                                                |
| **Criteo Mapped Event**   |                                                |
| **Google Mapped Event**   | notification_open                              |
| **Snapchat Mapped Event** |                                                |

​																			**Attributes Mapping**

| Adsforce | Facebook | Twitter | Criteo | Google | Snapchat |
| :------- | :------- | :------ | :----- | :----- | :------- |
| -        | -        | -       | -      | -      | -        |



#### Rate

**Event Name:** xh_rate

**Description:** Used to track app/item rating events.

**Recommended Attributes:** xh_rating_value, xh_content_type, xh_content_id, xh_content, 

​                                                    xh_max_rating_value

| *Platform*                | *Mapped Event*        |
| :------------------------ | :-------------------- |
| **Adsforce(Android)**     | XHInAppEventType.RATE |
| **Adsforce(iOS)**         | XHEventRate           |
| **Facebook Mapped Event** | fb_mobile_rate        |
| **Twitter Mapped Event**  | RATED                 |
| **Criteo Mapped Event**   |                       |
| **Google Mapped Event**   | submit_rating         |
| **Snapchat Mapped Event** |                       |

​																			**Attributes Mapping**

| Adsforce            | Facebook                           | Twitter                        | Criteo | Google       | Snapchat |
| :------------------ | :--------------------------------- | :----------------------------- | :----- | :----------- | :------- |
| xh_rating_value     | <small>_valueToSum</small>         | <small>price_micro</small>     | value  | -            | -        |
| xh_content_type     | <small>fb_content_type</small>     | <small>content_type</small>    | -      | content_type | -        |
| xh_content_id       | <small>fb_content_id</small>       | <small>content_id</small>      | -      | content_id   | -        |
| xh_content          | <small>fb_content</small>          | -                              | -      | -            | -        |
| xh_max_rating_value | <small>fb_max_rating_value</small> | <small>max_rated_value</small> | -      | max_rating   | -        |



#### Share

**Event Name:** xh_share

**Description:** Used to track sharing events

**Recommended Attributes:** xh_description

| *Platform*                | *Mapped Event*         |
| :------------------------ | :--------------------- |
| **Adsforce(Android)**     | XHInAppEventType.SHARE |
| **Adsforce(iOS)**         | XHEventShare           |
| **Facebook Mapped Event** | -                      |
| **Twitter Mapped Event**  | SHARE                  |
| **Criteo Mapped Event**   | -                      |
| **Google Mapped Event**   | share                  |
| **Snapchat Mapped Event** | -                      |

​																			**Attributes Mapping**

| Adsforce       | Facebook | Twitter     | Criteo | Google      | Snapchat |
| :------------- | :------- | :---------- | :----- | :---------- | :------- |
| xh_description | -        | description | -      | description | -        |



#### Subscription

**Event Name:** xh_subscribe

**Description:** Used to track paid subscription purchases

**Recommended Attributes:** xh_currency

| *Platform*                | *Mapped Event*             |
| :------------------------ | :------------------------- |
| **Adsforce(Android)**     | XHInAppEventType.SUBSCRIBE |
| **Adsforce(iOS)**         | XHEventSubscribe           |
| **Facebook Mapped Event** | Subscribe                  |
| **Twitter Mapped Event**  | -                          |
| **Criteo Mapped Event**   | -                          |
| **Google Mapped Event**   | -                          |
| **Snapchat Mapped Event** | -                          |

​																			**Attributes Mapping**

| Adsforce    | Facebook    | Twitter | Criteo | Google | Snapchat |
| :---------- | :---------- | :------ | :----- | :----- | :------- |
| xh_revenue  | _valueToSum | -       | -      | -      | -        |
| xh_currency | fb_currency | -       | -      | -      | -        |



#### Travel Booking

**Event Name:** xh_travel_booking

**Description:** Used to track travel booking events (and associate revenue to them)

**Recommended Attributes:** xh_customer_user_id, xh_content_type, xh_content_id, xh_class, xh_date_a, 

​                                                    xh_date_b, xh_destination_a, xh_destination_b

| *Platform*                | *Mapped Event*                  |
| :------------------------ | :------------------------------ |
| **Adsforce(Android)**     | XHInAppEventType.TRAVEL_BOOKING |
| **Adsforce(iOS)**         | XHEventTravelBooking            |
| **Facebook Mapped Event** | fb_mobile_purchase              |
| **Twitter Mapped Event**  | PURCHASE                        |
| **Criteo Mapped Event**   | transactionConfirmation         |
| **Google Mapped Event**   | ecommerce_purchase              |
| **Snapchat Mapped Event** | -                               |

​																			**Attributes Mapping**

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





#### Update

**Event Name:** xh_update

**Description:** Used to track update events

**Recommended Attributes:** xh_content_id

| *Platform*                | *Mapped Event*          |
| :------------------------ | :---------------------- |
| **Adsforce(Android)**     | XHInAppEventType.UPDATE |
| **Adsforce(iOS)**         | XHEventUpdate           |
| **Facebook Mapped Event** |                         |
| **Twitter Mapped Event**  | UPDATE                  |
| **Criteo Mapped Event**   | -                       |
| **Google Mapped Event**   | app_update              |
| **Snapchat Mapped Event** | -                       |

​																			**Attributes Mapping**

| Adsforce      | Facebook | Twitter    | Criteo | Google  | Snapchat |
| :------------ | :------- | :--------- | :----- | :------ | :------- |
| xh_content_id | -        | content_id | -      | item_id | -        |



### Advertisement

#### Ad Click

**Event Name:** xh_ad_click

**Description:** Used to track ad clicks on ads displayed in the app

**Recommended Attributes:** xh_adrev_ad_type

| *Platform*                | *Mapped Event*            |
| :------------------------ | :------------------------ |
| **Adsforce(Android)**     | XHInAppEventType.AD_CLICK |
| **Adsforce(iOS)**         | XHEventAdClick            |
| **Facebook Mapped Event** | AdClick                   |
| **Twitter Mapped Event**  | -                         |
| **Criteo Mapped Event**   | -                         |
| **Google Mapped Event**   | -                         |
| **Snapchat Mapped Event** | -                         |

​																			**Attributes Mapping**   

| Adsforce         | Facebook    | Twitter | Criteo | Google | Snapchat |
| :--------------- | :---------- | :------ | :----- | :----- | :------- |
| xh_adrev_ad_type | ad_type     | -       | -      | -      | -        |
| xh_currency      | fb_currency | -       | -      | -      | -        |



#### Ad View

**Event Name:** xh_ad_view

**Description:** Used to track ad views of ads displayed in the app

**Recommended Attributes:** xh_adrev_ad_type

| *Platform*                | *Mapped Event*           |
| :------------------------ | :----------------------- |
| **Adsforce(Android)**     | XHInAppEventType.AD_VIEW |
| **Adsforce(iOS)**         | XHEventAdView            |
| **Facebook Mapped Event** | AdView                   |
| **Twitter Mapped Event**  | -                        |
| **Criteo Mapped Event**   | -                        |
| **Google Mapped Event**   | -                        |
| **Snapchat Mapped Event** | -                        |

​																			**Attributes Mapping**

| Adsforce         | Facebook    | Twitter | Criteo | Google | Snapchat |
| :--------------- | :---------- | :------ | :----- | :----- | :------- |
| xh_adrev_ad_type | ad_type     | -       | -      | -      | -        |
| xh_currency      | fb_currency | -       | -      | -      | -        |



### Others

#### Content View

**Event Name:** xh_content_view

**Description:** Used to track content view events

**Recommended Attributes:** xh_price, xh_content_type, xh_content_id, xh_content, xh_currency

| *Platform*                | *Mapped Event*                |
| :------------------------ | :---------------------------- |
| **Adsforce(Android)**     | XHInAppEventType.CONTENT_VIEW |
| **Adsforce(iOS)**         | XHEventContentView            |
| **Facebook Mapped Event** | fb_mobile_content_view        |
| **Twitter Mapped Event**  | CONTENT_VIEW                  |
| **Criteo Mapped Event**   | viewProduct                   |
| **Google Mapped Event**   | view_item                     |
| **Snapchat Mapped Event** | VIEW_CONTENT                  |

​																			**Attributes Mapping**

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



#### List View

**Event Name:** xh_list_view

**Description:** Used to track listings view events

**Recommended Attributes:** xh_content_type, xh_content_list

| *Platform*                | *Mapped Event*                        |
| :------------------------ | :------------------------------------ |
| **Adsforce(Android)**     | use the string "xh_list_view" instead |
| **Adsforce(iOS)**         | XHEventListView                       |
| **Facebook Mapped Event** |                                       |
| **Twitter Mapped Event**  |                                       |
| **Criteo Mapped Event**   | viewListing                           |
| **Google Mapped Event**   | view_item_list                        |
| **Snapchat Mapped Event** |                                       |

​																			**Attributes Mapping**

| Adsforce        | Facebook | Twitter | Criteo | Google        | Snapchat |
| :-------------- | :------- | :------ | :----- | :------------ | :------- |
| xh_content_type | -        | -       | -      | item_Category | -        |
| xh_content_list | -        | -       | -      | item_id       | -        |



#### Re-Engage

**Event Name:** xh_re_engage

**Description:** Used to track user re-engagement events

**Recommended Attributes:** -

| *Platform*                | *Mapped Event*             |
| :------------------------ | :------------------------- |
| **Adsforce(Android)**     | XHInAppEventType.RE_ENGAGE |
| **Adsforce(iOS)**         | XHEventReEngage            |
| **Facebook Mapped Event** | -                          |
| **Twitter Mapped Event**  | RE_ENGAGE                  |
| **Criteo Mapped Event**   | -                          |
| **Google Mapped Event**   | custom_event               |
| **Snapchat Mapped Event** | -                          |

​																			**Attributes Mapping**

| Adsforce       | Facebook | Twitter     | Criteo | Google      | Snapchat |
| :------------- | :------- | :---------- | :----- | :---------- | :------- |
| xh_description | -        | description | -      | description | -        |



#### Search

**Event Name:** xh_search

**Description:** Used to track search events

**Recommended Attributes:** xh_content_type, xh_search_string, xh_success

| *Platform*                | *Mapped Event*          |
| :------------------------ | :---------------------- |
| **Adsforce(Android)**     | XHInAppEventType.SEARCH |
| **Adsforce(iOS)**         | XHEventSearch           |
| **Facebook Mapped Event** | fb_mobile_search        |
| **Twitter Mapped Event**  | SEARCH                  |
| **Criteo Mapped Event**   | viewSearch              |
| **Google Mapped Event**   | SEARCH                  |
| **Snapchat Mapped Event** | -                       |

​																			**Attributes Mapping**

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