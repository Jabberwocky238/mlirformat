"builtin.module"() ({
  "func.func"() <{function_type = () -> index, sym_name = "constant"}> ({
    %46 = "test.with_bounds"() <{smax = 3 : index, smin = 3 : index, umax = 3 : index, umin = 3 : index}> : () -> index
    "func.return"(%46) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> index, sym_name = "increment"}> ({
    %44 = "test.with_bounds"() <{smax = 9223372036854775807 : index, smin = 0 : index, umax = 3 : index, umin = 3 : index}> : () -> index
    %45 = "test.increment"(%44) : (index) -> index
    "func.return"(%45) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i1) -> index, sym_name = "maybe_increment"}> ({
  ^bb0(%arg18: i1):
    %40 = "test.with_bounds"() <{smax = 3 : index, smin = 3 : index, umax = 3 : index, umin = 3 : index}> : () -> index
    %41 = "scf.if"(%arg18) ({
      "scf.yield"(%40) : (index) -> ()
    }, {
      %43 = "test.increment"(%40) : (index) -> index
      "scf.yield"(%43) : (index) -> ()
    }) : (i1) -> index
    %42 = "test.reflect_bounds"(%41) : (index) -> index
    "func.return"(%42) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i1) -> index, sym_name = "maybe_increment_br"}> ({
  ^bb0(%arg17: i1):
    %36 = "test.with_bounds"() <{smax = 3 : index, smin = 3 : index, umax = 3 : index, umin = 3 : index}> : () -> index
    "cf.cond_br"(%arg17)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb1:  // pred: ^bb0
    %37 = "test.increment"(%36) : (index) -> index
    "cf.br"(%37)[^bb3] : (index) -> ()
  ^bb2:  // pred: ^bb0
    "cf.br"(%36)[^bb3] : (index) -> ()
  ^bb3(%38: index):  // 2 preds: ^bb1, ^bb2
    %39 = "test.reflect_bounds"(%38) : (index) -> index
    "func.return"(%39) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> index, sym_name = "for_bounds"}> ({
    %31 = "test.with_bounds"() <{smax = 0 : index, smin = 0 : index, umax = 0 : index, umin = 0 : index}> : () -> index
    %32 = "test.with_bounds"() <{smax = 1 : index, smin = 1 : index, umax = 1 : index, umin = 1 : index}> : () -> index
    %33 = "test.with_bounds"() <{smax = 2 : index, smin = 2 : index, umax = 2 : index, umin = 2 : index}> : () -> index
    %34 = "scf.for"(%31, %33, %32, %31) ({
    ^bb0(%arg15: index, %arg16: index):
      "scf.yield"(%arg15) : (index) -> ()
    }) : (index, index, index, index) -> index
    %35 = "test.reflect_bounds"(%34) : (index) -> index
    "func.return"(%35) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> index, sym_name = "no_analysis_of_loop_variants"}> ({
    %25 = "test.with_bounds"() <{smax = 0 : index, smin = 0 : index, umax = 0 : index, umin = 0 : index}> : () -> index
    %26 = "test.with_bounds"() <{smax = 1 : index, smin = 1 : index, umax = 1 : index, umin = 1 : index}> : () -> index
    %27 = "test.with_bounds"() <{smax = 2 : index, smin = 2 : index, umax = 2 : index, umin = 2 : index}> : () -> index
    %28 = "scf.for"(%25, %27, %26, %25) ({
    ^bb0(%arg13: index, %arg14: index):
      %30 = "test.increment"(%arg14) : (index) -> index
      "scf.yield"(%30) : (index) -> ()
    }) : (index, index, index, index) -> index
    %29 = "test.reflect_bounds"(%28) : (index) -> index
    "func.return"(%29) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "region_args"}> ({
    "test.with_bounds_region"() <{smax = 4 : index, smin = 3 : index, umax = 4 : index, umin = 3 : index}> ({
    ^bb0(%arg12: index):
      %24 = "test.reflect_bounds"(%arg12) : (index) -> index
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> index, sym_name = "func_args_unbound"}> ({
  ^bb0(%arg11: index):
    %23 = "test.reflect_bounds"(%arg11) : (index) -> index
    "func.return"(%23) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> index, sym_name = "propagate_across_while_loop_false"}> ({
    %19 = "test.with_bounds"() <{smax = 0 : index, smin = 0 : index, umax = 0 : index, umin = 0 : index}> : () -> index
    %20 = "scf.while"() ({
      %22 = "arith.constant"() <{value = false}> : () -> i1
      "scf.condition"(%22, %19) : (i1, index) -> ()
    }, {
    ^bb0(%arg10: index):
      "scf.yield"() : () -> ()
    }) : () -> index
    %21 = "test.increment"(%20) : (index) -> index
    "func.return"(%21) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i1) -> index, sym_name = "propagate_across_while_loop"}> ({
  ^bb0(%arg8: i1):
    %16 = "test.with_bounds"() <{smax = 0 : index, smin = 0 : index, umax = 0 : index, umin = 0 : index}> : () -> index
    %17 = "scf.while"() ({
      "scf.condition"(%arg8, %16) : (i1, index) -> ()
    }, {
    ^bb0(%arg9: index):
      "scf.yield"() : () -> ()
    }) : () -> index
    %18 = "test.increment"(%17) : (index) -> index
    "func.return"(%18) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> index, sym_name = "dont_propagate_across_infinite_loop"}> ({
    %12 = "test.with_bounds"() <{smax = 0 : index, smin = 0 : index, umax = 0 : index, umin = 0 : index}> : () -> index
    %13 = "scf.while"() ({
      %15 = "arith.constant"() <{value = true}> : () -> i1
      "scf.condition"(%15, %12) : (i1, index) -> ()
    }, {
    ^bb0(%arg7: index):
      "scf.yield"() : () -> ()
    }) : () -> index
    %14 = "test.reflect_bounds"(%13) : (index) -> index
    "func.return"(%14) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, i1) -> (), sym_name = "propagate_from_block_to_iterarg"}> ({
  ^bb0(%arg3: index, %arg4: i1):
    %4 = "arith.constant"() <{value = 0 : index}> : () -> index
    %5 = "arith.constant"() <{value = 1 : index}> : () -> index
    %6 = "scf.if"(%arg4) ({
      %11 = "scf.if"(%arg4) ({
        "scf.yield"(%arg3) : (index) -> ()
      }, {
        "scf.yield"(%arg3) : (index) -> ()
      }) : (i1) -> index
      "scf.yield"(%11) : (index) -> ()
    }, {
      "scf.yield"(%5) : (index) -> ()
    }) : (i1) -> index
    "scf.for"(%4, %arg3, %5) ({
    ^bb0(%arg5: index):
      "scf.if"(%arg4) ({
        %7 = "arith.subi"(%6, %5) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
        %8 = "arith.muli"(%6, %7) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
        %9 = "arith.addi"(%8, %5) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
        "scf.for"(%4, %9, %5) ({
        ^bb0(%arg6: index):
          %10 = "arith.cmpi"(%arg6, %5) <{predicate = 9 : i64}> : (index, index) -> i1
          "scf.if"(%10) ({
            "test.foo"() : () -> ()
            "scf.yield"() : () -> ()
          }, {
          }) : (i1) -> ()
          "scf.yield"() : () -> ()
        }) : (index, index, index) -> ()
        "scf.yield"() : () -> ()
      }, {
      }) : (i1) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x64xi32>) -> (), sym_name = "multiple_loop_ivs"}> ({
  ^bb0(%arg0: memref<?x64xi32>):
    %0 = "test.with_bounds"() <{smax = 32 : index, smin = 1 : index, umax = 32 : index, umin = 1 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    "scf.forall"(%0) <{operandSegmentSizes = array<i32: 0, 1, 0, 0>, staticLowerBound = array<i64: 0, 0>, staticStep = array<i64: 1, 1>, staticUpperBound = array<i64: -9223372036854775808, 64>}> ({
    ^bb0(%arg1: index, %arg2: index):
      %2 = "test.reflect_bounds"(%arg1) : (index) -> index
      %3 = "test.reflect_bounds"(%arg2) : (index) -> index
      "memref.store"(%1, %arg0, %2, %3) : (i32, memref<?x64xi32>, index, index) -> ()
      "scf.forall.in_parallel"() ({
      ^bb0:
      }) : () -> ()
    }) : (index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

