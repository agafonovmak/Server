`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'club-image-uploader', 'Integration | Component | club image uploader', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{club-image-uploader}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#club-image-uploader}}
      template block text
    {{/club-image-uploader}}
  """

  assert.equal @$().text().trim(), 'template block text'
