`import DS from 'ember-data'`
`import { ActiveModelSerializer } from 'active-model-adapter'`

UserTypeSerializer = ActiveModelSerializer.extend DS.EmbeddedRecordsMixin,
  attrs:
    roles: {
      serialize: 'ids',
      deserialize: 'ids'
    }

`export default UserTypeSerializer`
