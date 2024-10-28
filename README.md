# E-core-automation

This project is a Technical test using Ruby and Playwright for end-to-end automation.

---

### Prerequisites

Ensure the following dependencies are installed:

- Ruby (version 3 or higher)
- Node.js (to install Playwright)
- Bundler (to manage Ruby dependencies)

### Installation

1. **Clone the repository:**

   ```bash
   git clone git@github.com:gugadbrosa/e-core-automation.git
   ```

2. **Install Ruby dependencies:**

   ```bash
   gem install bundler
   bundle install
   ```

3. **Install Playwright**

   ```bash
   npx playwright install
   ```

### Running tests

    bundle exec rspec

### Project Structure

```
e-core-automation/
├── Gemfile
├── Gemfile.lock
├── README.md
└── spec/
    ├── features/
    │   ├── tc001_login_positive_spec.rb
    │   ├── tc002_login_negative_spec.rb
    │   └── tc003_validate_invoice_details_spec.rb
    ├── spec_helper.rb
    └── support/
        └── helpers.rb
```

### CI

The project uses [GitHub Actions](https://docs.github.com/en/actions) and tests are run automatically on PRs and on merge to `main` branch.
