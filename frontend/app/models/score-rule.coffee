`import DS from 'ember-data'`

ScoreRule = DS.Model.extend
  name:        DS.attr 'string'
  score:       DS.attr 'number'

`export default ScoreRule`
