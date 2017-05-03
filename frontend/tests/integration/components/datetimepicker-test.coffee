`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'datetimepicker', 'Integration | Component | datetimepicker', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{datetimepicker}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#datetimepicker}}
      template block text
    {{/datetimepicker}}
  """

  assert.equal @$().text().trim(), 'template block text'
