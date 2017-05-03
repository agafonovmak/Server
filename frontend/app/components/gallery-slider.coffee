`import Ember from 'ember'`

GallerySliderComponent = Ember.Component.extend

  didRender: ->
    @$('.gallery-carousel').gallery_carousel()

`export default GallerySliderComponent`
