# PainSquad

## Getting Started

#### Server:

- `bundle install`
- `rake db:create`
- `rake db:setup`
- `spring rails server`

#### Client:

- `$ cd public/ng`
- `npm install`
- `bower install`
- `sudo npm install -g gulp`
- `gulp serve`

##### Emulation:

Using the ios-simulator - be sure to run `sudo npm install -g cordova ios-sim` first:

- `gulp build --ios --run`


## Cukes

`gem install cucumber`

Run all: `bundle exec cucumber`

Run specific file: `bundle exec cucumber features/feature_name.feature`

Run specific scenario: `bundle exec cucumber features/feature_name.feature:5`


## Heroku Deployment

- `$ cd public/ng && gulp build`
- Copy all files/folders in `www/` directory to `public/` directory
- Commit and push to `origin:heroku-deployment`
- Finally: `git push heroku heroku-deployment:master`

## API Documentation

To generate the API Documentation:

`rake swagger:docs`

This creates a self-contained directory within `public/` with the generated documentation.

## TestFlight

$ cd public/ng
$ gulp build --ios

## Common problems

On a native device you are getting the error: "deviceready not fired for 5 seconds"

* This could mean that you compiled the code with old libraries.  Update your cordova, phonegap and ionic.

$ sudo npm update cordova -g
$ sudo npm update phonegap -g
$ sudo npm update ionic -g

* You are not seeing your changes in your TestFlight build

You probably didn't build the new scripts.  Build your TF using gulp and NOT using the `ionic build ios` command

* You are seeing "no valid 'aps-environment'" error

You aren't using the correct provisioning profile.  You need one with push notifications enabled.

## Notifications

### AWS SNS

These are native notifications what will be received by users who use the native application.  When a user logs in, their profile is updated with their device id.  When it is time for the reminders to be sent out, if their profile has a device id, it will use this service.

### SMS

These will be received by users who are not using a native device.  If a user logs in to a non native device, their device id will be cleared if it exists.  When the reminders are sent out, they will be received in the form of a SMS.

The current account is a test account for sending SMS messages.  This means that all phone numbers must be verified before they can receive SMS messages from Twilio.

You can add and verify new numbers here: http://twilio.com/user/account/phone-numbers/verified

## Twillio Account Details

email: jon@func-i.com
password: EOVbBKl)}7VEMD4&

### Your Twillio Phone Number

(437) 800-0269
