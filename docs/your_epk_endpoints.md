# Search Endpoints

HTTP Verb | Endpoint              | Description                              | Link
----------|-----------------------|------------------------------------------|---------------------------
POST       | `/api/v1/sessions` | Get a single user. | [Link](#get-user-session)
POST       | `/api/v1/movie-details` | Create film epk and add movie details. | [Link](#create-film-epk)

---

# Get User Session

Returns a user and their attributes.

```
POST /api/v1/sessions
```

## Parameters

Name        | Data Type | In    | Required/Optional    | Description
------------|---------|-------|----------------------|------------
`user_id`   | Integer | Path | Required | The ID of the user

Notes:
-

## Example Request

```
POST https://epk-be.herokuapp.com/api/v1/sessions

body = {
    "email": "nbrissey@gmail.com",
    "password": "password"
}
```

## Example Response

```
Status: 200 OK
```

```
Example 1:

{
    "data": {
        "id": "1",
        "type": "user",
        "attributes": {
            "email": "nbrissey@gmail.com",
            "first_name": "Nina",
            "last_name": "Brissey"
        }
    }
}

```
---

# Create Film Epk

Create film epk and add movie details.

```
POST /api/v1/movie-details
```

## Parameters

Name        | Data Type | In    | Required/Optional    | Description
------------|---------|-------|----------------------|------------
`user_id`   | Integer | Path | Required | The ID of the user

Notes:
-

## Example Request

```
POST https://epk-be.herokuapp.com/api/v1/movie-details

body = {
      "user_id": "1",
      "movie_title": "Jimmies Cookies",
      "genre": "horror",
      "country": "vietnam",
      "release_year": "2013",
      "run_time": "223",
      "language": "Vietnamese",
      "budget": "1000000",
      "website": "http://www.example.com",
      "production_company": "Universal Studios",
      "distribution": "distribution"
     }
```

## Example Response

```
Status: 200 OK
```

```
Example 1:

{
    "data": {
        "id": "1",
        "type": "film_epk",
        "attributes": {
            "user_id": 1,
            "movie_title": "Jimmies Cookies",
            "genre": "horror",
            "country": "vietnam",
            "release_year": "2013",
            "run_time": 223,
            "language": "Vietnamese",
            "budget": 1000000,
            "website": "http://www.example.com",
            "production_company": "Universal Studios",
            "distribution": "distribution"
        }
    }
}

```

---
