"builtin.module"() ({
  "func.func"() <{function_type = (!emitc.array<1xf32>, !emitc.array<10x20x30xi32>, !emitc.array<30x!emitc.ptr<i32>>, !emitc.array<30x!emitc.opaque<"int">>, !emitc.array<30x!emitc.size_t>, !emitc.array<30x!emitc.ssize_t>, !emitc.array<30x!emitc.ptrdiff_t>, !emitc.array<0xi64>) -> (), sym_name = "array_types"}> ({
  ^bb0(%arg0: !emitc.array<1xf32>, %arg1: !emitc.array<10x20x30xi32>, %arg2: !emitc.array<30x!emitc.ptr<i32>>, %arg3: !emitc.array<30x!emitc.opaque<"int">>, %arg4: !emitc.array<30x!emitc.size_t>, %arg5: !emitc.array<30x!emitc.ssize_t>, %arg6: !emitc.array<30x!emitc.ptrdiff_t>, %arg7: !emitc.array<0xi64>):
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "lvalue_types"}> ({
    %2 = "typed.result"() : () -> !emitc.lvalue<i32>
    %3 = "typed.result"() : () -> !emitc.lvalue<f64>
    %4 = "typed.result"() : () -> !emitc.lvalue<index>
    %5 = "typed.result"() : () -> !emitc.lvalue<!emitc.ptr<i32>>
    %6 = "typed.result"() : () -> !emitc.lvalue<!emitc.opaque<"int">>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "opaque_types"}> ({
    "emitc.call_opaque"() <{callee = "f", template_args = [!emitc.opaque<"int">]}> : () -> ()
    "emitc.call_opaque"() <{callee = "f", template_args = [!emitc.opaque<"byte">]}> : () -> ()
    "emitc.call_opaque"() <{callee = "f", template_args = [!emitc.opaque<"unsigned">]}> : () -> ()
    "emitc.call_opaque"() <{callee = "f", template_args = [!emitc.opaque<"status_t">]}> : () -> ()
    "emitc.call_opaque"() <{callee = "f", template_args = [!emitc.opaque<"std::vector<std::string>">]}> : () -> ()
    "emitc.call_opaque"() <{callee = "f", template_args = [!emitc.opaque<"SmallVector<int*, 4>">]}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "pointer_types"}> ({
    "emitc.call_opaque"() <{callee = "f", template_args = [!emitc.ptr<i32>]}> : () -> ()
    "emitc.call_opaque"() <{callee = "f", template_args = [!emitc.ptr<i64>]}> : () -> ()
    "emitc.call_opaque"() <{callee = "f", template_args = [!emitc.ptr<f32>]}> : () -> ()
    "emitc.call_opaque"() <{callee = "f", template_args = [!emitc.ptr<f64>]}> : () -> ()
    %0 = "emitc.call_opaque"() <{callee = "f"}> : () -> !emitc.ptr<i32>
    %1 = "emitc.call_opaque"(%0) <{callee = "f"}> : (!emitc.ptr<i32>) -> !emitc.ptr<!emitc.ptr<i32>>
    "emitc.call_opaque"() <{callee = "f", template_args = [!emitc.ptr<!emitc.opaque<"int">>]}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "size_types"}> ({
    "emitc.call_opaque"() <{callee = "f", template_args = [!emitc.ssize_t]}> : () -> ()
    "emitc.call_opaque"() <{callee = "f", template_args = [!emitc.size_t]}> : () -> ()
    "emitc.call_opaque"() <{callee = "f", template_args = [!emitc.ptrdiff_t]}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

