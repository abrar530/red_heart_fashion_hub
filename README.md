# Red Heart Fashion Hub

Red Heart Fashion Hub is a Ruby on Rails-based e-commerce platform tailored for women's fashion. It includes features such as product listings, category browsing, user roles, shopping cart, order management, and more.

##  Getting Started

These steps will help you set up and run the application locally.

---

##  Prerequisites

Make sure you have the following installed:

- Ruby (version defined in `.ruby-version`)
- Rails
- Node.js
- Yarn
- PostgreSQL (or the database configured in `config/database.yml`)

---

##  Installation

Clone the repository:

```bash
git clone https://github.com/abrar530/red_heart_fashion_hub.git
cd red_heart_fashion_hub
```

---

##  Install Dependencies

If not already installed, run:

```bash
bundle install
yarn install
```

>  Skip this step if you've already installed the dependencies on your machine.

---

##  Set Up the Database

Run the following commands to set up and seed the database:

```bash
rails db:create
rails db:migrate
rails db:seed
```


---

##  Start the Server

Start the Rails development server:

```bash
rails server
```

Then, open your browser and visit:

```text
http://localhost:3000
```

---

##  Notes

- You must be in the root project folder (`red_heart_fashion_hub`) before running these commands.
- If any gems or JS packages are added later, run `bundle install` or `yarn install` again.

---

##  Contributing

If you're contributing to the project, please create a feature branch and make pull requests for review.

---

##  License

This project is currently unlicensed. You may add a license in the future.