# Overtime App

## Key Requirement: Company needs documentation that salaried employees did or did not get overtime each week

## Models
- x Post -> date:date rationale:text
- x User -> Devise
- x AdminUser -> STI

## Features
- Approve Workflow
- SmS sending -> link approval or overtime input
- x Administrate admin dashboard
- x Block non admin guest users
- Email summary to managers approval
- Needs to be documented if employee did not log overtime

## UI
- x Bootstrap -> formatting
- Icons from font awesome
- x Update the style of forms

## Refactor TODOS:
- Refactor user association to integration test in post_spec
- Refactor forms for admin user with status
- Fix post_spec.rb