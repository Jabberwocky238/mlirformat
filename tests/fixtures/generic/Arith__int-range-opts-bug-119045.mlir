"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xf16>) -> (), sym_name = "blocks_prematurely_declared_dead_bug"}> ({
  ^bb0(%arg0: memref<?xf16>):
    %0 = "arith.constant"() <{value = dense<false> : vector<1xi1>}> : () -> vector<1xi1>
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = dense<0.000000e+00> : vector<1xf16>}> : () -> vector<1xf16>
    %3 = "arith.constant"() <{value = 0.000000e+00 : f16}> : () -> f16
    %4 = "arith.constant"() <{value = 16 : index}> : () -> index
    %5 = "arith.constant"() <{value = 0 : index}> : () -> index
    %6 = "arith.constant"() <{value = 64 : index}> : () -> index
    %7 = "gpu.thread_id"() <{dimension = #gpu<dim x>, upper_bound = 64 : index}> : () -> index
    %8 = "test.with_bounds"() <{smax = 112 : index, smin = 16 : index, umax = 112 : index, umin = 16 : index}> : () -> index
    %9 = "arith.divui"(%8, %4) : (index, index) -> index
    %10 = "arith.muli"(%9, %4) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    "cf.br"(%5)[^bb1] : (index) -> ()
  ^bb1(%11: index):  // 2 preds: ^bb0, ^bb7
    %12 = "arith.cmpi"(%11, %10) <{predicate = 2 : i64}> : (index, index) -> i1
    "cf.cond_br"(%12)[^bb2, ^bb8] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb2:  // pred: ^bb1
    %13 = "arith.subi"(%10, %11) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %14 = "arith.minsi"(%13, %6) : (index, index) -> index
    %15 = "arith.subi"(%14, %7) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %16 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 1>}> : () -> vector<1xi1>
    %17 = "arith.cmpi"(%15, %5) <{predicate = 4 : i64}> : (index, index) -> i1
    %18 = "arith.select"(%17, %16, %0) : (i1, vector<1xi1>, vector<1xi1>) -> vector<1xi1>
    %19 = "vector.extract"(%18) <{static_position = array<i64: 0>}> : (vector<1xi1>) -> i1
    %20 = "vector.insert"(%19, %0) <{static_position = array<i64: 0>}> : (i1, vector<1xi1>) -> vector<1xi1>
    %21 = "arith.addi"(%11, %7) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    "cf.br"(%5, %2)[^bb3] : (index, vector<1xf16>) -> ()
  ^bb3(%22: index, %23: vector<1xf16>):  // 2 preds: ^bb2, ^bb6
    %24 = "arith.cmpi"(%22, %1) <{predicate = 2 : i64}> : (index, index) -> i1
    "cf.cond_br"(%24)[^bb4, ^bb7] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb4:  // pred: ^bb3
    %25 = "vector.extract"(%20, %22) <{static_position = array<i64: -9223372036854775808>}> : (vector<1xi1>, index) -> i1
    "cf.cond_br"(%25, %23)[^bb5, ^bb6] <{operandSegmentSizes = array<i32: 1, 0, 1>}> : (i1, vector<1xf16>) -> ()
  ^bb5:  // pred: ^bb4
    %26 = "arith.addi"(%21, %22) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %27 = "memref.load"(%arg0, %26) : (memref<?xf16>, index) -> f16
    %28 = "vector.insert"(%27, %23, %22) <{static_position = array<i64: -9223372036854775808>}> : (f16, vector<1xf16>, index) -> vector<1xf16>
    "cf.br"(%28)[^bb6] : (vector<1xf16>) -> ()
  ^bb6(%29: vector<1xf16>):  // 2 preds: ^bb4, ^bb5
    %30 = "arith.addi"(%22, %1) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    "cf.br"(%30, %29)[^bb3] : (index, vector<1xf16>) -> ()
  ^bb7:  // pred: ^bb3
    %31 = "arith.addi"(%11, %6) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    "cf.br"(%31)[^bb1] : (index) -> ()
  ^bb8:  // pred: ^bb1
    %32 = "arith.cmpi"(%7, %5) <{predicate = 0 : i64}> : (index, index) -> i1
    "cf.cond_br"(%32)[^bb9, ^bb10] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb9:  // pred: ^bb8
    "memref.store"(%3, %arg0, %5) : (f16, memref<?xf16>, index) -> ()
    "cf.br"()[^bb10] : () -> ()
  ^bb10:  // 2 preds: ^bb8, ^bb9
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

