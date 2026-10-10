"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "coalesce_inner"}> ({
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index
    %4 = "arith.constant"() <{value = 1 : index}> : () -> index
    %5 = "arith.constant"() <{value = 10 : index}> : () -> index
    "scf.for"(%3, %5, %4) ({
    ^bb0(%arg1: index):
      "scf.for"(%3, %5, %4) ({
      ^bb0(%arg2: index):
        "scf.for"(%arg1, %arg2, %4) ({
        ^bb0(%arg3: index):
          "scf.for"(%arg1, %arg2, %4) ({
          ^bb0(%arg4: index):
            "use"(%arg1, %arg2) : (index, index) -> ()
            "scf.yield"() : () -> ()
          }) : (index, index, index) -> ()
          "scf.yield"() : () -> ()
        }) {coalesce} : (index, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{op_attrs = {coalesce}, ops = ["scf.for"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.cast"(%0) : (!transform.any_op) -> !transform.op<"scf.for">
      %2 = "transform.loop.coalesce"(%1) : (!transform.op<"scf.for">) -> !transform.op<"scf.for">
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (64)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<64x64xf32, 1>, memref<64x64xf32, 1>, memref<64x64xf32, 1>) -> (), sym_name = "coalesce_outer"}> ({
  ^bb0(%arg1: memref<64x64xf32, 1>, %arg2: memref<64x64xf32, 1>, %arg3: memref<64x64xf32, 1>):
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg4: index):
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg5: index):
        %3 = "affine.load"(%arg1, %arg4, %arg5) <{map = #map}> : (memref<64x64xf32, 1>, index, index) -> f32
        %4 = "affine.load"(%arg2, %arg4, %arg5) <{map = #map}> : (memref<64x64xf32, 1>, index, index) -> f32
        %5 = "arith.addf"(%3, %4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "affine.store"(%5, %arg3, %arg4, %arg5) <{map = #map}> : (f32, memref<64x64xf32, 1>, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) {coalesce} : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{op_attrs = {coalesce}, ops = ["affine.for"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.cast"(%0) : (!transform.any_op) -> !transform.op<"affine.for">
      %2 = "transform.loop.coalesce"(%1) : (!transform.op<"affine.for">) -> !transform.op<"affine.for">
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<64x64xf32, 1>, memref<64x64xf32, 1>, memref<64x64xf32, 1>) -> (), sym_name = "coalesce_and_unroll"}> ({
  ^bb0(%arg1: memref<64x64xf32, 1>, %arg2: memref<64x64xf32, 1>, %arg3: memref<64x64xf32, 1>):
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index
    %4 = "arith.constant"() <{value = 1 : index}> : () -> index
    %5 = "arith.constant"() <{value = 64 : index}> : () -> index
    "scf.for"(%3, %5, %4) ({
    ^bb0(%arg4: index):
      "scf.for"(%3, %5, %4) ({
      ^bb0(%arg5: index):
        %6 = "memref.load"(%arg1, %arg4, %arg5) : (memref<64x64xf32, 1>, index, index) -> f32
        %7 = "memref.load"(%arg2, %arg4, %arg5) : (memref<64x64xf32, 1>, index, index) -> f32
        %8 = "arith.addf"(%6, %7) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "memref.store"(%8, %arg3, %arg4, %arg5) : (f32, memref<64x64xf32, 1>, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) {coalesce} : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{op_attrs = {coalesce}, ops = ["scf.for"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.cast"(%0) : (!transform.any_op) -> !transform.op<"scf.for">
      %2 = "transform.loop.coalesce"(%1) : (!transform.op<"scf.for">) -> !transform.op<"scf.for">
      "transform.loop.unroll"(%2) <{factor = 3 : i64}> : (!transform.op<"scf.for">) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, index, index, index, index, index, index, index, index, index) -> tensor<?x?xf32>, sym_name = "tensor_loops"}> ({
  ^bb0(%arg1: tensor<?x?xf32>, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index, %arg8: index, %arg9: index, %arg10: index):
    %3 = "scf.for"(%arg2, %arg3, %arg4, %arg1) ({
    ^bb0(%arg11: index, %arg12: tensor<?x?xf32>):
      %4 = "scf.for"(%arg5, %arg6, %arg7, %arg12) ({
      ^bb0(%arg13: index, %arg14: tensor<?x?xf32>):
        %5 = "scf.for"(%arg8, %arg9, %arg10, %arg14) ({
        ^bb0(%arg15: index, %arg16: tensor<?x?xf32>):
          %6 = "use"(%arg16, %arg11, %arg13, %arg15) : (tensor<?x?xf32>, index, index, index) -> tensor<?x?xf32>
          "scf.yield"(%6) : (tensor<?x?xf32>) -> ()
        }) : (index, index, index, tensor<?x?xf32>) -> tensor<?x?xf32>
        "scf.yield"(%5) : (tensor<?x?xf32>) -> ()
      }) : (index, index, index, tensor<?x?xf32>) -> tensor<?x?xf32>
      "scf.yield"(%4) : (tensor<?x?xf32>) -> ()
    }) {coalesce} : (index, index, index, tensor<?x?xf32>) -> tensor<?x?xf32>
    "func.return"(%3) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{op_attrs = {coalesce}, ops = ["scf.for"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.cast"(%0) : (!transform.any_op) -> !transform.op<"scf.for">
      %2 = "transform.loop.coalesce"(%1) : (!transform.op<"scf.for">) -> !transform.op<"scf.for">
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?x?xf32>, index, index, index, index, index, index, index, index, index) -> (tensor<?x?xf32>, tensor<?x?xf32>), sym_name = "tensor_loops_first_two"}> ({
  ^bb0(%arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index, %arg8: index, %arg9: index, %arg10: index, %arg11: index):
    %3:2 = "scf.for"(%arg3, %arg4, %arg5, %arg1, %arg2) ({
    ^bb0(%arg12: index, %arg13: tensor<?x?xf32>, %arg14: tensor<?x?xf32>):
      %4:2 = "scf.for"(%arg6, %arg7, %arg8, %arg13, %arg14) ({
      ^bb0(%arg15: index, %arg16: tensor<?x?xf32>, %arg17: tensor<?x?xf32>):
        %5:2 = "scf.for"(%arg9, %arg10, %arg11, %arg17, %arg16) ({
        ^bb0(%arg18: index, %arg19: tensor<?x?xf32>, %arg20: tensor<?x?xf32>):
          %6:2 = "use"(%arg14, %arg12, %arg15, %arg18) : (tensor<?x?xf32>, index, index, index) -> (tensor<?x?xf32>, tensor<?x?xf32>)
          "scf.yield"(%6#0, %6#1) : (tensor<?x?xf32>, tensor<?x?xf32>) -> ()
        }) : (index, index, index, tensor<?x?xf32>, tensor<?x?xf32>) -> (tensor<?x?xf32>, tensor<?x?xf32>)
        "scf.yield"(%5#0, %5#1) : (tensor<?x?xf32>, tensor<?x?xf32>) -> ()
      }) : (index, index, index, tensor<?x?xf32>, tensor<?x?xf32>) -> (tensor<?x?xf32>, tensor<?x?xf32>)
      "scf.yield"(%4#0, %4#1) : (tensor<?x?xf32>, tensor<?x?xf32>) -> ()
    }) {coalesce} : (index, index, index, tensor<?x?xf32>, tensor<?x?xf32>) -> (tensor<?x?xf32>, tensor<?x?xf32>)
    "func.return"(%3#0, %3#1) : (tensor<?x?xf32>, tensor<?x?xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{op_attrs = {coalesce}, ops = ["scf.for"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.cast"(%0) : (!transform.any_op) -> !transform.op<"scf.for">
      %2 = "transform.loop.coalesce"(%1) : (!transform.op<"scf.for">) -> !transform.op<"scf.for">
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?x?xf32>, index, index, index, index, index, index, index, index, index) -> (tensor<?x?xf32>, tensor<?x?xf32>), sym_name = "tensor_loops_first_two_2"}> ({
  ^bb0(%arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index, %arg8: index, %arg9: index, %arg10: index, %arg11: index):
    %3:2 = "scf.for"(%arg3, %arg4, %arg5, %arg1, %arg2) ({
    ^bb0(%arg12: index, %arg13: tensor<?x?xf32>, %arg14: tensor<?x?xf32>):
      %4:2 = "scf.for"(%arg6, %arg7, %arg8, %arg13, %arg14) ({
      ^bb0(%arg15: index, %arg16: tensor<?x?xf32>, %arg17: tensor<?x?xf32>):
        %5:2 = "scf.for"(%arg9, %arg10, %arg11, %arg16, %arg17) ({
        ^bb0(%arg18: index, %arg19: tensor<?x?xf32>, %arg20: tensor<?x?xf32>):
          %6:2 = "use"(%arg14, %arg12, %arg15, %arg18) : (tensor<?x?xf32>, index, index, index) -> (tensor<?x?xf32>, tensor<?x?xf32>)
          "scf.yield"(%6#0, %6#1) : (tensor<?x?xf32>, tensor<?x?xf32>) -> ()
        }) : (index, index, index, tensor<?x?xf32>, tensor<?x?xf32>) -> (tensor<?x?xf32>, tensor<?x?xf32>)
        "scf.yield"(%5#1, %5#0) : (tensor<?x?xf32>, tensor<?x?xf32>) -> ()
      }) : (index, index, index, tensor<?x?xf32>, tensor<?x?xf32>) -> (tensor<?x?xf32>, tensor<?x?xf32>)
      "scf.yield"(%4#0, %4#1) : (tensor<?x?xf32>, tensor<?x?xf32>) -> ()
    }) {coalesce} : (index, index, index, tensor<?x?xf32>, tensor<?x?xf32>) -> (tensor<?x?xf32>, tensor<?x?xf32>)
    "func.return"(%3#0, %3#1) : (tensor<?x?xf32>, tensor<?x?xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{op_attrs = {coalesce}, ops = ["scf.for"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.cast"(%0) : (!transform.any_op) -> !transform.op<"scf.for">
      %2 = "transform.loop.coalesce"(%1) : (!transform.op<"scf.for">) -> !transform.op<"scf.for">
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?x?xf32>, index, index, index, index, index, index, index, index, index) -> (tensor<?x?xf32>, tensor<?x?xf32>), sym_name = "tensor_loops_last_two"}> ({
  ^bb0(%arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index, %arg8: index, %arg9: index, %arg10: index, %arg11: index):
    %3:2 = "scf.for"(%arg3, %arg4, %arg5, %arg1, %arg2) ({
    ^bb0(%arg12: index, %arg13: tensor<?x?xf32>, %arg14: tensor<?x?xf32>):
      %4:2 = "scf.for"(%arg6, %arg7, %arg8, %arg13, %arg14) ({
      ^bb0(%arg15: index, %arg16: tensor<?x?xf32>, %arg17: tensor<?x?xf32>):
        %5:2 = "scf.for"(%arg9, %arg10, %arg11, %arg16, %arg17) ({
        ^bb0(%arg18: index, %arg19: tensor<?x?xf32>, %arg20: tensor<?x?xf32>):
          %6:2 = "use"(%arg14, %arg12, %arg15, %arg18) : (tensor<?x?xf32>, index, index, index) -> (tensor<?x?xf32>, tensor<?x?xf32>)
          "scf.yield"(%6#0, %6#1) : (tensor<?x?xf32>, tensor<?x?xf32>) -> ()
        }) : (index, index, index, tensor<?x?xf32>, tensor<?x?xf32>) -> (tensor<?x?xf32>, tensor<?x?xf32>)
        "scf.yield"(%5#0, %5#1) : (tensor<?x?xf32>, tensor<?x?xf32>) -> ()
      }) : (index, index, index, tensor<?x?xf32>, tensor<?x?xf32>) -> (tensor<?x?xf32>, tensor<?x?xf32>)
      "scf.yield"(%4#1, %4#0) : (tensor<?x?xf32>, tensor<?x?xf32>) -> ()
    }) {coalesce} : (index, index, index, tensor<?x?xf32>, tensor<?x?xf32>) -> (tensor<?x?xf32>, tensor<?x?xf32>)
    "func.return"(%3#0, %3#1) : (tensor<?x?xf32>, tensor<?x?xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{op_attrs = {coalesce}, ops = ["scf.for"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.cast"(%0) : (!transform.any_op) -> !transform.op<"scf.for">
      %2 = "transform.loop.coalesce"(%1) : (!transform.op<"scf.for">) -> !transform.op<"scf.for">
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, index, index) -> tensor<?x?xf32>, sym_name = "trip_one_loops"}> ({
  ^bb0(%arg1: tensor<?x?xf32>, %arg2: index, %arg3: index):
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index
    %4 = "arith.constant"() <{value = 1 : index}> : () -> index
    %5 = "scf.for"(%3, %4, %4, %arg1) ({
    ^bb0(%arg4: index, %arg5: tensor<?x?xf32>):
      %6 = "scf.for"(%3, %4, %4, %arg5) ({
      ^bb0(%arg6: index, %arg7: tensor<?x?xf32>):
        %7 = "scf.for"(%3, %arg2, %4, %arg7) ({
        ^bb0(%arg8: index, %arg9: tensor<?x?xf32>):
          %8 = "scf.for"(%3, %4, %4, %arg9) ({
          ^bb0(%arg10: index, %arg11: tensor<?x?xf32>):
            %9 = "scf.for"(%3, %arg3, %4, %arg11) ({
            ^bb0(%arg12: index, %arg13: tensor<?x?xf32>):
              %10 = "some_use"(%arg13, %arg4, %arg6, %arg8, %arg10, %arg12) : (tensor<?x?xf32>, index, index, index, index, index) -> tensor<?x?xf32>
              "scf.yield"(%10) : (tensor<?x?xf32>) -> ()
            }) : (index, index, index, tensor<?x?xf32>) -> tensor<?x?xf32>
            "scf.yield"(%9) : (tensor<?x?xf32>) -> ()
          }) : (index, index, index, tensor<?x?xf32>) -> tensor<?x?xf32>
          "scf.yield"(%8) : (tensor<?x?xf32>) -> ()
        }) : (index, index, index, tensor<?x?xf32>) -> tensor<?x?xf32>
        "scf.yield"(%7) : (tensor<?x?xf32>) -> ()
      }) : (index, index, index, tensor<?x?xf32>) -> tensor<?x?xf32>
      "scf.yield"(%6) : (tensor<?x?xf32>) -> ()
    }) {coalesce} : (index, index, index, tensor<?x?xf32>) -> tensor<?x?xf32>
    "func.return"(%5) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{op_attrs = {coalesce}, ops = ["scf.for"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.cast"(%0) : (!transform.any_op) -> !transform.op<"scf.for">
      %2 = "transform.loop.coalesce"(%1) : (!transform.op<"scf.for">) -> !transform.op<"scf.for">
      "transform.apply_patterns"(%2) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.canonicalization"() : () -> ()
      }) : (!transform.op<"scf.for">) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, index) -> tensor<?x?xf32>, sym_name = "all_outer_trip_one"}> ({
  ^bb0(%arg1: tensor<?x?xf32>, %arg2: index):
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index
    %4 = "arith.constant"() <{value = 1 : index}> : () -> index
    %5 = "scf.for"(%3, %4, %4, %arg1) ({
    ^bb0(%arg3: index, %arg4: tensor<?x?xf32>):
      %6 = "scf.for"(%3, %4, %4, %arg4) ({
      ^bb0(%arg5: index, %arg6: tensor<?x?xf32>):
        %7 = "scf.for"(%3, %arg2, %4, %arg6) ({
        ^bb0(%arg7: index, %arg8: tensor<?x?xf32>):
          %8 = "some_use"(%arg8, %arg3, %arg5, %arg7) : (tensor<?x?xf32>, index, index, index) -> tensor<?x?xf32>
          "scf.yield"(%8) : (tensor<?x?xf32>) -> ()
        }) : (index, index, index, tensor<?x?xf32>) -> tensor<?x?xf32>
        "scf.yield"(%7) : (tensor<?x?xf32>) -> ()
      }) : (index, index, index, tensor<?x?xf32>) -> tensor<?x?xf32>
      "scf.yield"(%6) : (tensor<?x?xf32>) -> ()
    }) {coalesce} : (index, index, index, tensor<?x?xf32>) -> tensor<?x?xf32>
    "func.return"(%5) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{op_attrs = {coalesce}, ops = ["scf.for"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.cast"(%0) : (!transform.any_op) -> !transform.op<"scf.for">
      %2 = "transform.loop.coalesce"(%1) : (!transform.op<"scf.for">) -> !transform.op<"scf.for">
      "transform.apply_patterns"(%2) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.canonicalization"() : () -> ()
      }) : (!transform.op<"scf.for">) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

