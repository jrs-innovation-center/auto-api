const mysql = require('mysql')
const HTTPError = require('node-http-error')
const dalHelper = require('./lib/dal-helper')
const { assoc, prop, compose, omit } = require('ramda')

const createAuto = (auto, cb) =>
  dalHelper.create('auto', auto, autoFormatter, cb)

const getAuto = (id, cb) => dalHelper.read('auto', 'ID', id, autoFormatter, cb)

const updateAuto = (auto, id, cb) =>
  dalHelper.update('auto', auto, 'ID', Number(id), cb)

const deleteAuto = (id, cb) => dalHelper.deleteRow('auto', 'ID', id, cb)

const listAutos = (lastItem, filter, limit, cb) => {
  dalHelper.queryDB(
    'vAutoSortToken',
    lastItem,
    filter,
    limit,
    autoFormatter,
    'sortToken',
    (err, data) => (err ? cb(err) : cb(null, data))
  )
}

const listSuppliers = (lastItem, filter, limit, cb) => {
  dalHelper.queryDB(
    'supplier',
    lastItem,
    filter,
    limit,
    supplier => supplier,
    'ID',
    (err, data) => (err ? cb(err) : cb(null, data))
  )
}

const autoFormatter = a => a

const dal = {
  getAuto,
  updateAuto,
  deleteAuto,
  createAuto,
  listAutos,
  listSuppliers
}

module.exports = dal
