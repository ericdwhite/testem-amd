define(['backbone'], function(){
  var Note = Backbone.Model.extend({

    defaults: {
      title: 'No title set',
      body: 'No body text'
    },

    initialize: function(){
      this.url = '/notes/[id]'
    },
 })

  return Note
})
