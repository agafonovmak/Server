`import DS from 'ember-data'`

ClubShedule = DS.Model.extend

  weekdaysTimeStart:  DS.attr 'string'
  weekdaysTimeStop:   DS.attr 'string'
  weekendTimeStart:   DS.attr 'string'
  weekendTimeStop:    DS.attr 'string'

`export default ClubShedule`
