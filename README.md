<a name="readme-top"></a>

<div align="center">
  <br/>

  <h3><b>Undertakings</b></h3>

</div>

<!-- TABLE OF CONTENTS -->

# 📗 Table of Contents

- [📖 About the Project](#about-project)
  - [🛠 Built With](#built-with)
    - [Tech Stack](#tech-stack)
    - [Key Features](#key-features)
    - [API Documentation](#api-documentation)
  - [🚀 Live Demo](#live-demo)
- [💻 Getting Started](#getting-started)
  - [Setup](#setup)
  - [Prerequisites](#prerequisites)
  - [Install](#install)
  - [Usage](#usage)
  - [Run tests](#run-tests)
  - [Deployment](#deployment)
- [👥 Authors](#authors)
- [🔭 Future Features](#future-features)
- [🤝 Contributing](#contributing)
- [⭐️ Show your support](#support)
- [📝 License](#license)

<!-- PROJECT DESCRIPTION -->

# 📖 Undertakings <a name="about-project"></a>

**Undertakings** is a is an API for a task management application where users can create, update, and delete tasks.

**Frontend Repository:** [Undertakings](https://github.com/yuvenalmash/undertakings-webapp)

## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>

<details>
  <summary>Backend</summary>
  <ul>
    <li><a href="https://rubyonrails.org/">Ruby on Rails</a></li>
  </ul>
</details>

<details>
<summary>Database</summary>
  <ul>
    <li><a href="https://www.postgresql.org/">PostgreSQL</a></li>
  </ul>
</details>

<!-- Features -->

### Key Features <a name="key-features"></a>


- **User Authentication**
- **CRUD Operations on Tasks**

### API Documentation <a name="api-documentation"></a>
***Base UR***L: `https://undertakings-5fbcc97dce19.herokuapp.com/api/v1`

***Authentication***: Obtain a token by sending a POST request to `/users/sign_in` with the user's email and password. Use the token in the `Authorization` header of subsequent requests.

<details>
  <Summary >Authentication</Summary>
  <ul>
    <li>
      POST /users
      <ul>
        <li>Creates a new user</li>
        <li>Sample request body:
          <pre>
            {
              "name": "John Doe",
              "email": "johndoe@example.com",
              "password": "password",
              "password_confirmation": "password"
            }
          </pre>
        </li>
      </ul>
    </li>
    <li>
      POST /users/sign_in
      <ul>
        <li>Logs in a user</li>
        <li>Sample request body:
          <pre>
            {
              "email": "johndoe@example.com",
              "password": "password"
            }
          </pre>
        </li>
      </ul>
    </li>
    <li>
      DELETE /users/{user_id}
      <ul>
        <li>Deletes a user</li>
        <li>Requires authentication</li>
      </ul>
    </li>
  </ul>
</details>

<details>
  <Summary >Tasks</Summary>
  <ul>
    <li>
      GET /users/{user_id}/tasks
      <ul>
        <li>Gets all tasks</li>
        <li>Requires authentication</li>
      </ul>
    </li>
    <li>
      POST /users/{user_id}/tasks
      <ul>
        <li>Creates a new task</li>
        <li>Requires authentication</li>
        <li>Sample request body:
          <pre>
            {
              "title": "Task Title",
              "description": "Task Description",
              "due_date": "2023-06-19 18:30:00",
              "completed": false
            }
          </pre>
        </li>
      </ul>
    </li>
    <li>
      GET /users/{user_id}/tasks/{task_id}
      <ul>
        <li>Gets a task</li>
        <li>Requires authentication</li>
      </ul>
    </li>
    <li>
      PUT /users/{user_id}/tasks/{task_id}
      <ul>
        <li>Updates a task</li>
        <li>Requires authentication</li>
        <li>Sample request body:
          <pre>
            {
              "title": "Task Title",
              "description": "Task Description",
              "due_date": "2023-06-19 18:30:00",
              "completed": false
            }
          </pre>
        </li>
      </ul>
    </li>
    <li>
      DELETE /users/{user_id}/tasks/{task_id}
      <ul>
        <li>Deletes a task</li>
        <li>Requires authentication</li>
      </ul>
    </li>
  </ul>
</details>


## 🚀 Live Demo <a name="live-demo"></a>

[Live Demo Link](https://undertakings-5fbcc97dce19.herokuapp.com/api-docs/index.html)


<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- GETTING STARTED -->

## 💻 Getting Started <a name="getting-started"></a>


To get a local copy up and running, follow these steps.

### Prerequisites

In order to run this project you need:

- Ruby
- Rails(7)
- PostgreSQL

### Setup

Clone this repository to your desired folder:

```sh
  cd my-folder
  git clone git@github.com:yuvenalmash/undertakings.git
```

### Setup Database

Run the following command to create the database:

```sh
  rails db:create
  rails db:migrate
```

### Install

Install this project with:

```sh
  cd undertakings
  bundle install
```

### Usage

To run the project, execute the following command:

```sh
  rails server
```


### Run tests

To run tests, run the following command:


```sh
  rspec
```

### Deployment

This project is deployed on Heroku.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- AUTHORS -->

## 👥 Authors <a name="authors"></a>

👤 **Yuvenal Njoroge**

- GitHub: [@yuvenalmash](https://github.com/yuvenalmash)
- Twitter: [@YuvenalNjoroge](https://twitter.com/YuvenalNjoroge)
- LinkedIn: [Yuvenal Njoroge](https://linkedin.com/in/yuvenal-njoroge)


<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- FUTURE FEATURES -->

## 🔭 Future Features <a name="future-features"></a>

- [ ] Add user profile
- [ ] Add user avatar
- [ ] Add user settings

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/yuvenalmash/undertakings/issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- SUPPORT -->

## ⭐️ Show your support <a name="support"></a>

If you like this project, give it a ⭐️!

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->

## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
