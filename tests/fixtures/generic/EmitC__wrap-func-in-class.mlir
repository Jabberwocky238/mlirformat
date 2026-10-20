"builtin.module"() ({
  "emitc.func"() <{function_type = (!emitc.array<1xf32>) -> (), sym_name = "foo"}> ({
  ^bb0(%arg0: !emitc.array<1xf32>):
    "emitc.call_opaque"(%arg0) <{callee = "bar"}> : (!emitc.array<1xf32>) -> ()
    "emitc.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "emitc.func"() <{arg_attrs = [{emitc.name_hint = "another_feature"}, {emitc.name_hint = "some_feature"}, {emitc.name_hint = "output_0"}], function_type = (!emitc.array<1xf32>, !emitc.array<1xf32>, !emitc.array<1xf32>) -> (), sym_name = "model"}> ({
  ^bb0(%arg0: !emitc.array<1xf32>, %arg1: !emitc.array<1xf32>, %arg2: !emitc.array<1xf32>):
    %0 = "emitc.constant"() <{value = 0 : index}> : () -> !emitc.size_t
    %1 = "emitc.subscript"(%arg1, %0) : (!emitc.array<1xf32>, !emitc.size_t) -> !emitc.lvalue<f32>
    %2 = "emitc.load"(%1) : (!emitc.lvalue<f32>) -> f32
    %3 = "emitc.subscript"(%arg0, %0) : (!emitc.array<1xf32>, !emitc.size_t) -> !emitc.lvalue<f32>
    %4 = "emitc.load"(%3) : (!emitc.lvalue<f32>) -> f32
    %5 = "emitc.add"(%2, %4) : (f32, f32) -> f32
    %6 = "emitc.subscript"(%arg2, %0) : (!emitc.array<1xf32>, !emitc.size_t) -> !emitc.lvalue<f32>
    "emitc.assign"(%6, %5) : (!emitc.lvalue<f32>, f32) -> ()
    "emitc.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

