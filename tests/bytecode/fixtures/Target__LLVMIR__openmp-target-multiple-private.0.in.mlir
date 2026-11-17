"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "dealloc_foo_0", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":2:3)
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "box.heap_privatizer0", type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>}> ({
  }, {
  }, {
  ^bb0(%arg11: !llvm.ptr loc("<stdin>":7:8)):
    "llvm.call"(%arg11) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @dealloc_foo_0, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (!llvm.ptr) -> () loc("<stdin>":8:5)
    "omp.yield"() : () -> () loc("<stdin>":9:5)
  }) : () -> () loc("<stdin>":4:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "alloc_foo_1", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":11:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "dealloc_foo_1", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":13:3)
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "box.heap_privatizer1", type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>}> ({
  ^bb0(%arg9: !llvm.ptr loc("<stdin>":16:8), %arg10: !llvm.ptr loc("<stdin>":16:26)):
    "llvm.call"(%arg9) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @alloc_foo_1, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (!llvm.ptr) -> () loc("<stdin>":17:5)
    "omp.yield"(%arg10) : (!llvm.ptr) -> () loc("<stdin>":18:5)
  }, {
  }, {
  ^bb0(%arg8: !llvm.ptr loc("<stdin>":21:8)):
    "llvm.call"(%arg8) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @dealloc_foo_1, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (!llvm.ptr) -> () loc("<stdin>":22:5)
    "omp.yield"() : () -> () loc("<stdin>":23:5)
  }) : () -> () loc("<stdin>":15:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{fir.bindc_name = "lb"}, {fir.bindc_name = "ub"}, {fir.bindc_name = "l"}], function_type = !llvm.func<void (ptr, ptr, ptr)>, linkage = #llvm.linkage<external>, sym_name = "target_allocatable_", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr loc("<stdin>":26:8), %arg1: !llvm.ptr loc("<stdin>":26:26), %arg2: !llvm.ptr loc("<stdin>":26:44)):
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":27:10)
    %1 = "llvm.alloca"(%0) <{elem_type = i32}> {bindc_name = "mapped_var"} : (i64) -> !llvm.ptr loc("<stdin>":28:10)
    %2 = "llvm.alloca"(%0) <{elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>}> {bindc_name = "alloc_var0"} : (i64) -> !llvm.ptr loc("<stdin>":29:10)
    %3 = "llvm.alloca"(%0) <{elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>}> {bindc_name = "alloc_var1"} : (i64) -> !llvm.ptr loc("<stdin>":30:10)
    %4 = "omp.map.info"(%1) <{map_capture_type = #omp<variable_capture_kind(ByCopy)>, map_type = #omp<clause_map_flags implicit>, name = "mapped_var", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":31:10)
    %5 = "omp.map.info"(%2) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":32:10)
    %6 = "omp.map.info"(%3) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":33:10)
    "omp.target"(%4, %5, %6, %2, %3) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 2, 0>, private_maps = array<i64: 1, 2>, private_syms = [@box.heap_privatizer0, @box.heap_privatizer1]}> ({
    ^bb0(%arg3: !llvm.ptr loc("<stdin>":35:10), %arg4: !llvm.ptr loc("<stdin>":35:28), %arg5: !llvm.ptr loc("<stdin>":35:46), %arg6: !llvm.ptr loc("<stdin>":35:64), %arg7: !llvm.ptr loc("<stdin>":35:82)):
      "llvm.call"(%arg6) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @use_private_var0, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (!llvm.ptr) -> () loc("<stdin>":36:7)
      "llvm.call"(%arg7) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @use_private_var1, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (!llvm.ptr) -> () loc("<stdin>":37:7)
      "omp.terminator"() : () -> () loc("<stdin>":38:7)
    }) : (!llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr) -> () loc("<stdin>":34:5)
    "llvm.return"() : () -> () loc("<stdin>":40:5)
  }) {fir.internal_name = "_QPtarget_allocatable"} : () -> () loc("<stdin>":25:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "use_private_var0", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":42:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "use_private_var1", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":44:3)
}) : () -> () loc("<stdin>":1:1)
