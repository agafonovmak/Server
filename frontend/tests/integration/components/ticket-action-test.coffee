`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'ticket-action', 'Integration | Component | ticket action', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{ticket-action}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#ticket-action}}
      template block text
    {{/ticket-action}}
  """

  assert.equal @$().text().trim(), 'template block text'
