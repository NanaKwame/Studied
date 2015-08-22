# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
  ### making :contains case insentive ###
  $.expr[":"].contains = $.expr.createPseudo((arg)  ->
     (elem) ->
        $(elem).text().toUpperCase().indexOf(arg.toUpperCase()) >= 0;
  )
  console.log('made it case insensitive')
  console.log("js ready loaded")
  $(".deletejs").click ->
    controller = $(this).attr("data-controller")
    id = $(this).attr("data-id")
    ### code ###
    if  controller == "tagLink"
      $.ajax
        url: '/tags/removeTagLink'
        type: 'post'
        dataType: 'json'
        data: 'id': id
        complete: (data, textStatus, jqXHR) ->
          location.reload()
    else
      deleteURL(controller, id)

  $(".like").click ->
    like($(this).attr("data-likedid"), $(this).attr("data-likedtype"), $(this).attr("data-userid"))


  $(".libraryfilter").click ->
    statuses = []
    if $("#readfilter")[0].checked
      statuses.push "read"
    if $("#unreadfilter")[0].checked
      statuses.push "unread"

    elements = $(".library-ele")
    for ele in elements
      if statuses.length == 0 or statuses.length == 2
        $(ele).removeClass("noDisplay")
      else if $(ele).attr("data-status") in statuses
        $(ele).removeClass("noDisplay")
      else if $(ele).attr("data-status") not in statuses
        $(ele).addClass("noDisplay")
  
  ### for search page to search on keypress ###   
  $(".searchbar").bind 'keyup', (e) ->
    console.log("something was typed")
    search_term = $(".searchbar").val()
    console.log(search_term)
    $(".catalogue-ele:not(:contains('" + search_term + "'))").hide()
    $(".catalogue-ele:contains('" + search_term + "')").show()


deleteURL = (controller, id)->
  $.ajax
    url: '/'+controller+'/' + id
    type: 'post'
    dataType: 'json'
    data: '_method': 'delete'
    complete: (data, textStatus, jqXHR) ->
      console.log(data)
      console.log(textStatus)
      console.log(jqXHR)
      location.reload()

like = ( liked_id, liked_type, user_id) ->
  $.ajax
    url: '/likes'
    type: 'post'
    dataType: 'json'
    data: {like : {"liked_id" : liked_id,  "liked_type" : liked_type,  "user_id" :user_id}}    
    complete: (data, textStatus, jqXHR) ->
      console.log(data)
      console.log(textStatus)
      console.log(jqXHR)
      location.reload()


$(document).ready(ready)
$(document).on('page:load', ready)
