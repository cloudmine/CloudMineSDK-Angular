angular
  .module('angularCloudmine', [])
  .constant('cloudmine', require('cloudmine'))
  .factory('AngularCloudmine', ($q)->
    @ws = null

    method = (ws, method, params)->
      deferred = $q.defer()
      console.log 'ws:', ws
      console.log 'params:', params
      ws[method].apply(this, params).on 'success', (data)->
        deferred.resolve(data)
      .on 'result', (result)->
        deferred.resolve(result)
      .on 'error', (err)->
        deferred.reject(err)


      deferred.promise

    cmExports = {
      setWebService: (ws)->
        @ws = ws

      api: (action, options, data)->
        deferred = $q.defer()
        options = @ws.options if not options
        @ws.api(keys, options).on 'success', (data)->
          deferred.resolve(data)
        .on 'error', (err)->
          deferred.reject(err)

        deferred.promise

      get: (keys, options)->
        options = @ws.options if not options
        return method(@ws, 'get', [keys, options])

      update: (key, value, options)->
        deferred = $q.defer()
        options = @ws.options if not options
        @ws.update(key, value, options).on 'success', (data)->
          deferred.resolve(data)
        .on 'error', (err)->
          deferred.reject(err)

        deferred.promise

      set: (key, value, options)->
        deferred = $q.defer()
        options = @ws.options if not options
        @ws.set(key, value, options).on 'success', (data)->
          deferred.resolve(data)
        .on 'error', (err)->
          deferred.reject(err)

        deferred.promise

      destroy: (keys, options)->
        deferred = $q.defer()
        options = @ws.options if not options
        @ws.destroy(keys, options).on 'success', (data)->
          deferred.resolve(data)
        .on 'error', (err)->
          deferred.reject(err)

        deferred.promise

      run: (snippet, parameters, options)->
        console.log 'in run'
        deferred = $q.defer()
        options = @ws.options if not options
        @ws.run(snippet, parameters, options).on 'success', (data)->
          console.log 'run was successful', data
          deferred.resolve(data)
        .on 'error', (err)->
          console.log 'run failed?', err
          deferred.reject(err)
        .on 'result', (result)->
          console.log 'snippet result', result
          deferred.resolve(result)

        deferred.promise

      search: (query, options)->
        deferrd = $q.defer()
        options = @ws.options if not options
        @ws.search(query, options).on 'success', (data)->
          deferred.resolve(data)
        .on 'error', (err)->
          deferred.reject(err)

        deferred.promise

      searchFiles: (query, options)->
        deferred = $q.defer()
        options = @ws.options if not options
        @ws.searchFiles(query, options).on 'success', (data)->
          deferred.resolve(data)
        .on 'error', (err)->
          deferred.reject(err)

        deferred.promise

      searchUsers: (query, options)->
        deferred = $q.defer()
        options = @ws.options if not options
        @ws.searchUsers(query, options).on 'success', (data)->
          deferred.resolve(data)
        .on 'error', (err)->
          deferred.reject(err)

        deferred.promise

      allUsers: (options)->
        deferred = $q.defer()
        options = @ws.options if not options
        @ws.allUsers(options).on 'success', (data)->
          deferred.resolve(data)
        .on 'error', (err)->
          deferred.reject(err)

        deferred.promise

      pushNotification: (notification, options)->
        deferred = $q.defer()
        options = @ws.options if not options
        @ws.pushNotification(notification, options).on 'success', (data)->
          deferred.resolve(data)
        .on 'error', (err)->
          deferred.reject(err)

        deferred.promise

      getUser: (id, options)->
        deferred = $q.defer()
        options = @ws.options if not options
        @ws.getUser(id, options).on 'success', (data)->
          deferred.resolve(data)
        .on 'error', (err)->
          deferred.reject(err)

        deferred.promise

      searchGeo: (field, longitude, latitude, options)->
        options = @ws.options if not options
        return method(@ws, 'searchGeo', [field, longitude, latitude, options])

      upload: (key, file, options)->
        options = @ws.options if not options
        return method(@ws, 'upload', [key, file, options])

      download: (key, options)->
        options = @ws.options if not options
        return method(@ws, 'download', [key, options])

      createUser: (auth, password, options)->
        options = @ws.options if not options
        return method(@ws, 'createUser', [auth, password, options])

      updateUser: (field, value, options)->
        options = @ws.options if not options
        return method(@ws, 'updateUser', [field, value, options])

      updateUserMaster: (user_id, profile, options)->
        options = @ws.options if not options
        return method(@ws, 'updateUserMaster', [user_id, profile, options])

      changePassword: (auth, oldPassword, password, options)->
        options = @ws.options if not options
        return method(@ws, 'changePassword', [auth, oldpassword, password, options])

      changeCredentials: (auth, options)->
        options = @ws.options if not options
        return method(@ws, 'changeCredentials', [auth, options])

      resetPassword: (email, options)->
        options = @ws.options if not options
        return method(@ws, 'resetPassword', [email, options])

      confirmReset: (token, newPassword, options)->
        options = @ws.options if not options
        return method(@ws, 'confirmReset', [token, newPassword, options])

      login: (auth, password, options)->
        options = @ws.options if not options
        return method(@ws, 'login', [auth, password, options])

      loginSocial: (network, options)->
        options = @ws.options if not options
        return method(@ws, 'loginSocial', [network, options])

      socialQuery: (query, options)->
        options = @ws.options if not options
        return method(@ws, 'socialQuery', [query, options])

      logout: (options)->
        options = @ws.options if not options
        return method(@ws, 'logout', [options])

      verify: (auth, password, options)->
        options = @ws.options if not options
        return method(@ws, 'verify', [auth, password, options])

      deleteUser: (auth, password, options)->
        options = @ws.options if not options
        return method(@ws, 'deleteUser', [auth, password, options])

      updateACL: (acl, options)->
        options = @ws.options if not options
        return method(@ws, 'updateACL', [acl, options])

      getACL: (aclid, options)->
        options = @ws.options if not options
        return method(@ws, 'getACL', [aclid, options])

    }

    cmExports
  )
