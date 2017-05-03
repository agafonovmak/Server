`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'jquery-timepicker', 'Integration | Component | jquery timepicker', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{jquery-timepicker}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#jquery-timepicker}}
      template block text
    {{/jquery-timepicker}}
  """

  assert.equal @$().text().trim(), 'template block text'
