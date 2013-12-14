
taskSchedule = angular.module 'taskSchedule', ['ngResource', 'ng-rails-csrf']

taskSchedule.controller "NamesController", ($scope, $http, $resource) ->
  $scope.showSel = () ->
    userId = $scope.selectedName.id
    $scope.name = $scope.selectedName.name
    $scope.appData.tasks

  $scope.getNames = ->
    nameRequest = $http.get('/tasks.json')
    nameRequest.success (data) ->
      $scope.appData = data

  $scope.addTask = () ->
    $scope.appData = {tasks: []}
    $scope.appData.tasks.push($scope.newTask)
    data = $scope.appData.tasks
    console.log data
    pushTask = $http.post('/tasks', data)
    pushTask.success (data) ->
      console.log "Task was added"
  # $scope.addTask() = ->

  $scope.getNames()