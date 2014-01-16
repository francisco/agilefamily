
taskSchedule = angular.module 'taskSchedule', ['ngResource', 'ng-rails-csrf']

taskSchedule.controller "NamesController", [ '$scope', '$http', '$resource', ($scope, $http, $resource) ->

  # gets user names via json and sets username/taskUsername to default value
  $scope.getNames = ->
    nameRequest = $http.get('/tasks.json')
    $scope.username = "Select a User"
    $scope.taskUsername = "Select a User"
    nameRequest.success (data) ->
      $scope.appData = data

  # Calls getnames function on page load
  $scope.getNames()

  #fetch method called from dom on user click, gets user tasks and sets dropdown to selected name
  $scope.fetch = (userId, name) ->
    $scope.username = name + "'s Task List"
    $scope.getTask(userId)

  # gets tasks for a selected user using get request
  $scope.getTask = (userId) ->
    $scope.method = 'GET'
    $scope.url = '/family_members/'+userId+'.json'
    $http({method: $scope.method, url: $scope.url})
      .success (data, status)->
        $scope.newTaskData = data
        $scope.orgData()
      .error (data, status) ->
        $scope.data = data || "Request failed"

    # loops through user's taskdata and organizes it into processable data object
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

  # called on a user click from the DOM
  $scope.getUser = (userId, name) ->
    $scope.taskUserId = userId
    $scope.taskUsername = name

  # called after user submit new task
  $scope.addTask = () ->
    # instantiates appdata task object, assigns user and set object equal to variable
    $scope.appData["tasks"] = $scope.appData["tasks"] || []
    $scope.newTask.userId = $scope.taskUserId
    console.log $scope.newTask
    $scope.appData.tasks.push($scope.newTask)
    data = $scope.appData.tasks

    # clears form for next request
    $scope.addTasker.$setPristine()
    $scope.newTask = ''

    # post request pushing new task to DB
    pushTask = $http.post('/tasks', data)
    $scope.getTask($scope.taskUserId)
    pushTask.success (data) ->
      # console.log "Task was added"
    $scope.appData.tasks = ''

  #conditional to set task class to done called in the completetask function
  $scope.itemClass = (item) ->
    return item == $scope.done ? "active" : undefined

  # updates completion status on dom and on the backend
  $scope.completeTask = (taskId, taskWeekdayId) ->
    $scope.picked = taskWeekdayId
    this.task.complete = !this.task.complete
    updateTask = $http.put('/tasks/'+taskId+".json", data: taskWeekdayId)
    updateTask.success (data) ->
      console.log "Task was updated"
    $scope.itemClass(item)
]


