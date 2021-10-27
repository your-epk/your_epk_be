[![untitled-2.png](https://i.postimg.cc/0Nx0qR1Q/untitled-2.png)](https://postimg.cc/pmGFDSTb)
## Your Epk -(back end)

[Deployed to Heroku](https://your-epk.herokuapp.com/dashboard/1)

[![Contributors][contributors-shield]][contributors-url]
[![Issues][issues-shield]][issues-url]
[![Stargazers][stars-shield]][stars-url]
[![Forks][forks-shield]][forks-url]
# Welcome to Your Epk
  - Your Epk is an electronic press kit builder. This App allows you to build an HTML web page to promote your film project and provide detailed standard promotional materials.

## Table of Contents

- [Overview](#overview)
- [Tools Utilized](#tools-used)
- [Getting Started](#getting-started)
- [Endpoints](#endpoints)
- [Database Schema](#database-schema)
- [Contributing](#contributors)

# README
------

### <ins>Overview</ins>

[Your Epk (Back-End)](https://github.com/your-epk/your_epk_be) Your EPK is a 5 person, 2 week capstone project for the final mod of Turing School of Software and Design

- Apply principles of flow control across multiple methods
- Design a one to many relationship using an API backend application
- Design a many to many relationship using an API backend application
- Design self referential relationship using an API backend application
- Write migrations to create tables with columns of varying data types and foreign keys.
- Use TypeSript and React to design a UI for frontend
- Write model and feature tests that fully cover data logic and potential user behavior
- Use AWS S3 to store images on the Cloud


## Tools Used

| Development       | Testing       | Gems            |
|   :----:          |    :----:     |    :----:       |
| Ruby 2.7.2        | RSpec         | Pry             |
| Rails 5.2.5       | WebMock       | ShouldaMatchers |
| PostgresSQL       | VCR           | Capybara        |
| Postico           | Launchy       | Figaro          |
| VS Code           | SimpleCov     | Faraday         |
| Github            | Capybara      | aws-sdk-s3      |
| TypeScript        | FactoryBot    |                 |
| React             | Cypress       |                 |
| AWS S3 Cloud Storage |  |  |


## Getting Started

The `base path` of each endpoint is:

```
https://travel-buddy-api.herokuapp.com/api/v1
```

## Endpoints

The following table presents each API endpoint and its documentation.


HTTP Verb | Endpoint              | Description                              | 
----------|-----------------------|------------------------------------------|
POST       | `/api/v1/sessions` | Get a single user. | 
GET        | `/api/v1/users/:id` | Get a single users attributes and relationships. | 
POST       | `/api/v1/film_epk` | Create film epk and add movie details. | 
GET       | `/api/v1/film_epk/:id` | Get a film epk's attributes and relationships. | 
DELETE       | `/api/v1/film_epk/:id` | Delete film epk and it's dependents. | 
PATCH     | `/api/v1/film_epk/:id` | Update film_epk attributes. | 
GET      | `/api/v1/film_epk/:film_epk_id/awards` | Get all a film_epk's awards. | 
POST      | `/api/v1/awards` | Create film_epk award. | 
DELETE      | `/api/v1/awards/:id` | Delete an award. | 
GET      | `/api/v1/film_epk/:film_epk_id/film_fams` | Get all a film_epk's film fams. | 
POST      | `/api/v1/film_fams` | Create film_epk film_fam. |
PATCH     | `/api/v1/film_fams/:id` | Update film_epk film_fam. | 
DELETE      | `/api/v1/film_fams/:id` | Delete an film_fam. | 
GET      | `/api/v1/film_epk/:film_epk_id/presses` | Get all a film_epk's press. |
POST      | `/api/v1/presses` | Create film_epk presses. | 
POST       | `api/v1/presigned_url` | Provides the AWS S3 upload url and blob_signed_id. |
PUT        | `api/v1/<<direct_upload_url>>` | Uploads Asset to AWS S3 Cloud Storage. | 
POST     | `api/v1/movie_posters` | Update a film_epk with a movie poster url. |
POST     | `api/v1/header_images` | Update a film_epk with a header image url. |
POST     | `api/v1/head_shots` | Update a film_fam with a head shot url. |


## Database Schema
![Screen Shot 2021-09-19 at 10 57 04 AM](https://user-images.githubusercontent.com/81600649/133936054-baac51fb-f3f0-4951-86e2-07f431c02253.png)

### <ins>Contributors</ins>

👤  **Rachel Jensen**
- Github: [Rachel Jensen](https://github.com/rachelJensen)
- LinkedIn: [Rachel Jensen](https://www.linkedin.com/in/racheljensendev/)

👤  **Elliot Olbright**
- Github: [Elliot Olbright](https://github.com/ElliotOlbright)
- LinkedIn: [Elliot Olbright](https://www.linkedin.com/in/elliotolbright/)

👤  **Nina Brissey**
- Github: [Nina Brissey](https://github.com/ninabrissey)
- LinkedIn: [Nina Brissey](https://www.linkedin.com/in/ninabrissey/)

👤  **Michael Abbott**
- Github: [Michael Abbott](https://github.com/AbbottMichael)
- LinkedIn: [Michael Abbott](https://www.linkedin.com/in/mjabbottdesign/)

👤  **Maria DelSignore**
- Github: [Maria DelSignore](https://github.com/madhaus4)
- LinkedIn: [Maria DelSignore](https://www.linkedin.com/in/mariadelsignore/)

<!-- MARKDOWN LINKS & IMAGES -->

[contributors-shield]: https://img.shields.io/github/contributors/your-epk/your_epk_be.svg?style=flat-square
[contributors-url]: https://github.com/your-epk/your_epk_be/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/your-epk/your_epk_be.svg?style=flat-square
[forks-url]: https://github.com/your-epk/your_epk_be/network/members
[stars-shield]: https://img.shields.io/github/stars/your-epk/your_epk_be.svg?style=flat-square
[stars-url]: https://github.com/your-epk/your_epk_be/stargazers
[issues-shield]: https://img.shields.io/github/issues/your-epk/your_epk_be.svg?style=flat-square
[issues-url]: https://github.com/your-epk/your_epk_be/issues
<!--

<!-- Docs -->
[get-one-user-docs]: /doc/travel_buddy_endpoints.md#get-one-user
[find-or-create-user-docs]: /doc/travel_buddy_endpoints.md#find-or-create-user
[get-user-friendships-docs]: /doc/travel_buddy_endpoints.md#get-user-friendships
[create-user-friendships-docs]: /doc/travel_buddy_endpoints.md#create-user-friendship
[get-one-trip-docs]: /doc/travel_buddy_endpoints.md#get-one-trip
[create-user-trip-docs]: /doc/travel_buddy_endpoints.md#create-user-trip
[update-user-trip-docs]: /doc/travel_buddy_endpoints.md#update-user-trip
[get-trips-accommodations-docs]: /doc/travel_buddy_endpoints.md#get-trip-accommodations
[create-trip-accommodation-docs]: /doc/travel_buddy_endpoints.md#create-trip-accommodation
[get-trips-travel-buddies-docs]: /doc/travel_buddy_endpoints.md#get-trip-travel-buddies
[create-trip-travel-buddy-docs]: /doc/travel_buddy_endpoints.md#create-trip-travel-buddy
[get-trip-checklists-docs]: /doc/travel_buddy_endpoints.md#get-trip-checklists
[create-trip-checklist-docs]: /doc/travel_buddy_endpoints.md#create-trip-checklist
[create-checklist-item-docs]: /doc/travel_buddy_endpoints.md#create-checklist-item
[get-parks-by-state-docs]: /doc/travel_buddy_endpoints.md#get-parks-by-state
[get-parks-by-activity-docs]: /doc/travel_buddy_endpoints.md#get-parks-by-activity
[get-park-by-parkcode-docs]: /doc/travel_buddy_endpoints.md#get-park-by-parkcode
[get-weather-docs]: /doc/travel_buddy_endpoints.md#get-weather



# Your Epk

## Setup

This project requires Ruby 2.7.2.

* Fork this repository
* Clone your fork
* From the command line, install gems and set up your DB:
    * `bundle`
    * `rails db:create`
* Run the test suite with `bundle exec rspec`.
* Run your development server with `rails s` to see the app in action.

#### Project Configurations

* Ruby version
    ```bash
    $ ruby -v
    ruby 2.7.2p137 (2020-10-01 revision 5445e04352) [x86_64-darwin20]
    ```

* [System dependencies](https://github.com/bfl3tch/little-esty-shop/blob/main/Gemfile)
    ```bash
    $ rails -v
    Rails 5.2.6
    ```

* Database creation
    ```bash
    $ rails db:{drop,create,migrate,seed}
    Created database 'little_esty_shop_development'
    Created database 'little_esty_shop_test'
    ```


* How to run the test suite
    ```bash
    $ bundle exec rspec
    ```

* [Local Deployment](http://localhost:3000), for testing:
    ```bash
    $ rails s
    => Booting Puma
    => Rails 5.2.6 application starting in development
    => Run `rails server -h` for more startup options
    Puma starting in single mode...
    * Version 3.12.6 (ruby 2.7.2-p137), codename: Llamas in Pajamas
    * Min threads: 5, max threads: 5
    * Environment: development
    * Listening on tcp://localhost:3000
    Use Ctrl-C to stop

    ```

* [Heroku Deployment](https://your-epk.herokuapp.com/dashboard/1), for production
