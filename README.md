# overtime-tracker

Real world project example. Developed while completing RoR development guide.

## Initial requirements

### Models
- [✓] Post -> date:date, rationale:text
- [✓] User -> Devise
- [✓] Admin -> STI

### Features
- Approval worflow
- SMS Messages -> link to approval logtime
- Admin dashboard
- Email summary to managers for approval
- Needs to be documented if employee did not log overtime

### Libraries

- [✓] FactoryBot
- [✓] Devise
- [✓] Administrate
- [✓] UIKit
- [✓] FontAwesome
- Twilio - sms
- Dotenv
- [✓] Capybara

### ToDo
- Refactor user association integration test in post_spec
- Refactor status view in post edit form
- Refactor nav view
- Add user friendly error views
- Refactor testing of user type (admin_types)
- Update list of posts: admin can see column "user" and user can't see thie column
- Remove edit/delete for approved posts