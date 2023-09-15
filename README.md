# Tea Subscription


## New Tea Subscription
```js
  POST /api/v1/customers/customer_id/subscriptions
```

### Validated Parameters
<br>

```| title | price | frequenty | status |```
<br>
<br>

### Example Request
```json
  {
    "title": "Sleepy Collection",
    "price": 10,
    "frequency": "bi-weekly",
    "status": "active",
    "customer_id": 1
  }

  Status: 201 Created
```

### Response
```json
{
    "data": {
        "id": "13",
        "type": "subscription",
        "attributes": {
            "customer_id": 1,
            "title": "Sleep Collection",
            "price": 10,
            "status": "active",
            "frequency": "bi-weekly"
        }
    }
}
```
<br>
<hr>

## Get Customer Subscriptions
```js
  GET /api/v1/customers/customer_id/subscriptions
```

### Example Request
```json
{
    "data": [
        {
            "id": "1",
            "type": "subscription",
            "attributes": {
                "customer_id": 1,
                "title": "London Mix",
                "price": 10,
                "status": "active",
                "frequency": "monthly"
            }
        },
        {
            "id": "2",
            "type": "subscription",
            "attributes": {
                "customer_id": 1,
                "title": "Decaf Supply",
                "price": 15,
                "status": "cancelled",
                "frequency": "monthly"
            }
        }
    ]
}
  Status: 200 OK
```
<br>
<br>

## Cancel Subscription
```js
  PATCH /api/v1/customers/:customer_id/subscriptions/subscription_id
  ```
```json

{
    "successs": "OK"
}
  Status: 200 OK
```

## Delete Subscription

```js
  DELETE /api/v1/customers/:customer_id/subscriptions/subscription_id
```
```json

{
    "successs": "OK"
}
  Status: 200 OK
```