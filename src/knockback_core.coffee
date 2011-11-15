###
  knockback.js 0.8.0
  (c) 2011 Kevin Malakoff.
  Knockback.js is freely distributable under the MIT license.
  See the following for full license details:
    https://github.com/kmalakoff/knockback/blob/master/LICENSE
  Dependencies: Knockout.js, Backbone.js, and Underscore.js.
    Optional dependency: Backbone.ModelRef.js.
###
throw new Error('Knockback: Dependency alert! Knockout.js must be included before this file') if not this.ko
throw new Error('Knockback: Dependency alert! Backbone.js must be included before this file') if not this.Backbone
throw new Error('Knockback: Dependency alert! Underscore.js must be included before this file') if not this._ or not this._.VERSION

# define namspaces
this.Knockback||this.Knockback={}; this.kb||this.kb=this.Knockback

# Current version.
Knockback.VERSION = '0.8.0'

# Locale Manager - if you are using localization, set this property.
# It must have Backbone.Events mixed in and implement a get method like Backbone.Model, eg. get: (attribute_name) -> return somthing
Knockback.locale_manager

# helpers
Knockback.wrappedObservable = (instance) ->
  throw new Error('Knockback: _kb_observable missing from your instance') if not instance._kb_observable
  return instance._kb_observable

Knockback.viewModelDestroyObservables = Knockback.vmDestroy = (view_model) ->
  for key, observable of view_model
    do (key, observable) ->
      return if not observable or not ((ko.isObservable(observable) and observable.destroy) or (observable instanceof kb.Observables))
      observable.destroy(); view_model[key] = null
