`import Ember from 'ember'`
`import config from './config/environment'`

Router = Ember.Router.extend
  location: config.locationType

Router.map ->
  @route 'root', path: '/'
  @route 'sign-in'
  @route 'users'

  @route 'tickets/workout'
  @route 'tickets/recall'
  @route 'tickets/freezing'
  @route 'tickets/extension'
  @route 'tickets/guest-visit'
  @route 'tickets/tutoring'
  @route 'tickets/message'

  @route 'franchises'
  @route 'franchise', path: '/franchise/:id'
  @route 'new-franchise'
  @route 'edit-franchise', path: '/edit-franchise/:id'

  @route 'score-rules'
  @route 'new-score-rule'
  @route 'edit-score-rule', path: '/edit-score-rule/:id'

  @route 'clubs'
  @route 'club', path: '/club/:id'
  @route 'new-club'
  @route 'edit-club', path: '/edit-club/:id'

  @route 'card-templates'
  @route 'new-card-template'
  @route 'edit-card-template', path: '/edit-card-template/:id'

  @route 'news'
  @route 'show-news', path: '/news/:id'
  @route 'new-news'
  @route 'edit-news', path: '/edit-news/:id'

  @route 'training-packages'
  @route 'new-training-package'
  @route 'edit-training-package', path: '/edit-training-package/:id'

  @route 'coaches'
  @route 'coach', path: '/coach/:id'
  @route 'new-coach'
  @route 'edit-coach', path: '/edit-coach/:id'

  @route 'reward-templates'
  @route 'reward-template', path: '/reward-template/:id'
  @route 'new-reward-template'
  @route 'edit-reward-template', path: '/edit-reward-template/:id'

  @route 'workout-types'
  @route 'new-workout-type'
  @route 'edit-workout-type', path: '/edit-workout-type/:id'

  @route 'workout-templates'
  @route 'new-workout-template'
  @route 'edit-workout-template', path: '/edit-workout-template/:id'

  @route 'schedule'

  @route 'schedule-templates'
  @route 'schedule-template', path: '/schedule-template/:id'
  @route 'new-schedule-template'

  @route 'user-types'
  @route 'new-user-type'
  @route 'edit-user-type', path: '/edit-user-type/:id'

  @route 'panel-accounts'
  @route 'new-panel-account'
  @route 'edit-panel-account', path: '/edit-panel-account/:id'

  @route 'rewards-history'
  @route 'reward-history', path: '/reward-history/:id'

`export default Router`
