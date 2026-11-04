"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "parallel_op_firstprivate", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg2: !llvm.ptr):
    "omp.parallel"(%arg2) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 1, 0>, private_syms = [@x.privatizer]}> ({
    ^bb0(%arg3: !llvm.ptr):
      %1 = "llvm.load"(%arg3) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = firstprivate}>, sym_name = "x.privatizer", type = f32}> ({
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
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "parallel_op_firstprivate_multi_block", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg4: !llvm.ptr):
    "omp.parallel"(%arg4) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 1, 0>, private_syms = [@multi_block.privatizer]}> ({
    ^bb0(%arg5: !llvm.ptr):
      %3 = "llvm.load"(%arg5) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = firstprivate}>, sym_name = "multi_block.privatizer", type = f32}> ({
  ^bb0(%arg2: !llvm.ptr, %arg3: !llvm.ptr):
    "llvm.br"()[^bb1] : () -> ()
  ^bb1:  // pred: ^bb0
    "omp.yield"(%arg3) : (!llvm.ptr) -> ()
  }, {
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    %0 = "llvm.load"(%arg0) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32
    "llvm.br"(%0, %arg1)[^bb1] : (f32, !llvm.ptr) -> ()
  ^bb1(%1: f32, %2: !llvm.ptr):  // pred: ^bb0
    "llvm.store"(%1, %2) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> ()
    "omp.yield"(%2) : (!llvm.ptr) -> ()
  }, {
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{fir.bindc_name = "n"}], function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "non_const_len_char_test", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg4: !llvm.ptr):
    %4 = "llvm.load"(%arg4) <{ordering = 0 : i64}> : (!llvm.ptr) -> i64
    %5 = "llvm.alloca"(%4) <{elem_type = i8}> {bindc_name = "str"} : (i64) -> !llvm.ptr
    %6 = "llvm.mlir.undef"() : () -> !llvm.struct<(ptr, i64)>
    %7 = "llvm.insertvalue"(%6, %5) <{position = array<i64: 0>}> : (!llvm.struct<(ptr, i64)>, !llvm.ptr) -> !llvm.struct<(ptr, i64)>
    "omp.parallel"(%7) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 1, 0>, private_syms = [@non_const_len_char]}> ({
    ^bb0(%arg5: !llvm.struct<(ptr, i64)>):
      %8 = "llvm.extractvalue"(%arg5) <{position = array<i64: 0>}> : (!llvm.struct<(ptr, i64)>) -> !llvm.ptr
      "omp.terminator"() : () -> ()
    }) : (!llvm.struct<(ptr, i64)>) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = firstprivate}>, sym_name = "non_const_len_char", type = !llvm.struct<(ptr, i64)>}> ({
  ^bb0(%arg2: !llvm.struct<(ptr, i64)>, %arg3: !llvm.struct<(ptr, i64)>):
    %0 = "llvm.extractvalue"(%arg2) <{position = array<i64: 1>}> : (!llvm.struct<(ptr, i64)>) -> i64
    %1 = "llvm.alloca"(%0) <{elem_type = i8}> {bindc_name = "str", pinned} : (i64) -> !llvm.ptr
    %2 = "llvm.mlir.undef"() : () -> !llvm.struct<(ptr, i64)>
    %3 = "llvm.insertvalue"(%2, %1) <{position = array<i64: 0>}> : (!llvm.struct<(ptr, i64)>, !llvm.ptr) -> !llvm.struct<(ptr, i64)>
    "omp.yield"(%3) : (!llvm.struct<(ptr, i64)>) -> ()
  }, {
  ^bb0(%arg0: !llvm.struct<(ptr, i64)>, %arg1: !llvm.struct<(ptr, i64)>):
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @foo, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    "omp.yield"(%arg1) : (!llvm.struct<(ptr, i64)>) -> ()
  }, {
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "foo", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = firstprivate}>, sym_name = "global_privatizer", type = f32}> ({
  }, {
  ^bb0(%arg1: !llvm.ptr, %arg2: !llvm.ptr):
    %3 = "llvm.load"(%arg1) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32
    "llvm.store"(%3, %arg2) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> ()
    "omp.yield"(%arg2) : (!llvm.ptr) -> ()
  }, {
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "global_accessor", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %1 = "llvm.mlir.addressof"() <{global_name = @global}> : () -> !llvm.ptr
    "omp.parallel"(%1) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 1, 0>, private_syms = [@global_privatizer]}> ({
    ^bb0(%arg0: !llvm.ptr):
      %2 = "llvm.mlir.constant"() <{value = 3.140000e+00 : f32}> : () -> f32
      "llvm.store"(%2, %arg0) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = f32, linkage = #llvm.linkage<internal>, sym_name = "global", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.zero"() : () -> f32
    "llvm.return"(%0) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

