"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "foo1", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "foo2", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":4:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "foo3", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":6:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "foo4", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":8:3)
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "multi_block.privatizer", type = f32}> ({
  ^bb0(%arg8: !llvm.ptr loc("<stdin>":11:8), %arg9: !llvm.ptr loc("<stdin>":11:26)):
    %10 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":12:11)
    %11 = "llvm.alloca"(%10) <{alignment = 8 : i64, elem_type = !llvm.struct<(i64)>}> : (i32) -> !llvm.ptr<5> loc("<stdin>":13:11)
    %12 = "llvm.load"(%arg8) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32 loc("<stdin>":14:11)
    %13 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":15:11)
    %14 = "llvm.mlir.constant"() <{value = 2 : i32}> : () -> i32 loc("<stdin>":16:11)
    %15 = "llvm.icmp"(%13, %14) <{predicate = 0 : i64}> : (i32, i32) -> i1 loc("<stdin>":17:11)
    "llvm.cond_br"(%15)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> () loc("<stdin>":18:5)
  ^bb1:  // pred: ^bb0
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @foo1, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> () loc("<stdin>":20:5)
    "llvm.br"()[^bb3] : () -> () loc("<stdin>":21:5)
  ^bb2:  // pred: ^bb0
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @foo2, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> () loc("<stdin>":23:5)
    "llvm.br"()[^bb3] : () -> () loc("<stdin>":24:5)
  ^bb3:  // 2 preds: ^bb1, ^bb2
    "llvm.store"(%12, %arg9) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> () loc("<stdin>":26:5)
    "omp.yield"(%arg9) : (!llvm.ptr) -> () loc("<stdin>":27:5)
  }, {
  }, {
  }) : () -> () loc("<stdin>":10:3)
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "multi_block.privatizer2", type = f32}> ({
  ^bb0(%arg6: !llvm.ptr loc("<stdin>":32:8), %arg7: !llvm.ptr loc("<stdin>":32:26)):
    %4 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":33:10)
    %5 = "llvm.alloca"(%4) <{alignment = 8 : i64, elem_type = !llvm.struct<(ptr)>}> : (i32) -> !llvm.ptr<5> loc("<stdin>":34:10)
    %6 = "llvm.load"(%arg6) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32 loc("<stdin>":35:10)
    %7 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":36:10)
    %8 = "llvm.mlir.constant"() <{value = 2 : i32}> : () -> i32 loc("<stdin>":37:10)
    %9 = "llvm.icmp"(%7, %8) <{predicate = 0 : i64}> : (i32, i32) -> i1 loc("<stdin>":38:10)
    "llvm.cond_br"(%9)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> () loc("<stdin>":39:5)
  ^bb1:  // pred: ^bb0
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @foo3, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> () loc("<stdin>":41:5)
    "llvm.br"()[^bb3] : () -> () loc("<stdin>":42:5)
  ^bb2:  // pred: ^bb0
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @foo4, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> () loc("<stdin>":44:5)
    "llvm.br"()[^bb3] : () -> () loc("<stdin>":45:5)
  ^bb3:  // 2 preds: ^bb1, ^bb2
    "llvm.store"(%6, %arg7) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> () loc("<stdin>":47:5)
    "omp.yield"(%arg7) : (!llvm.ptr) -> () loc("<stdin>":48:5)
  }, {
  }, {
  }) : () -> () loc("<stdin>":31:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr)>, linkage = #llvm.linkage<external>, sym_name = "parallel_op_private_multi_block", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr loc("<stdin>":53:8), %arg1: !llvm.ptr loc("<stdin>":53:26)):
    %0 = "omp.map.info"(%arg0) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags is_device_ptr>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = !llvm.ptr}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":54:10)
    %1 = "omp.map.info"(%arg1) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags is_device_ptr>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = !llvm.ptr}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":55:10)
    "omp.target"(%0, %1) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0>}> ({
    ^bb0(%arg2: !llvm.ptr loc("<stdin>":57:10), %arg3: !llvm.ptr loc("<stdin>":57:28)):
      "omp.parallel"(%arg2, %arg3) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 2, 0>, private_syms = [@multi_block.privatizer, @multi_block.privatizer2]}> ({
      ^bb0(%arg4: !llvm.ptr loc("<stdin>":59:12), %arg5: !llvm.ptr loc("<stdin>":59:30)):
        %2 = "llvm.load"(%arg4) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32 loc("<stdin>":60:14)
        %3 = "llvm.load"(%arg5) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32 loc("<stdin>":61:14)
        "omp.terminator"() : () -> () loc("<stdin>":62:9)
      }) : (!llvm.ptr, !llvm.ptr) -> () loc("<stdin>":58:7)
      "omp.terminator"() : () -> () loc("<stdin>":64:7)
    }) : (!llvm.ptr, !llvm.ptr) -> () loc("<stdin>":56:5)
    "llvm.return"() : () -> () loc("<stdin>":66:5)
  }) : () -> () loc("<stdin>":52:3)
}) {dlti.dl_spec = #dlti.dl_spec<"dlti.alloca_memory_space" = 5 : ui64, "dlti.global_memory_space" = 1 : ui64>, llvm.target_triple = "amdgcn-amd-amdhsa", omp.is_gpu = true, omp.is_target_device = true} : () -> () loc("<stdin>":1:1)
