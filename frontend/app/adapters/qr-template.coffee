`import ApplicationAdapter from './application'`

QrTemplateAdapter = ApplicationAdapter.extend
  namespace: 'ember/qr'

  pathForType: ->
    'templates'

`export default QrTemplateAdapter`
