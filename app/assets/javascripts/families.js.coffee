# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $family_id = $('#family_id').val()
  familyMember = _.template('<tr><td><%= item.name %></td><td><%= item.phone %></td><td><%= item.email %></td><td><%= item.age %></td><td><%= item.invitation_accepted_at ? "Accepted" : "Pending" %></td></tr>')

  $('#add-family-member').click ->
    event.preventDefault()
    $name = $("#name").val()
    $phone = $("#phone").val()
    $email = $("#email").val()
    $age = $("#age").val()
    $event_id = $('#event_id').val()
    params = { family_member: { name: $name, phone: $phone, email: $email, age: $age, family_id: $family_id}}
    $("#name").val("")
    $("#phone").val("")
    $("#email").val("")
    $("#age").val("")

    $.ajax("/family_members/create",
      type: "GET",
      data: params
      ).done (data) ->
        $('#family-member-list table tbody').append(familyMember({item: data}))


