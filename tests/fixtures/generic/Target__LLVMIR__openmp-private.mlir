"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "parallel_op_1_private", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg8: !llvm.ptr):
    "omp.parallel"(%arg8) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 1, 0>, private_syms = [@x.privatizer]}> ({
    ^bb0(%arg9: !llvm.ptr):
      %6 = "llvm.load"(%arg9) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr)>, linkage = #llvm.linkage<external>, sym_name = "parallel_op_2_privates", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg4: !llvm.ptr, %arg5: !llvm.ptr):
    "omp.parallel"(%arg4, %arg5) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 2, 0>, private_syms = [@x.privatizer, @y.privatizer]}> ({
    ^bb0(%arg6: !llvm.ptr, %arg7: !llvm.ptr):
      %4 = "llvm.load"(%arg6) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32
      %5 = "llvm.load"(%arg7) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "x.privatizer", type = f32}> ({
  ^bb0(%arg2: !llvm.ptr, %arg3: !llvm.ptr):
    %2 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %3 = "llvm.load"(%arg2) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32
    "llvm.store"(%3, %arg3) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> ()
    "omp.yield"(%arg3) : (!llvm.ptr) -> ()
  }, {
  }, {
  }) : () -> ()
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "y.privatizer", type = i32}> ({
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    %0 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %1 = "llvm.load"(%arg0) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
    "llvm.store"(%1, %arg1) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
    "omp.yield"(%arg1) : (!llvm.ptr) -> ()
  }, {
  }, {
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "parallel_op_private_multi_block", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg12: !llvm.ptr):
    "omp.parallel"(%arg12) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 1, 0>, private_syms = [@multi_block.privatizer]}> ({
    ^bb0(%arg13: !llvm.ptr):
      %19 = "llvm.load"(%arg13) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "multi_block.privatizer", type = f32}> ({
  ^bb0(%arg10: !llvm.ptr, %arg11: !llvm.ptr):
    "llvm.br"(%arg10, %arg11)[^bb1] : (!llvm.ptr, !llvm.ptr) -> ()
  ^bb1(%16: !llvm.ptr, %17: !llvm.ptr):  // pred: ^bb0
    %18 = "llvm.load"(%16) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32
    "llvm.store"(%18, %17) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> ()
    "omp.yield"(%17) : (!llvm.ptr) -> ()
  }, {
  }, {
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "lower_region_with_addressof", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %9 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %10 = "llvm.alloca"(%9) <{elem_type = f64}> {bindc_name = "u1"} : (i64) -> !llvm.ptr
    "omp.parallel"(%10) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 1, 0>, private_syms = [@_QFlower_region_with_addressof_privatizer]}> ({
    ^bb0(%arg9: !llvm.ptr):
      %11 = "llvm.mlir.constant"() <{value = 111 : i64}> : () -> i64
      %12 = "llvm.getelementptr"(%arg9, %11) <{elem_type = f64, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i64) -> !llvm.ptr
      "llvm.call"(%12) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @bar, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (!llvm.ptr) -> ()
      %13 = "llvm.mlir.constant"() <{value = 222 : i64}> : () -> i64
      %14 = "llvm.mlir.addressof"() <{global_name = @_QQfoo}> : () -> !llvm.ptr
      %15 = "llvm.getelementptr"(%14, %13) <{elem_type = f64, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i64) -> !llvm.ptr
      "llvm.call"(%15) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @bar, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (!llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "_QFlower_region_with_addressof_privatizer", type = !llvm.ptr}> ({
  ^bb0(%arg7: !llvm.ptr, %arg8: !llvm.ptr):
    %8 = "llvm.mlir.addressof"() <{global_name = @_QQfoo}> : () -> !llvm.ptr
    "omp.yield"(%8) : (!llvm.ptr) -> ()
  }, {
  }, {
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, constant, global_type = !llvm.array<3 x i8>, linkage = #llvm.linkage<linkonce>, sym_name = "_QQfoo", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %7 = "llvm.mlir.constant"() <{value = "foo"}> : () -> !llvm.array<3 x i8>
    "llvm.return"(%7) : (!llvm.array<3 x i8>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "bar", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, frame_pointer = #llvm.framePointerKind<all>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "private_and_reduction_", target_cpu = "x86-64", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %2 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %3 = "llvm.alloca"(%2) <{elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>}> : (i64) -> !llvm.ptr
    %4 = "llvm.alloca"(%2) <{elem_type = f32}> {bindc_name = "to_priv"} : (i64) -> !llvm.ptr
    "omp.parallel"(%4, %3) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 1, 1>, private_syms = [@privatizer.part], reduction_byref = array<i1: true>, reduction_syms = [@reducer.part]}> ({
    ^bb0(%arg5: !llvm.ptr, %arg6: !llvm.ptr):
      %5 = "llvm.load"(%arg6) <{ordering = 0 : i64}> : (!llvm.ptr) -> !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>
      %6 = "llvm.mlir.constant"() <{value = 8.000000e+00 : f32}> : () -> f32
      "llvm.store"(%6, %arg5) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) {fir.internal_name = "_QPprivate_and_reduction"} : () -> ()
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "privatizer.part", type = f32}> ({
  }, {
  }, {
  }) : () -> ()
  "omp.declare_reduction"() <{sym_name = "reducer.part", type = !llvm.ptr}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %1 = "llvm.alloca"(%0) <{elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>}> : (i64) -> !llvm.ptr
    "omp.yield"(%1) : (!llvm.ptr) -> ()
  }, {
  ^bb0(%arg3: !llvm.ptr, %arg4: !llvm.ptr):
    "omp.yield"(%arg4) : (!llvm.ptr) -> ()
  }, {
  ^bb0(%arg1: !llvm.ptr, %arg2: !llvm.ptr):
    "omp.yield"(%arg1) : (!llvm.ptr) -> ()
  }, {
  }, {
  ^bb0(%arg0: !llvm.ptr):
    "omp.yield"() : () -> ()
  }, {
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "_QPequivalence", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %1 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %2 = "llvm.alloca"(%1) <{elem_type = !llvm.array<4 x i8>}> : (i64) -> !llvm.ptr
    %3 = "llvm.mlir.constant"() <{value = 0 : index}> : () -> i64
    %4 = "llvm.getelementptr"(%2, %3) <{elem_type = !llvm.array<4 x i8>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: 0, -2147483648>}> : (!llvm.ptr, i64) -> !llvm.ptr
    "omp.parallel"(%4) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 1, 0>, private_syms = [@_QFequivalenceEx_firstprivate_ptr_f32]}> ({
    ^bb0(%arg2: !llvm.ptr):
      %5 = "llvm.mlir.constant"() <{value = 3.140000e+00 : f32}> : () -> f32
      "llvm.store"(%5, %arg2) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = firstprivate}>, sym_name = "_QFequivalenceEx_firstprivate_ptr_f32", type = f32}> ({
  }, {
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    %0 = "llvm.load"(%arg0) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32
    "llvm.store"(%0, %arg1) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> ()
    "omp.yield"(%arg1) : (!llvm.ptr) -> ()
  }, {
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "_QFEi_private_i32", type = i32}> ({
  }, {
  }, {
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "_QPprivate_alloc_with_switch", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %1 = "llvm.mlir.constant"() <{value = 30 : i32}> : () -> i32
    %2 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %3 = "llvm.alloca"(%2) <{elem_type = i32}> {bindc_name = "n"} : (i64) -> !llvm.ptr
    %4 = "llvm.alloca"(%2) <{elem_type = i32}> {bindc_name = "i"} : (i64) -> !llvm.ptr
    "llvm.store"(%0, %3) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
    %5 = "llvm.load"(%3) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
    "llvm.switch"(%5)[^bb1, ^bb1, ^bb2] <{case_operand_segments = array<i32: 0, 0>, case_values = dense<[1, 2]> : vector<2xi32>, operandSegmentSizes = array<i32: 1, 0, 0>}> : (i32) -> ()
  ^bb1:  // 2 preds: ^bb0, ^bb0
    "omp.simd"(%4) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1, 0>, private_syms = [@_QFEi_private_i32]}> ({
    ^bb0(%arg0: !llvm.ptr):
      "omp.loop_nest"(%0, %1, %0) <{loop_inclusive}> ({
      ^bb0(%arg1: i32):
        "llvm.store"(%arg1, %arg0) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
        "omp.yield"() : () -> ()
      }) : (i32, i32, i32) -> ()
    }) : (!llvm.ptr) -> ()
    "llvm.br"()[^bb2] : () -> ()
  ^bb2:  // 2 preds: ^bb0, ^bb1
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

