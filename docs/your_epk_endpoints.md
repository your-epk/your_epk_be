# Search Endpoints

HTTP Verb | Endpoint              | Description                              | Link
----------|-----------------------|------------------------------------------|---------------------------
POST       | `/api/v1/sessions` | Get a single user. | [Link](#get-user-session)
POST        | `/api/v1/users` | Create a user. | [Link](#create-user)
GET        | `/api/v1/users/:id` | Get a single users attributes and relationships. | [Link](#get-user-attributes)
POST       | `/api/v1/film_epk` | Create film epk and add movie details. | [Link](#create-film-epk)
GET       | `/api/v1/film_epk/:id` | Get a film epk's attributes and relationships. | [Link](#get-film-epk)
DELETE       | `/api/v1/film_epk/:id` | Delete film epk and it's dependents. | [Link](#delete-film-epk)
PATCH     | `/api/v1/film_epk/:id` | Update film_epk attributes. | [Link](#update-film-epk)
GET      | `/api/v1/film_epk/:film_epk_id/awards` | Get all a film_epk's awards. | [Link](#Get-film-epk-awards)
POST      | `/api/v1/awards` | Create film_epk award. | [Link](#Create-film-epk-award)
DELETE      | `/api/v1/awards/:id` | Delete an award. | [Link](#delete-film-epk-award)
GET      | `/api/v1/film_epk/:film_epk_id/film_fams` | Get all a film_epk's film fams. | [Link](#Get-film-epk-film-fams)
POST      | `/api/v1/film_fams` | Create film_epk film_fam. | [Link](#Create-film-epk-film-fam)
PATCH     | `/api/v1/film_fams/:id` | Update film_epk film_fam. | [Link](#Update-film-epk-film-fam)
DELETE      | `/api/v1/film_fams/:id` | Delete an film_fam. | [Link](#delete-film-epk-film-fam)
POST      | `/api/v1/film_stills` | Create film_epk film_still. | [Link](#Create-film-epk-film-still)
GET      | `/api/v1/film_epk/:film_epk_id/presses` | Get all a film_epk's press. | [Link](#Get-film-epk-press)
POST      | `/api/v1/presses` | Create film_epk presses. | [Link](#Update-film-epk-presses)
POST       | `api/v1/presigned_url` | Provides the AWS S3 upload url and blob_signed_id. | [Link](#retrieve-aws-s3-upload-link)
PUT        | `api/v1/<<direct_upload_url>>` | Uploads Asset to AWS S3 Cloud Storage. | [Link](#asset-aws-s3-upload)
POST     | `api/v1/movie_posters` | Update a film_epk with a movie poster url. | [Link](#Post-a-movie-poster)
POST     | `api/v1/header_images` | Update a film_epk with a header image url. | [Link](#Post-a-header-image)
POST     | `api/v1/head_shots` | Update a film_fam with a head shot url. | [Link](#Post-a-head-shot)
POST     | `api/v1/film_stills` | Update a film_still with an image url. | [Link](#Post-a-film-still)




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

# Get User Attributes

Returns a user and their attributes and relationships.

```
GET /api/v1/users/:id
```

## Parameters

Name        | Data Type | In    | Required/Optional    | Description
------------|---------|-------|----------------------|------------
`user_id`   | Integer | Path | Required | The ID of the user

Notes:
-

## Example Request

```
GET https://epk-be.herokuapp.com/api/v1/users/1
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
            "first_name": null,
            "last_name": null
        },
        "relationships": {
            "film_epks": {
                "data": [
                    {
                        "id": "1",
                        "type": "film_epk"
                    },
                    {
                        "id": "2",
                        "type": "film_epk"
                    }
                ]
            }
        }
    },
    "included": [
        {
            "id": "1",
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
                "awards": []
            }
        },
        {
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
                    },
                    {
                        "id": 28,
                        "name": "The Super Award",
                        "year": "2000",
                        "award_type": "Shiny",
                        "film_epk_id": 2
                    },
                ]
            }
        },
    ]
}
```
---

# Create User

Creates a user and returns a user and their attributes and relationships.

```
POST /api/v1/users
```

## Body

Name        | Data Type | In    | Required/Optional    | Description
------------|---------|-------|----------------------|------------
`email`   | String | Body | Required | The email of the user
`first_name`   | String | Body | Required | The first name of the user
`last_name`   | String | Body | Required | The last name of the user
`password`   | String | Body | Required | The password of the user
`password_confirmation`   | String | Body | Required | The password of the user

Notes:
-

## Example Request

```
POST https://epk-be.herokuapp.com/api/v1/users

body = {
    "email": "exorcist@excorsism.com",
    "first_name": "johnny",
    "last_name": "sins",
    "password": "password",
    "password_confirmation": "password"
}
```

## Example Response

```
Status: 201 OK
```

```
Example 1:

{
    "data": {
        "id": "7",
        "type": "user",
        "attributes": {
            "email": "exorcist@excorsism.com",
            "first_name": "johnny",
            "last_name": "sins"
        },
        "relationships": {
            "film_epks": {
                "data": []
            }
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

# Get Film Epk

Get a film epk's attributes and relationships.

```
GET /api/v1/film_epk/:id
```

Notes:
- "user_id" must be included in the request body

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
        "id": "133",
        "type": "film_epk",
        "attributes": {
            "user_id": 1,
            "movie_title": "Jimmies Cookies",
            "genre": "horror",
            "trailer": null,
            "teaser": null,
            "tag_line": null,
            "log_line": null,
            "synopsis": null,
            "country": "vietnam",
            "release_year": "2013",
            "run_time": 223,
            "language": "Vietnamese",
            "budget": 1000000,
            "website": "http://www.example.com",
            "production_company": "Universal Studios",
            "distribution": "distribution",
            "contact_name": null,
            "contact_email": null,
            "contact_number": null,
            "company_name": null
        },
        "relationships": {
            "awards": {
                "data": [
                    {
                        "id": "20",
                        "type": "award"
                    },
                ]
            }
        }
    },
    "included": [
        {
            "id": "20",
            "type": "award",
            "attributes": {
                "name": "gfsfdg",
                "year": "dfgdf",
                "award_type": "sfdgsdg",
                "film_epk_id": 133
            }
        },
    ]
}

```
---

# Delete Film Epk

Delete a film epk and it's dependents.

```
DELETE /api/v1/film_epk/:id
```

## :id

Name        | Data Type | In    | Required/Optional    | Description
------------|---------|-------|----------------------|------------
`id`   | Integer | Path | Required | The ID of the film epk

Notes:
-

## Example Request

```
DELETE https://epk-be.herokuapp.com/api/v1/film_epk/:id
```

## Example Response

```
Status: 204 No Content
```

---

# Update Film Epk

Update film epk attributes.

```
PATCH /api/v1/film_epk/:id
```

## :id

Name        | Data Type | In    | Required/Optional    | Description
------------|---------|-------|----------------------|------------
`id`   | Integer | Path | Required | The ID of the film epk

Notes:
- Add any or all of the film epk attributes in the body to update.

## Example Request

```
PATCH https://epk-be.herokuapp.com/api/v1/film_epk/<<film_epk_id>>

body = {
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
# Create Film Epk Award

Create film epk award.

```
POST /api/v1/awards
```

Notes:
- Must have a film_epk_id in the body

## Example Request

```
POST https://epk-be.herokuapp.com/api/v1/awards

body = {
          "award": {
            "name": "The Super Award",
            "year": "1999",
            "award_type": "Shiny",
            "film_epk_id": "80"
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
        "id": "3",
        "type": "award",
        "attributes": {
            "name": "The Super Award",
            "year": "1999",
            "award_type": "Shiny",
            "film_epk_id": 80
        }
    }
}

```
---
# Get Film Epk Awards

Get all of a film epk's awards.

```
GET /api/v1/film_epk/:film_epk_id/awards
```

## Example Request

```
GET https://epk-be.herokuapp.com/api/v1/film_epk/100/awards
```

## Example Response

```
Status: 200 OK
```

```
Example 1:

{
    "data": [
        {
            "id": "1",
            "type": "award",
            "attributes": {
                "name": "The Super Award",
                "year": "1999",
                "award_type": "Shiny",
                "film_epk_id": 1
            }
        },
        {
            "id": "2",
            "type": "award",
            "attributes": {
                "name": "The Super Award",
                "year": "1999",
                "award_type": "Shiny",
                "film_epk_id": 1
            }
        }
    ]
}

```
---
# Delete Award

Delete an award.

```
DELETE /api/v1/awards/:id
```

Notes:
-

## Example Request

```
DELETE https://epk-be.herokuapp.com/api/v1/awards/<id>
```

## Example Response

```
Status: 204 No Content
```
---
# Get Film Epk Film Fams

Get all of a film epk's awards.

```
GET /api/v1/film_epk/:film_epk_id/film_fams
```

## Example Request

```
GET https://epk-be.herokuapp.com/api/v1/film_epk/100/film_fams
```

## Example Response

```
Status: 200 OK
```

```
Example 1:

{
    "data": [
        {
            "id": "1",
            "type": "film_fam",
            "attributes": {
                "role": "Director",
                "first_name": "Harry",
                "last_name": "Parabols",
                "description": "Runs this shit",
                "film_epk_id": 1,
                "head_shot_url": "https://your-epk-development.s3.us-west-2.amazonaws.com/uploads/99a4a3e3-9380-4f69-ae08-466790419a67?response-content-disposition=inline%3B%20filename%3D%22test_upload%22%3B%20filename%2A%3DUTF-8%27%27test_upload&response-content-type=image%2Fjpeg&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAVGNANJEWSXY6YYDD%2F20211027%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211027T013804Z&X-Amz-Expires=300&X-Amz-SignedHeaders=host&X-Amz-Signature=b3352ea69356a62bf2db272cf5057b6d41ac0c35ed0d05adcb7cfb83398e23b9"
            }
        },
        {
            "id": "2",
            "type": "film_fam",
            "attributes": {
                "role": "Director",
                "first_name": "jj",
                "last_name": "dorris",
                "description": "safety coordinator",
                "film_epk_id": 1,
                "head_shot_url": null
            }
        },
    ]
}

```
---
# Create Film Epk Film Fam

Create film epk film fam.

```
POST /api/v1/film_fam
```

Notes:
- Must have a film_epk_id in the body

## Example Request

```
POST https://epk-be.herokuapp.com/api/v1/film_fams

body = {
          "film_fam": {
            "role": "Director",
            "first_name": "alec",
            "last_name": "baldwin",
            "description": "goofball",
            "film_epk_id": "80"
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
        "id": "3",
        "type": "film_fam",
        "attributes": {
            "role": "Director",
            "first_name": "alec",
            "last_name": "baldwin",
            "description": "goofball",
            "film_epk_id": 80
        }
    }
}

```
---
# Update Film Epk Film Fam

Update film epk film fam.

```
PATCH /api/v1/film_fam/24
```

Notes:
- Must have a film_epk_id in the body

## Example Request

```
PATCH https://epk-be.herokuapp.com/api/v1/film_fams/24

body = {
          "film_fam": {
            "id": 24
            "role": "Director",
            "first_name": "alec",
            "last_name": "booseldorfinsperg",
            "description": "goofball",
            "film_epk_id": "80"
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
        "id": "24",
        "type": "film_fam",
        "attributes": {
            "role": "Actor",
            "first_name": "alec",
            "last_name": "booseldorfinspreg",
            "description": "goofball",
            "film_epk_id": 80
        }
    }
}

```
---
# Delete Film Fam

Delete an film fam record.

```
DELETE /api/v1/film_fams/:id
```

Notes:
-

## Example Request

```
DELETE https://epk-be.herokuapp.com/api/v1/film_fams/<id>
```

## Example Response

```
Status: 204 No Content
```
---
# Create Film Epk Film Still

Create film epk film Still.

```
POST /api/v1/film_stills
```

Notes:
- Must have a film_still_id in the body

## Example Request

```
POST https://epk-be.herokuapp.com/api/v1/film_stills

body = {
    "description": "image description",
    "film_epk_id": "1"
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
        "type": "film_still",
        "attributes": {
            "description": "image description",
            "film_epk_id": 1,
            "film_still_url": null
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

## :id

Name        | Data Type | In    | Required/Optional    | Description
------------|---------|-------|----------------------|------------
`id`   | Integer | Path | Required | The ID of the film epk

Notes:
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

Create film epk film fam.

```
PATCH /api/v1/film_epk/:id
```

## :id

Name        | Data Type | In    | Required/Optional    | Description
------------|---------|-------|----------------------|------------
`id`   | Integer | Path | Required | The ID of the film epk

Notes:
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

## :id

Name        | Data Type | In    | Required/Optional    | Description
------------|---------|-------|----------------------|------------
`id`   | Integer | Path | Required | The ID of the film epk

Notes:
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
            "film_fam": [
                {
                    "id": "1",
                    "role": "Director",
                    "first_name": "Jim",
                    "last_name": "Carrey",
                    "description": "Makes you laugh",
                }
            ]
        }
    }
}
```
---

# Get Film Epk Press

Get all of a film press.

```
GET /api/v1/film_epk/:film_epk_id/presses
```

## Example Request

```
GET https://epk-be.herokuapp.com/api/v1/film_epk/100/press
```

## Example Response

```
Status: 200 OK
```

```
Example 1:

{
    "data": [
        {
            "id": "1",
            "type": "press",
            "attributes": {
                "name_of_publication": "ExamplePub",
                "description": "ExampleDesc",
                "link": "ex.com",
                "film_epk_id": 1
            }
        }
    ]
}

```
---

# Create Film Epk Presses

Create film epk Presses.

```
POST /api/v1/presses
```

Notes:
- take note that the body is JSON( wrap keys and values in double quotes)

## Example Request

```
POST https://epk-be.herokuapp.com/api/v1/presses

 body = {
          "press": {
            "name_of_publication": "ExamplePub",
            "description": "ExampleDesc",
            "link": "ex.com",
            "film_epk_id": "1"
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
        "id": "1",
        "type": "presses",
        "attributes": {
          "name_of_publication": "ExamplePub",
          "description": "ExampleDesc",
          "link": "ex.com",
          "film_epk_id": "1"
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
PUT <<direct_upload_url>> (from presigned_url response body)
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

# Post a movie poster

Update film epk with an AWS S3 movie poster url

```
Post /api/v1/movie_posters
```

Notes:
- Must provided a film_epk_id in the body
- blob_signed_id is provided in the presigned_url post response body
- Note that the response `movie_url` may comeback much longer than depicted


## Example Request

```
POST /api/v1/movie_posters

body = {
    "film_epk_id": "1"
    "blob_signed_id": "eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBDQT09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--d57ff741221f13e76f879478263c22a0918d812f"
    }
}

```

## Example Response

```
Status: 200 OK
```

```
{
    "movie_poster_url": "https://your-epk-development.s3.us-west-2.amazonaws.com/uploads/ae330064-d3dd-43c2-8578-a6e740925dd6?response-content-disposition=inline%3B%20filename%3D%22test_upload%22%3B%20filename%2A%3DUTF-8%27%27test_upload&response-content-type=image%2Fjpeg&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAVGNANJEWSXY6YYDD%2F20211024%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211024T195711Z&X-Amz-Expires=300&X-Amz-SignedHeaders=host&X-Amz-Signature=b34be329264520e9eaae673b2ba8126c7dd8db7dc45fd608a867d18bcea3cf46"
}
```
---

# Post a header image

Update film epk with an AWS S3 header image url

```
Post /api/v1/header_images
```

Notes:
- Must provided a film_epk_id in the body
- blob_signed_id is provided in the presigned_url post response body
- Note that the response `header_image_url` may comeback much longer than depicted


## Example Request

```
POST /api/v1/header_images

body = {
    "film_epk_id": "1"
    "blob_signed_id": "eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBDQT09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--d57ff741221f13e76f879478263c22a0918d812f"
    }
}

```
---

# Post a head shot

Update film fam with an AWS S3 head shot url

```
Post /api/v1/head_shot
```

Notes:
- Must provided a film_epk_id in the body
- blob_signed_id is provided in the presigned_url post response body
- Note that the response `header_image_url` may comeback much longer than depicted


## Example Request

```
POST /api/v1/head_shot

{
        "film_fam_id": "1",
        "blob_signed_id": "eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBEQT09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--b74f6864cc6634e12f8cf70f51aad3f883634a0e"
}

```

## Example Response

```
Status: 200 OK
```

```
{
    "data": {
        "id": "1",
        "type": "film_fam",
        "attributes": {
            "role": "Director",
            "first_name": "Sam",
            "last_name": "Samison",
            "description": "Directing for a long time.",
            "film_epk_id": 1,
            "head_shot_url": "https://your-epk-development.s3.us-west-2.amazonaws.com/uploads/ae330064-d3dd-43c2-8578-a6e740925dd6?response-content-disposition=inline%3B%20filename%3D%22test_upload%22%3B%20filename%2A%3DUTF-8%27%27test_upload&response-content-type=image%2Fjpeg&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAVGNANJEWSXY6YYDD%2F20211024%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211024T195711Z&X-Amz-Expires=300&X-Amz-SignedHeaders=host&X-Amz-Signature=b34be329264520e9eaae673b2ba8126c7dd8db7dc45fd608a867d18bcea3cf46"
        }
    }
}

```
---

# Post a film still

Update film still with an AWS S3 image url

```
Post /api/v1/film_still_images
```

Notes:
- Must provided a film_still_id in the body
- blob_signed_id is provided in the presigned_url post response body

## Example Request

```
POST /api/v1/film_still_images

{
        "film_still_id": "1",
        "blob_signed_id": "eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBEQT09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--b74f6864cc6634e12f8cf70f51aad3f883634a0e"
}

```

## Example Response

```
Status: 200 OK
```

```
{
    "data": {
        "id": "1",
        "type": "film_still",
        "attributes": {
            "description": "image description",
            "film_epk_id": 1,
            "film_still_url": "https://your-epk-development.s3.us-west-2.amazonaws.com/uploads/ef8e2303-e0d9-4c38-a4be-539d264b0a8f?response-content-disposition=inline%3B%20filename%3D%22film_upload%22%3B%20filename%2A%3DUTF-8%27%27film_upload&response-content-type=image%2Fjpeg&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAVGNANJEWSXY6YYDD%2F20211124%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211124T225050Z&X-Amz-Expires=300&X-Amz-SignedHeaders=host&X-Amz-Signature=391371f7ae5cb6120660dffd2faa0915d5ab937d451ea4feecdec9ba09e53adc"
        }
    }
}

```
---

