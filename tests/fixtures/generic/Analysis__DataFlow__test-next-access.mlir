"builtin.module"() ({
  "func.func"() <{function_type = (memref<f32>, f32) -> f32, sym_name = "trivial"}> ({
  ^bb0(%arg31: memref<f32>, %arg32: f32):
    "memref.store"(%arg32, %arg31) {name = "store"} : (f32, memref<f32>) -> ()
    %58 = "memref.load"(%arg31) {name = "load"} : (memref<f32>) -> f32
    "func.return"(%58) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<f32>, f32) -> f32, sym_name = "chain"}> ({
  ^bb0(%arg29: memref<f32>, %arg30: f32):
    "memref.store"(%arg30, %arg29) {name = "store"} : (f32, memref<f32>) -> ()
    %55 = "memref.load"(%arg29) {name = "load 1"} : (memref<f32>) -> f32
    %56 = "memref.load"(%arg29) {name = "load 2"} : (memref<f32>) -> f32
    %57 = "arith.addf"(%55, %56) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    "func.return"(%57) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<f32>, f32, i1) -> f32, sym_name = "branch"}> ({
  ^bb0(%arg26: memref<f32>, %arg27: f32, %arg28: i1):
    "memref.store"(%arg27, %arg26) {name = "store"} : (f32, memref<f32>) -> ()
    "cf.cond_br"(%arg28)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb1:  // pred: ^bb0
    %52 = "memref.load"(%arg26) {name = "load 1"} : (memref<f32>) -> f32
    "cf.br"(%52)[^bb3] : (f32) -> ()
  ^bb2:  // pred: ^bb0
    %53 = "memref.load"(%arg26) {name = "load 2"} : (memref<f32>) -> f32
    "cf.br"(%53)[^bb3] : (f32) -> ()
  ^bb3(%54: f32):  // 2 preds: ^bb1, ^bb2
    "func.return"(%54) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<f32>, f32) -> f32, sym_name = "dead_branch"}> ({
  ^bb0(%arg24: memref<f32>, %arg25: f32):
    "memref.store"(%arg25, %arg24) {name = "store"} : (f32, memref<f32>) -> ()
    "cf.br"()[^bb2] : () -> ()
  ^bb1:  // no predecessors
    %49 = "memref.load"(%arg24) {name = "load 1"} : (memref<f32>) -> f32
    "cf.br"(%49)[^bb3] : (f32) -> ()
  ^bb2:  // pred: ^bb0
    %50 = "memref.load"(%arg24) {name = "load 2"} : (memref<f32>) -> f32
    "cf.br"(%50)[^bb3] : (f32) -> ()
  ^bb3(%51: f32):  // 2 preds: ^bb1, ^bb2
    "func.return"(%51) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xf32>, f32, index, index, index) -> f32, sym_name = "loop"}> ({
  ^bb0(%arg17: memref<?xf32>, %arg18: f32, %arg19: index, %arg20: index, %arg21: index):
    %42 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %43 = "memref.load"(%arg17, %arg21) {name = "pre"} : (memref<?xf32>, index) -> f32
    %44 = "scf.for"(%arg19, %arg20, %arg21, %42) ({
    ^bb0(%arg22: index, %arg23: f32):
      %47 = "memref.load"(%arg17, %arg22) {name = "loop"} : (memref<?xf32>, index) -> f32
      %48 = "arith.addf"(%arg23, %47) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "scf.yield"(%48) : (f32) -> ()
    }) : (index, index, index, f32) -> f32
    %45 = "memref.load"(%arg17, %arg20) {name = "outside"} : (memref<?xf32>, index) -> f32
    %46 = "arith.addf"(%45, %44) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    "func.return"(%46) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i1, memref<f32>) -> (), sym_name = "conditional"}> ({
  ^bb0(%arg15: i1, %arg16: memref<f32>):
    %39 = "memref.load"(%arg16) {name = "pre"} : (memref<f32>) -> f32
    "scf.if"(%arg15) ({
      %41 = "memref.load"(%arg16) {name = "then"} : (memref<f32>) -> f32
      "scf.yield"() : () -> ()
    }, {
    }) : (i1) -> ()
    %40 = "memref.load"(%arg16) {name = "post"} : (memref<f32>) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i1, memref<f32>) -> (), sym_name = "two_sided_conditional"}> ({
  ^bb0(%arg13: i1, %arg14: memref<f32>):
    %35 = "memref.load"(%arg14) {name = "pre"} : (memref<f32>) -> f32
    "scf.if"(%arg13) ({
      %38 = "memref.load"(%arg14) {name = "then"} : (memref<f32>) -> f32
      "scf.yield"() : () -> ()
    }, {
      %37 = "memref.load"(%arg14) {name = "else"} : (memref<f32>) -> f32
      "scf.yield"() : () -> ()
    }) : (i1) -> ()
    %36 = "memref.load"(%arg14) {name = "post"} : (memref<f32>) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<f32>) -> (), sym_name = "dead_conditional"}> ({
  ^bb0(%arg12: memref<f32>):
    %31 = "arith.constant"() <{value = false}> : () -> i1
    %32 = "memref.load"(%arg12) {name = "pre"} : (memref<f32>) -> f32
    "scf.if"(%31) ({
      %34 = "memref.load"(%arg12) {name = "then"} : (memref<f32>) -> f32
      "scf.yield"() : () -> ()
    }, {
    }) : (i1) -> ()
    %33 = "memref.load"(%arg12) {name = "post"} : (memref<f32>) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<f32>) -> (), sym_name = "known_conditional"}> ({
  ^bb0(%arg11: memref<f32>):
    %26 = "arith.constant"() <{value = false}> : () -> i1
    %27 = "memref.load"(%arg11) {name = "pre"} : (memref<f32>) -> f32
    "scf.if"(%26) ({
      %30 = "memref.load"(%arg11) {name = "then"} : (memref<f32>) -> f32
      "scf.yield"() : () -> ()
    }, {
      %29 = "memref.load"(%arg11) {name = "else"} : (memref<f32>) -> f32
      "scf.yield"() : () -> ()
    }) : (i1) -> ()
    %28 = "memref.load"(%arg11) {name = "post"} : (memref<f32>) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xf32>, f32, index, index, index) -> f32, sym_name = "loop_cf"}> ({
  ^bb0(%arg6: memref<?xf32>, %arg7: f32, %arg8: index, %arg9: index, %arg10: index):
    %16 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %17 = "memref.load"(%arg6, %arg10) {name = "pre"} : (memref<?xf32>, index) -> f32
    "cf.br"(%arg8, %16)[^bb1] : (index, f32) -> ()
  ^bb1(%18: index, %19: f32):  // 2 preds: ^bb0, ^bb2
    %20 = "arith.cmpi"(%18, %arg9) <{predicate = 2 : i64}> : (index, index) -> i1
    "cf.cond_br"(%20)[^bb2, ^bb3] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb2:  // pred: ^bb1
    %21 = "memref.load"(%arg6, %18) {name = "loop"} : (memref<?xf32>, index) -> f32
    %22 = "arith.addf"(%19, %21) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    %23 = "arith.addi"(%18, %arg10) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    "cf.br"(%23, %22)[^bb1] : (index, f32) -> ()
  ^bb3:  // pred: ^bb1
    %24 = "memref.load"(%arg6, %arg9) {name = "outside"} : (memref<?xf32>, index) -> f32
    %25 = "arith.addf"(%24, %19) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    "func.return"(%25) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i1, memref<f32>) -> (), sym_name = "conditional_cf"}> ({
  ^bb0(%arg4: i1, %arg5: memref<f32>):
    %13 = "memref.load"(%arg5) {name = "pre"} : (memref<f32>) -> f32
    "cf.cond_br"(%arg4)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb1:  // pred: ^bb0
    %14 = "memref.load"(%arg5) {name = "then"} : (memref<f32>) -> f32
    "cf.br"()[^bb2] : () -> ()
  ^bb2:  // 2 preds: ^bb0, ^bb1
    %15 = "memref.load"(%arg5) {name = "post"} : (memref<f32>) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i1, memref<f32>) -> (), sym_name = "two_sided_conditional_cf"}> ({
  ^bb0(%arg2: i1, %arg3: memref<f32>):
    %9 = "memref.load"(%arg3) {name = "pre"} : (memref<f32>) -> f32
    "cf.cond_br"(%arg2)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb1:  // pred: ^bb0
    %10 = "memref.load"(%arg3) {name = "then"} : (memref<f32>) -> f32
    "cf.br"()[^bb3] : () -> ()
  ^bb2:  // pred: ^bb0
    %11 = "memref.load"(%arg3) {name = "else"} : (memref<f32>) -> f32
    "cf.br"()[^bb3] : () -> ()
  ^bb3:  // 2 preds: ^bb1, ^bb2
    %12 = "memref.load"(%arg3) {name = "post"} : (memref<f32>) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<f32>) -> (), sym_name = "dead_conditional_cf"}> ({
  ^bb0(%arg1: memref<f32>):
    %5 = "arith.constant"() <{value = false}> : () -> i1
    %6 = "memref.load"(%arg1) {name = "pre"} : (memref<f32>) -> f32
    "cf.cond_br"(%5)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb1:  // pred: ^bb0
    %7 = "memref.load"(%arg1) {name = "then"} : (memref<f32>) -> f32
    "cf.br"()[^bb2] : () -> ()
  ^bb2:  // 2 preds: ^bb0, ^bb1
    %8 = "memref.load"(%arg1) {name = "post"} : (memref<f32>) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<f32>) -> (), sym_name = "known_conditional_cf"}> ({
  ^bb0(%arg0: memref<f32>):
    %0 = "arith.constant"() <{value = false}> : () -> i1
    %1 = "memref.load"(%arg0) {name = "pre"} : (memref<f32>) -> f32
    "cf.cond_br"(%0)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb1:  // pred: ^bb0
    %2 = "memref.load"(%arg0) {name = "then"} : (memref<f32>) -> f32
    "cf.br"()[^bb3] : () -> ()
  ^bb2:  // pred: ^bb0
    %3 = "memref.load"(%arg0) {name = "else"} : (memref<f32>) -> f32
    "cf.br"()[^bb3] : () -> ()
  ^bb3:  // 2 preds: ^bb1, ^bb2
    %4 = "memref.load"(%arg0) {name = "post"} : (memref<f32>) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<f32>) -> (), sym_name = "callee1", sym_visibility = "private"}> ({
  ^bb0(%arg2: memref<f32>):
    %3 = "memref.load"(%arg2) {name = "callee1"} : (memref<f32>) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<f32>) -> (), sym_name = "callee2", sym_visibility = "private"}> ({
  ^bb0(%arg1: memref<f32>):
    %2 = "memref.load"(%arg1) {name = "callee2"} : (memref<f32>) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<f32>) -> (), sym_name = "simple_call"}> ({
  ^bb0(%arg0: memref<f32>):
    %0 = "memref.load"(%arg0) {name = "caller"} : (memref<f32>) -> f32
    "func.call"(%arg0) <{callee = @callee1}> {name = "call"} : (memref<f32>) -> ()
    %1 = "memref.load"(%arg0) {name = "post"} : (memref<f32>) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<f32>) -> (), sym_name = "infinite_recursive_call"}> ({
  ^bb0(%arg0: memref<f32>):
    %0 = "memref.load"(%arg0) {name = "pre"} : (memref<f32>) -> f32
    "func.call"(%arg0) <{callee = @infinite_recursive_call}> {name = "call"} : (memref<f32>) -> ()
    %1 = "memref.load"(%arg0) {name = "post"} : (memref<f32>) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<f32>, i1) -> (), sym_name = "recursive_call"}> ({
  ^bb0(%arg0: memref<f32>, %arg1: i1):
    %0 = "memref.load"(%arg0) {name = "pre"} : (memref<f32>) -> f32
    "scf.if"(%arg1) ({
      "func.call"(%arg0, %arg1) <{callee = @recursive_call}> {name = "call"} : (memref<f32>, i1) -> ()
      "scf.yield"() : () -> ()
    }, {
    }) : (i1) -> ()
    %1 = "memref.load"(%arg0) {name = "post"} : (memref<f32>) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<f32>, i1) -> (), sym_name = "recursive_call_cf"}> ({
  ^bb0(%arg0: memref<f32>, %arg1: i1):
    %0 = "memref.load"(%arg0) {name = "pre"} : (memref<f32>) -> f32
    "cf.cond_br"(%arg1)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb1:  // pred: ^bb0
    "func.call"(%arg0, %arg1) <{callee = @recursive_call_cf}> {name = "call"} : (memref<f32>, i1) -> ()
    "cf.br"()[^bb2] : () -> ()
  ^bb2:  // 2 preds: ^bb0, ^bb1
    %1 = "memref.load"(%arg0) {name = "post"} : (memref<f32>) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<f32>) -> (), sym_name = "callee1", sym_visibility = "private"}> ({
  ^bb0(%arg3: memref<f32>):
    %3 = "memref.load"(%arg3) {name = "callee1"} : (memref<f32>) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<f32>) -> (), sym_name = "callee2", sym_visibility = "private"}> ({
  ^bb0(%arg2: memref<f32>):
    %2 = "memref.load"(%arg2) {name = "callee2"} : (memref<f32>) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<f32>, i1) -> (), sym_name = "conditonal_call"}> ({
  ^bb0(%arg0: memref<f32>, %arg1: i1):
    %0 = "memref.load"(%arg0) {name = "pre"} : (memref<f32>) -> f32
    "scf.if"(%arg1) ({
      "func.call"(%arg0) <{callee = @callee1}> {name = "call1"} : (memref<f32>) -> ()
      "scf.yield"() : () -> ()
    }, {
      "func.call"(%arg0) <{callee = @callee2}> {name = "call2"} : (memref<f32>) -> ()
      "scf.yield"() : () -> ()
    }) : (i1) -> ()
    %1 = "memref.load"(%arg0) {name = "post"} : (memref<f32>) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<f32>) -> (), sym_name = "callee", sym_visibility = "private"}> ({
  ^bb0(%arg1: memref<f32>):
    %2 = "memref.load"(%arg1) {name = "callee"} : (memref<f32>) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<f32>) -> (), sym_name = "call_and_store_before"}> ({
  ^bb0(%arg0: memref<f32>):
    %0 = "memref.load"(%arg0) {name = "caller"} : (memref<f32>) -> f32
    "test.call_and_store"(%arg0, %arg0) <{callee = @callee, store_before_call = true}> {name = "call"} : (memref<f32>, memref<f32>) -> ()
    %1 = "memref.load"(%arg0) {name = "post"} : (memref<f32>) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<f32>) -> (), sym_name = "callee", sym_visibility = "private"}> ({
  ^bb0(%arg1: memref<f32>):
    %2 = "memref.load"(%arg1) {name = "callee"} : (memref<f32>) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<f32>) -> (), sym_name = "call_and_store_after"}> ({
  ^bb0(%arg0: memref<f32>):
    %0 = "memref.load"(%arg0) {name = "caller"} : (memref<f32>) -> f32
    "test.call_and_store"(%arg0, %arg0) <{callee = @callee, store_before_call = false}> {name = "call"} : (memref<f32>, memref<f32>) -> ()
    %1 = "memref.load"(%arg0) {name = "post"} : (memref<f32>) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<f32>) -> (), sym_name = "store_with_a_region_before"}> ({
  ^bb0(%arg3: memref<f32>):
    %8 = "memref.load"(%arg3) {name = "pre"} : (memref<f32>) -> f32
    "test.store_with_a_region"(%arg3) <{store_before_region = true}> ({
      "test.store_with_a_region_terminator"() : () -> ()
    }) {name = "region"} : (memref<f32>) -> ()
    %9 = "memref.load"(%arg3) {name = "post"} : (memref<f32>) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<f32>) -> (), sym_name = "store_with_a_region_after"}> ({
  ^bb0(%arg2: memref<f32>):
    %6 = "memref.load"(%arg2) {name = "pre"} : (memref<f32>) -> f32
    "test.store_with_a_region"(%arg2) <{store_before_region = false}> ({
      "test.store_with_a_region_terminator"() : () -> ()
    }) {name = "region"} : (memref<f32>) -> ()
    %7 = "memref.load"(%arg2) {name = "post"} : (memref<f32>) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<f32>) -> (), sym_name = "store_with_a_region_before_containing_a_load"}> ({
  ^bb0(%arg1: memref<f32>):
    %3 = "memref.load"(%arg1) {name = "pre"} : (memref<f32>) -> f32
    "test.store_with_a_region"(%arg1) <{store_before_region = true}> ({
      %5 = "memref.load"(%arg1) {name = "inner"} : (memref<f32>) -> f32
      "test.store_with_a_region_terminator"() : () -> ()
    }) {name = "region"} : (memref<f32>) -> ()
    %4 = "memref.load"(%arg1) {name = "post"} : (memref<f32>) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<f32>) -> (), sym_name = "store_with_a_region_after_containing_a_load"}> ({
  ^bb0(%arg0: memref<f32>):
    %0 = "memref.load"(%arg0) {name = "pre"} : (memref<f32>) -> f32
    "test.store_with_a_region"(%arg0) <{store_before_region = false}> ({
      %2 = "memref.load"(%arg0) {name = "inner"} : (memref<f32>) -> f32
      "test.store_with_a_region_terminator"() : () -> ()
    }) {name = "region"} : (memref<f32>) -> ()
    %1 = "memref.load"(%arg0) {name = "post"} : (memref<f32>) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<f32>) -> (), sym_name = "opaque_callee", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (memref<f32>) -> (), sym_name = "call_opaque_callee"}> ({
  ^bb0(%arg0: memref<f32>):
    %0 = "memref.load"(%arg0) {name = "pre"} : (memref<f32>) -> f32
    "func.call"(%arg0) <{callee = @opaque_callee}> {name = "call"} : (memref<f32>) -> ()
    %1 = "memref.load"(%arg0) {name = "post"} : (memref<f32>) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<f32>, (memref<f32>) -> ()) -> (), sym_name = "indirect_call"}> ({
  ^bb0(%arg0: memref<f32>, %arg1: (memref<f32>) -> ()):
    %0 = "memref.load"(%arg0) {name = "pre"} : (memref<f32>) -> f32
    "func.call_indirect"(%arg1, %arg0) {name = "call"} : ((memref<f32>) -> (), memref<f32>) -> ()
    %1 = "memref.load"(%arg0) {name = "post"} : (memref<f32>) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

