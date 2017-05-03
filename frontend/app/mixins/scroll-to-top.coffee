`import Ember from 'ember'`

ScrollToTopMixin = Ember.Mixin.create

  scrollToTop: ->
    $("html, body").animate({ scrollTop: 0 }, 500)

`export default ScrollToTopMixin`
