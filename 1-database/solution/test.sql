
CALL InsertProduct('
{
  "products": [
    {
      "name": "Product 1",
      "description": "This is a product 1",
      "category": "Category 1",
      "image": "https://via.placeholder.com/150",
      "status": "active",
      "restrictions": [
        {
          "type": "age",
          "value": 18,
          "subType": "min"
        },
        {
          "type": "age",
          "value": 60,
          "subType": "max"
        },
        {
          "type": "qty",
          "value": 2,
          "subType": "max"
        }
      ],
      "tags": [
        "tag1",
        "tag2"
      ],
      "types": [
        {
          "id": 1,
          "name": "Type 1",
          "price": 100,
          "status": "active",
          "currency": "USD",
          "distributions": [
            {
              "id": 1,
              "name": "Supplier",
              "amount": 50
            },
            {
              "id": 2,
              "name": "Seller",
              "amount": 30
            },
            {
              "id": 3,
              "name": "Platform",
              "amount": 15
            },
            {
              "id": 4,
              "name": "Delivery",
              "amount": 5
            }
          ]
        },
        {
          "id": 2,
          "name": "Type 2",
          "price": 200,
          "status": "active",
          "currency": "USD",
          "distributions": [
            {
              "id": 1,
              "name": "Supplier",
              "amount": 100
            },
            {
              "id": 2,
              "name": "Seller",
              "amount": 60
            },
            {
              "id": 3,
              "name": "Platform",
              "amount": 30
            },
            {
              "id": 4,
              "name": "Delivery",
              "amount": 10
            }
          ]
        },
        {
          "id": 3,
          "name": "Type 3",
          "price": 300,
          "status": "active",
          "currency": "USD",
          "distributions": [
            {
              "id": 1,
              "name": "Supplier",
              "amount": 150
            },
            {
              "id": 2,
              "name": "Seller",
              "amount": 90
            },
            {
              "id": 3,
              "name": "Platform",
              "amount": 45
            },
            {
              "id": 4,
              "name": "Delivery",
              "amount": 15
            }
          ]
        },
        {
          "id": 4,
          "name": "Type 4",
          "price": 400,
          "status": "active",
          "currency": "USD",
          "distributions": [
            {
              "id": 1,
              "name": "Supplier",
              "amount": 200
            },
            {
              "id": 2,
              "name": "Seller",
              "amount": 120
            },
            {
              "id": 3,
              "name": "Platform",
              "amount": 60
            },
            {
              "id": 4,
              "name": "Delivery",
              "amount": 20
            }
          ]
        }
      ]
    },
    {
      "name": "Product 2",
      "description": "This is a product 2",
      "category": "Category 2",
      "image": "https://via.placeholder.com/150",
      "status": "active",
      "restrictions": [
        {
          "type": "age",
          "value": 18,
          "subType": "min"
        },
        {
          "type": "age",
          "value": 60,
          "subType": "max"
        },
        {
          "type": "qty",
          "value": 2,
          "subType": "max"
        }
      ],
      "tags": [
        "tag1",
        "tag2"
      ],
      "types": [
        {
          "id": 1,
          "name": "Type 1",
          "price": 100,
          "status": "active",
          "currency": "USD",
          "distributions": [
            {
              "id": 1,
              "name": "Supplier",
              "amount": 50
            },
            {
              "id": 2,
              "name": "Seller",
              "amount": 30
            },
            {
              "id": 3,
              "name": "Platform",
              "amount": 15
            },
            {
              "id": 4,
              "name": "Delivery",
              "amount": 5
            }
          ]
        },
        {
          "id": 2,
          "name": "Type 2",
          "price": 200,
          "status": "active",
          "currency": "USD",
          "distributions": [
            {
              "id": 1,
              "name": "Supplier",
              "amount": 100
            },
            {
              "id": 2,
              "name": "Seller",
              "amount": 60
            },
            {
              "id": 3,
              "name": "Platform",
              "amount": 30
            },
            {
              "id": 4,
              "name": "Delivery",
              "amount": 10
            }
          ]
        },
        {
          "id": 3,
          "name": "Type 3",
          "price": 300,
          "status": "active",
          "currency": "USD",
          "distributions": [
            {
              "id": 1,
              "name": "Supplier",
              "amount": 150
            },
            {
              "id": 2,
              "name": "Seller",
              "amount": 90
            },
            {
              "id": 3,
              "name": "Platform",
              "amount": 45
            },
            {
              "id": 4,
              "name": "Delivery",
              "amount": 15
            }
          ]
        },
        {
          "id": 4,
          "name": "Type 4",
          "price": 400,
          "status": "active",
          "currency": "USD",
          "distributions": [
            {
              "id": 1,
              "name": "Supplier",
              "amount": 200
            },
            {
              "id": 2,
              "name": "Seller",
              "amount": 120
            },
            {
              "id": 3,
              "name": "Platform",
              "amount": 60
            },
            {
              "id": 4,
              "name": "Delivery",
              "amount": 20
            }
          ]
        }
      ]
    },
    {
      "name": "Product 3",
      "description": "This is a product 3",
      "category": "Category 3",
      "image": "https://via.placeholder.com/150",
      "status": "active",
      "restrictions": [
        {
          "type": "age",
          "value": 18,
          "subType": "min"
        },
        {
          "type": "age",
          "value": 60,
          "subType": "max"
        },
        {
          "type": "qty",
          "value": 2,
          "subType": "max"
        }
      ],
      "tags": [
        "tag1",
        "tag2"
      ],
      "types": [
        {
          "id": 1,
          "name": "Type 1",
          "price": 100,
          "status": "active",
          "currency": "USD",
          "distributions": [
            {
              "id": 1,
              "name": "Supplier",
              "amount": 50
            },
            {
              "id": 2,
              "name": "Seller",
              "amount": 30
            },
            {
              "id": 3,
              "name": "Platform",
              "amount": 15
            },
            {
              "id": 4,
              "name": "Delivery",
              "amount": 5
            }
          ]
        },
        {
          "id": 2,
          "name": "Type 2",
          "price": 200,
          "status": "active",
          "currency": "USD",
          "distributions": [
            {
              "id": 1,
              "name": "Supplier",
              "amount": 100
            },
            {
              "id": 2,
              "name": "Seller",
              "amount": 60
            },
            {
              "id": 3,
              "name": "Platform",
              "amount": 30
            },
            {
              "id": 4,
              "name": "Delivery",
              "amount": 10
            }
          ]
        },
        {
          "id": 3,
          "name": "Type 3",
          "price": 300,
          "status": "active",
          "currency": "USD",
          "distributions": [
            {
              "id": 1,
              "name": "Supplier",
              "amount": 150
            },
            {
              "id": 2,
              "name": "Seller",
              "amount": 90
            },
            {
              "id": 3,
              "name": "Platform",
              "amount": 45
            },
            {
              "id": 4,
              "name": "Delivery",
              "amount": 15
            }
          ]
        }
      ]
    }
  ]
}
');
