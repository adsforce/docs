In-App Events
=============

Adsforce’s in-app events provide advertisers with the ability to record any post-install event and analyzed it to the originating media sources.

If your users perform registrations, add items to the shopping cart or make purchases, the in-app events data can show it, with details.

**In-app events are essential in determining the value of your users, and the quality of the traffic you get from different media sources**. 

Therefore, although they are optional to implement, Adsforce HIGHLY recommends doing so.

![1](1.png)

## Trackevent&ensp;API

An in-app event is comprised of an event name and event parameters.

You can use any event name string of your choice. However, Adsforce's SDK supplies the recommended event names via enumerations and definitions.

Event names are case sensitive, e.g., by sending both purchase_revenue and purchase_REVENUE as event names, two separate events are created.

**Syntax:**

### **iOS**

```
- (void) trackEvent:(NSString *)eventName withValues:(NSDictionary*)values 
```

-  eventName

  Any string to define the event name.

- Values

  A dictionary of event parameters that comprise a rich event.

### **Android**

```
public static void trackEvent(Context context, String eventName, Map eventValues)
```

-  Context

  Use `getApplicationContext()`

- eventName

  Any string to define the event name.

- eventValues

  A map of event parameters that comprise a rich event.

## In-app Purchase Events Configuration

![2](2.png)

Revenue Parameter
-----------------

You can send revenue values with any parameter name and event. However, to register the revenue in Adsforce's raw and aggregated data, you MUST use the ***xh_revenue*** parameter.

Always use it with in-app events that represent actual revenue generation in your business logic.

Multiple Items
--------------

You can add multiple items to a single transaction. Instead of single values per event parameter you can have an array of items describing the transaction, separated by commas.

**Example**

In the same transaction, Mr A. Flyer purchases two identical shirts, one pair of shoes and a hat from a US-based online store. 

The sequence in which each item is listed must be identical for each parameter.

`xh_content_id: ["123","988","399"]`
 `xh_quantity: [2,1,1]`
 `xh_price: [25,50,10]`
 `xh_revenue: [110]`
 `xh_currency: USD`

For Multiple Items, the code appears, as follows:

```
Map<String,Object> eventData = new HashMap<>();
eventData.put(xhInAppEventParameterName.CONTENT_ID, new String[] {"123","988","399"});
eventData.put(xhInAppEventParameterName.QUANTITY, new int[] {2, 1, 1});
eventData.put(xhInAppEventParameterName.PRICE,new int[] {25, 50, 10});
eventData.put(xhInAppEventParameterName.CURRENCY,"USD");
eventData.put(xhInAppEventParameterName.REVENUE,110);
AdsforceLib.getInstance().trackEvent(AdsforceTestActivity.this, xhInAppEventType.PURCHASE,eventData);
```

> **[warning] Note**
>
> Multiple items can be used with the following in-app events:
> 
>    `xh_add_to_cart`、`xh_add_to_wishlist`、`xh_tutorial_completion`、`xh_initiated_checkout`、  `purchase_revenue`、`xh_rate`、`xh_spent_credits `、`xh_content_view`、`xh_travel_booking`、`xh_update`

Complex In-App Events
---------------------

Complex In-App events enable sending multiple events in a single API call.

They are useful when you want to see several closely related user actions grouped together, e.g. adding several products to the basket in a single session.

**Example:**

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

> **[danger] Warning**
>
> - Complex In-App events cause postback issues with Facebook. 
> 
> - If you need the event to be fully mapped with Facebook, you should send separate events per user action, e.g. send an Add to cart event per each added item. Using the in-app events raw data you can group these events together.

## Recording Events Offline

If a user initiates an event when the internet connection is unavailable, Adsforce is still able to record it. This is how it works:

###### 1. SDK sends the events to Adsforce's servers and waits for a response.
###### 2. If the SDK doesn’t receive a 200 response, the event is stored in the cache.
###### 3. Once the next 200 response is received, the stored event is re-sent to the server.
###### 4. If there are multiple events in the cache, they are sent to the server one promptly after another.


> **[warning] Note**
>
> SDK’s cache can store up to 40 events, which means that only the first 40 events that happen offline are saved. Everything that comes afterwards until the next 200 response, gets discarded.

Event Deduplication
-------------------

Adsforce has an in-app event deduplication mechanism. It checks all in-app events to see if there was an identical in-app event that came from the same Adsforce_ID less than 10 seconds beforehand. If such an event is found, the mechanism removes the duplicate.

Two events are considered identical if the following fields in both events are the same:

- eventName
- Event value
- App ID
- Adsforce ID

> **[warning] Note**
>
> * Deduplication works only for in-app events which are sent from the SDK;
> * S2S in-app events don’t get deduplicated.

In-App Event Types
------------------

### Purchase Revenue

**Event Name:** purchase_revenue

**Description:** Used to track purchase events (and associate revenue to them)  

**Event Parameter（Android）：** `XHInAppEventType.PURCHASE` 

**Event Parameter（iOS）：** `XHEventPurchase` 

**Facebook Mapped Event:** fb_mobile_purchase

**Twitter **Mapped Event: PURCHASE

**Criteo **Mapped Event: transactionConfirmation

**Google** Mapped Event: in_app_purchase

**Snapchat** Mapped Event: PURCHASE

**Recommended Attributes**: xh_content_type,xh_content_id,xh_content,xh_currency,xh_quantity,xh_order_id,xh_price

**Attributes Mapping：**

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

### Purchasing

#### Add Payment Info

**Event Name:** xh_add_payment_info

**Description:** Used to track payment info configuration status

**Recommended Attributes: **xh_success

| **Platform**      | *Mapped Event*            |
| :------------------------ | :-------------------------------- |
| **Adsforce（Android）**    | XHInAppEventType.ADD_PAYMENT_INFO |
| **Adsforce（iOS）**       | XHEventAddPaymentInfo             |
| **Facebook Mapped Event** | fb_mobile_add_payment_info        |
| **Twitter Mapped Event** | -                                 |
| **Criteo Mapped Event** | -                                 |
| **Google Mapped Event** | add_payment_info                  |
| **Snapchat Mapped Event** | ADD_BILLING                       |

​																			**Attributes Mapping**

| Adsforce   | Facebook   | Twitter           | Criteo | Google           | Snapchat |
| :--------- | :--------- | :---------------- | :----- | :--------------- | :------- |
| xh_success | fb_success | user_payment_info | -      | add_payment_info | -        |



#### Add to Cart

**Event Name:** xh_add_to_cart

**Description:** Used to track add to cart events of specific items

**Recommended Attributes: **xh_price, xh_content_type, xh_content_id, xh_content, xh_currency, xh_quantity

| *Platform*              | *Mapped Event*       |
| :------------------------ | :--------------------------- |
| **Adsforce(Android)**     | XHInAppEventType.ADD_TO_CART |
| **Adsforce(iOS)**         | XHEventAddToCart             |
| **Facebook Mapped Event** | fb_mobile_add_to_cart        |
| **Twitter Mapped Event** | ADD_TO_CART                  |
| **Criteo Mapped Event** | viewBasket                   |
| **Google Mapped Event** | add_to_cart                  |
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

**Recommended Attributes:** xh_price, xh_content_type, xh_content_id, xh_content, xh_currency, xh_quantity

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

**Recommended Attributes: **xh_price, xh_content_type, xh_content_id, xh_content, xh_currency, xh_quantity, xh_payment_info_available

| *Platform*                | *Mapped Event*                      |
| :------------------------ | :---------------------------------- |
| **Adsforce(Android)**     | XHInAppEventType.INITIATED_CHECKOUT |
| **Adsforce(iOS)**         | XHEventInitiatedCheckout            |
| **Facebook Mapped Event** | fb_mobile_initiated_checkout        |
| **Twitter Mapped Event**  | CHECKOUT_INITIATED                  |
| **Criteo Mapped Event**   | viewBasket                          |
| **Google Mapped Event**   | begin_checkout                      |
| **Snapchat Mapped Event** | START_CHECKOUT                      |

​																			**Attributes Mapping**

| Adsforce                    | Facebook                    | Twitter           | Criteo   | Google                 | Snapchat |
| :-------------------------- | :-------------------------- | :---------------- | :------- | :--------------------- | :------- |
| xh_price                    | fb_purchase_value           | price_micro*      | price    | price                  | -        |
| xh_content_type             | fb_content_type             | content_type      | -        | item_category          | -        |
| xh_content_id               | <fb_content_id              | content_id        | id       | item_id                | -        |
| xh_content                  | fb_content                  | -                 | -        | -                      | -        |
| xh_currency                 | fb_currency                 | price_currency    | currency | currency_code          | -        |
| xh_quantity                 | fb_num_items                | number_items      | quantity | quantity               | -        |
| xh_payment_info_available   | fb_payment_info_available   | user_payment_info | -        | payment_info_available | -        |
| xh_content_list             | fb_content_id               | -                 | -        | item_id                | -        |
| xh_date_a                   | fb_checkin_date             | -                 | din      | start_date             | -        |
| xh_date_b                   | fb_checkout_date            | -                 | dout     | end_date               | -        |
| xh_departing_departure_date | fb_departing_departure_date | -                 | -        | -                      | -        |
| xh_returning_departure_date | fb_returning_departure_date | -                 | -        | -                      | -        |
| xh_destination_a            | fb_origin_airport           | -                 | -        | origin                 | -        |
| xh_destination_b            | fb_destination_airport      | -                 | -        | destination            | -        |
| xh_destination_list         | fb_destination_ids          | -                 | -        | -                      | -        |
| xh_city                     | fb_city                     | -                 | -        | -                      | -        |
| xh_region                   | fb_region                   | -                 | -        | -                      | -        |
| xh_country                  | fb_country                  | -                 | -        | -                      | -        |
| xh_departing_arrival_date   | fb_departing_arrival_date   | -                 | -        | -                      | -        |
| xh_returning_arrival_date   | fb_returning_arrival_date   | -                 | -        | -                      | -        |
| xh_suggested_destinations   | fb_suggested_destinations   | -                 | -        | -                      | -        |
| xh_travel_start             | fb_travel_start             | -                 | -        | -                      | -        |
| xh_travel_end               | fb_travel_end               | -                 | -        | -                      | -        |
| xh_num_adults               | fb_num_adults               | -                 | -        | -                      | -        |
| xh_num_children             | fb_num_children             | -                 | -        | -                      | -        |
| xh_num_infants              | fb_num_infants              | -                 | -        | -                      | -        |
| xh_class                    | fb_travel_class             | -                 | -        | travel_class           | -        |
| xh_suggested_hotels         | fb_suggested_hotels         | -                 | -        | -                      | -        |
| xh_user_score               | fb_user_score               | -                 | -        | -                      | -        |
| xh_hotel_score              | fb_hotel_score              | -                 | -        | -                      | -        |
| xh_purchase_currency        | fb_purchase_currency        | -                 | -        | -                      | -        |
| xh_preferred_star_ratings   | fb_preferred_star_ratings   | -                 | -        | -                      | -        |
| xh_preferred_price_range    | fb_preferred_price_range    | -                 | -        | -                      | -        |
| xh_preferred_neighborhoods  | fb_preferred_neighborhoods  | -                 | -        | -                      | -        |
| xh_preferred_num_stops      | fb_preferred_num_stops      | -                 | -        | -                      | -        |

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

#### Ad Click

**Event Name:**  xh_ad_click

**Description:** Used to record ad clicks on ads displayed in the app

**Recommended Attributes: **xh_adrev_ad_type

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
| xh_currency      | fb_currency | -       | - | - |-|



#### Ad View

**Event Name:** xh_ad_view

**Description:** Used to record ad views of ads displayed in the app

**Recommended Attributes: **xh_adrev_ad_type

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



#### Achievement Unlocked

**Event Name:** xh_achievement_unlocked

**Description:** Used to track achievement unlocking events

**Recommended Attributes: **xh_description

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
| xh_description | fb_description | description | ui_achievement |description|-|



#### Complete Registration

**Event Name:** xh_complete_registration

**Description:** Used to track user registration methods

**Recommended Attributes: **xh_registration_method

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

| Adsforce                              | Facebook                              | Twitter                            | Criteo | Google              | Snapchat |
| :------------------------------------ | :------------------------------------ | :--------------------------------- | :----- | :------------------ | :------- |
| <small>xh_registration_method</small> | <small>fb_registration_method</small> | <small>registration_method</small> | -      | registration_method | -        |



#### Level Achieved

**Event Name:** xh_level_achieved

**Description:** Used to record game level events

**Recommended Attributes: **xh_level, xh_score

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
| xh_score | -        | - | -        |score|-|



#### Login

**Event Name:** xh_login

**Description:** Used to track user login events

**Recommended Attributes: **-

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
| -        | - | -      | -        |-|-|



#### Start Trial

**Event Name:** xh_start_trial

**Description:** Used to track the start of a free trial of a product

**Recommended Attributes: **xh_price, xh_currency

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
| xh_currency | fb_currency | - | -      | -        |-|



#### Tutorial Completion

**Event Name:** xh_tutorial_completion

**Description:** Used to track tutorial completions

**Recommended Attributes: **xh_success, xh_content_id, xh_content

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
| xh_content    | fb_content | - | -       | -        |-|



#### Content View

**Event Name:** xh_content_view

**Description:** Used to record content view events

**Recommended Attributes: **xh_price, xh_content_type, xh_content_id, xh_content, xh_currency

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
| <small>xh_preferred_num_stops</small>      | <small>fb_preferred_num_stops</small>      | -                             | -        | -         | -        |



#### List View

**Event Name:** xh_list_view

**Description:** Used to record listings view events

**Recommended Attributes: **xh_content_type, xh_content_list

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
| xh_content_list | -        | -       | - | item_id |-|



#### Re-Engage

**Event Name:** xh_re_engage

**Description:** Used to track user re-engagement events

**Recommended Attributes: **-

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
| xh_description | -        | description | -      | description |-|



#### Search

**Event Name:** xh_search

**Description:** Used to track search events

**Recommended Attributes: **xh_content_type, xh_search_string, xh_success

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
| <small>xh_preferred_num_stops</small>      | <small>fb_preferred_num_stops</small>      | -                | - | -        ||



### Advanced Features

#### Invite

**Event Name:** xh_invite

**Description:** Used to track invite (social) events

**Recommended Attributes: **-

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

**Recommended Attributes: **-

| *Platform*                | *Mapped Event*                                 |
| :------------------------ | :--------------------------------------------- |
| **Adsforce（Android）**   | XHInAppEventType.OPENED_FROM_PUSH_NOTIFICATION |
| **Adsforce（iOS）**       | XHEventOpenedFromPushNotification              |
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

**Description:** Used to track app / item rating events.

**Recommended Attributes: **xh_rating_value, xh_content_type, xh_content_id, xh_content,  xh_max_rating_value

| *Platform*                | *Mapped Event*        |
| :------------------------ | :-------------------- |
| **Adsforce（Android）**   | XHInAppEventType.RATE |
| **Adsforce（iOS）**       | XHEventRate           |
| **Facebook Mapped Event** | fb_mobile_rate        |
| **Twitter Mapped Event**  | RATED                 |
| **Criteo Mapped Event**   |                       |
| **Google Mapped Event**   | submit_rating         |
| **Snapchat Mapped Event** |                       |

​																			**Attributes Mapping**

| Adsforce            | Facebook            | Twitter         | Criteo | Google       | Snapchat |
| :------------------ | :------------------ | :-------------- | :----- | :----------- | :------- |
| xh_rating_value     | _valueToSum         | price_micro     | value  | -            | -        |
| xh_content_type     | fb_content_type     | content_type    | -      | content_type | -        |
| xh_content_id       | fb_content_id       | content_id      | -      | content_id   | -        |
| xh_content          | fb_content          | -               | -      | -            | -        |
| xh_max_rating_value | fb_max_rating_value | max_rated_value | -      | max_rating   | -        |



#### Share

**Event Name:** xh_share

**Description:** Used to track sharing events

**Recommended Attributes: **xh_description

| *Platform*                | *Mapped Event*         |
| :------------------------ | :--------------------- |
| **Adsforce（Android）**   | XHInAppEventType.SHARE |
| **Adsforce（iOS）**       | XHEventShare           |
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

**Recommended Attributes: **xh_currency

| *Platform*                | *Mapped Event*             |
| :------------------------ | :------------------------- |
| **Adsforce（Android）**   | XHInAppEventType.SUBSCRIBE |
| **Adsforce（iOS）**       | XHEventSubscribe           |
| **Facebook Mapped Event** | Subscribe                  |
| **Twitter Mapped Event**  | -                          |
| **Criteo Mapped Event**   | -                          |
| **Google Mapped Event**   | -                          |
| **Snapchat Mapped Event** | -                          |

​																			**Attributes Mapping****

| Adsforce    | Facebook    | Twitter | Criteo | Google | Snapchat |
| :---------- | :---------- | :------ | :----- | :----- | :------- |
| xh_revenue  | _valueToSum- | -       | -      | -      | -        |
| xh_currency | fb_currency | - | -      | -        ||



#### Travel Booking

**Event Name:** xh_travel_booking

**Description:** Used to track travel booking events (and associate revenue to them)

**Recommended Attributes: **xh_customer_user_id, xh_content_type, xh_content_id, xh_class, xh_date_a, 

​                                                    xh_date_b, xh_destination_a, xh_destination_b

| *Platform*                | *Mapped Event*                  |
| :------------------------ | :------------------------------ |
| **Adsforce（Android）**   | XHInAppEventType.TRAVEL_BOOKING |
| **Adsforce（iOS）**       | XHEventTravelBooking            |
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

**Recommended Attributes: **xh_content_id

| *Platform*                | *Mapped Event*          |
| :------------------------ | :---------------------- |
| **Adsforce（Android）**   | XHInAppEventType.UPDATE |
| **Adsforce（iOS）**       | XHEventUpdate           |
| **Facebook Mapped Event** |                         |
| **Twitter Mapped Event**  | UPDATE                  |
| **Criteo Mapped Event**   | -                       |
| **Google Mapped Event**   | app_update              |
| **Snapchat Mapped Event** | -                       |

​																			**Attributes Mapping**

| Adsforce      | Facebook | Twitter    | Criteo | Google  | Snapchat |
| :------------ | :------- | :--------- | :----- | :------ | :------- |
| xh_content_id | -        | content_id | -      | item_id | -        |


