"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "alloc_foo_1", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "dealloc_foo_1", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":4:3)
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "box.heap_privatizer", type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>}> ({
  ^bb0(%arg7: !llvm.ptr loc("<stdin>":7:8), %arg8: !llvm.ptr loc("<stdin>":7:26)):
    "llvm.call"(%arg7) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @alloc_foo_1, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (!llvm.ptr) -> () loc("<stdin>":8:5)
    "omp.yield"(%arg8) : (!llvm.ptr) -> () loc("<stdin>":9:5)
  }, {
  }, {
  ^bb0(%arg6: !llvm.ptr loc("<stdin>":12:8)):
    "llvm.br"()[^bb1] : () -> () loc("<stdin>":13:5)
  ^bb1:  // pred: ^bb0
    "llvm.call"(%arg6) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @dealloc_foo_1, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (!llvm.ptr) -> () loc("<stdin>":15:5)
    "omp.yield"() : () -> () loc("<stdin>":16:5)
  }) : () -> () loc("<stdin>":6:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{fir.bindc_name = "lb"}, {fir.bindc_name = "ub"}, {fir.bindc_name = "l"}], function_type = !llvm.func<void (ptr, ptr, ptr)>, linkage = #llvm.linkage<external>, sym_name = "target_allocatable_", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr loc("<stdin>":19:8), %arg1: !llvm.ptr loc("<stdin>":19:26), %arg2: !llvm.ptr loc("<stdin>":19:44)):
    %0 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":20:10)
    %1 = "llvm.alloca"(%0) <{alignment = 8 : i64, elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>}> : (i32) -> !llvm.ptr loc("<stdin>":21:10)
    %2 = "llvm.alloca"(%0) <{alignment = 8 : i64, elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>}> : (i32) -> !llvm.ptr loc("<stdin>":22:10)
    %3 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":23:10)
    %4 = "llvm.alloca"(%3) <{elem_type = f32}> {bindc_name = "real_var"} : (i64) -> !llvm.ptr loc("<stdin>":24:10)
    %5 = "llvm.alloca"(%3) <{elem_type = i32}> {bindc_name = "mapped_var"} : (i64) -> !llvm.ptr loc("<stdin>":25:10)
    %6 = "llvm.alloca"(%3) <{elem_type = !llvm.struct<(f32, f32)>}> {bindc_name = "comp_var"} : (i64) -> !llvm.ptr loc("<stdin>":26:10)
    %7 = "llvm.alloca"(%0) <{alignment = 8 : i64, elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>}> : (i32) -> !llvm.ptr loc("<stdin>":27:10)
    %8 = "llvm.alloca"(%3) <{elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>}> {bindc_name = "alloc_var"} : (i64) -> !llvm.ptr loc("<stdin>":28:10)
    %9 = "llvm.load"(%arg2) <{ordering = 0 : i64}> : (!llvm.ptr) -> i64 loc("<stdin>":29:10)
    %10 = "llvm.alloca"(%9) <{elem_type = f32}> {bindc_name = "real_arr"} : (i64) -> !llvm.ptr loc("<stdin>":30:11)
    %11 = "omp.map.info"(%5) <{map_capture_type = #omp<variable_capture_kind(ByCopy)>, map_type = #omp<clause_map_flags implicit>, name = "mapped_var", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":31:11)
    %12 = "omp.map.info"(%8) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":32:11)
    "omp.target"(%11, %12, %8) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 1, 0>, private_maps = array<i64: 1>, private_syms = [@box.heap_privatizer]}> ({
    ^bb0(%arg3: !llvm.ptr loc("<stdin>":34:10), %arg4: !llvm.ptr loc("<stdin>":34:28), %arg5: !llvm.ptr loc("<stdin>":34:46)):
      "llvm.call"(%arg5) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @use_private_var, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (!llvm.ptr) -> () loc("<stdin>":35:7)
      "omp.terminator"() : () -> () loc("<stdin>":36:7)
    }) : (!llvm.ptr, !llvm.ptr, !llvm.ptr) -> () loc("<stdin>":33:5)
    "llvm.return"() : () -> () loc("<stdin>":38:5)
  }) {fir.internal_name = "_QPtarget_allocatable"} : () -> () loc("<stdin>":18:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "use_private_var", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":40:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<struct<()> (ptr, ptr, ptr, i32)>, linkage = #llvm.linkage<external>, sym_name = "_FortranAAssign", sym_visibility = "private", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) {fir.runtime} : () -> () loc("<stdin>":42:3)
}) : () -> () loc("<stdin>":1:1)
