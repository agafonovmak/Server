`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'static-select', 'Integration | Component | static select', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{static-select}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#static-select}}
      template block text
    {{/static-select}}
  """

  assert.equal @$().text().trim(), 'template block text'
