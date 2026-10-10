"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> (index, index, index), sym_name = "reify_through_chain"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "arith.constant"() <{value = 2 : index}> : () -> index
    %1 = "tensor.empty"(%arg0, %arg1) : (index, index) -> tensor<?x10x?xf32>
    %2 = "tensor.cast"(%1) : (tensor<?x10x?xf32>) -> tensor<?x?x?xf32>
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index
    %4 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %5 = "tensor.insert"(%4, %2, %3, %3, %3) : (f32, tensor<?x?x?xf32>, index, index, index) -> tensor<?x?x?xf32>
    %6 = "tensor.dim"(%5, %0) : (tensor<?x?x?xf32>, index) -> index
    %7 = "test.reify_bound"(%5) <{dim = 0 : i64, type = "EQ"}> : (tensor<?x?x?xf32>) -> index
    %8 = "test.reify_bound"(%5) <{dim = 1 : i64, type = "EQ"}> : (tensor<?x?x?xf32>) -> index
    %9 = "test.reify_bound"(%6) <{type = "EQ"}> : (index) -> index
    "func.return"(%7, %8, %9) : (index, index, index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0)[s0] -> (-d0 + s0, 4)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xi32>, index, index, i32) -> (), sym_name = "reify_slice_bound"}> ({
  ^bb0(%arg0: tensor<?x?xi32>, %arg1: index, %arg2: index, %arg3: i32):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 4 : index}> : () -> index
    "scf.for"(%0, %arg2, %1) ({
    ^bb0(%arg4: index):
      %2 = "affine.min"(%arg4, %arg2) <{map = #map}> : (index, index) -> index
      %3 = "tensor.extract_slice"(%arg0, %arg1, %arg4, %2) <{operandSegmentSizes = array<i32: 1, 2, 1, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 1, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (tensor<?x?xi32>, index, index, index) -> tensor<1x?xi32>
      %4 = "linalg.fill"(%arg3, %3) <{operandSegmentSizes = array<i32: 1, 1>}> ({
      ^bb0(%arg5: i32, %arg6: i32):
        "linalg.yield"(%arg5) : (i32) -> ()
      }) : (i32, tensor<1x?xi32>) -> tensor<1x?xi32>
      %5 = "test.reify_bound"(%4) <{dim = 1 : i64, type = "UB"}> : (tensor<1x?xi32>) -> index
      "test.some_use"(%5) : (index) -> ()
      %6 = "test.reify_bound"(%4) <{constant, dim = 1 : i64, type = "UB"}> : (tensor<1x?xi32>) -> index
      "test.some_use"(%6) : (index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0)[s0] -> (-d0 + s0)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index) -> (), sym_name = "scf_for"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index):
    "scf.for"(%arg0, %arg1, %arg2) ({
    ^bb0(%arg3: index):
      %0 = "affine.apply"(%arg3, %arg1) <{map = #map}> : (index, index) -> index
      %1 = "test.reify_bound"(%0) <{type = "UB"}> : (index) -> index
      "test.some_use"(%1) : (index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0)[s0] -> (-d0 + s0, 128)>
#map1 = affine_map<()[s0] -> ((s0 floordiv 32) * 32)>
#map2 = affine_map<(d0)[s0] -> (-d0 + s0)>
#map3 = affine_map<(d0, d1, d2) -> (d0, d2)>
#map4 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map5 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index, index, tensor<1x?xi8>, tensor<?x?xi8>, tensor<1x?xi32>) -> (), sym_name = "reify_slice_bound2"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: tensor<1x?xi8>, %arg5: tensor<?x?xi8>, %arg6: tensor<1x?xi32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 32 : index}> : () -> index
    "scf.for"(%arg0, %arg1, %arg2) ({
    ^bb0(%arg7: index):
      %3 = "affine.min"(%arg7, %arg1) <{map = #map}> : (index, index) -> index
      %4 = "test.reify_bound"(%3) <{type = "UB"}> : (index) -> index
      "test.some_use"(%4) : (index) -> ()
      %5 = "affine.apply"(%3) <{map = #map1}> : (index) -> index
      %6 = "test.reify_bound"(%5) <{type = "UB"}> : (index) -> index
      "test.some_use"(%6) : (index) -> ()
      %7 = "test.reify_bound"(%5) <{constant, type = "UB"}> : (index) -> index
      "test.some_use"(%7) : (index) -> ()
      "scf.for"(%5, %3, %2) ({
      ^bb0(%arg8: index):
        %8 = "affine.apply"(%arg8, %3) <{map = #map2}> : (index, index) -> index
        %9 = "test.reify_bound"(%8) <{type = "UB"}> : (index) -> index
        "test.some_use"(%9) : (index) -> ()
        "scf.for"(%0, %arg3, %1) ({
        ^bb0(%arg9: index):
          %10 = "tensor.extract_slice"(%arg4, %arg9) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: 0, -9223372036854775808>, static_sizes = array<i64: 1, 1>, static_strides = array<i64: 1, 1>}> : (tensor<1x?xi8>, index) -> tensor<1x1xi8>
          %11 = "tensor.extract_slice"(%arg5, %arg9, %8) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: -9223372036854775808, 0>, static_sizes = array<i64: 1, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (tensor<?x?xi8>, index, index) -> tensor<1x?xi8>
          %12 = "tensor.extract_slice"(%arg6, %8) <{operandSegmentSizes = array<i32: 1, 0, 1, 0>, static_offsets = array<i64: 0, 0>, static_sizes = array<i64: 1, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (tensor<1x?xi32>, index) -> tensor<1x?xi32>
          %13 = "linalg.matmul"(%10, %11, %12) <{indexing_maps = [#map3, #map4, #map5], operandSegmentSizes = array<i32: 2, 1>}> ({
          ^bb0(%arg10: i8, %arg11: i8, %arg12: i32):
            %16 = "arith.extsi"(%arg10) : (i8) -> i32
            %17 = "arith.extsi"(%arg11) : (i8) -> i32
            %18 = "arith.muli"(%16, %17) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
            %19 = "arith.addi"(%arg12, %18) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
            "linalg.yield"(%19) : (i32) -> ()
          }) : (tensor<1x1xi8>, tensor<1x?xi8>, tensor<1x?xi32>) -> tensor<1x?xi32>
          %14 = "test.reify_bound"(%13) <{dim = 1 : i64, type = "UB"}> : (tensor<1x?xi32>) -> index
          "test.some_use"(%14) : (index) -> ()
          %15 = "test.reify_bound"(%13) <{constant, dim = 1 : i64, type = "UB"}> : (tensor<1x?xi32>) -> index
          "test.some_use"(%15) : (index) -> ()
          "scf.yield"() : () -> ()
        }) : (index, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

