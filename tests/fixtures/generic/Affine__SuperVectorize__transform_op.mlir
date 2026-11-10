#map = affine_map<(d0, d1) -> (d0, d0 + d1)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<()[s0] -> (s0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32>, memref<?x?x?xf32>) -> (), sym_name = "vec1d_3"}> ({
  ^bb0(%arg1: memref<?x?xf32>, %arg2: memref<?x?x?xf32>):
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    %3 = "arith.constant"() <{value = 2 : index}> : () -> index
    %4 = "memref.dim"(%arg1, %1) : (memref<?x?xf32>, index) -> index
    %5 = "memref.dim"(%arg1, %2) : (memref<?x?xf32>, index) -> index
    %6 = "memref.dim"(%arg2, %3) : (memref<?x?x?xf32>, index) -> index
    "affine.for"(%4) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg3: index):
      "affine.for"(%5) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg4: index):
        %7 = "affine.load"(%arg1, %arg4, %arg3) <{map = #map}> : (memref<?x?xf32>, index, index) -> f32
        "affine.yield"() : () -> ()
      }) : (index) -> ()
      "affine.yield"() : () -> ()
    }) : (index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["affine.for"]}> : (!transform.any_op) -> !transform.any_op
      "transform.affine.super_vectorize"(%0) <{vector_sizes = array<i64: 128>, vectorize_reductions = false}> : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32>, memref<?x?xf32>, memref<?x?xf32>) -> (), sym_name = "vectorize_matmul"}> ({
  ^bb0(%arg1: memref<?x?xf32>, %arg2: memref<?x?xf32>, %arg3: memref<?x?xf32>):
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    %3 = "memref.dim"(%arg1, %1) : (memref<?x?xf32>, index) -> index
    %4 = "memref.dim"(%arg1, %2) : (memref<?x?xf32>, index) -> index
    %5 = "memref.dim"(%arg3, %2) : (memref<?x?xf32>, index) -> index
    "affine.for"(%1, %3) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 1, 1, 0>, step = 1 : index, upperBoundMap = #map1}> ({
    ^bb0(%arg7: index):
      "affine.for"(%1, %5) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 1, 1, 0>, step = 1 : index, upperBoundMap = #map1}> ({
      ^bb0(%arg8: index):
        %11 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
        "affine.store"(%11, %arg3, %arg7, %arg8) <{map = #map}> : (f32, memref<?x?xf32>, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : (index, index) -> ()
      "affine.yield"() : () -> ()
    }) : (index, index) -> ()
    "affine.for"(%1, %3) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 1, 1, 0>, step = 1 : index, upperBoundMap = #map1}> ({
    ^bb0(%arg4: index):
      "affine.for"(%1, %5) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 1, 1, 0>, step = 1 : index, upperBoundMap = #map1}> ({
      ^bb0(%arg5: index):
        "affine.for"(%1, %4) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 1, 1, 0>, step = 1 : index, upperBoundMap = #map1}> ({
        ^bb0(%arg6: index):
          %6 = "affine.load"(%arg2, %arg6, %arg5) <{map = #map}> : (memref<?x?xf32>, index, index) -> f32
          %7 = "affine.load"(%arg1, %arg4, %arg6) <{map = #map}> : (memref<?x?xf32>, index, index) -> f32
          %8 = "arith.mulf"(%7, %6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
          %9 = "affine.load"(%arg3, %arg4, %arg5) <{map = #map}> : (memref<?x?xf32>, index, index) -> f32
          %10 = "arith.addf"(%9, %8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
          "affine.store"(%10, %arg3, %arg4, %arg5) <{map = #map}> : (f32, memref<?x?xf32>, index, index) -> ()
          "affine.yield"() : () -> ()
        }) : (index, index) -> ()
        "affine.yield"() : () -> ()
      }) : (index, index) -> ()
      "affine.yield"() : () -> ()
    }) : (index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["affine.for"]}> : (!transform.any_op) -> !transform.any_op
      "transform.affine.super_vectorize"(%0) <{vector_sizes = array<i64: 4, 8>, vectorize_reductions = false}> : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<()[s0] -> (s0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?x?xf32>) -> (), sym_name = "vec3d"}> ({
  ^bb0(%arg1: memref<?x?x?xf32>):
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    %3 = "arith.constant"() <{value = 2 : index}> : () -> index
    %4 = "memref.dim"(%arg1, %1) : (memref<?x?x?xf32>, index) -> index
    %5 = "memref.dim"(%arg1, %2) : (memref<?x?x?xf32>, index) -> index
    %6 = "memref.dim"(%arg1, %3) : (memref<?x?x?xf32>, index) -> index
    "affine.for"(%4) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg2: index):
      "affine.for"(%4) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg3: index):
        "affine.for"(%4) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map2}> ({
        ^bb0(%arg4: index):
          "affine.for"(%5) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map2}> ({
          ^bb0(%arg5: index):
            "affine.for"(%6) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map2}> ({
            ^bb0(%arg6: index):
              %7 = "affine.load"(%arg1, %arg4, %arg5, %arg6) <{map = #map}> : (memref<?x?x?xf32>, index, index, index) -> f32
              "affine.yield"() : () -> ()
            }) : (index) -> ()
            "affine.yield"() : () -> ()
          }) : (index) -> ()
          "affine.yield"() : () -> ()
        }) : (index) -> ()
        "affine.yield"() : () -> ()
      }) : (index) -> ()
      "affine.yield"() : () -> ()
    }) : (index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["affine.for"]}> : (!transform.any_op) -> !transform.any_op
      "transform.affine.super_vectorize"(%0) <{fastest_varying_pattern = array<i64: 2, 1, 0>, vector_sizes = array<i64: 32, 64, 256>, vectorize_reductions = false}> : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (512)>
#map3 = affine_map<(d0) -> (d0)>
#map4 = affine_map<() -> (256)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<256x512xf32>, memref<256xf32>) -> (), sym_name = "vecdim_reduction_minf"}> ({
  ^bb0(%arg1: memref<256x512xf32>, %arg2: memref<256xf32>):
    %1 = "arith.constant"() <{value = 0x7F800000 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg3: index):
      %2 = "affine.for"(%1) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 1>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg4: index, %arg5: f32):
        %3 = "affine.load"(%arg1, %arg3, %arg4) <{map = #map}> : (memref<256x512xf32>, index, index) -> f32
        %4 = "arith.minimumf"(%arg5, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "affine.yield"(%4) : (f32) -> ()
      }) : (f32) -> f32
      "affine.store"(%2, %arg2, %arg3) <{map = #map3}> : (f32, memref<256xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["affine.for"]}> : (!transform.any_op) -> !transform.any_op
      "transform.affine.super_vectorize"(%0) <{vector_sizes = array<i64: 128>, vectorize_reductions = true}> : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

