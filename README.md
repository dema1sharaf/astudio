<h2 align="center">
API with Authentication, EAV, and Filtering
</h2>


## About Project

This project provides a RESTful API built with Laravel, supporting:

* User Authentication: Registration, login, logout using Laravel Passport.
* EAV System: Dynamic attributes for projects.
* Filtering: Query projects by standard and EAV attributes.
* CRUD: Full CRUD for users, projects, timesheets, attributes, and attribute values.

## Setup Instructions

<h3>1. Clone the Repository</h3>
git clone https://github.com/dema1sharaf/astudio.git
<br/>
<h3>2. Install Dependencies</h3>
<pre><code>
composer install
npm install
</code></pre>
<h3>3. Environment Configuration</h3>
<pre><code>
cp .env.example .env 
</code></pre>

<h3>4. Generate Application Key</h3>
<pre><code>php artisan key:generate</code></pre>

<h3>5. Set Up Database</h3>
<p>Create a new database and update the database name in the .env file and run migrations:</p>
<pre><code>php artisan migrate --seed</code></pre>

<h3>6. Install Passport</h3>
<pre><code>php artisan passport:install</code></pre>
Copy the client ID and secret into your .env file from the output.

<h3>7. Run the Application</h3>
<pre><code>php artisan serve</code></pre>
<p>Visit: <a href="http://127.0.0.1:8000" target="_blank">http://127.0.0.1:8000</a></p>


<div class="section">
    <h3>SQL Dump</h3>
    <p>Find the SQL dump in this path:</p>
    <pre><code>database/dumps/studio_test.sql</code></pre>
    <p>you can import it </p>
</div>

<div class="section">
    <h2>Test Credentials</h2>
    <p>Use these credentials for testing:</p>
    <ul>
        <li><strong>Email:</strong> <code>massa@gmail.com</code></li>
        <li><strong>Password:</strong> <code>123456</code></li>
    </ul>
</div>

<h2>API Documentation</h2>

<div class="section">
    <h3>Postman Collection</h3>
    <p>You can find the Postman collection in the following path:</p>
    <pre><code>tests/astudio.postman_collection.json</code></pre>
    <p>This file includes all test cases and API endpoints with example requests and responses for each.</p>
</div>

<details>
<summary>Authentication Endpoints</summary>
<div class="section">
<h3>Register</h3>
<pre><code>POST /api/register</code></pre>
<p><strong>Request:</strong></p>
<pre><code>{
    "first_name": "dmdom",
    "last_name": "sharaf",
    "email": "dmdom@example.com",
    "password": "123456",
    "password_confirmation": "123456"
}</code></pre>

<p><strong>Response:</strong></p>
<pre><code>{
    "message": "User registered successfully",
    "user": {
        "id": 1,
        "first_name": "dmdom",
        "last_name": "sharaf",
        "email": "dmdom@example.com"
    },
    "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJS...."
}</code></pre>
</div>

<div class="section">
        <h3>Login</h3>
        <pre><code>POST /api/login</code></pre>
        <p><strong>Request:</strong></p>
        <pre><code>{
    "email": "massa@gmail.com",
    "password": "123456"
}</code></pre>

<p><strong>Response:</strong></p>
<pre><code>{
    "message": "Login successful",
    "user": {
        "id": 1,
        "first_name": "massa",
        "last_name": "bazrtwo",
        "email": "massa@gmail.com"
    },
    "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJS...."
}</code></pre>
</div>

<div class="section">
        <h3>Logout</h3>
        <pre><code>POST /api/logout</code></pre>
        <p><strong>Headers:</strong></p>
        <pre><code>Authorization: Bearer YOUR_ACCESS_TOKEN</code></pre>

<p><strong>Response:</strong></p>
        <pre><code>{
    "message": "Logout successful"
}</code></pre>
</div>
</details>
<details>
<summary>User API Endpoints (CRUD)</summary>
<div class="section">

<h3>1. Get All Users</h3>
    <pre><code>GET /api/users</code></pre>
    <p><strong>Response:</strong></p>
    <pre><code>{
    "users": [
        {
            "id": 1,
            "first_name": "massa",
            "last_name": "bazrtwo",
            "email": "massa@gmail.com"
        },
        {
            "id": 2,
            "first_name": "diima",
            "last_name": "Sharaf",
            "email": "dema.sharaf1@gmail.com"
        }
    ]
}</code></pre>

<h3>2. Create a New User</h3>
    <pre><code>POST /api/users</code></pre>
    <p><strong>Request:</strong></p>
    <pre><code>{
    "first_name": "dema",
    "last_name": "developer",
    "email": "developer@dema.com",
    "password": "123456",
    "password_confirmation": "123456"
}</code></pre>
<p><strong>Response:</strong></p>
<pre><code>{
    "message": "User created successfully",
    "user": {
        "first_name": "dema",
        "last_name": "developer",
        "email": "developer@dema.com",
        "id": 50
}</code></pre>

<h3>3. Get Single User</h3>
    <pre><code>GET /api/users/{id}</code></pre>
    <p><strong>Response:</strong></p>
    <pre><code>{
    "id": 1,
    "first_name": "massa",
    "last_name": "bazrtwo",
    "email": "massa@gmail.com"
}</code></pre>

<h3>4. Update User</h3>
    <pre><code>PUT /api/users/{id}</code></pre>
    <p><strong>Request:</strong></p>
    <pre><code>{
"first_name" : "Hanan"
}</code></pre>
<p><strong>Response:</strong></p>
<pre><code>
{
    "message": "User updated successfully",
    "user": {
        "id": 6,
        "first_name": "Hanan",
        "last_name": "bazrtwo",
        "email": "abd1@gmail.com"
    }
}</code></pre>

<h3>5. Delete User</h3>
    <pre><code>DELETE /api/users/{id}</code></pre>
    <p><strong>Response:</strong></p>
    <pre><code>{
"message": "User deleted successfully"
}</code></pre>
</div>
</details>
<details>
<summary>Attribute API Endpoints (CRUD)</summary>
<div class="section">
<h2></h2>
<h3>1. Get All Attributes</h3>
<pre><code>GET /api/attributes</code></pre>
<p><strong>Response:</strong></p>
<pre><code>{
"attributes": [
    {
        "id": 1,
        "name": "department",
        "type": "text"
    },
    {
        "id": 2,
        "name": "start_date",
        "type": "date"
    },
    {
        "id": 3,
        "name": "end_date",
        "type": "date"
    }
]
} </code></pre>

<h3>2. Create a New Attribute</h3>
<pre><code>POST /api/attributes</code></pre>
<p><strong>Request:</strong></p>
<pre><code>{
"name": "Project Type",
"type": "select"
}</code></pre>
<p><strong>Response:</strong></p>
<pre><code>
{
    "message": "Attribute created successfully",
    "attribute": {
        "name": "Project Type",
        "type": "select",
        "id": 11
    }
}
</code></pre>

<h3>3. Get Single Attribute</h3>
<pre><code>GET /api/attributes/{id}</code></pre>
<p><strong>Response:</strong></p>
<pre><code>
{
    "id": 5,
    "name": "image",
    "type": "text"
}
</code></pre>

<h3>4. Update Attribute</h3>
<pre><code>PUT /api/attributes/{id}</code></pre>
<p><strong>Request:</strong></p>
<pre><code>{
"name": "Project Category",
"type": "text"
}
</code></pre>
<p><strong>Response:</strong></p>
<pre><code>
{
    "message": "Attribute updated successfully",
    "attribute": {
        "id": 11,
        "name": "Project Category",
        "type": "text"
    }
}
</code></pre>

<h3>5. Delete Attribute</h3>
<pre><code>DELETE /api/attributes/{id}</code></pre>
<p><strong>Response:</strong></p>
<pre><code>{
"message": "Attribute deleted successfully"
}
</code></pre>
</div>
</details>

<details>
<summary>Project API Endpoints (CRUD) & Filter</summary>
<div class="section">

<h2>1. Get All Projects (with Filtering on both regular and EAV attributes)</h2>
        <h3>Endpoint:</h3>
        <pre><code>GET /api/projects</code></pre>
        <h3>Example Request:</h3>
        <pre><code>GET /api/projects?filters[department]=IT Department&filters[name]=Dima</code></pre>
        <h3>Example Response:</h3>
        <pre><code>
[
    {
        "id":18,
        "name":"Dima",
        "status":"active",
        "attributes":
        [
            {
                "id":4,
                "attribute_id":1,
                "entity_id":18,
                "value":"IT Department",
                "attribute":{"id":1,"name":"department","type":"text"}
            },
            {
                "id":5,
                "attribute_id":2,
                "entity_id":18,
                "value":"2025-06-01",
                "attribute":{"id":2,"name":"start_date","type":"date"}
            }
        ]
    }
]
</code></pre>
</div>

<div class="section">
        <h2>2. Filter Projects by Attributes</h2>
        <h3>Endpoint:</h3>
        <pre><code>GET /api/projects/filter</code></pre>
        <h3>Example Request:</h3>
        <pre><code>GET /api/projects/filter?filters[department]=IT&filters[start_date]=2025-06-01</code></pre>
        <h3>Example Response:</h3>
        <pre><code>
        {
        "message":"Projects found",
        "projects":
            [
                {
                    "id":18,
                    "name":"Dima",
                    "status":"active",
                    "attributes":
                        [
                            {
                                "id":4,
                                "attribute_id":1,
                                "entity_id":18,
                                "value":"IT Department",
                                "attribute":{"id":1,"name":"department","type":"text"}
                            },
                            {
                                "id":5,
                                "attribute_id":2,
                                "entity_id":18,
                                "value":"2025-06-01",
                                "attribute":{"id":2,"name":"start_date","type":"date"}
                            }
                        ]
                }
            ]
        }
</code></pre>
</div>


<div class="section">
        <h2>3. Create Project with Attributes</h2>
        <h3>Endpoint:</h3>
        <pre><code>POST /api/projects</code></pre>
        <h3>Example Request:</h3>
        <pre><code>
{
    "name": "four Project",
    "status": "active",
    "attributes": [
        {
            "id": 1,
            "value": "outside Department"
        }
    ]
}
</code></pre>
<h3>Example Response:</h3>
<pre><code>
{
    "message": "Project created successfully",
    "project": {
        "name": "four Project",
        "status": "active",
        "id": 34
    }
}
</code></pre>
</div>

<div class="section">
        <h2>4. Update Project with Attributes</h2>
        <h3>Endpoint:</h3>
        <pre><code>PUT /api/projects/{id}</code></pre>
        <h3>Example Request:</h3>
        <pre><code>
{
    "name" : "project ID 20"
}
</code></pre>
<h3>Example Response:</h3>
<pre><code>{
    "message": "Project updated successfully",
    "project": {
        "id": 20,
        "name": "project ID 20",
        "status": "active"
    }
}</code></pre>
</div>

<div class="section">
        <h2>5. Get Single Project</h2>
        <h3>Endpoint:</h3>
        <pre><code>GET /api/projects/{id}</code></pre>
        <h3>Example Response:</h3>
        <pre><code>
{
    "id": 18,
    "name": "Dima",
    "status": "active",
    "attributes": [
        {
            "id": 4,
            "attribute_id": 1,
            "entity_id": 18,
            "value": "IT Department",
            "attribute": {
                "id": 1,
                "name": "department",
                "type": "text"
            }
        },
        {
            "id": 5,
            "attribute_id": 2,
            "entity_id": 18,
            "value": "2025-06-01",
            "attribute": {
                "id": 2,
                "name": "start_date",
                "type": "date"
            }
        }
    ]
}</code></pre>
</div>

<div class="section">
        <h2>6. Delete Project</h2>
        <h3>Endpoint:</h3>
        <pre><code>DELETE /api/projects/{id}</code></pre>
        <h3>Example Response:</h3>
        <pre><code>
{
    "message": "Project deleted successfully"
}
</code></pre>
</div>
</details>

<details>
<summary>Timesheet API Endpoints (CRUD)</summary>

<div class="section">
        <h2>1. Get All Timesheets</h2>
        <h3>Endpoint:</h3>
        <pre><code>GET /api/timesheets</code></pre>
        <h3>Example Response:</h3>
        <pre><code>
[
    {
        "id": 1,
        "task_name": "Updated Design DB",
        "date": "2025-06-20",
        "hours": 6,
        "user_id": 1,
        "project_id": 1,
        "user": {
            "id": 1,
            "first_name": "massa",
            "last_name": "bazrtwo",
            "email": "massa@gmail.com"
        },
        "project": {
            "id": 1,
            "name": "Project 1",
            "status": "active"
        }
    }
]
</code></pre>
</div>

<div class="section">
        <h2>2. Create a Timesheet Entry</h2>
        <h3>Endpoint:</h3>
        <pre><code>POST /api/timesheets</code></pre>
        <h3>Example Request:</h3>
        <pre><code>
{
"task_name": "Development Task",
"date": "2025-02-20",
"hours": 5,
"user_id": 1,
"project_id": 1
}
</code></pre>
<h3>Example Response:</h3>
<pre><code>
{
    "message": "Timesheet created successfully",
    "timesheet": {
        "task_name": "Development Task",
        "date": "2025-02-20",
        "hours": 5,
        "user_id": 1,
        "project_id": 1,
        "id": 4,
        "user": {
            "id": 1,
            "first_name": "massa",
            "last_name": "bazrtwo",
            "email": "massa@gmail.com"
        },
        "project": {
            "id": 1,
            "name": "Project 1",
            "status": "active"
        }
    }
}
</code></pre>
</div>

<div class="section">
        <h2>3. Get a Single Timesheet Entry</h2>
        <h3>Endpoint:</h3>
        <pre><code>GET /api/timesheets/{id}</code></pre>
        <h3>Example Response:</h3>
        <pre><code>
{
    "id": 1,
    "task_name": "Updated Design DB",
    "date": "2025-06-20",
    "hours": 6,
    "user_id": 1,
    "project_id": 1,
    "user": {
        "id": 1,
        "first_name": "massa",
        "last_name": "bazrtwo",
        "email": "massa@gmail.com"
    },
    "project": {
        "id": 1,
        "name": "Project 1",
        "status": "active"
    }
}
</code></pre>
</div>

<div class="section">
        <h2>4. Update a Timesheet Entry</h2>
        <h3>Endpoint:</h3>
        <pre><code>PUT /api/timesheets/{id}</code></pre>
        <h3>Example Request:</h3>
        <pre><code>
{
"task_name": "Updated Task",
"hours": 6
}
</code></pre>
<h3>Example Response:</h3>
<pre><code>
{
    "message": "Timesheet updated successfully",
    "timesheet": {
        "id": 1,
        "task_name": "Updated Task",
        "date": "2025-06-20",
        "hours": 6,
        "user_id": 1,
        "project_id": 1,
        "user": {
            "id": 1,
            "first_name": "massa",
            "last_name": "bazrtwo",
            "email": "massa@gmail.com"
        },
        "project": {
            "id": 1,
            "name": "Project 1",
            "status": "active"
        }
    }
}
</code></pre>
</div>

<div class="section">
        <h2>5. Delete a Timesheet Entry</h2>
        <h3>Endpoint:</h3>
        <pre><code>DELETE /api/timesheets/{id}</code></pre>
        <h3>Example Response:</h3>
        <pre><code>{
    "message": "Timesheet deleted successfully"
}</code></pre>
</div>

</details>


<details>
<summary>AttributeValue API Endpoints (CRUD)</summary>

<div class="section">
        <h2>1. Get All Attribute Values</h2>
        <h3>Endpoint:</h3>
        <pre><code>GET /api/attribute-values</code></pre>
        <h3>Example Response:</h3>
        <pre><code>
[
    {
        "id": 4,
        "attribute_id": 1,
        "entity_id": 18,
        "value": "IT Department",
        "attribute": {
            "id": 1,
            "name": "department",
            "type": "text"
        },
        "project": {
            "id": 18,
            "name": "Dima",
            "status": "active"
        }
    }
    {
        "id": 7,
        "attribute_id": 1,
        "entity_id": 19,
        "value": "IT Department",
        "attribute": {
            "id": 1,
            "name": "department",
            "type": "text"
        },
        "project": {
            "id": 19,
            "name": "Taxi Project New",
            "status": "active"
        }
    },
    {
        "id": 10,
        "attribute_id": 1,
        "entity_id": 22,
        "value": "HR Department",
        "attribute": {
            "id": 1,
            "name": "department",
            "type": "text"
        },
        "project": {
            "id": 22,
            "name": "New Project 10",
            "status": "active"
        }
    },
    {
        "id": 17,
        "attribute_id": 1,
        "entity_id": 34,
        "value": "outside Department",
        "attribute": {
            "id": 1,
            "name": "department",
            "type": "text"
        },
        "project": {
            "id": 34,
            "name": "four Project",
            "status": "active"
        }
    }
]
        </code></pre>
</div>

<div class="section">
        <h2>2. Create an Attribute Value</h2>
        <h3>Endpoint:</h3>
        <pre><code>POST /api/attribute-values</code></pre>
        <h3>Example Request:</h3>
        <pre><code>
{
    "value": "Finance Department",
    "entity_id": 1,
    "attribute_id": 2
}
        </code></pre>
<h3>Example Response:</h3>
<pre><code>
{
    "message": "AttributeValue created successfully",
    "attributeValue": {
        "entity_id": 1,
        "attribute_id": 2,
        "value": "Finance Department",
        "id": 18,
        "attribute": {
            "id": 2,
            "name": "start_date",
            "type": "date"
        },
        "project": {
            "id": 1,
            "name": "Project 1",
            "status": "active"
        }
    }
}
</code></pre>
</div>

<div class="section">
        <h2>3. Get a Single Attribute Value</h2>
        <h3>Endpoint:</h3>
        <pre><code>GET /api/attribute-values/{id}</code></pre>
        <h3>Example Response:</h3>
        <pre><code>{
    "id": 4,
    "attribute_id": 1,
    "entity_id": 18,
    "value": "IT Department",
    "attribute": {
        "id": 1,
        "name": "department",
        "type": "text"
    },
    "project": {
        "id": 18,
        "name": "Dima",
        "status": "active"
    }
}</code></pre>
</div>

<div class="section">
        <h2>4. Update an Attribute Value</h2>
        <h3>Endpoint:</h3>
        <pre><code>PUT /api/attribute-values/{id}</code></pre>
        <h3>Example Request:</h3>
        <pre><code>{
"value": "Updated Value"
}</code></pre>
<h3>Example Response:</h3>
<pre><code>
{
    "message": "AttributeValue updated successfully",
    "timesheet": {
        "id": 9,
        "attribute_id": 1,
        "entity_id": 21,
        "value": "Updated Value",
        "attribute": {
            "id": 1,
            "name": "department",
            "type": "text"
        },
        "project": {
            "id": 21,
            "name": "Sec Project Dima",
            "status": "active"
        }
    }
}
</code></pre>
</div>

<div class="section">
        <h2>5. Delete an Attribute Value</h2>
        <h3>Endpoint:</h3>
        <pre><code>DELETE /api/attribute-values/{id}</code></pre>
        <h3>Example Response:</h3>
        <pre><code>{
    "message": "AttributeValue deleted successfully"
}</code></pre>
</div>

</details>


<div class="section">
    <h3>PHPUnit Test Cases</h3>
    <p>I added PHPUnit test cases to validate the functionality of some API endpoints. These tests ensure that the function works correctly, handles edge cases, and returns the expected responses.</p>

<p><strong>Location of Test Cases:</strong></p>
    <pre><code>tests/Feature</code></pre>
    <p>This directory contains feature tests for the core functionalities</p>
<p><strong>How to Run the Test Cases:</strong></p>
    <ol>
        <li>Ensure your environment is properly configured with a testing database in the <code>.env</code> file:</li>
        <pre><code>DB_DATABASE=your_test_database</code></pre>

<li>Run the following command to execute all PHPUnit tests:</li>
<pre><code>php artisan test</code></pre>

<li>To run tests for a specific feature, use:</li>
<pre><code>php artisan test --filter ProjectControllerTest</code></pre>

</ol>

<p>The test cases cover various scenarios, including:</p>
<ul>
        <li>Successful and failed API requests</li>
        <li>Validation errors</li>
        <li>Database operations (CRUD)</li>
        <li>Authentication and authorization</li>
    </ul>
</div>

<div class="section">
    <h3>Note</h3>
<p>The requirements in Part 2 regarding for example "the creation and updating of attributes" are already covered by the CRUD operations implemented through the apiResource route. Therefore, the specific routes for creating and updating attributes have been commented out in the routes/api.php file to avoid duplication. They are left commented for reference.</p>
</div>
