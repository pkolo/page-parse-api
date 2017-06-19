# Page Parse API

An API that, given a valid URL, will parse out content within `h1`, `h2`, and `h3` tags, and store it in a database.

## Show all links
`GET /links`

Displays all links and associated heading content in the database.

* Success Response
  * Code: `200`
  * Content:
  ```
  [{
      id: 1,
      url: 'http://www.example.com',
      headers: [
        {
          content: 'Example Domain',
          tag: 'h1'
        }
      ]
    }]```

* Error Response
  * Code: `422`

## Create a new link
`POST /links`

Takes a URL as a data parameter and, if the URL is valid, parses the page and creates a new link and associated headers, then returns the newly-created link.

* Data Params
  * `url=[valid URL]`


* Success Response
  * Code: `200`
  * Content:
  ```
  {
      id: 1,
      url: 'http://www.example.com',
      headers: [
        {
          content: 'Example Domain',
          tag: 'h1'
        }
      ]
    }```


* Error Response
  * Code: `422`
  * Content: `{ errors: ['Url can't be blank'] }`
