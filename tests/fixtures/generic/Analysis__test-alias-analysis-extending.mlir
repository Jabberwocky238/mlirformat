"builtin.module"() ({
  "func.func"() <{arg_attrs = [{}, {local_alias_analysis.restrict}], function_type = (memref<?xf32>, memref<?xf32>) -> (), sym_name = "restrict"}> ({
  ^bb0(%arg0: memref<?xf32>, %arg1: memref<?xf32>):
    %0 = "memref.subview"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: 2>, static_strides = array<i64: 1>}> {test.ptr = "view1"} : (memref<?xf32>) -> memref<2xf32>
    %1 = "memref.subview"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: 2>, static_strides = array<i64: 1>}> {test.ptr = "view2"} : (memref<?xf32>) -> memref<2xf32>
    "func.return"() : () -> ()
  }) {test.ptr = "func"} : () -> ()
}) : () -> ()

