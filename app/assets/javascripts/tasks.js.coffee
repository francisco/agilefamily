
taskSchedule = angular.module 'taskSchedule', ['ngResource', 'ng-rails-csrf']

# taskSchedule.directive "listName", () ->
#   if username.name != null
#     template: "{{username.name}}\'s Task List"

taskSchedule.controller "NamesController", ($scope, $http, $resource) ->

  $scope.getNames = ->
    nameRequest = $http.get('/tasks.json')
    nameRequest.success (data) ->
      $scope.appData = data

  $scope.getNames()

  $scope.fetch = () ->
    userId = $scope.selectedName.id
    $scope.username = $scope.selectedName
    $scope.method = 'GET'
    $scope.url = '/family_members/'+userId+'.json'

    $http({method: $scope.method, url: $scope.url})
      .success (data, status)->
        $scope.status = status
        $scope.newTaskData = data
        $scope.orgData()
      .error (data, status) ->
        $scope.data = data || "Request failed"
        $scope.status = status

    $scope.orgData = ()->
      $scope.taskData = {"1": [], "2": [], "3":[], "4":[], "5":[], "6":[], "7":[]};

      $scope.newTaskData.forEach (item)->
        item.days.forEach (day)->
          # console.log(day)
          $scope.taskData[day.weekday].push(item.task.description)

      # console.log $scope.taskData

  $scope.updateModel = (method, url) ->
    $scope.method = method;
    $scope.url = url;

taskSchedule.controller "TaskController", ($scope, $http, $resource) ->
  $scope.addTask = () ->
    $scope.appData = {tasks: []}
    $scope.appData.tasks.push($scope.newTask)
    data = $scope.appData.tasks
    console.log data
    pushTask = $http.post('/tasks', data)
    pushTask.success (data) ->
      console.log "Task was added"

  $scope.completeTask = () ->
    $scope.appData.tasks.push($scope.updateTask)
    data = $scope.appData.tasks
    pushTask = $http.post('/tasks', data)
    pushTask.success (data) ->
      console.log "Task was updated"