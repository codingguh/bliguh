## Bliguh

Bliguh is opensource ecommerce ui using getx, mapbox autocomplete, and googlemap Open source web app that saves you many days of work when building your own SaaS product. The boilerplate comes with many basic SaaS features (see [Features](https://github.com/async-labs/saas#features) below) so that you can focus on features that differentiate your product.

## Contents

- [Features](#features)
- [Run locally](#running-api-locally)
- [Deploy](#deploy-to-heroku-aws-elastic-beanstalk-api-gateway-and-aws-lambda)
- [Built with](#built-with)
- [Screenshots](#screenshots)
- [Contributing](#contributing)
- [Team](#team)
- [License](#license)
- [Project structure](#project-structure)

## Features

- Server-side rendering for fast initial load and SEO.
- User authentication with Google OAuth API and Passwordless, cookie, and session.
- Production-ready Express server with compression, parser, and helmet.
- Transactional emails (`AWS SES`): welcome, team invitation, and payment.
- Adding email addresses to newsletter lists (`Mailchimp`): new users, paying users.
- File upload, load, and deletion (`AWS S3`) with pre-signed request for: Posts, Team Profile, and User Profile.
- Websockets with socket.io v3.
- Team creation, Team Member invitation, and settings for Team and User.
- Opinionated architecture:
  - keeping babel and webpack configurations under the hood,
  - striving to minimize number of configurations,
  - `withAuth` HOC to pass user prop and control user access to pages,
  - HOC extensions `MyApp` and `MyDocument`
  - server-side rendering with `Material-UI`,
  - model-specific components in addition to common components.
- Universally-available environmental variables at runtime.
- Custom logger (configure what _not_ to print in production).
- Useful components for any web app: `ActiveLink`, `Confirm`, `Notifier`, `MenuWithLinks`, and more.
- Analytics with `Google Analytics`.
- Production-ready, scalable architecture:
  - `app` - user-facing web app with Next/Express server, responsible for rendering pages (either client-side or server-side rendered). `app` sends requests via API methods to `api` Express server.
  - `api` - server-only code, Express server, responsible for processing requests for internal and external API infrastructures.
- **Subscriptions with `Stripe`**:
  - subscribe/unsubscribe Team to plan,
  - update card information,
  - verified Stripe webhook for failed payment for subscription.

## Screenshots

Authentication
![Image](/assets/screenshots/bliguh_auth.png)

Products
![Image](/assets/screenshots/bliguh_auth.png)

Carts
![Image](/assets/screenshots/bliguh_auth.png)

Settings
![Image](/assets/screenshots/bliguh_auth.png)

Addresses
![Image](/assets/screenshots/bliguh_auth.png)
