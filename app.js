require('dotenv').config()

const express = require('express')
const app = express()
const dal = require('./dal')
const port = process.env.PORT || 5555
const HTTPError = require('node-http-error')

app.get('/', function(req, res, next) {
  res.send('Welcome to the automobile api.')
})

app.get('/autos/:id', (req, res, next) =>
  dal.getAuto(req.params.id, callback(res, next))
)

app.use((err, req, res, next) => {
  console.log(req.method, ' ', req.path, ' ', 'error: ', err)
  res.status(err.status || 500)
  res.send(err)
})

app.listen(port, () => console.log('API is up on', port))

////// HELPERS

const callback = (res, next) => (err, result) =>
  err
    ? next(new HTTPError(err.status, err.message, err))
    : res.status(200).send(result)
