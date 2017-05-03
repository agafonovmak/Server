`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'file-uploader', 'Integration | Component | file uploader', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{file-uploader}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#file-uploader}}
      template block text
    {{/file-uploader}}
  """

  assert.equal @$().text().trim(), 'template block text'
