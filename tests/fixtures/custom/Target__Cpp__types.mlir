module {
  func.func @opaque_types() {
    emitc.call_opaque "f"() <{template_args = [!emitc.opaque<"int">]}> : () -> ()
    emitc.call_opaque "f"() <{template_args = [!emitc.opaque<"byte">]}> : () -> ()
    emitc.call_opaque "f"() <{template_args = [!emitc.opaque<"unsigned">]}> : () -> ()
    emitc.call_opaque "f"() <{template_args = [!emitc.opaque<"status_t">]}> : () -> ()
    emitc.call_opaque "f"() <{template_args = [!emitc.opaque<"std::vector<std::string>">]}> : () -> ()
    return
  }
  func.func @ptr_types() {
    emitc.call_opaque "f"() <{template_args = [!emitc.ptr<i32>]}> : () -> ()
    emitc.call_opaque "f"() <{template_args = [!emitc.ptr<i64>]}> : () -> ()
    emitc.call_opaque "f"() <{template_args = [!emitc.ptr<f16>]}> : () -> ()
    emitc.call_opaque "f"() <{template_args = [!emitc.ptr<bf16>]}> : () -> ()
    emitc.call_opaque "f"() <{template_args = [!emitc.ptr<f32>]}> : () -> ()
    emitc.call_opaque "f"() <{template_args = [!emitc.ptr<f64>]}> : () -> ()
    %0 = emitc.call_opaque "f"()  : () -> !emitc.ptr<i32>
    %1 = emitc.call_opaque "f"(%0)  : (!emitc.ptr<i32>) -> !emitc.ptr<!emitc.ptr<i32>>
    emitc.call_opaque "f"() <{template_args = [!emitc.ptr<!emitc.opaque<"int">>]}> : () -> ()
    return
  }
  func.func @size_types() {
    emitc.call_opaque "f"() <{template_args = [!emitc.ssize_t]}> : () -> ()
    emitc.call_opaque "f"() <{template_args = [!emitc.size_t]}> : () -> ()
    emitc.call_opaque "f"() <{template_args = [!emitc.ptrdiff_t]}> : () -> ()
    return
  }
}

