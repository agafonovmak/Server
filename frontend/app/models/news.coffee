`import DS from 'ember-data'`

News = DS.Model.extend

  TYPES:  {
          'offer': 'Акция'
          'default': 'Новость'
          }
  STATES: {
            'active':   'Опубликована'
            'waiting':  'Ожидает публикации'
            'archived': 'В архиве'
          }

  title:           DS.attr 'string'
  body:            DS.attr 'string'
  youtubeVideoUrl: DS.attr 'string'
  publicationDate: DS.attr 'string'
  isOnSlider:      DS.attr 'boolean'
  sharingUrl:      DS.attr 'string'
  type:            DS.attr 'string'
  aasmState:       DS.attr 'string'
  file:            DS.attr 'file'
  removeFile:      DS.attr 'boolean'
  imageUrl:        DS.attr 'string'

  club:            DS.belongsTo 'club'
  user:            DS.belongsTo 'user'

  formattedType: Ember.computed 'type', ->
    @get('TYPES')[@get('type')]

  formattedAasmState: Ember.computed 'aasmState', ->
    @get('STATES')[@get('aasmState')]

  formattedPublicationDate: Ember.computed 'publicationDate', ->
    moment(@get('publicationDate')).format('DD.MM.YYYY')

  formattedIsOnSlider: Ember.computed 'isOnSlider', ->
    if @get('isOnSlider')
      'Отображать'
    else
      'Не отображать'

  youtubeId: Ember.computed 'youtubeVideoUrl', ->
    @get('youtubeVideoUrl').match(/(?:https?:\/{2})?(?:w{3}\.)?youtu(?:be)?\.(?:com|be)(?:\/watch\?v=|\/)([^\s&]+)/)[1]

`export default News`
