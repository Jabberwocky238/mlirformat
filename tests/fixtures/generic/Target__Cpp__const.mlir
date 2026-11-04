"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "emitc_constant"}> ({
    %0 = "emitc.constant"() <{value = #emitc.opaque<"INT_MAX">}> : () -> i32
    %1 = "emitc.constant"() <{value = 42 : i32}> : () -> i32
    %2 = "emitc.constant"() <{value = -1 : i32}> : () -> i32
    %3 = "emitc.constant"() <{value = -1 : si8}> : () -> si8
    %4 = "emitc.constant"() <{value = 255 : ui8}> : () -> ui8
    %5 = "emitc.constant"() <{value = #emitc.opaque<"CHAR_MIN">}> : () -> !emitc.opaque<"char">
    %6 = "emitc.constant"() <{value = 2 : index}> : () -> index
    %7 = "emitc.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
    %8 = "emitc.constant"() <{value = 4.000000e+00 : f64}> : () -> f64
    %9 = "emitc.constant"() <{value = 2.000000e+00 : f16}> : () -> f16
    %10 = "emitc.constant"() <{value = 4.000000e+00 : bf16}> : () -> bf16
    %11 = "emitc.constant"() <{value = dense<0> : tensor<i32>}> : () -> tensor<i32>
    %12 = "emitc.constant"() <{value = dense<[0, 1]> : tensor<2xindex>}> : () -> tensor<2xindex>
    %13 = "emitc.constant"() <{value = dense<[[0.000000e+00, 1.000000e+00], [2.000000e+00, 3.000000e+00]]> : tensor<2x2xf32>}> : () -> tensor<2x2xf32>
    %14 = "emitc.constant"() <{value = dense<[0, 1]> : !emitc.array<2xindex>}> : () -> !emitc.array<2xindex>
    %15 = "emitc.constant"() <{value = dense<[0.000000e+00, 1.000000e+00]> : !emitc.array<2xf32>}> : () -> !emitc.array<2xf32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

