`import Ember from 'ember'`
DropdownclassHelper = Ember.Helper.helper ([a, b]) ->
  if a == b then "active" else "default"
`export default DropdownclassHelper`
