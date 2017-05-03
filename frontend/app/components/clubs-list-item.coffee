`import Ember from 'ember'`

ClubsListItem = Ember.Component.extend
  tagName: 'li'
  classNameBindings: ['clubClass']

  clubClass: Ember.computed 'club', 'user', 'selectedClub', ->
    if @get('selectedClub.id') == @get('club.id') then "active" else "default"

  actions:
    selectClub: ->
      @get('user').then (user) =>
        user.set 'selectedClub', @get('club')
        user.save().then =>
          @sendAction 'gotoRoot'

`export default ClubsListItem`

