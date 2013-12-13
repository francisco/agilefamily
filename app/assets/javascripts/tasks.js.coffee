
app = angular.module("Tasker", ["ngResource"])

app.factory "Task", ["$resource", ($resource) ->
  $resource("/tasks/:id", {id: "@id"}, {update: {method: "PUT"}})
]

@RaffleCtrl = ["$scope", "Task", ($scope, Task) ->
  $scope.tasks = Task.query()

  $scope.addEntry = ->
    task = Task.save($scope.newTask)
    $scope.tasks.push(task)
    $scope.newTask = {}

  $scope.drawWinner = ->
    pool = []
    angular.forEach $scope.tasks, (task) ->
      pool.push(task) if !task.winner
    if pool.length > 0
      task = pool[Math.floor(Math.random()*pool.length)]
      task.winner = true
      task.$update()
      $scope.lastWinner = task
]