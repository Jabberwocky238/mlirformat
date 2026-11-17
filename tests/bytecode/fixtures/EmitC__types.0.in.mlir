"builtin.module"() ({
  "func.func"() <{function_type = (!emitc.array<1xf32>, !emitc.array<10x20x30xi32>, !emitc.array<30x!emitc.ptr<i32>>, !emitc.array<30x!emitc.opaque<"int">>, !emitc.array<30x!emitc.size_t>, !emitc.array<30x!emitc.ssize_t>, !emitc.array<30x!emitc.ptrdiff_t>, !emitc.array<0xi64>) -> (), sym_name = "array_types"}> ({
  ^bb0(%arg0: !emitc.array<1xf32> loc("<stdin>":3:8), %arg1: !emitc.array<10x20x30xi32> loc("<stdin>":3:36), %arg2: !emitc.array<30x!emitc.ptr<i32>> loc("<stdin>":3:71), %arg3: !emitc.array<30x!emitc.opaque<"int">> loc("<stdin>":3:112), %arg4: !emitc.array<30x!emitc.size_t> loc("<stdin>":3:158), %arg5: !emitc.array<30x!emitc.ssize_t> loc("<stdin>":3:197), %arg6: !emitc.array<30x!emitc.ptrdiff_t> loc("<stdin>":3:237), %arg7: !emitc.array<0xi64> loc("<stdin>":3:279)):
    "func.return"() : () -> () loc("<stdin>":4:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = () -> (), sym_name = "lvalue_types"}> ({
    %2 = "typed.result"() : () -> !emitc.lvalue<i32> loc("<stdin>":7:10)
    %3 = "typed.result"() : () -> !emitc.lvalue<f64> loc("<stdin>":8:10)
    %4 = "typed.result"() : () -> !emitc.lvalue<index> loc("<stdin>":9:10)
    %5 = "typed.result"() : () -> !emitc.lvalue<!emitc.ptr<i32>> loc("<stdin>":10:10)
    %6 = "typed.result"() : () -> !emitc.lvalue<!emitc.opaque<"int">> loc("<stdin>":11:10)
    "func.return"() : () -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":6:3)
  "func.func"() <{function_type = () -> (), sym_name = "opaque_types"}> ({
    "emitc.call_opaque"() <{callee = "f", template_args = [!emitc.opaque<"int">]}> : () -> () loc("<stdin>":15:5)
    "emitc.call_opaque"() <{callee = "f", template_args = [!emitc.opaque<"byte">]}> : () -> () loc("<stdin>":16:5)
    "emitc.call_opaque"() <{callee = "f", template_args = [!emitc.opaque<"unsigned">]}> : () -> () loc("<stdin>":17:5)
    "emitc.call_opaque"() <{callee = "f", template_args = [!emitc.opaque<"status_t">]}> : () -> () loc("<stdin>":18:5)
    "emitc.call_opaque"() <{callee = "f", template_args = [!emitc.opaque<"std::vector<std::string>">]}> : () -> () loc("<stdin>":19:5)
    "emitc.call_opaque"() <{callee = "f", template_args = [!emitc.opaque<"SmallVector<int*, 4>">]}> : () -> () loc("<stdin>":20:5)
    "func.return"() : () -> () loc("<stdin>":21:5)
  }) : () -> () loc("<stdin>":14:3)
  "func.func"() <{function_type = () -> (), sym_name = "pointer_types"}> ({
    "emitc.call_opaque"() <{callee = "f", template_args = [!emitc.ptr<i32>]}> : () -> () loc("<stdin>":24:5)
    "emitc.call_opaque"() <{callee = "f", template_args = [!emitc.ptr<i64>]}> : () -> () loc("<stdin>":25:5)
    "emitc.call_opaque"() <{callee = "f", template_args = [!emitc.ptr<f32>]}> : () -> () loc("<stdin>":26:5)
    "emitc.call_opaque"() <{callee = "f", template_args = [!emitc.ptr<f64>]}> : () -> () loc("<stdin>":27:5)
    %0 = "emitc.call_opaque"() <{callee = "f"}> : () -> !emitc.ptr<i32> loc("<stdin>":28:10)
    %1 = "emitc.call_opaque"(%0) <{callee = "f"}> : (!emitc.ptr<i32>) -> !emitc.ptr<!emitc.ptr<i32>> loc("<stdin>":29:10)
    "emitc.call_opaque"() <{callee = "f", template_args = [!emitc.ptr<!emitc.opaque<"int">>]}> : () -> () loc("<stdin>":30:5)
    "func.return"() : () -> () loc("<stdin>":31:5)
  }) : () -> () loc("<stdin>":23:3)
  "func.func"() <{function_type = () -> (), sym_name = "size_types"}> ({
    "emitc.call_opaque"() <{callee = "f", template_args = [!emitc.ssize_t]}> : () -> () loc("<stdin>":34:5)
    "emitc.call_opaque"() <{callee = "f", template_args = [!emitc.size_t]}> : () -> () loc("<stdin>":35:5)
    "emitc.call_opaque"() <{callee = "f", template_args = [!emitc.ptrdiff_t]}> : () -> () loc("<stdin>":36:5)
    "func.return"() : () -> () loc("<stdin>":37:5)
  }) : () -> () loc("<stdin>":33:3)
}) : () -> () loc("<stdin>":1:1)
