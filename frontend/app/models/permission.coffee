`import DS from 'ember-data'`

Permission = DS.Model.extend
  authorized: DS.attr 'boolean'

`export default Permission`
