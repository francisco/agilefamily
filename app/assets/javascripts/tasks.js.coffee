
taskSchedule = angular.module 'taskSchedule', ['ngResource', 'ng-rails-csrf']

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
      $scope.taskData = {"1": [], "2": [], "3":[], "4":[], "5":[], "6":[], "7":[]}

      $scope.newTaskData.forEach (item)->
        item.days.forEach (day)->
          description = item.task.description
          taskWeekdayId = day.id
          id = item.task.id
          complete = day.complete
          taskPackage = {"id": id,"description": description, "taskWeekdayId": taskWeekdayId, "complete": complete}
          $scope.taskData[day.weekday].push(taskPackage)

      console.log $scope.taskData

  $scope.updateModel = (method, url) ->
    $scope.method = method;
    $scope.url = url;

  $scope.getUser = () ->
    userId = $scope.newTask.familyMember.id

  $scope.addTask = () ->
    scope = angular.element("[ng-controller=NamesController]").scope()
    console.log scope
    $scope.appData["tasks"] = $scope.appData["tasks"] || []


    $scope.appData.tasks.push($scope.newTask)
    data = $scope.appData.tasks
    # scope.appData.tasks= $scope.appData.tasks
    console.log data
    pushTask = $http.post('/tasks', data)
    $scope.fetch()
    pushTask.success (data) ->
      console.log "Task was added"

  $scope.itemClass = (item) ->
      return item == $scope.done ? "active" : undefined

  $scope.completeTask = (taskId, taskWeekdayId) ->
    console.log taskWeekdayId
    $scope.done = "strike"
    $scope.picked = taskWeekdayId
    this.task.complete = !this.task.complete
    updateTask = $http.put('/tasks/'+taskId+".json", data: taskWeekdayId)
    updateTask.success (data) ->
      console.log "Task was updated"
    $scope.itemClass(item)



