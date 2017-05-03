`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'custom-action', 'Integration | Component | custom action', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{custom-action}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#custom-action}}
      template block text
    {{/custom-action}}
  """

  assert.equal @$().text().trim(), 'template block text'
