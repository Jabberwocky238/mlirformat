"builtin.module"() ({
  "func.func"() <{function_type = (memref<2xf32>) -> (), sym_name = "no_side_effects"}> ({
  ^bb0(%arg0: memref<2xf32>):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> {test.ptr = "alloc"} : () -> memref<8x64xf32>
    "memref.dealloc"(%0) {test.ptr = "dealloc"} : (memref<8x64xf32>) -> ()
    "func.return"() {test.ptr = "return"} : () -> ()
  }) {test.ptr = "func"} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<i32>, i32) -> (), sym_name = "simple"}> ({
  ^bb0(%arg0: memref<i32>, %arg1: i32):
    %0 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> {test.ptr = "alloc"} : () -> memref<i32>
    "memref.store"(%arg1, %0) {test.ptr = "store"} : (i32, memref<i32>) -> ()
    %1 = "memref.load"(%0) {test.ptr = "load"} : (memref<i32>) -> i32
    "func.return"() {test.ptr = "return"} : () -> ()
  }) {test.ptr = "func"} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<i32>, memref<i32>, i32) -> (), sym_name = "mayalias"}> ({
  ^bb0(%arg0: memref<i32>, %arg1: memref<i32>, %arg2: i32):
    "memref.store"(%arg2, %arg1) {test.ptr = "store"} : (i32, memref<i32>) -> ()
    %0 = "memref.load"(%arg1) {test.ptr = "load"} : (memref<i32>) -> i32
    "func.return"() {test.ptr = "return"} : () -> ()
  }) {test.ptr = "func"} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<i32>, memref<i32>, i1, i32) -> (), sym_name = "recursive"}> ({
  ^bb0(%arg0: memref<i32>, %arg1: memref<i32>, %arg2: i1, %arg3: i32):
    %0 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> {test.ptr = "alloc"} : () -> memref<i32>
    "scf.if"(%arg2) ({
      "memref.store"(%arg3, %arg0) : (i32, memref<i32>) -> ()
      %1 = "memref.load"(%arg0) : (memref<i32>) -> i32
      "scf.yield"() : () -> ()
    }, {
    }) {test.ptr = "if"} : (i1) -> ()
    "func.return"() {test.ptr = "return"} : () -> ()
  }) {test.ptr = "func"} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<i32>) -> (), sym_name = "unknown"}> ({
  ^bb0(%arg0: memref<i32>):
    "foo.op"() {test.ptr = "unknown"} : () -> ()
    "func.return"() : () -> ()
  }) {test.ptr = "func"} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<2xf32>) -> (), sym_name = "nonaddressable_write"}> ({
  ^bb0(%arg0: memref<2xf32>):
    %0 = "test.side_effect_op"() {effects = [{effect = "write", test_nonaddressable_resource}], test.ptr = "side_effect_op"} : () -> i32
    "func.return"() {test.ptr = "return"} : () -> ()
  }) {test.ptr = "func"} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<2xf32>) -> (), sym_name = "addressable_write"}> ({
  ^bb0(%arg0: memref<2xf32>):
    %0 = "test.side_effect_op"() {effects = [{effect = "write"}], test.ptr = "side_effect_op"} : () -> i32
    "func.return"() {test.ptr = "return"} : () -> ()
  }) {test.ptr = "func"} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<2xf32>) -> (), sym_name = "conditional_no_effects"}> ({
  ^bb0(%arg0: memref<2xf32>):
    %0 = "test.conditional_side_effect_op"() <{has_effects = false}> {test.ptr = "conditional_side_effect_op"} : () -> i32
    "func.return"() {test.ptr = "return"} : () -> ()
  }) {test.ptr = "func"} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<2xf32>) -> (), sym_name = "conditional_all_effects"}> ({
  ^bb0(%arg0: memref<2xf32>):
    %0 = "test.conditional_side_effect_op"() <{has_effects = true}> {test.ptr = "conditional_side_effect_op"} : () -> i32
    "func.return"() {test.ptr = "return"} : () -> ()
  }) {test.ptr = "func"} : () -> ()
}) : () -> ()

