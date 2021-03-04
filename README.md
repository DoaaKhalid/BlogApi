# BolgApi

## Run Command to run 

> docker-compose up

## Requests for user 

1. ### ** Signup ** 
"Post/user"
 post `'/api/v1/users', :params => user_params.to_json,:headers => { "Content-Type": "application/json" }`
 
 ### ** This request create a new user in db **
    
    **Input**
    ```
       user_params = { user: {
                       name: "doaa",
                       email: "doaa.khaled@gmail.com",
                       password_digest: "1234567",
                       image_path: "photo.jpg" }
                   }

 
     ```

    **Output**
    ```
       {
    "user": {
        "id": 1,
        "name": "doaa",
        "email": "doaa.khaled@gmail.com",
        "password_digest": "$2a$12$H3Wo/2RcYtLgHofJxjGtquT8jjV2Cd8oiv9480UXRAZi4EiPuMLQG",
        "image_path": "photo.jpg",
        "created_at": "2021-03-04T07:21:18.758Z",
        "updated_at": "2021-03-04T07:21:18.758Z",
     },
    "token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo5fQ.nDT3i82YcoghVvVD8lT2DFplmJr-G8q6oIMCVUba7QY"
   }
 
    ```

1. ### ** Login ** 
"Post/user"
 post `'/api/v1/login', :params => user_params.to_json,:headers => { "Content-Type": "application/json" }`
 
 ### ** This request get user to access api **
    
    **Input**
    ```
       user_params = { user: {
                       email: "doaa.khaled@gmail.com",
                       password_digest: "1234567" 
                   }
                 }

 
     ```

    **Output**
    ```
       {
    "user": {
        "id": 1,
        "name": "doaa",
        "email": "doaa.khaled@gmail.com",
        "password_digest": "$2a$12$H3Wo/2RcYtLgHofJxjGtquT8jjV2Cd8oiv9480UXRAZi4EiPuMLQG",
        "image_path": "photo.jpg",
        "created_at": "2021-03-04T07:21:18.758Z",
        "updated_at": "2021-03-04T07:21:18.758Z",
     },
    "token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo5fQ.nDT3i82YcoghVvVD8lT2DFplmJr-G8q6oIMCVUba7QY"
   }
 
     ```

## Some Requests for post

 1. ### ** Create Post ** 
  "Post/posts"
   post `'/api/v1/posts', :params => post_params.to_json, :headers => {"Content-Type": "application/json" , "Authorization": "Bearer " + token}`

### ** This request create post in db **
    
    **Input**
    ```
       post_params = { post: {
                       title: "First Post",
                       body: "First Body",
                       post_tags: " Tag1, Tag2"
                   }
                 }

 
     ```

    **Output**
    ```
       {
    "post": {
        "id": 1,
          title: "First Post",
          body: "First Body",
          post_tags:
                { Tag1 model , Tag2 model }
          comments:[]
          user_id: 1
         "created_at": "2021-03-04T07:21:18.758Z",
         "updated_at": "2021-03-04T07:21:18.758Z",
     }
   }
     ```

 2. ### ** Update Post ** 
  "PATCH/posts/post_id"
   post `'/api/v1/posts/post_id', :params => post_params.to_json, :headers => {"Content-Type": "application/json" , "Authorization": "Bearer " + token}`

### ** This request update a post in db **
    
    **Input**
    ```
       post_params = { post: {
                       title: "Updated Post",
                       body: "First Body",
                       post_tags: " Tag1, Tag2"
                   }
                 }

 
     ```

    **Output**
    ```
       {
    "post": {
        "id": 1,
          title: "Updated Post",
          body: "First Body",
          post_tags:
           { Tag1 model , Tag2 model }
          comments:[]
         "created_at": "2021-03-04T07:21:18.758Z",
         "updated_at": "2021-03-04T07:21:18.758Z",
     }
   }
     ```





