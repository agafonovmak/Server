`import Ember from 'ember'`
`import TicketBaseControllerMixin from '../../mixins/ticket-base-controller'`
`import config from '../../config/environment'`
`import ToastMixin from '../../mixins/toast-mixin'`

TicketsGuestVisitController = Ember.Controller.extend TicketBaseControllerMixin, ToastMixin,
  session: Ember.inject.service()

  actions:
    close: (ticket)->
      $.ajax
        type: 'POST'
        beforeSend: (request) =>
          id = @get('session.data.authenticated.user_id')
          token = @get('session.data.authenticated.token')
          request.setRequestHeader 'Authorization', 'Token token="'+token+'", id="'+id+'"'
        url: "#{config.protocol}://#{config.host}/ember/ticket/guest_visits/#{ticket.id}/close"
        success: (data) =>
          ticket.set 'aasmState', 'closed'
          ticket.save().then =>
            ticket.reload()
            @showToast('Запрос успешно обработан!')
          return

`export default TicketsGuestVisitController`
