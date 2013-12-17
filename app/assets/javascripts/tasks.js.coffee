
taskSchedule = angular.module 'taskSchedule', ['ngResource', 'ng-rails-csrf']

taskSchedule.controller "NamesController", ($scope, $http, $resource) ->

  $scope.getNames = ->
    nameRequest = $http.get('/tasks.json')
    nameRequest.success (data) ->
      $scope.appData = data

  $scope.getNames()

  $scope.fetch = () ->
    userId = $scope.selectedName.id
    console.log userId
    $scope.method = 'GET'
    $scope.url = '/family_members/'+userId+'.json'

    $http({method: $scope.method, url: $scope.url})
      .success (data, status)->
        console.log(data)
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
          console.log(day)
          $scope.taskData[day.weekday].push(item.task.description)

      console.log $scope.taskData




  $scope.updateModel = (method, url) ->
    $scope.method = method;
    $scope.url = url;


taskSchedule.controller "FetchController", ($scope, $http, $resource) ->
  $scope.method = 'GET';
  $scope.url = '/family_members/#{userId}.json';

  # makeReq = ()->
  #   $http.get('/family_members/5.json').success (data)->
  #     console.log data

  # $scope.showSel = () ->
  #   # alert "hey"
  #   console.log "REQUEST MADE"
  #   userId = $scope.selectedName.id
  #   makeReq()
    # $scope.name = $scope.selectedName.name
    # taskRequest = $http.get('/family_members/5.json')
    # taskRequest.success (data) ->
    #   console.log("the data is ", data)
    #   $scope.taskData.tasks = data
    #   console.log "the request was sent"



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