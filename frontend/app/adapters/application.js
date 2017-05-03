import ActiveModelAdapter from 'active-model-adapter';
import DataAdapterMixin   from 'ember-simple-auth/mixins/data-adapter-mixin';
import FormDataAdapterMixin from 'ember-cli-form-data/mixins/form-data-adapter';
import config from '../config/environment';
import Ember from 'ember';


export default ActiveModelAdapter.extend(DataAdapterMixin, FormDataAdapterMixin, {
  authorizer: 'authorizer:devise',
  host: config.protocol+'://'+config.host,
  namespace: 'ember',
  headers: Ember.computed('session.data.authenticated.token', function() {
    let headers = {'Accept': 'application/json'};
    let id = this.get('session.data.authenticated.user_id');
    let token = this.get('session.data.authenticated.token');
    if (!Ember.isBlank(id) && !Ember.isBlank(token)){
      headers['Authorization'] = `Token token="${token}", id="${id}"`;
    }
    return headers;
  })
});
