# Django, React, CircleCI, Heroku app

- Make utility cli available with `source local/utils.sh`
- Start Django server with `ofir pm runserver`
- Start next.js with `npm run dev` in `nextjs`.

## Todo

- [ ] Setup CircleCI
- [ ] Deploy on Heroku

## Setup

- New Heroku app created with `heroku create djangofir`

## Resources

### Books

- "Decoupled Django", Gagliardi

### CircleCI

- https://circleci.com/docs/2.0/pipeline-variables/
- https://circleci.com/blog/continuous-integration-for-django-projects/
- https://circleci.com/docs/2.0/deployment-integrations/
- https://circleci.com/docs/2.0/concepts/
- https://discuss.circleci.com/t/circleci-2-1-config-overview/26057
- https://circleci.com/blog/django-deploy/

### Heroku

- https://devcenter.heroku.com/articles/getting-started-with-python?singlepage=true
- https://devcenter.heroku.com/articles/django-app-configuration
- https://devcenter.heroku.com/articles/buildpacks

### Django/React

- https://docs.djangoproject.com/en/4.0/intro/tutorial02/
- https://www.digitalocean.com/community/tutorials/build-a-to-do-application-using-django-and-react

### Other

- https://dev.to/mdrhmn/deploying-react-django-app-using-heroku-2gfa
- https://www.codementor.io/@jamesezechukwu/how-to-deploy-django-app-on-heroku-dtsee04d4
- https://github.com/CircleCI-Public/circleci-demo-python-django
- https://jangiacomelli.com/django-tests-on-circleci-step-by-step/
- https://github.com/CIRCLECI-GWP/cci-cd-django

## Notes

- Difficult to set up different environments (env, prod) with Heroku?
- Perhaps better with DigitalOcean/AWS?
- Heroku has own CI: https://devcenter.heroku.com/articles/heroku-ci Why use CircleCI?
- Perhaps put in Docker container?
