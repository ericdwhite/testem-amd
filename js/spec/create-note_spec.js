//
// A simple spec to make sure that 
// Backbone, Sinon, etc. are working together
//
// Credit: http://blog.involver.com/2012/01/26/testing-backbone-js-best-practices-2/
define([
       'amd-app/app'
       , 'amd-app/model/note'
       , 'amd-app/views/note'
       , 'vendor/test/test-amd'
], function(App, Note, NoteView){
  var note
  var noteView

  describe("NoteView", function(){
    beforeEach(function(){
      jasmine.Ajax.useMock();

      note = new Note()
      spyOn(note, "fetch").andCallThrough()
    })

    describe("init", function(){
      it("Should fetch the note.", function(){
        noteView = new NoteView({model: note})
        expect(note.fetch).toHaveBeenCalled()
      })

      describe("on note fetch success", function(){
        beforeEach(function(){
          var request = mostRecentAjaxRequest()
          request.response({
            status: 200,
            responseText: JSON.stringify(
              {title: "Grocery list", body: "Fruit: orange, apple", id: 11})
          })
        })

        it("should render the grocery list", function(){
          var title = $(noteView.el).find(".title")
          var body = noteView.$el.find(".textbody")
          expect(title).toHaveText("Grocery list")
          expect(body).toHaveText("Fruit: orange, apple")
        })
      })
    })
  })
})

