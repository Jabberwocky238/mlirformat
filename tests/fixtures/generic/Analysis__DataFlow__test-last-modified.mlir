"builtin.module"() ({
  "func.func"() <{function_type = (memref<i32>, memref<i32>) -> (memref<i32>, memref<i32>), sym_name = "test_simple_mod"}> ({
  ^bb0(%arg18: memref<i32>, %arg19: memref<i32>):
    %64 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %65 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    "memref.store"(%64, %arg18) {tag_name = "a"} : (i32, memref<i32>) -> ()
    "memref.store"(%65, %arg19) {tag_name = "b"} : (i32, memref<i32>) -> ()
    "func.return"(%arg18, %arg19) {tag = "test_simple_mod"} : (memref<i32>, memref<i32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<i32>) -> memref<i32>, sym_name = "test_simple_mod_overwrite"}> ({
  ^bb0(%arg17: memref<i32>):
    %62 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    "memref.store"(%62, %arg17) {tag = "test_simple_mod_overwrite_a", tag_name = "a"} : (i32, memref<i32>) -> ()
    %63 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    "memref.store"(%63, %arg17) {tag_name = "b"} : (i32, memref<i32>) -> ()
    "func.return"(%arg17) {tag = "test_simple_mod_overwrite_b"} : (memref<i32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i1, memref<i32>) -> memref<i32>, sym_name = "test_mod_control_flow"}> ({
  ^bb0(%arg15: i1, %arg16: memref<i32>):
    "cf.cond_br"(%arg15)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb1:  // pred: ^bb0
    %60 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    "memref.store"(%60, %arg16) {tag_name = "a"} : (i32, memref<i32>) -> ()
    "cf.br"()[^bb3] : () -> ()
  ^bb2:  // pred: ^bb0
    %61 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    "memref.store"(%61, %arg16) {tag_name = "b"} : (i32, memref<i32>) -> ()
    "cf.br"()[^bb3] : () -> ()
  ^bb3:  // 2 preds: ^bb1, ^bb2
    "func.return"(%arg16) {tag = "test_mod_control_flow"} : (memref<i32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, memref<i32>) -> memref<i32>, sym_name = "test_mod_dead_branch"}> ({
  ^bb0(%arg13: i32, %arg14: memref<i32>):
    %55 = "arith.subi"(%arg13, %arg13) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
    %56 = "arith.constant"() <{value = -1 : i32}> : () -> i32
    %57 = "arith.cmpi"(%55, %56) <{predicate = 4 : i64}> : (i32, i32) -> i1
    "cf.cond_br"(%57)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb1:  // pred: ^bb0
    %58 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    "memref.store"(%58, %arg14) {tag_name = "a"} : (i32, memref<i32>) -> ()
    "cf.br"()[^bb3] : () -> ()
  ^bb2:  // pred: ^bb0
    %59 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    "memref.store"(%59, %arg14) {tag_name = "b"} : (i32, memref<i32>) -> ()
    "cf.br"()[^bb3] : () -> ()
  ^bb3:  // 2 preds: ^bb1, ^bb2
    "func.return"(%arg14) {tag = "test_mod_dead_branch"} : (memref<i32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i1, memref<i32>) -> memref<i32>, sym_name = "test_mod_region_control_flow"}> ({
  ^bb0(%arg11: i1, %arg12: memref<i32>):
    "scf.if"(%arg11) ({
      %54 = "arith.constant"() <{value = 0 : i32}> : () -> i32
      "memref.store"(%54, %arg12) {tag_name = "then"} : (i32, memref<i32>) -> ()
      "scf.yield"() : () -> ()
    }, {
      %53 = "arith.constant"() <{value = 1 : i32}> : () -> i32
      "memref.store"(%53, %arg12) {tag_name = "else"} : (i32, memref<i32>) -> ()
      "scf.yield"() : () -> ()
    }) : (i1) -> ()
    "func.return"(%arg12) {tag = "test_mod_region_control_flow"} : (memref<i32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<i32>) -> memref<i32>, sym_name = "test_mod_dead_region"}> ({
  ^bb0(%arg10: memref<i32>):
    %50 = "arith.constant"() <{value = false}> : () -> i1
    "scf.if"(%50) ({
      %52 = "arith.constant"() <{value = 0 : i32}> : () -> i32
      "memref.store"(%52, %arg10) {tag_name = "then"} : (i32, memref<i32>) -> ()
      "scf.yield"() : () -> ()
    }, {
      %51 = "arith.constant"() <{value = 1 : i32}> : () -> i32
      "memref.store"(%51, %arg10) {tag_name = "else"} : (i32, memref<i32>) -> ()
      "scf.yield"() : () -> ()
    }) : (i1) -> ()
    "func.return"(%arg10) {tag = "test_mod_dead_region"} : (memref<i32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<i32>) -> memref<i32>, sym_name = "unknown_memory_effects"}> ({
  ^bb0(%arg9: memref<i32>):
    %49 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    "memref.store"(%49, %arg9) {tag = "unknown_memory_effects_a", tag_name = "a"} : (i32, memref<i32>) -> ()
    "test.unknown_effects"() : () -> ()
    "func.return"(%arg9) {tag = "unknown_memory_effects_b"} : (memref<i32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<f32>) -> memref<f32>, sym_name = "store_with_a_region_before"}> ({
  ^bb0(%arg8: memref<f32>):
    %44 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %45 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    "memref.store"(%44, %arg8) {tag_name = "pre"} : (f32, memref<f32>) -> ()
    %46 = "memref.load"(%arg8) {tag = "store_with_a_region_before::before"} : (memref<f32>) -> f32
    "test.store_with_a_region"(%arg8) <{store_before_region = true}> ({
      %48 = "memref.load"(%arg8) {tag = "inside_region"} : (memref<f32>) -> f32
      "test.store_with_a_region_terminator"() : () -> ()
    }) {tag_name = "region"} : (memref<f32>) -> ()
    %47 = "memref.load"(%arg8) {tag = "after"} : (memref<f32>) -> f32
    "memref.store"(%45, %arg8) {tag_name = "post"} : (f32, memref<f32>) -> ()
    "func.return"(%arg8) {tag = "return"} : (memref<f32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<f32>) -> memref<f32>, sym_name = "store_with_a_region_after"}> ({
  ^bb0(%arg7: memref<f32>):
    %39 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %40 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    "memref.store"(%39, %arg7) {tag_name = "pre"} : (f32, memref<f32>) -> ()
    %41 = "memref.load"(%arg7) {tag = "store_with_a_region_after::before"} : (memref<f32>) -> f32
    "test.store_with_a_region"(%arg7) <{store_before_region = false}> ({
      %43 = "memref.load"(%arg7) {tag = "inside_region"} : (memref<f32>) -> f32
      "test.store_with_a_region_terminator"() : () -> ()
    }) {tag_name = "region"} : (memref<f32>) -> ()
    %42 = "memref.load"(%arg7) {tag = "after"} : (memref<f32>) -> f32
    "memref.store"(%40, %arg7) {tag_name = "post"} : (f32, memref<f32>) -> ()
    "func.return"(%arg7) {tag = "return"} : (memref<f32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<f32>) -> memref<f32>, sym_name = "store_with_a_region_before_containing_a_store"}> ({
  ^bb0(%arg6: memref<f32>):
    %32 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %33 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    "memref.store"(%32, %arg6) {tag_name = "pre"} : (f32, memref<f32>) -> ()
    %34 = "memref.load"(%arg6) {tag = "store_with_a_region_before_containing_a_store::before"} : (memref<f32>) -> f32
    "test.store_with_a_region"(%arg6) <{store_before_region = true}> ({
      %36 = "memref.load"(%arg6) {tag = "enter_region"} : (memref<f32>) -> f32
      %37 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
      "memref.store"(%37, %arg6) {tag_name = "inner"} : (f32, memref<f32>) -> ()
      %38 = "memref.load"(%arg6) {tag = "exit_region"} : (memref<f32>) -> f32
      "test.store_with_a_region_terminator"() : () -> ()
    }) {tag_name = "region"} : (memref<f32>) -> ()
    %35 = "memref.load"(%arg6) {tag = "after"} : (memref<f32>) -> f32
    "memref.store"(%33, %arg6) {tag_name = "post"} : (f32, memref<f32>) -> ()
    "func.return"(%arg6) {tag = "return"} : (memref<f32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<f32>) -> memref<f32>, sym_name = "store_with_a_region_after_containing_a_store"}> ({
  ^bb0(%arg5: memref<f32>):
    %25 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %26 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    "memref.store"(%25, %arg5) {tag_name = "pre"} : (f32, memref<f32>) -> ()
    %27 = "memref.load"(%arg5) {tag = "store_with_a_region_after_containing_a_store::before"} : (memref<f32>) -> f32
    "test.store_with_a_region"(%arg5) <{store_before_region = false}> ({
      %29 = "memref.load"(%arg5) {tag = "enter_region"} : (memref<f32>) -> f32
      %30 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
      "memref.store"(%30, %arg5) {tag_name = "inner"} : (f32, memref<f32>) -> ()
      %31 = "memref.load"(%arg5) {tag = "exit_region"} : (memref<f32>) -> f32
      "test.store_with_a_region_terminator"() : () -> ()
    }) {tag_name = "region"} : (memref<f32>) -> ()
    %28 = "memref.load"(%arg5) {tag = "after"} : (memref<f32>) -> f32
    "memref.store"(%26, %arg5) {tag_name = "post"} : (f32, memref<f32>) -> ()
    "func.return"(%arg5) {tag = "return"} : (memref<f32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<f32>) -> memref<f32>, sym_name = "store_with_a_loop_region_before"}> ({
  ^bb0(%arg4: memref<f32>):
    %20 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %21 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    "memref.store"(%20, %arg4) {tag_name = "pre"} : (f32, memref<f32>) -> ()
    %22 = "memref.load"(%arg4) {tag = "store_with_a_loop_region_before::before"} : (memref<f32>) -> f32
    "test.store_with_a_loop_region"(%arg4) <{store_before_region = true}> ({
      %24 = "memref.load"(%arg4) {tag = "inside_region"} : (memref<f32>) -> f32
      "test.store_with_a_region_terminator"() : () -> ()
    }) {tag_name = "region"} : (memref<f32>) -> ()
    %23 = "memref.load"(%arg4) {tag = "after"} : (memref<f32>) -> f32
    "memref.store"(%21, %arg4) {tag_name = "post"} : (f32, memref<f32>) -> ()
    "func.return"(%arg4) {tag = "return"} : (memref<f32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<f32>) -> memref<f32>, sym_name = "store_with_a_loop_region_after"}> ({
  ^bb0(%arg3: memref<f32>):
    %15 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %16 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    "memref.store"(%15, %arg3) {tag_name = "pre"} : (f32, memref<f32>) -> ()
    %17 = "memref.load"(%arg3) {tag = "store_with_a_loop_region_after::before"} : (memref<f32>) -> f32
    "test.store_with_a_loop_region"(%arg3) <{store_before_region = false}> ({
      %19 = "memref.load"(%arg3) {tag = "inside_region"} : (memref<f32>) -> f32
      "test.store_with_a_region_terminator"() : () -> ()
    }) {tag_name = "region"} : (memref<f32>) -> ()
    %18 = "memref.load"(%arg3) {tag = "after"} : (memref<f32>) -> f32
    "memref.store"(%16, %arg3) {tag_name = "post"} : (f32, memref<f32>) -> ()
    "func.return"(%arg3) {tag = "return"} : (memref<f32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<f32>) -> memref<f32>, sym_name = "store_with_a_loop_region_before_containing_a_store"}> ({
  ^bb0(%arg2: memref<f32>):
    %8 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %9 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    "memref.store"(%8, %arg2) {tag_name = "pre"} : (f32, memref<f32>) -> ()
    %10 = "memref.load"(%arg2) {tag = "store_with_a_loop_region_before_containing_a_store::before"} : (memref<f32>) -> f32
    "test.store_with_a_loop_region"(%arg2) <{store_before_region = true}> ({
      %12 = "memref.load"(%arg2) {tag = "enter_region"} : (memref<f32>) -> f32
      %13 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
      "memref.store"(%13, %arg2) {tag_name = "inner"} : (f32, memref<f32>) -> ()
      %14 = "memref.load"(%arg2) {tag = "exit_region"} : (memref<f32>) -> f32
      "test.store_with_a_region_terminator"() : () -> ()
    }) {tag_name = "region"} : (memref<f32>) -> ()
    %11 = "memref.load"(%arg2) {tag = "after"} : (memref<f32>) -> f32
    "memref.store"(%9, %arg2) {tag_name = "post"} : (f32, memref<f32>) -> ()
    "func.return"(%arg2) {tag = "return"} : (memref<f32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<f32>) -> memref<f32>, sym_name = "store_with_a_loop_region_after_containing_a_store"}> ({
  ^bb0(%arg1: memref<f32>):
    %1 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %2 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    "memref.store"(%1, %arg1) {tag_name = "pre"} : (f32, memref<f32>) -> ()
    %3 = "memref.load"(%arg1) {tag = "store_with_a_loop_region_after_containing_a_store::before"} : (memref<f32>) -> f32
    "test.store_with_a_loop_region"(%arg1) <{store_before_region = false}> ({
      %5 = "memref.load"(%arg1) {tag = "enter_region"} : (memref<f32>) -> f32
      %6 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
      "memref.store"(%6, %arg1) {tag_name = "inner"} : (f32, memref<f32>) -> ()
      %7 = "memref.load"(%arg1) {tag = "exit_region"} : (memref<f32>) -> f32
      "test.store_with_a_region_terminator"() : () -> ()
    }) {tag_name = "region"} : (memref<f32>) -> ()
    %4 = "memref.load"(%arg1) {tag = "after"} : (memref<f32>) -> f32
    "memref.store"(%2, %arg1) {tag_name = "post"} : (f32, memref<f32>) -> ()
    "func.return"(%arg1) {tag = "return"} : (memref<f32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> (), sym_name = "unreachable_private", sym_visibility = "private"}> ({
  ^bb0(%arg0: i32):
    %0 = "arith.index_cast"(%arg0) {tag = "tag_in_unreachable_private"} : (i32) -> index
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

