#map = affine_map<(d0)[s0] -> (-d0 + 32400, s0)>
#map1 = affine_map<(d0)[s0] -> (-d0 + 16, s0)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "fixed_size_loop_nest"}> ({
    %0 = "arith.constant"() <{value = 16 : index}> : () -> index
    %1 = "arith.constant"() <{value = 32400 : index}> : () -> index
    %2 = "arith.constant"() <{value = 4 : index}> : () -> index
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index
    %4 = "vector.vscale"() : () -> index
    %5 = "arith.muli"(%4, %2) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    "scf.for"(%3, %1, %5) ({
    ^bb0(%arg0: index):
      %6 = "affine.min"(%arg0, %5) <{map = #map}> : (index, index) -> index
      "scf.for"(%3, %0, %5) ({
      ^bb0(%arg1: index):
        %7 = "affine.min"(%arg1, %5) <{map = #map1}> : (index, index) -> index
        %8 = "test.reify_bound"(%6) <{scalable, type = "UB", vscale_max = 16 : i64, vscale_min = 1 : i64}> : (index) -> index
        %9 = "test.reify_bound"(%7) <{scalable, type = "UB", vscale_max = 16 : i64, vscale_min = 1 : i64}> : (index) -> index
        "test.some_use"(%8, %9) : (index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0)[s0, s1] -> (-d0 + s1, s0)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> (), sym_name = "dynamic_size_loop_nest"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "arith.constant"() <{value = 4 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "vector.vscale"() : () -> index
    %3 = "arith.muli"(%2, %0) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    "scf.for"(%1, %arg0, %3) ({
    ^bb0(%arg2: index):
      %4 = "affine.min"(%arg2, %3, %arg0) <{map = #map}> : (index, index, index) -> index
      "scf.for"(%1, %arg1, %3) ({
      ^bb0(%arg3: index):
        %5 = "affine.min"(%arg3, %3, %arg1) <{map = #map}> : (index, index, index) -> index
        %6 = "test.reify_bound"(%4) <{scalable, type = "UB", vscale_max = 16 : i64, vscale_min = 1 : i64}> : (index) -> index
        %7 = "test.reify_bound"(%5) <{scalable, type = "UB", vscale_max = 16 : i64, vscale_min = 1 : i64}> : (index) -> index
        "test.some_use"(%6, %7) : (index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "add_to_vscale"}> ({
    %0 = "vector.vscale"() : () -> index
    %1 = "arith.constant"() <{value = 8 : index}> : () -> index
    %2 = "arith.addi"(%0, %1) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %3 = "test.reify_bound"(%2) <{scalable, type = "EQ", vscale_max = 16 : i64, vscale_min = 1 : i64}> : (index) -> index
    "test.some_use"(%3) : (index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "vscale_fixed_size"}> ({
    %0 = "vector.vscale"() : () -> index
    %1 = "test.reify_bound"(%0) <{scalable, type = "EQ", vscale_max = 2 : i64, vscale_min = 2 : i64}> : (index) -> index
    "test.some_use"(%1) : (index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> (), sym_name = "unknown_bound"}> ({
  ^bb0(%arg0: index):
    %0 = "vector.vscale"() : () -> index
    %1 = "arith.muli"(%0, %arg0) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %2 = "test.reify_bound"(%1) <{scalable, type = "UB", vscale_max = 16 : i64, vscale_min = 1 : i64}> : (index) -> index
    "test.some_use"(%2) : (index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "duplicate_vscale_values"}> ({
    %0 = "arith.constant"() <{value = 4 : index}> : () -> index
    %1 = "vector.vscale"() : () -> index
    %2 = "arith.constant"() <{value = 2 : index}> : () -> index
    %3 = "vector.vscale"() : () -> index
    %4 = "arith.muli"(%1, %0) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %5 = "arith.muli"(%3, %2) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %6 = "arith.addi"(%5, %4) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %7 = "test.reify_bound"(%6) <{scalable, type = "EQ", vscale_max = 16 : i64, vscale_min = 1 : i64}> : (index) -> index
    "test.some_use"(%7) : (index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0)[s0] -> (-d0 + 1024, s0)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "non_scalable_code"}> ({
    %0 = "arith.constant"() <{value = 1024 : index}> : () -> index
    %1 = "arith.constant"() <{value = 4 : index}> : () -> index
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index
    "scf.for"(%2, %0, %1) ({
    ^bb0(%arg0: index):
      %3 = "affine.min"(%arg0, %1) <{map = #map}> : (index, index) -> index
      %4 = "test.reify_bound"(%3) <{scalable, type = "UB", vscale_max = 16 : i64, vscale_min = 1 : i64}> : (index) -> index
      "test.some_use"(%4) : (index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<()[s0] -> (-(1000 mod s0) + 1000)>
#map1 = affine_map<(d0) -> (-d0 + 1000)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_scalable_remainder_loop"}> ({
    %0 = "arith.constant"() <{value = 8 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1000 : index}> : () -> index
    %2 = "vector.vscale"() : () -> index
    %3 = "arith.muli"(%2, %0) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %4 = "affine.apply"(%3) <{map = #map}> : (index) -> index
    "scf.for"(%4, %1, %3) ({
    ^bb0(%arg0: index):
      %5 = "affine.apply"(%arg0) <{map = #map1}> : (index) -> index
      %6 = "test.reify_bound"(%5) <{scalable, type = "UB", vscale_max = 16 : i64, vscale_min = 1 : i64}> : (index) -> index
      "test.some_use"(%6) : (index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<()[s0] -> (s0 * s0)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "unsupported_semi_affine"}> ({
    %0 = "vector.vscale"() : () -> index
    %1 = "affine.apply"(%0) <{map = #map}> : (index) -> index
    %2 = "test.reify_bound"(%1) <{scalable, type = "UB", vscale_max = 16 : i64, vscale_min = 1 : i64}> : (index) -> index
    "test.some_use"(%2) : (index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<()[s0] -> (1000 mod s0)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "unsupported_negative_mod"}> ({
    %0 = "arith.constant"() <{value = -1 : index}> : () -> index
    %1 = "vector.vscale"() : () -> index
    %2 = "arith.muli"(%1, %0) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %3 = "affine.apply"(%2) <{map = #map}> : (index) -> index
    %4 = "test.reify_bound"(%3) <{scalable, type = "UB", vscale_max = 16 : i64, vscale_min = 1 : i64}> : (index) -> index
    "test.some_use"(%4) : (index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x1x3x?xf32>) -> (), sym_name = "extract_slice_loop"}> ({
  ^bb0(%arg0: tensor<1x1x3x?xf32>):
    %0 = "vector.vscale"() : () -> index
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    %3 = "arith.constant"() <{value = 2 : index}> : () -> index
    %4 = "arith.constant"() <{value = 3 : index}> : () -> index
    %5 = "arith.constant"() <{value = 4 : index}> : () -> index
    %6 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %7 = "arith.muli"(%5, %0) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %8 = "tensor.extract_slice"(%arg0, %7) <{operandSegmentSizes = array<i32: 1, 0, 1, 0>, static_offsets = array<i64: 0, 0, 0, 0>, static_sizes = array<i64: 1, 1, 3, -9223372036854775808>, static_strides = array<i64: 1, 1, 1, 1>}> : (tensor<1x1x3x?xf32>, index) -> tensor<1x3x?xf32>
    %9 = "scf.for"(%1, %4, %2, %8) ({
    ^bb0(%arg1: index, %arg2: tensor<1x3x?xf32>):
      %10 = "tensor.dim"(%arg2, %3) : (tensor<1x3x?xf32>, index) -> index
      %11 = "test.reify_bound"(%10) <{scalable, type = "LB", vscale_max = 16 : i64, vscale_min = 1 : i64}> : (index) -> index
      "test.some_use"(%11) : (index) -> ()
      "scf.yield"(%arg2) : (tensor<1x3x?xf32>) -> ()
    }) : (index, index, index, tensor<1x3x?xf32>) -> tensor<1x3x?xf32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

