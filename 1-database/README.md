# Test 01 - Databases

## Introduction

This test is designed to assess your knowledge of databases and SQL.

## Problem

- I have a set of products that I want to store in a database. Each product has a `name`, a `description`, a `category`, an `image`, a `status` and `tags`.
- The product is having different kinds of `restrictions` that has a `type`, `subtype`, and a `value`.
- A product will have multiple `types` of variations that has a `type id`, a `price`, a `status`, and a `currency`.
- The product price will be distributed among different kinds of `distributions` that has a `distribution id` and an `amount`.

## Tasks

1. Develop a script to generate all the tables with relevant data if applicable using the [DB Diagram](DBDiagram.svg) provided.
2. Develop a stored procedure to insert products into the database using the [JSON File](data.json) provided.

## Instructions

- You have to use the database server as given when this test is assigned to you.
- You have to use a single parameter input for the stored procedure.
- You have to use the JSON file provided to insert the products into the database.
- Use appropriate data types for the columns.