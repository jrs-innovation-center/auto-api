const mysql = require('mysql')
const HTTPError = require('node-http-error')
const dalHelper = require('./lib/dal-helper')
const { assoc, prop, compose, omit } = require('ramda')

const getAuto = (id, cb) => dalHelper.read('auto', 'ID', id, autoFormatter, cb)

const dal = { getAuto }

const autoFormatter = a =>
  compose(omit('modelYear'), assoc('year', prop('modelYear', a)))(a)

module.exports = dal
