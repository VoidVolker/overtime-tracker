# overtime-tracker

Real world project example. Developed while completing RoR development guide.

## Initial requirements

### Models

- [✓] Post -> date:date, rationale:text
- [✓] User -> Devise
- [✓] Admin -> STI
- Auditlog - keep track of if a employee had overtime or not.

### Features

- Approval worflow
- [✓] SMS Messages -> link to approval logtime (TODO: inegrate with Heroku scheduler and turn)
- [✓] Admin dashboard
- Email summary to managers for approval
- Needs to be documented if employee did not log overtime

### Libraries

- [✓] FactoryBot
- [✓] Devise
- [✓] Administrate
- [✓] UIKit
- [✓] FontAwesome
- [✓] Twilio - sms
- [✓] Dotenv
- [✓] Capybara

### ToDo

- Refactor user association integration test in post_spec
- Refactor nav view
- Add user friendly error views
- Refactor testing of user type (admin_types)
- Update list of posts: admin can see column "user" and user can't see thie column
- Refactor table views to use universal helpers

## Cretendtials for twilio

`./.env`
```
TWILIO_ACCOUNT_SID=YOURACCOUNTSID
TWILIO_AUTH_TOKEN=YOURAUTHTOKEN
TWILIO_PHONE_NUMBER=+11111111111
```
