"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index) -> (), sym_name = "make_alloca_loop_independent"}> ({
  ^bb0(%arg1: index, %arg2: index, %arg3: index):
    %2 = "arith.constant"() <{value = 5.500000e+00 : f32}> : () -> f32
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index
    "scf.for"(%arg1, %arg2, %arg3) ({
    ^bb0(%arg4: index):
      %4 = "memref.alloca"(%arg4) <{operandSegmentSizes = array<i32: 1, 0>}> : (index) -> memref<?xf32>
      %5 = "memref.subview"(%4) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 1>, static_sizes = array<i64: 5>, static_strides = array<i64: 1>}> : (memref<?xf32>) -> memref<5xf32, strided<[1], offset: 1>>
      "test.some_use"(%5) : (memref<5xf32, strided<[1], offset: 1>>) -> ()
      %6 = "test.another_use"(%4) : (memref<?xf32>) -> memref<?xf32>
      "memref.store"(%2, %4, %3) : (f32, memref<?xf32>, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["memref.alloca"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.memref.make_loop_independent"(%0) <{num_loops = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0)[s0] -> (-d0 + s0)>
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> (), sym_name = "make_alloca_loop_independent_static"}> ({
  ^bb0(%arg1: index):
    %2 = "arith.constant"() <{value = 5.500000e+00 : f32}> : () -> f32
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index
    %4 = "arith.constant"() <{value = 128 : index}> : () -> index
    "scf.for"(%3, %4, %arg1) ({
    ^bb0(%arg2: index):
      %5 = "affine.apply"(%arg2, %4) <{map = #map}> : (index, index) -> index
      %6 = "memref.alloca"(%5) <{operandSegmentSizes = array<i32: 1, 0>}> : (index) -> memref<?xf32>
      "memref.store"(%2, %6, %3) : (f32, memref<?xf32>, index) -> ()
      %7 = "memref.dim"(%6, %3) : (memref<?xf32>, index) -> index
      "vector.print"(%7) <{punctuation = #vector.punctuation<newline>}> : (index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["memref.alloca"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.memref.make_loop_independent"(%0) <{num_loops = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

