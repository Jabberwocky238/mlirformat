"builtin.module"() ({
  "func.func"() <{function_type = (memref<i32>) -> memref<i32>, sym_name = "single_callsite_fn", sym_visibility = "private"}> ({
  ^bb0(%arg11: memref<i32>):
    "func.return"(%arg11) {tag = "test_callsite"} : (memref<i32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_callsite"}> ({
    %5 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<i32>
    %6 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    "memref.store"(%6, %5) {tag_name = "a"} : (i32, memref<i32>) -> ()
    %7 = "func.call"(%5) <{callee = @single_callsite_fn}> : (memref<i32>) -> memref<i32>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<i32>) -> memref<i32>, sym_name = "single_return_site_fn", sym_visibility = "private"}> ({
  ^bb0(%arg10: memref<i32>):
    %4 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    "memref.store"(%4, %arg10) {tag_name = "b"} : (i32, memref<i32>) -> ()
    "func.return"(%arg10) : (memref<i32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<i32>) -> memref<i32>, sym_name = "test_return_site"}> ({
  ^bb0(%arg9: memref<i32>):
    %3 = "func.call"(%arg9) <{callee = @single_return_site_fn}> : (memref<i32>) -> memref<i32>
    "func.return"(%3) {tag = "test_return_site"} : (memref<i32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<i32>) -> memref<i32>, sym_name = "multiple_callsite_fn", sym_visibility = "private"}> ({
  ^bb0(%arg8: memref<i32>):
    "func.return"(%arg8) {tag = "test_multiple_callsites"} : (memref<i32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, memref<i32>) -> memref<i32>, sym_name = "test_multiple_callsites"}> ({
  ^bb0(%arg6: i32, %arg7: memref<i32>):
    "memref.store"(%arg6, %arg7) {tag_name = "write0"} : (i32, memref<i32>) -> ()
    %1 = "func.call"(%arg7) <{callee = @multiple_callsite_fn}> : (memref<i32>) -> memref<i32>
    "memref.store"(%arg6, %arg7) {tag_name = "write1"} : (i32, memref<i32>) -> ()
    %2 = "func.call"(%arg7) <{callee = @multiple_callsite_fn}> : (memref<i32>) -> memref<i32>
    "func.return"(%arg7) : (memref<i32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i1, i32, memref<i32>) -> memref<i32>, sym_name = "multiple_return_site_fn", sym_visibility = "private"}> ({
  ^bb0(%arg3: i1, %arg4: i32, %arg5: memref<i32>):
    "cf.cond_br"(%arg3)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb1:  // pred: ^bb0
    "memref.store"(%arg4, %arg5) {tag_name = "return0"} : (i32, memref<i32>) -> ()
    "func.return"(%arg5) : (memref<i32>) -> ()
  ^bb2:  // pred: ^bb0
    "memref.store"(%arg4, %arg5) {tag_name = "return1"} : (i32, memref<i32>) -> ()
    "func.return"(%arg5) : (memref<i32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i1, i32, memref<i32>) -> memref<i32>, sym_name = "test_multiple_return_sites"}> ({
  ^bb0(%arg0: i1, %arg1: i32, %arg2: memref<i32>):
    %0 = "func.call"(%arg0, %arg1, %arg2) <{callee = @multiple_return_site_fn}> : (i1, i32, memref<i32>) -> memref<i32>
    "func.return"(%0) {tag = "test_multiple_return_sites"} : (memref<i32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<i32>) -> (), sym_name = "void_return", sym_visibility = "private"}> ({
  ^bb0(%arg0: memref<i32>):
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_call_void_return"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<i32>
    %1 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    "memref.store"(%1, %0) {tag_name = "write0"} : (i32, memref<i32>) -> ()
    "func.call"(%0) <{callee = @void_return}> : (memref<i32>) -> ()
    %2 = "memref.load"(%0) {tag = "after_call"} : (memref<i32>) -> i32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<f32>) -> memref<f32>, sym_name = "callee", sym_visibility = "private"}> ({
  ^bb0(%arg1: memref<f32>):
    %4 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
    %5 = "memref.load"(%arg1) {tag = "call_and_store_before::enter_callee"} : (memref<f32>) -> f32
    "memref.store"(%4, %arg1) {tag_name = "callee"} : (f32, memref<f32>) -> ()
    %6 = "memref.load"(%arg1) {tag = "exit_callee"} : (memref<f32>) -> f32
    "func.return"(%arg1) : (memref<f32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<f32>) -> memref<f32>, sym_name = "call_and_store_before"}> ({
  ^bb0(%arg0: memref<f32>):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    "memref.store"(%0, %arg0) {tag_name = "pre"} : (f32, memref<f32>) -> ()
    %2 = "memref.load"(%arg0) {tag = "before_call"} : (memref<f32>) -> f32
    "test.call_and_store"(%arg0, %arg0) <{callee = @callee, store_before_call = true}> {tag_name = "call"} : (memref<f32>, memref<f32>) -> ()
    %3 = "memref.load"(%arg0) {tag = "after_call"} : (memref<f32>) -> f32
    "memref.store"(%1, %arg0) {tag_name = "post"} : (f32, memref<f32>) -> ()
    "func.return"(%arg0) {tag = "return"} : (memref<f32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<f32>) -> memref<f32>, sym_name = "callee", sym_visibility = "private"}> ({
  ^bb0(%arg1: memref<f32>):
    %4 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
    %5 = "memref.load"(%arg1) {tag = "call_and_store_after::enter_callee"} : (memref<f32>) -> f32
    "memref.store"(%4, %arg1) {tag_name = "callee"} : (f32, memref<f32>) -> ()
    %6 = "memref.load"(%arg1) {tag = "exit_callee"} : (memref<f32>) -> f32
    "func.return"(%arg1) : (memref<f32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<f32>) -> memref<f32>, sym_name = "call_and_store_after"}> ({
  ^bb0(%arg0: memref<f32>):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    "memref.store"(%0, %arg0) {tag_name = "pre"} : (f32, memref<f32>) -> ()
    %2 = "memref.load"(%arg0) {tag = "before_call"} : (memref<f32>) -> f32
    "test.call_and_store"(%arg0, %arg0) <{callee = @callee, store_before_call = false}> {tag_name = "call"} : (memref<f32>, memref<f32>) -> ()
    %3 = "memref.load"(%arg0) {tag = "after_call"} : (memref<f32>) -> f32
    "memref.store"(%1, %arg0) {tag_name = "post"} : (f32, memref<f32>) -> ()
    "func.return"(%arg0) {tag = "return"} : (memref<f32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<i32>) -> (), sym_name = "void_return", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_opaque_call_return"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<i32>
    %1 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    "memref.store"(%1, %0) {tag_name = "write0"} : (i32, memref<i32>) -> ()
    "func.call"(%0) <{callee = @void_return}> : (memref<i32>) -> ()
    %2 = "memref.load"(%0) {tag = "after_opaque_call"} : (memref<i32>) -> i32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

