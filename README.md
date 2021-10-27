## Little Esty Shop

[![Contributors][contributors-shield]][contributors-url]
[![Issues][issues-shield]][issues-url]
[![Stargazers][stars-shield]][stars-url]
[![Forks][forks-shield]][forks-url]
# Welcome to Your-EPK - An Application to host and promote your Film EPKs
<p align="center">
  ![Database Schema](https://i.postimg.cc/vmy0hxPc/Screen-Shot-2021-10-18-at-5-04-35-PM.png)](https://postimg.cc/qNmcMqHT)
</p>

Find the [project spec here](https://github.com/turingschool-examples/little-esty-shop).
## Table of Contents

- [Overview](#overview)
- [Tools Utilized](#tools-used)
- [Contributing](#contributors)

# README
------

### <ins>Overview</ins>

[Little Esty Shop](https://github.com/bfl3tch/little-esty-shop) is a 10-day, 4 person project, during Mod 2 of 4 for Turing School's Back End Engineering Program.

Our challenge was to build a functioning web app consisting of multiple relational databases to model the popular e-commerce web site *Etsy*.

Learning goals and areas of focus consisted of:

- Apply principles of flow control across multiple methods
- Design a one to many relationship using a schema designer
- Write migrations to create tables with columns of varying data types and foreign keys.
- Use Rails to create web pages that allow users to CRUD resources
- Create instance and class methods on a Rails model that use ActiveRecord methods and helpers
- Write model and feature tests that fully cover data logic and potential user behavior


### <ins>Tools Used</ins>
- Ruby 2.7.2
- TypeScript
- React
- React Router
- Cypress
- Material UI
- AWS S3
- PostgresQL
- Postico
- Capybara
- Launchy
- Orderly
- SimpleCov
- Git/GitHub
- HTML5
- SCSS
- Bootstrap
- RSpec
- Pry
- Atom
- VS Code

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


# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ... -->


# Little Esty Shop

## Background and Description

"Little Esty Shop" is a group project that requires students to build a fictitious e-commerce platform where merchants and admins can manage inventory and fulfill customer invoices.

## Learning Goals
- Practice designing a normalized database schema and defining model relationships
- Utilize advanced routing techniques including namespacing to organize and group like functionality together.
- Utilize advanced active record techniques to perform complex database queries
- Practice consuming a public API while utilizing POROs as a way to apply OOP principles to organize code

## Requirements
- must use Rails 5.2.x
- must use PostgreSQL
- all code must be tested via feature tests and model tests, respectively
- must use GitHub branching, team code reviews via GitHub comments, and github projects to track progress on user stories
- must include a thorough README to describe the project
- must deploy completed code to Heroku

## Setup

This project requires Ruby 2.7.2.

* Fork this repository
* Clone your fork
* From the command line, install gems and set up your DB:
    * `bundle`
    * `rails db:create`
* Run the test suite with `bundle exec rspec`.
* Run your development server with `rails s` to see the app in action.

## Phases

1. [Database Setup](./doc/db_setup.md)
1. [User Stories](./doc/user_stories.md)
1. [Extensions](./doc/extensions.md)
1. [Evaluation](./doc/evaluation.md)



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
