# e-core-automation

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
   git clone https://github.com/your-username/repository-name.git
   ```
2. **Install Ruby dependencies:**
    ```bash
    bundle install
    ```
3. **Install Playwright**
    ```bash
    npx playwright install
    ```
### Running tests
    bundle exec rspec

    This command runs all the three test cases.

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

  
