define(['underscore', 'backbone', 'jquery'], function(){
  var NoteView = Backbone.View.extend({

    template: _.template('<h2 class="title"><%= title %></h2><p class="textbody"><%= body %></p>'),

    initialize: function(options){
      this.model.bind('change', this.render, this)
      this.model.fetch()
    },

    render: function() {
      var json = this.model.toJSON()
      var html = this.template(json)
      $(this.el).html(html)
      return this
    }
  })
  return NoteView
})
