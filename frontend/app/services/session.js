import Ember from 'ember';
import SessionService from 'ember-simple-auth/services/session';

export default SessionService.extend({
  store: Ember.inject.service('store'),
  currentUser: Ember.computed('data.authenticated.token', function() {
    let userId = this.get('data.authenticated.user_id');
    if (!Ember.isEmpty(userId)){
      let user = this.get('store').find('user', userId);
      user.catch((reason) => {
        console.error(reason);
        this.invalidate();
      });
      return user;
    }
    else {
      return null;
    }
  })
});
