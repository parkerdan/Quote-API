## API usage

## All requests require an API key, submit JSON, it returns JSON

Request headers
```
headers:
{ 'Accept': 'application/json',
  'Content-Type': 'application/json',
  'Quote-API-Key': 'YOUR_API_KEY'
},
```

A GET request will return a response with an array of 10 quotes each having:
```
GET  https://quote-convert-api.herokuapp.com/api/quote
```
```
{ author: "Author",
  pirate_speak: "Pirate speak version",
  quote: "A random quote",
  yoda_speak: "Yoda speak version",
}
```

When using to convert user quote submit data with POST request as:
```
POST  https://quote-convert-api.herokuapp.com/api/quote
```
with
```
body:
{ 'quote':'I would like to convert this to Yoda and Pirate speak'
  'author':'AUTHOR' }
```

To search by Author submit POST as:
```
POST  https://quote-convert-api.herokuapp.com/api/quote/author
```
with
```
body:
{ 'author': 'AUTHOR'}
```
