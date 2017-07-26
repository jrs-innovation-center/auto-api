const mysql = require('mysql')
const HTTPError = require('node-http-error')
const dalHelper = require('./lib/dal-helper')
const { assoc, prop, compose, omit } = require('ramda')

const getAuto = (id, cb) => dalHelper.read('auto', 'ID', id, autoFormatter, cb)
const updateAuto = (auto, id, cb) =>
  dalHelper.update('auto', auto, 'ID', Number(id), cb)

const dal = { getAuto, updateAuto }

const autoFormatter = a => a

module.exports = dal
