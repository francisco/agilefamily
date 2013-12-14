
taskSchedule = angular.module 'taskSchedule', ['ngResource']

taskSchedule.controller "NamesController", ($scope, $http, $resource) ->
  $scope.getNames = ->
    nameRequest = $http.get('/tasks.json')
    nameRequest.success (data) ->
      $scope.appData = data

  $scope.getNames()
  $scope.showSel = ()->
    userId = $scope.selectedName.id
    console.log $scope.appData.element(userId)