"builtin.module"() ({
  "func.func"() <{function_type = (memref<2xf32>, memref<2xf32>) -> (), sym_name = "simple"}> ({
  ^bb0(%arg0: memref<2xf32>, %arg1: memref<2xf32>):
    %0 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> {test.ptr = "alloca_1"} : () -> memref<8x64xf32>
    %1 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> {test.ptr = "alloca_2"} : () -> memref<8x64xf32>
    %2 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> {test.ptr = "alloc_1"} : () -> memref<8x64xf32>
    %3 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> {test.ptr = "alloc_2"} : () -> memref<8x64xf32>
    "func.return"() : () -> ()
  }) {test.ptr = "func"} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<2xf32>, i1) -> (), sym_name = "control_flow"}> ({
  ^bb0(%arg0: memref<2xf32>, %arg1: i1):
    %0 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> {test.ptr = "alloca_1"} : () -> memref<8x64xf32>
    %1 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> {test.ptr = "alloca_2"} : () -> memref<8x64xf32>
    %2 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> {test.ptr = "alloc_1"} : () -> memref<8x64xf32>
    "cf.cond_br"(%arg1, %0, %0)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 1, 1>}> : (i1, memref<8x64xf32>, memref<8x64xf32>) -> ()
  ^bb1(%3: memref<8x64xf32>):  // pred: ^bb0
    "cf.br"(%3)[^bb2] : (memref<8x64xf32>) -> ()
  ^bb2(%4: memref<8x64xf32>):  // 2 preds: ^bb0, ^bb1
    "func.return"() : () -> ()
  }) {test.ptr = "func"} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<2xf32>, i1) -> (), sym_name = "control_flow_merge"}> ({
  ^bb0(%arg0: memref<2xf32>, %arg1: i1):
    %0 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> {test.ptr = "alloca_1"} : () -> memref<8x64xf32>
    %1 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> {test.ptr = "alloca_2"} : () -> memref<8x64xf32>
    %2 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> {test.ptr = "alloc_1"} : () -> memref<8x64xf32>
    "cf.cond_br"(%arg1, %0, %2)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 1, 1>}> : (i1, memref<8x64xf32>, memref<8x64xf32>) -> ()
  ^bb1(%3: memref<8x64xf32>):  // pred: ^bb0
    "cf.br"(%3)[^bb2] : (memref<8x64xf32>) -> ()
  ^bb2(%4: memref<8x64xf32>):  // 2 preds: ^bb0, ^bb1
    "func.return"() : () -> ()
  }) {test.ptr = "func"} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<2xf32>, i1) -> (), sym_name = "region_control_flow"}> ({
  ^bb0(%arg0: memref<2xf32>, %arg1: i1):
    %0 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> {test.ptr = "alloca_1"} : () -> memref<8x64xf32>
    %1 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> {test.ptr = "alloca_2"} : () -> memref<8x64xf32>
    %2 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> {test.ptr = "alloc_1"} : () -> memref<8x64xf32>
    %3 = "scf.if"(%arg1) ({
      "scf.yield"(%0) : (memref<8x64xf32>) -> ()
    }, {
      "scf.yield"(%0) : (memref<8x64xf32>) -> ()
    }) {test.ptr = "if_alloca"} : (i1) -> memref<8x64xf32>
    %4 = "scf.if"(%arg1) ({
      "scf.yield"(%0) : (memref<8x64xf32>) -> ()
    }, {
      "scf.yield"(%1) : (memref<8x64xf32>) -> ()
    }) {test.ptr = "if_alloca_merge"} : (i1) -> memref<8x64xf32>
    %5 = "scf.if"(%arg1) ({
      "scf.yield"(%2) : (memref<8x64xf32>) -> ()
    }, {
      "scf.yield"(%2) : (memref<8x64xf32>) -> ()
    }) {test.ptr = "if_alloc"} : (i1) -> memref<8x64xf32>
    "func.return"() : () -> ()
  }) {test.ptr = "func"} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<2xf32>, index, index, index) -> (), sym_name = "region_loop_control_flow"}> ({
  ^bb0(%arg0: memref<2xf32>, %arg1: index, %arg2: index, %arg3: index):
    %0 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> {test.ptr = "alloca_1"} : () -> memref<8x64xf32>
    %1 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> {test.ptr = "alloca_2"} : () -> memref<8x64xf32>
    %2 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> {test.ptr = "alloc_1"} : () -> memref<8x64xf32>
    %3 = "scf.for"(%arg1, %arg2, %arg3, %0) ({
    ^bb0(%arg4: index, %arg5: memref<8x64xf32>):
      "scf.yield"(%arg5) : (memref<8x64xf32>) -> ()
    }) {test.ptr = "for_alloca"} : (index, index, index, memref<8x64xf32>) -> memref<8x64xf32>
    "func.return"() : () -> ()
  }) {test.ptr = "func"} : () -> ()
}) : () -> ()

// -----
#map = affine_map<() -> (0)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "region_loop_zero_trip_count"}> ({
    %0 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> {test.ptr = "alloca_1"} : () -> memref<i32>
    %1 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> {test.ptr = "alloca_2"} : () -> memref<i32>
    %2 = "affine.for"(%0) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 1>, step = 1 : index, upperBoundMap = #map}> ({
    ^bb0(%arg0: index, %arg1: memref<i32>):
      "affine.yield"(%arg1) : (memref<i32>) -> ()
    }) {test.ptr = "for_alloca"} : (memref<i32>) -> memref<i32>
    "func.return"() : () -> ()
  }) {test.ptr = "func"} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<2xf32>, index) -> (), sym_name = "view_like"}> ({
  ^bb0(%arg0: memref<2xf32>, %arg1: index):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> {test.ptr = "alloc_1"} : () -> memref<8x64xf32>
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "memref.alloca"(%arg1) <{operandSegmentSizes = array<i32: 1, 0>}> {test.ptr = "alloca_1"} : (index) -> memref<?xi8>
    %3 = "memref.view"(%2, %1) {test.ptr = "view"} : (memref<?xi8>, index) -> memref<8x64xf32>
    "func.return"() : () -> ()
  }) {test.ptr = "func"} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<2xf32>) -> (), sym_name = "constants"}> ({
  ^bb0(%arg0: memref<2xf32>):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> {test.ptr = "alloc_1"} : () -> memref<8x64xf32>
    %1 = "arith.constant"() <{value = 0 : index}> {test.ptr = "constant_1"} : () -> index
    %2 = "arith.constant"() <{value = 0 : index}> {test.ptr = "constant_2"} : () -> index
    %3 = "arith.constant"() <{value = 1 : index}> {test.ptr = "constant_3"} : () -> index
    "func.return"() : () -> ()
  }) {test.ptr = "func"} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xf32>, memref<?xf32>) -> (), sym_name = "distinct_objects"}> ({
  ^bb0(%arg0: memref<?xf32>, %arg1: memref<?xf32>):
    %0:2 = "memref.distinct_objects"(%arg0, %arg1) {test.ptr = "distinct"} : (memref<?xf32>, memref<?xf32>) -> (memref<?xf32>, memref<?xf32>)
    "func.return"() : () -> ()
  }) {test.ptr = "func"} : () -> ()
}) : () -> ()

