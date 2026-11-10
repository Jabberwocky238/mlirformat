module {
  func.func @opaque_attrs() {
    emitc.call_opaque "f"() <{args = [#emitc.opaque<"OPAQUE_ENUM_VALUE">]}> : () -> ()
    emitc.call_opaque "f"() <{args = [#emitc.opaque<"\22some string\22">]}> : () -> ()
    return
  }
}

