module {
  func.func @opaque_attrs() {
    emitc.call_opaque "f"() {args = [#emitc.opaque<"attr">]} : () -> ()
    emitc.call_opaque "f"() {args = [#emitc.opaque<"\22quoted_attr\22">]} : () -> ()
    return
  }
}

