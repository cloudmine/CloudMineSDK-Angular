'use strict'
#
# CloudMine, Inc
# 2015
#
angular
  .module('angularCloudmine', [])
  .constant('cloudmine', require('cloudmine'))
  .factory 'AngularCloudmine', ($q)->
    @ws = null
    cmExports = {}

    setup = (ws)->
      return unless ws
      keys = Object.keys(ws)
      blacklist = keys.concat([
        'isLoggedIn'
        'getUserID'
        'getSessionToken'
        'getEmail'
        'getUsername'
        'getOption'
        'setOption'
        'useApplicationData'
        'isApplicationData'
        'keygen'
      ])
      for method of ws when blacklist.indexOf(method) is -1
        do (method) =>
          cmExports[method] = =>
            args = Array.prototype.slice.call(arguments)
            deferred = $q.defer()
            ws[method].apply(ws, args).on 'success', (data)->
              deferred.resolve(data)
            .on 'result', (result)->
              deferred.resolve(result)
            .on 'error', (err)->
              deferred.reject(err)
            deferred.promise

    cmExports.setWebService = (@ws)=> setup(@ws)
    cmExports
