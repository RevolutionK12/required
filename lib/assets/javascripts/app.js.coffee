app = angular.module "Required", []
app.factory "lazyRequire", ['$q', '$rootScope', ($q, $rootScope) ->
  service =
    load: (library) ->
      deferred = $q.defer()
      require([library], () ->
        $rootScope.$apply ->
          deferred.resolve()
      , (error) ->
        $rootScope.$apply ->
          deferred.reject(error)
      )
      deferred.promise
]
