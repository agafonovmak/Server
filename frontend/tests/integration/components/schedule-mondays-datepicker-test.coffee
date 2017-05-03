`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'schedule-mondays-datepicker', 'Integration | Component | schedule mondays datepicker', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{schedule-mondays-datepicker}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#schedule-mondays-datepicker}}
      template block text
    {{/schedule-mondays-datepicker}}
  """

  assert.equal @$().text().trim(), 'template block text'
