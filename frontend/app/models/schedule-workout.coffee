`import DS from 'ember-data'`

ScheduleWorkout = DS.Model.extend

  STATUSES: ['default', 'new', 'hot', 'best']

  DAY_NAMES: ['Понедельник', 'Вторник', 'Среда', 'Четверг', 'Пятница', 'Суббота', 'Воскресение']

  DAYS:  {
    'Понедельник': '0'
    'Вторник':     '1'
    'Среда':       '2'
    'Четверг':     '3'
    'Пятница':     '4'
    'Суббота':     '5'
    'Воскресение': '6'
  }

  status:              DS.attr 'string'
  datetime:            DS.attr 'string'
  aasmState:           DS.attr 'string'
  cancelReason:        DS.attr 'string'
  price:               DS.attr 'number', defaultValue: 0
  availableSeatsCount: DS.attr 'number'
  title:               DS.attr 'string'
  day:                 DS.attr 'string'
  dayName:             DS.attr 'string'
  time:                DS.attr 'string'

  name:                 DS.attr 'string'
  description:          DS.attr 'string'
  duration:             DS.attr 'string'
  seatsCount:           DS.attr 'string'
  gym:                  DS.attr 'string'
  shareUrl:             DS.attr 'string'
  isNeedManagerConfirm: DS.attr 'boolean'

  type:         DS.belongsTo 'workout/type'
  template:     DS.belongsTo 'workout/template'
  club:         DS.belongsTo 'club'

  users:        DS.hasMany 'user'
  coaches:      DS.hasMany 'coach'

  scheduleTemplate: DS.belongsTo 'schedule-template'

  formattedDateTime: Ember.computed 'datetime', ->
    moment(@get('datetime')).format('DD.MM.YYYY hh:mm')

  dayNameOnChange: Ember.observer 'dayName', ->
    @set 'day', @get('DAYS')[@get('dayName')]

  start: Ember.computed 'day', 'time', ->
    datetime = moment().startOf('week').add(@get('day'), 'days')
    if @get('time')
      datetime.hour(parseInt(@get('time').substring(0,2)))
      datetime.minute(parseInt(@get('time').substring(3,5)))
    datetime.format()

  stop: Ember.computed 'start', 'duration', ->
    if @get('start')? && @get('duration')?
      moment(@get('start')).add(parseInt(@get('duration')), 'minutes').format()
`export default ScheduleWorkout`
