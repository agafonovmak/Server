`import DS from 'ember-data'`
`import { ActiveModelSerializer } from 'active-model-adapter'`

UserSerializer = ActiveModelSerializer.extend DS.EmbeddedRecordsMixin,
  attrs:
    clubs: {
      serialize: 'ids',
      deserialize: 'ids'
    }

`export default UserSerializer`
