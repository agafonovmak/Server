import Ember from 'ember';
import ApplicationRouteMixin from 'ember-simple-auth/mixins/application-route-mixin';
export default Ember.Route.extend(ApplicationRouteMixin, {
  session: Ember.inject.service(),

  model() {
    if (this.get('session.isAuthenticated')) {
      return this.store.findAll('club');
    }
  },

  setupController (controller, model) {
    if (this.get('session.isAuthenticated')) {
      controller.set('clubs', model);
    }
  }

});
