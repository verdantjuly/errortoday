# ErrorToday

Calculate and shows most occured error during last 1 day.

## Versions
- ruby 3.1.4p223
- Rails 7.1.3.2

## Feature
- Error CRUD
- Comment CRUD
- Add Occur
- Show most occured error during last 1 day
- Admin Back Office with Active Admin

## How to Run

- Bundle Install

```
bundle install
```

- Register Cron Job

```
whenever --update-crontab
```

- Create Account in Active Admin
```
bin/rails c
admin_user = AdminUser.create(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
```

- Run Server Locally

```
bin/rails server
```

- Docker build
```
docker build -t docker/errortoday .
```

- Docker Run 
```
docker run -p 3000:3000 docker/errortoday
```

## ERD

![erd](./app/assets/images/erd.png)
