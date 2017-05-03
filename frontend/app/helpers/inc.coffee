`import Ember from 'ember'`
IndexHelper = Ember.Helper.helper ([integer, page, perPage]) ->
  integer + 1 + (page-1)*perPage
`export default IndexHelper`
