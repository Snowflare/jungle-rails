# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of learning Rails by example.
## Screenshots

!["Screenshot of Homepage"](https://raw.githubusercontent.com/Snowflare/scheduler/master/docs/Initial.png)
!["Screenshot of Product Details"](https://raw.githubusercontent.com/Snowflare/scheduler/master/docs/appoinment-form.png)
!["Screenshot of My Cart"](https://raw.githubusercontent.com/Snowflare/scheduler/master/docs/appointment-form2.png)
!["Screenshot of Checkout"](https://raw.githubusercontent.com/Snowflare/scheduler/master/docs/saving.png)
!["Screenshot of Appointment Booked"](https://raw.githubusercontent.com/Snowflare/scheduler/master/docs/appoinment-booked.png)
!["Screenshot of Delete Confirmation"](https://raw.githubusercontent.com/Snowflare/scheduler/master/docs/delete-confirmation.png)
!["Screenshot of Deleting"](https://raw.githubusercontent.com/Snowflare/scheduler/master/docs/deleting.png)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
