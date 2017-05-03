`import DS from 'ember-data'`

RewardTemplate = DS.Model.extend

  name:                    DS.attr 'string'
  description:             DS.attr 'string'
  sharedUrl:               DS.attr 'string'
  levelCost:               DS.attr 'string'
  availableRewardsCount:   DS.attr 'string'
  startedRewardsCount:     DS.attr 'string'
  file:                    DS.attr 'file'
  removeFile:              DS.attr 'boolean'
  showInApp:               DS.attr 'boolean', defaultValue: true
  fileUrl:                 DS.attr 'string'

  club:                    DS.belongsTo 'club'

`export default RewardTemplate`
