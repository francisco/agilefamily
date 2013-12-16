
taskSchedule = angular.module 'taskSchedule', ['ngResource', 'ng-rails-csrf']

taskSchedule.controller "NamesController", ($scope, $http, $resource) ->
  $scope.getNames = ->
    nameRequest = $http.get('/tasks.json')
    nameRequest.success (data) ->
      $scope.appData = data

  $scope.showSel = () ->
    userId = $scope.selectedName.id
    # $scope.name = $scope.selectedName.name
    taskRequest = $http.get('/family_members/5.json')
    taskRequest.success (data) ->
     $scope.taskData.tasks = data
     console.log "the request was sent"

  $scope.getNames()

taskSchedule.controller "TaskController", ($scope, $http, $resource) ->
  $scope.addTask = () ->
    $scope.appData = {tasks: []}
    $scope.appData.tasks.push($scope.newTask)
    data = $scope.appData.tasks
    console.log data
    pushTask = $http.post('/tasks', data)
    pushTask.success (data) ->
      console.log "Task was added"
  # $scope.addTask() = ->

  $scope.completeTask = () ->
    $scope.appData.tasks.push($scope.updateTask)
    data = $scope.appData.tasks
    pushTask = $http.post('/tasks', data)
    pushTask.success (data) ->
      console.log "Task was updated"