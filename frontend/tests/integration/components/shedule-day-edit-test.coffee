`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'shedule-day-edit', 'Integration | Component | shedule day edit', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{shedule-day-edit}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#shedule-day-edit}}
      template block text
    {{/shedule-day-edit}}
  """

  assert.equal @$().text().trim(), 'template block text'
