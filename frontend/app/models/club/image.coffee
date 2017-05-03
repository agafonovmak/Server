`import DS from 'ember-data'`

ClubImage = DS.Model.extend

  file:     DS.attr 'file'
  fileUrl:  DS.attr 'string'
  club:     DS.belongsTo 'club'

`export default ClubImage`
