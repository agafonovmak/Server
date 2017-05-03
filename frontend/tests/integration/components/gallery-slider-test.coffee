`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'gallery-slider', 'Integration | Component | gallery slider', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{gallery-slider}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#gallery-slider}}
      template block text
    {{/gallery-slider}}
  """

  assert.equal @$().text().trim(), 'template block text'
