`import DS from 'ember-data'`
`import { ActiveModelSerializer } from 'active-model-adapter'`

WorkoutSerializer = ActiveModelSerializer.extend DS.EmbeddedRecordsMixin,
  attrs:
    coaches: {
      serialize: 'ids',
      deserialize: 'ids'
    }

`export default WorkoutSerializer`
