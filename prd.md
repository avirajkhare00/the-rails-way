## Blog App PRD

### Intoduction

This is a blog app that allows users to create, read, update, and delete blog posts.

### Features

- User can create a new blog post
- User can read a blog post
- User can update a blog post
- User can delete a blog post
- User can search for a blog post by title

- User can create a new user
- User can read a user
- User can update a user
- User can delete a user
- User can search for a user by username

### Tech Stack

** Ruby on Rails **
** PostgreSQL **
** Bootstrap **
** HTML **
** CSS **
** JavaScript **

### Database Schema

 - User (table) {
    id: integer
    username: string
    email: string
    password: string
    created_at: datetime
    updated_at: datetime
 }
 - Post (table) {
    id: integer
    user_id: integer
    title: string
    content: string
    created_at: datetime
    updated_at: datetime
 }

 - User has many posts
 - Post belongs to user


### API Endpoints

 - GET /ping
 - GET /posts -> returns collection of posts in json format
 - GET /posts/:id -> returns a single post in json format
 - POST /posts -> creates a new post
 - PUT /posts/:id -> updates a post
 - DELETE /posts/:id -> deletes a post

 - GET /users -> returns collection of users in json format
 - GET /users/:username -> returns a single user in json format
 - POST /users -> creates a new user
 - PUT /users/:username -> updates a user
 - DELETE /users/:username -> deletes a user

 - GET /users/:username/posts -> returns collection of posts for a user in json format


### Error Handling

 - 200 OK
 - 201 Created
 - 404 Not Found

### Note

**Please use rails generator commands where possible.**
