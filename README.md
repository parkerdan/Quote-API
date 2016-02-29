## API usage

## All requests require an API key, submit JSON, returns JSON

Request headers
```
headers:
{ 'Accept': 'application/json',
  'Content-Type': 'application/json',
  'Quote-API-Key': 'YOUR_API_KEY'
},
```

A GET request will return an object as:
```
{ status: 200,
  author: "Author",
  quote: "A random quote",
  yoda_speak: "Yoda speak version",
  pirate_speak: "Pirate speak version",
}
```

When using to convert user quote submit data with POST request as:
```
body:
{ 'quote':'I would like to convert this to Yoda and Pirate'
  'author':'AUTHOR' }
```
