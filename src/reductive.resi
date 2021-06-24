module Store: {
  type t<'action, 'state>
  let create: (
    ~reducer: ('state, 'action) => 'state,
    ~preloadedState: 'state,
    ~enhancer: (t<'action, 'state>, 'action => unit, 'action) => unit=?,
    unit,
  ) => t<'action, 'state>
  let unsubscribe: (t<'action, 'state>, unit => unit, unit) => unit
  let subscribe: (t<'action, 'state>, unit => unit, unit) => unit
  /* skips all middleware and applies an update directly to the store */
  let nativeDispatch: (t<'action, 'state>, 'action) => unit
  let dispatch: (t<'action, 'state>, 'action) => unit
  let getState: t<'action, 'state> => 'state
  let replaceReducer: (t<'action, 'state>, ('state, 'action) => 'state) => unit
}
