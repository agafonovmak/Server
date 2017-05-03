`import DS from 'ember-data'`

Role = DS.Model.extend

  name:        DS.attr 'string'
  russianName: DS.attr 'string'
  type:        DS.attr 'string'

`export default Role`
