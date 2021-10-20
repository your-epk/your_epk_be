# Search Endpoints

HTTP Verb | Endpoint              | Description                              | Link
----------|-----------------------|------------------------------------------|---------------------------
POST       | `/api/v1/sessions` | Get a single user. | [Link](#get-user-session)
POST       | `/api/v1/film_epk` | Create film epk and add movie details. | [Link](#create-film-epk)
PATCH      | `/api/v1/film_epk/:id` | Update film_epk attributes. | [Link](#update-film-epk)
PATCH      | `/api/v1/film_epk/:id` | Create film_epk awards. | [Link](#Create-film-epk-awards)
PATCH      | `/api/v1/film_epk/:id` | Update film_epk awards. | [Link](#Update-film-epk-awards)
PATCH      | `/api/v1/film_epk/:id` | Update film_epk film_fam. | [Link](#Update-film-epk-film-fam)
POST      | `api/v1/presigned_url` | Provides the AWS S3 upload url and blob_signed_id. | [Link](#retrieve-aws-s3-upload-link)
PUT      | `api/v1/<<direct_upload_url>>` | Uploads Asset to AWS S3 Cloud Storage. | [Link](#asset-aws-s3-upload)
PATCH     | `api/v1/film_epk/:id` | Update film_epk movie poster. | [Link](#update-film-epk-movie-poster)

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
POST /api/v1/film_epk
```

## Parameters

Name        | Data Type | In    | Required/Optional    | Description
------------|---------|-------|----------------------|------------
`user_id`   | Integer | Path | Required | The ID of the user

Notes:
-

## Example Request

```
POST https://epk-be.herokuapp.com/api/v1/film_epk

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

# Update Film Epk

Update film epk.

```
PATCH /api/v1/film_epk/:id
```

## Parameters

Name        | Data Type | In    | Required/Optional    | Description
------------|---------|-------|----------------------|------------
`film_epk_id`   | Integer | Path | Required | The ID of the film epk

Notes:
-

## Example Request

```
PATCH https://epk-be.herokuapp.com/api/v1/film_epk/<<film_epk_id>>

body = {
      "user_id": "1",
      "movie_title": "Captain Crunch",
      "genre": "Rom-Com",
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
            "movie_title": "Captian Crunch",
            "genre": "Rom_Com",
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

# Create Film Epk Awards

Create film epk awards.

```
PATCH /api/v1/film_epk/:id
```

## Parameters

Name        | Data Type | In    | Required/Optional    | Description
------------|---------|-------|----------------------|------------
`film_epk_id`   | Integer | Path | Required | The ID of the film epk

Notes:
- First patch will create an awards table attached to the film epk
- Will not have an awards ID
- take note that the body is JSON( wrap keys and values in double quotes)

## Example Request

```
PATCH https://epk-be.herokuapp.com/api/v1/film_epk/#{epk.id}

 body = {
        "film_epk": {
          "award": {
            "name": "The Super Award",
            "year": "1999",
            "award_type": "Shiny"
          }
        }
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
        "id": "2",
        "type": "film_epk",
        "attributes": {
            "user_id": 1,
            "movie_title": null,
            "genre": null,
            "country": null,
            "release_year": null,
            "run_time": null,
            "language": null,
            "budget": null,
            "website": null,
            "production_company": null,
            "distribution": null,
            "awards": [
                {
                    "id": 27,
                    "name": "The Super Award",
                    "year": "1999",
                    "award_type": "Shiny",
                    "film_epk_id": 2
                }
            ]
        }
    }
}

```
---

# Update Film Epk Awards

Update film epk awards.

```
PATCH /api/v1/film_epk/:id
```

## Parameters

Name        | Data Type | In    | Required/Optional    | Description
------------|---------|-------|----------------------|------------
`film_epk_id`   | Integer | Path | Required | The ID of the film epk

Notes:
- After first patch, all calls will update or add awards.
- If updating an existing award, the award ID will be needed in body.
- take note that the body is JSON( wrap keys and values in double quotes)

## Example Request

```
PATCH https://epk-be.herokuapp.com/api/v1/film_epk/#{epk.id}

 body = {
        "film_epk": {
          "award": {
            "id": "27",
            "name": "The Super Shiny Award",
            "year": "1999",
            "award_type": "Shiny"
          }
        }
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
        "id": "2",
        "type": "film_epk",
        "attributes": {
            "user_id": 1,
            "movie_title": null,
            "genre": null,
            "country": null,
            "release_year": null,
            "run_time": null,
            "language": null,
            "budget": null,
            "website": null,
            "production_company": null,
            "distribution": null,
            "awards": [
                {
                    "id": 27,
                    "name": "The Super Shiny Award",
                    "year": "1999",
                    "award_type": "Shiny",
                    "film_epk_id": 2
                }
            ]
        }
    }
}
```

---

# Create Film Epk Film Fam

Create film epk awards.

```
PATCH /api/v1/film_epk/:id
```

## Parameters

Name        | Data Type | In    | Required/Optional    | Description
------------|---------|-------|----------------------|------------
`film_epk_id`   | Integer | Path | Required | The ID of the film epk

Notes:
- First patch will create an film fams table attached to the film epk
- Will not have an film fam ID
- take note that the body is JSON( wrap keys and values in double quotes)

## Example Request

```
PATCH https://epk-be.herokuapp.com/api/v1/film_epk/#{epk.id}

 body = {
        film_epk: {
          film_fam: {
            role: "Director",
            first_name: "Harry",
            last_name: "Parabols",
            description: "Runs this shit",
          }
        }
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
        "id": "2",
        "type": "film_epk",
        "attributes": {
            "user_id": 1,
            "movie_title": null,
            "genre": null,
            "country": null,
            "release_year": null,
            "run_time": null,
            "language": null,
            "budget": null,
            "website": null,
            "production_company": null,
            "distribution": null,
            "awards": [
                {
                    "id": 27,
                    "name": "The Super Award",
                    "year": "1999",
                    "award_type": "Shiny",
                    "film_epk_id": 2
                }
            ]
            film_fam: {
                    "id": 1
                    "role": "Director",
                    "first_name": "Harry",
                    "last_name": "Parabols",
                    "description": "Runs this shit",
                }
        }
    }
}

```
---

# Update Film Epk Film Fam

Update film epk film fam.

```
PATCH /api/v1/film_epk/:id
```

## Parameters

Name        | Data Type | In    | Required/Optional    | Description
------------|---------|-------|----------------------|------------
`film_epk_id`   | Integer | Path | Required | The ID of the film epk

Notes:
- After first patch, all calls will update or add awards.
- If updating an existing film_fam, the film_fam ID will be needed in body.
- take note that the body is JSON( wrap keys and values in double quotes)

## Example Request

```
PATCH https://epk-be.herokuapp.com/api/v1/film_epk/#{epk.id}

 body = {
        film_epk: {
          film_fam: {
            "id":1",
            "role": "Director",
            "first_name": "Jim",
            "last_name": "Carrey",
           " description": "Makes you laugh",
          }
        }
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
        "id": "2",
        "type": "film_epk",
        "attributes": {
            "user_id": 1,
            "movie_title": null,
            "genre": null,
            "country": null,
            "release_year": null,
            "run_time": null,
            "language": null,
            "budget": null,
            "website": null,
            "production_company": null,
            "distribution": null,
            "awards": [
                {
                    "id": 27,
                    "name": "The Super Shiny Award",
                    "year": "1999",
                    "award_type": "Shiny",
                    "film_epk_id": 2
                }
            ]
            "film_fam": {
                    "id": "1",
                    "role": "Director",
                    "first_name": "Jim",
                    "last_name": "Carrey",
                    "description": "Makes you laugh",
                }
        }
    }
}
```
---

# Retrieve AWS S3 Upload Link

Retrieve AWS S3 upload url and blob_signed_id

```
POST /api/v1/presigned_url
```

## Parameters

Notes:
- This call will retrieve an upload URL which will be used in asset upload endpoint URI
    - Has a 10 minute expiration window
- Will return a blob_signed_id which is needed to be sent back to backend
    - Will be used to reference the asset in the S3 cloud
- Must calculate `byte_size` and `checksum` for the body
- Note that the response url and blob_signed_id may comeback much longer than depicted

## Example Request

```
POST /api/v1/presigned_url

body = {
        "file": {
            "filename": "test_upload",
            "byte_size": 92358,
            "checksum": "UCo4+JMJDVuxmSASPcz+Wg==",
            "content_type": "image/jpeg",
            "metadata": {
                "message": "active_storage_test"
            }
        }
    }
```

## Example Response

```
Status: 200 OK
```

```
Example 1:

body = {
        "direct_upload": {
            "url": "https://your-epk-development.s3.us-west-2.amazonaws.com/uploads/9cec0105-35f8-4277-ba98-",
            "headers": {
                "Content-Type": "image/jpeg",
                "Content-MD5": "UCo4+JMJDVuxmSASPcz+Wg=="
            }
        },
        "blob_signed_id": "eyJfcmFpbHMiOnsibWVzc2"
    }

```

---

# Asset AWS S3 Upload

Upload media asset to AWS S3 cloud service

```
PUT /api/v1/<<direct_upload_url>>
```

## Headers

Name        | Data Type | In    | Required/Optional    | Description
------------|---------|-------|----------------------|------------
`Content-Type`   | String | Headers | Required | Type of media file(provided by headers in upload link call response)
`Content-MD5`   | String | Headers | Required | Checksum (provided by headers in upload link call response)


Notes:
- Will need to provide the `Content-Type` and `Content-MD5` from AWS S3 upload_url response.
- Will need to use `url` from the AWS S3 upload_url response.

## Example Request

```
PUT /api/v1/https://your-epk-development.s3.us-west-2.amazonaws.com/uploads/9cec0105-35f8-4277-ba98-

body = media asset saved as binary
```

## Example Response

```
Status: 200 OK
```

```
no response sent back
```
---

# Update Film Epk Movie Poster

Update film epk movie poster

```
PATCH /api/v1/film_epk/<<film_epk_id>>
```
## Parameters

Name        | Data Type | In    | Required/Optional    | Description
------------|---------|-------|----------------------|------------
`film_epk_id`   | Integer | Path | Required | The ID of the film epk


Notes:
- Value of movie_poster is the blob_signed_id
- Note that the response `movie_url` may comeback much longer than depicted


## Example Request

```
PATCH /api/v1/film_epk/22

body = {
    "film_epk": {
    "movie_poster": "eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBDQT09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--d57ff741221f13e76f879478263c22a0918d812f"
    }
}

```

## Example Response

```
Status: 200 OK
```

```
body = {
    "data": {
        "id": "2",
        "type": "film_epk",
        "attributes": {
            "user_id": 1,
            "movie_title": null,
            "genre": null,
            "country": null,
            "release_year": null,
            "run_time": null,
            "language": null,
            "budget": null,
            "website": null,
            "production_company": null,
            "distribution": null,
            "awards": [
                {
                    "id": 27,
                    "name": "The Super Award",
                    "year": "1999",
                    "award_type": "Shiny",
                    "film_epk_id": 2
                }
            ],
            "movie_poster_url": "https://your-epk-development.s3.us-west-2.amazonaws.com/uploads/9cec0105-35f8-4277-ba98-16c53d466c91?response-content"
        }
    }
}
```
---

