"builtin.module"() ({
  "func.func"() <{function_type = (memref<i32>, memref<i32>) -> (memref<i32>, memref<i32>), sym_name = "test_simple_mod"}> ({
  ^bb0(%arg17: memref<i32>, %arg18: memref<i32>):
    %63 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %64 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    "memref.store"(%63, %arg17) {tag_name = "a"} : (i32, memref<i32>) -> ()
    "memref.store"(%64, %arg18) {tag_name = "b"} : (i32, memref<i32>) -> ()
    "func.return"(%arg17, %arg18) {tag = "test_simple_mod"} : (memref<i32>, memref<i32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<i32>) -> memref<i32>, sym_name = "test_simple_mod_overwrite"}> ({
  ^bb0(%arg16: memref<i32>):
    %61 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    "memref.store"(%61, %arg16) {tag = "test_simple_mod_overwrite_a", tag_name = "a"} : (i32, memref<i32>) -> ()
    %62 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    "memref.store"(%62, %arg16) {tag_name = "b"} : (i32, memref<i32>) -> ()
    "func.return"(%arg16) {tag = "test_simple_mod_overwrite_b"} : (memref<i32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i1, memref<i32>) -> memref<i32>, sym_name = "test_mod_control_flow"}> ({
  ^bb0(%arg14: i1, %arg15: memref<i32>):
    "cf.cond_br"(%arg14)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb1:  // pred: ^bb0
    %59 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    "memref.store"(%59, %arg15) {tag_name = "a"} : (i32, memref<i32>) -> ()
    "cf.br"()[^bb3] : () -> ()
  ^bb2:  // pred: ^bb0
    %60 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    "memref.store"(%60, %arg15) {tag_name = "b"} : (i32, memref<i32>) -> ()
    "cf.br"()[^bb3] : () -> ()
  ^bb3:  // 2 preds: ^bb1, ^bb2
    "func.return"(%arg15) {tag = "test_mod_control_flow"} : (memref<i32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, memref<i32>) -> memref<i32>, sym_name = "test_mod_dead_branch"}> ({
  ^bb0(%arg12: i32, %arg13: memref<i32>):
    %54 = "arith.subi"(%arg12, %arg12) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
    %55 = "arith.constant"() <{value = -1 : i32}> : () -> i32
    %56 = "arith.cmpi"(%54, %55) <{predicate = 4 : i64}> : (i32, i32) -> i1
    "cf.cond_br"(%56)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb1:  // pred: ^bb0
    %57 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    "memref.store"(%57, %arg13) {tag_name = "a"} : (i32, memref<i32>) -> ()
    "cf.br"()[^bb3] : () -> ()
  ^bb2:  // pred: ^bb0
    %58 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    "memref.store"(%58, %arg13) {tag_name = "b"} : (i32, memref<i32>) -> ()
    "cf.br"()[^bb3] : () -> ()
  ^bb3:  // 2 preds: ^bb1, ^bb2
    "func.return"(%arg13) {tag = "test_mod_dead_branch"} : (memref<i32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i1, memref<i32>) -> memref<i32>, sym_name = "test_mod_region_control_flow"}> ({
  ^bb0(%arg10: i1, %arg11: memref<i32>):
    "scf.if"(%arg10) ({
      %53 = "arith.constant"() <{value = 0 : i32}> : () -> i32
      "memref.store"(%53, %arg11) {tag_name = "then"} : (i32, memref<i32>) -> ()
      "scf.yield"() : () -> ()
    }, {
      %52 = "arith.constant"() <{value = 1 : i32}> : () -> i32
      "memref.store"(%52, %arg11) {tag_name = "else"} : (i32, memref<i32>) -> ()
      "scf.yield"() : () -> ()
    }) : (i1) -> ()
    "func.return"(%arg11) {tag = "test_mod_region_control_flow"} : (memref<i32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<i32>) -> memref<i32>, sym_name = "test_mod_dead_region"}> ({
  ^bb0(%arg9: memref<i32>):
    %49 = "arith.constant"() <{value = false}> : () -> i1
    "scf.if"(%49) ({
      %51 = "arith.constant"() <{value = 0 : i32}> : () -> i32
      "memref.store"(%51, %arg9) {tag_name = "then"} : (i32, memref<i32>) -> ()
      "scf.yield"() : () -> ()
    }, {
      %50 = "arith.constant"() <{value = 1 : i32}> : () -> i32
      "memref.store"(%50, %arg9) {tag_name = "else"} : (i32, memref<i32>) -> ()
      "scf.yield"() : () -> ()
    }) : (i1) -> ()
    "func.return"(%arg9) {tag = "test_mod_dead_region"} : (memref<i32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<i32>) -> memref<i32>, sym_name = "unknown_memory_effects"}> ({
  ^bb0(%arg8: memref<i32>):
    %48 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    "memref.store"(%48, %arg8) {tag = "unknown_memory_effects_a", tag_name = "a"} : (i32, memref<i32>) -> ()
    "test.unknown_effects"() : () -> ()
    "func.return"(%arg8) {tag = "unknown_memory_effects_b"} : (memref<i32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<f32>) -> memref<f32>, sym_name = "store_with_a_region_before"}> ({
  ^bb0(%arg7: memref<f32>):
    %43 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %44 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    "memref.store"(%43, %arg7) {tag_name = "pre"} : (f32, memref<f32>) -> ()
    %45 = "memref.load"(%arg7) {tag = "store_with_a_region_before::before"} : (memref<f32>) -> f32
    "test.store_with_a_region"(%arg7) <{store_before_region = true}> ({
      %47 = "memref.load"(%arg7) {tag = "inside_region"} : (memref<f32>) -> f32
      "test.store_with_a_region_terminator"() : () -> ()
    }) {tag_name = "region"} : (memref<f32>) -> ()
    %46 = "memref.load"(%arg7) {tag = "after"} : (memref<f32>) -> f32
    "memref.store"(%44, %arg7) {tag_name = "post"} : (f32, memref<f32>) -> ()
    "func.return"(%arg7) {tag = "return"} : (memref<f32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<f32>) -> memref<f32>, sym_name = "store_with_a_region_after"}> ({
  ^bb0(%arg6: memref<f32>):
    %38 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %39 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    "memref.store"(%38, %arg6) {tag_name = "pre"} : (f32, memref<f32>) -> ()
    %40 = "memref.load"(%arg6) {tag = "store_with_a_region_after::before"} : (memref<f32>) -> f32
    "test.store_with_a_region"(%arg6) <{store_before_region = false}> ({
      %42 = "memref.load"(%arg6) {tag = "inside_region"} : (memref<f32>) -> f32
      "test.store_with_a_region_terminator"() : () -> ()
    }) {tag_name = "region"} : (memref<f32>) -> ()
    %41 = "memref.load"(%arg6) {tag = "after"} : (memref<f32>) -> f32
    "memref.store"(%39, %arg6) {tag_name = "post"} : (f32, memref<f32>) -> ()
    "func.return"(%arg6) {tag = "return"} : (memref<f32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<f32>) -> memref<f32>, sym_name = "store_with_a_region_before_containing_a_store"}> ({
  ^bb0(%arg5: memref<f32>):
    %31 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %32 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    "memref.store"(%31, %arg5) {tag_name = "pre"} : (f32, memref<f32>) -> ()
    %33 = "memref.load"(%arg5) {tag = "store_with_a_region_before_containing_a_store::before"} : (memref<f32>) -> f32
    "test.store_with_a_region"(%arg5) <{store_before_region = true}> ({
      %35 = "memref.load"(%arg5) {tag = "enter_region"} : (memref<f32>) -> f32
      %36 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
      "memref.store"(%36, %arg5) {tag_name = "inner"} : (f32, memref<f32>) -> ()
      %37 = "memref.load"(%arg5) {tag = "exit_region"} : (memref<f32>) -> f32
      "test.store_with_a_region_terminator"() : () -> ()
    }) {tag_name = "region"} : (memref<f32>) -> ()
    %34 = "memref.load"(%arg5) {tag = "after"} : (memref<f32>) -> f32
    "memref.store"(%32, %arg5) {tag_name = "post"} : (f32, memref<f32>) -> ()
    "func.return"(%arg5) {tag = "return"} : (memref<f32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<f32>) -> memref<f32>, sym_name = "store_with_a_region_after_containing_a_store"}> ({
  ^bb0(%arg4: memref<f32>):
    %24 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %25 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    "memref.store"(%24, %arg4) {tag_name = "pre"} : (f32, memref<f32>) -> ()
    %26 = "memref.load"(%arg4) {tag = "store_with_a_region_after_containing_a_store::before"} : (memref<f32>) -> f32
    "test.store_with_a_region"(%arg4) <{store_before_region = false}> ({
      %28 = "memref.load"(%arg4) {tag = "enter_region"} : (memref<f32>) -> f32
      %29 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
      "memref.store"(%29, %arg4) {tag_name = "inner"} : (f32, memref<f32>) -> ()
      %30 = "memref.load"(%arg4) {tag = "exit_region"} : (memref<f32>) -> f32
      "test.store_with_a_region_terminator"() : () -> ()
    }) {tag_name = "region"} : (memref<f32>) -> ()
    %27 = "memref.load"(%arg4) {tag = "after"} : (memref<f32>) -> f32
    "memref.store"(%25, %arg4) {tag_name = "post"} : (f32, memref<f32>) -> ()
    "func.return"(%arg4) {tag = "return"} : (memref<f32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<f32>) -> memref<f32>, sym_name = "store_with_a_loop_region_before"}> ({
  ^bb0(%arg3: memref<f32>):
    %19 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %20 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    "memref.store"(%19, %arg3) {tag_name = "pre"} : (f32, memref<f32>) -> ()
    %21 = "memref.load"(%arg3) {tag = "store_with_a_loop_region_before::before"} : (memref<f32>) -> f32
    "test.store_with_a_loop_region"(%arg3) <{store_before_region = true}> ({
      %23 = "memref.load"(%arg3) {tag = "inside_region"} : (memref<f32>) -> f32
      "test.store_with_a_region_terminator"() : () -> ()
    }) {tag_name = "region"} : (memref<f32>) -> ()
    %22 = "memref.load"(%arg3) {tag = "after"} : (memref<f32>) -> f32
    "memref.store"(%20, %arg3) {tag_name = "post"} : (f32, memref<f32>) -> ()
    "func.return"(%arg3) {tag = "return"} : (memref<f32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<f32>) -> memref<f32>, sym_name = "store_with_a_loop_region_after"}> ({
  ^bb0(%arg2: memref<f32>):
    %14 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %15 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    "memref.store"(%14, %arg2) {tag_name = "pre"} : (f32, memref<f32>) -> ()
    %16 = "memref.load"(%arg2) {tag = "store_with_a_loop_region_after::before"} : (memref<f32>) -> f32
    "test.store_with_a_loop_region"(%arg2) <{store_before_region = false}> ({
      %18 = "memref.load"(%arg2) {tag = "inside_region"} : (memref<f32>) -> f32
      "test.store_with_a_region_terminator"() : () -> ()
    }) {tag_name = "region"} : (memref<f32>) -> ()
    %17 = "memref.load"(%arg2) {tag = "after"} : (memref<f32>) -> f32
    "memref.store"(%15, %arg2) {tag_name = "post"} : (f32, memref<f32>) -> ()
    "func.return"(%arg2) {tag = "return"} : (memref<f32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<f32>) -> memref<f32>, sym_name = "store_with_a_loop_region_before_containing_a_store"}> ({
  ^bb0(%arg1: memref<f32>):
    %7 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %8 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    "memref.store"(%7, %arg1) {tag_name = "pre"} : (f32, memref<f32>) -> ()
    %9 = "memref.load"(%arg1) {tag = "store_with_a_loop_region_before_containing_a_store::before"} : (memref<f32>) -> f32
    "test.store_with_a_loop_region"(%arg1) <{store_before_region = true}> ({
      %11 = "memref.load"(%arg1) {tag = "enter_region"} : (memref<f32>) -> f32
      %12 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
      "memref.store"(%12, %arg1) {tag_name = "inner"} : (f32, memref<f32>) -> ()
      %13 = "memref.load"(%arg1) {tag = "exit_region"} : (memref<f32>) -> f32
      "test.store_with_a_region_terminator"() : () -> ()
    }) {tag_name = "region"} : (memref<f32>) -> ()
    %10 = "memref.load"(%arg1) {tag = "after"} : (memref<f32>) -> f32
    "memref.store"(%8, %arg1) {tag_name = "post"} : (f32, memref<f32>) -> ()
    "func.return"(%arg1) {tag = "return"} : (memref<f32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<f32>) -> memref<f32>, sym_name = "store_with_a_loop_region_after_containing_a_store"}> ({
  ^bb0(%arg0: memref<f32>):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    "memref.store"(%0, %arg0) {tag_name = "pre"} : (f32, memref<f32>) -> ()
    %2 = "memref.load"(%arg0) {tag = "store_with_a_loop_region_after_containing_a_store::before"} : (memref<f32>) -> f32
    "test.store_with_a_loop_region"(%arg0) <{store_before_region = false}> ({
      %4 = "memref.load"(%arg0) {tag = "enter_region"} : (memref<f32>) -> f32
      %5 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
      "memref.store"(%5, %arg0) {tag_name = "inner"} : (f32, memref<f32>) -> ()
      %6 = "memref.load"(%arg0) {tag = "exit_region"} : (memref<f32>) -> f32
      "test.store_with_a_region_terminator"() : () -> ()
    }) {tag_name = "region"} : (memref<f32>) -> ()
    %3 = "memref.load"(%arg0) {tag = "after"} : (memref<f32>) -> f32
    "memref.store"(%1, %arg0) {tag_name = "post"} : (f32, memref<f32>) -> ()
    "func.return"(%arg0) {tag = "return"} : (memref<f32>) -> ()
  }) : () -> ()
}) : () -> ()

