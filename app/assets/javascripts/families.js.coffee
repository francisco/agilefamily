# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $family_id = $('#family_id').val()
  familyMember = _.template('<tr><td><%= item.name %></td><td><%= item.phone %></td><td><%= item.email %></td><td><%= item.age %></td><td><button class="btn btn-success btn-sm" id="accept-fam-mem">Authorize</button> <button class="btn btn-danger btn-sm" id="reject-fam-mem">Reject</button></td></tr>')

  checkFamilyMembers = () ->
    $.ajax("/families/#{$family_id}.json",
      type: "GET"
    ).done (data) ->
      for item in data
        $('#family-member-list table tbody').append(familyMember({item: item}))

  $('#family-member-list').each ->
    checkFamilyMembers()

  $('#accept-fam-mem').click ->
    event.preventDefault()

