"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "external", sym_visibility = "private", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<struct<(i32, f32)> (ptr)>, linkage = #llvm.linkage<external>, sym_name = "basic_checks", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg48: !llvm.ptr):
    %88 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %89 = "llvm.alloca"(%88) <{elem_type = i32}> : (i64) -> !llvm.ptr
    %90 = "llvm.mlir.constant"() <{value = 10 : i32}> : () -> i32
    %91 = "llvm.mlir.constant"() <{value = 2.500000e+00 : f32}> : () -> f32
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @foo, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    %92 = "llvm.mlir.addressof"() <{global_name = @global_scalar}> : () -> !llvm.ptr
    %93 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %94 = "omp.map.info"(%arg48) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    %95 = "omp.map.info"(%92) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    %96 = "omp.map.info"(%89) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    %97 = "omp.map.info"(%89) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    "omp.target"(%96, %94, %95, %97) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 3, 0, 0, 0>}> ({
    ^bb0(%arg49: !llvm.ptr, %arg50: !llvm.ptr, %arg51: !llvm.ptr, %arg52: !llvm.ptr):
      "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @foo, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr) -> ()
    "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
      "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @foo, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    %98 = "omp.map.info"(%arg48) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    %99 = "omp.map.info"(%92) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    %100 = "omp.map.info"(%89) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    %101 = "omp.map.info"(%89) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    "omp.target_data"(%98, %99, %100, %101) <{operandSegmentSizes = array<i32: 0, 0, 4, 0, 0, 0>}> ({
      "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @foo, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr) -> ()
    %102 = "omp.map.info"(%arg48) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    "omp.target_enter_data"(%102) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 1, 0>}> : (!llvm.ptr) -> ()
    %103 = "omp.map.info"(%92) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags from>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    "omp.target_exit_data"(%103) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 1, 0>}> : (!llvm.ptr) -> ()
    %104 = "omp.map.info"(%89) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = !llvm.ptr}> : (!llvm.ptr) -> !llvm.ptr
    "omp.target_update"(%104) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 1, 0>}> : (!llvm.ptr) -> ()
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @foo, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    %105 = "llvm.mlir.poison"() : () -> !llvm.struct<(i32, f32)>
    %106 = "llvm.insertvalue"(%105, %90) <{position = array<i64: 0>}> : (!llvm.struct<(i32, f32)>, i32) -> !llvm.struct<(i32, f32)>
    %107 = "llvm.insertvalue"(%106, %91) <{position = array<i64: 1>}> : (!llvm.struct<(i32, f32)>, f32) -> !llvm.struct<(i32, f32)>
    "llvm.return"(%107) : (!llvm.struct<(i32, f32)>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "member_map_complex_init", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg45: !llvm.ptr):
    %66 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %67 = "llvm.alloca"(%66) <{alignment = 8 : i64, elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<15 x array<3 x i64>>)>}> : (i32) -> !llvm.ptr
    %68 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %69 = "llvm.alloca"(%68) <{elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<15 x array<3 x i64>>)>}> : (i64) -> !llvm.ptr
    %70 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %71 = "llvm.alloca"(%70) <{elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<15 x array<3 x i64>>)>}> : (i64) -> !llvm.ptr
    %72 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %73 = "llvm.mlir.constant"() <{value = 0 : i8}> : () -> i8
    %74 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %75 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %76 = "llvm.mlir.zero"() : () -> !llvm.ptr
    "llvm.call"(%71, %arg45, %76, %73, %72) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @LangRTPlaceholderFunc, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 5, 0>}> : (!llvm.ptr, !llvm.ptr, !llvm.ptr, i8, i32) -> ()
    %77 = "llvm.mlir.constant"() <{value = 384 : i32}> : () -> i32
    "llvm.intr.memcpy"(%67, %71, %77) <{arg_attrs = [{llvm.align = 8 : i64}, {llvm.align = 8 : i64}, {}], isVolatile = false}> : (!llvm.ptr, !llvm.ptr, i32) -> ()
    %78 = "llvm.mlir.constant"() <{value = 24 : i32}> : () -> i32
    %79 = "llvm.getelementptr"(%67) <{elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<15 x array<3 x i64>>)>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: 0, 3>}> : (!llvm.ptr) -> !llvm.ptr
    %80 = "llvm.load"(%79) <{ordering = 0 : i64}> : (!llvm.ptr) -> i8
    %81 = "llvm.sext"(%80) : (i8) -> i32
    %82 = "llvm.mlir.constant"() <{value = 24 : i32}> : () -> i32
    %83 = "llvm.mul"(%82, %81) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
    %84 = "llvm.add"(%78, %83) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
    "llvm.intr.memcpy"(%69, %67, %84) <{isVolatile = false}> : (!llvm.ptr, !llvm.ptr, i32) -> ()
    %85 = "llvm.getelementptr"(%69) <{elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<15 x array<3 x i64>>)>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: 0, 0>}> : (!llvm.ptr) -> !llvm.ptr
    %86 = "omp.map.info"(%69, %85) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, partial_map = false, var_ptr_ptr_type = f32, var_ptr_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<15 x array<3 x i64>>)>}> : (!llvm.ptr, !llvm.ptr) -> !llvm.ptr
    %87 = "omp.map.info"(%69, %86) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to>, members_index = [[0]], operandSegmentSizes = array<i32: 1, 0, 1, 0>, partial_map = false, var_ptr_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<15 x array<3 x i64>>)>}> : (!llvm.ptr, !llvm.ptr) -> !llvm.ptr
    "omp.target"(%87, %86) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0>}> ({
    ^bb0(%arg46: !llvm.ptr, %arg47: !llvm.ptr):
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr, ptr)>, linkage = #llvm.linkage<external>, sym_name = "target_data", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg37: !llvm.ptr, %arg38: !llvm.ptr, %arg39: !llvm.ptr):
    %60 = "omp.map.info"(%arg37) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    %61 = "omp.map.info"(%arg38) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags return_param>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    %62 = "omp.map.info"(%arg39) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags return_param>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = !llvm.struct<"MyStruct", (i64)>}> : (!llvm.ptr) -> !llvm.ptr
    "omp.target_data"(%60, %61, %62) <{operandSegmentSizes = array<i32: 0, 0, 1, 0, 1, 1>}> ({
    ^bb0(%arg40: !llvm.ptr, %arg41: !llvm.ptr):
      %63 = "omp.map.info"(%arg37) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr
      %64 = "omp.map.info"(%arg40) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr
      %65 = "omp.map.info"(%arg41) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = !llvm.struct<"MyStruct", (i64)>}> : (!llvm.ptr) -> !llvm.ptr
      "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @foo, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
      "omp.target"(%63, %64, %65) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0>}> ({
      ^bb0(%arg42: !llvm.ptr, %arg43: !llvm.ptr, %arg44: !llvm.ptr):
        "omp.terminator"() : () -> ()
      }) : (!llvm.ptr, !llvm.ptr, !llvm.ptr) -> ()
      "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @foo, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr, !llvm.ptr, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "no_target", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg36: !llvm.ptr):
    %58 = "omp.map.info"(%arg36) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    "omp.target_data"(%58) <{operandSegmentSizes = array<i32: 0, 0, 1, 0, 0, 0>}> ({
      %59 = "omp.map.info"(%arg36) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr
      "omp.target_data"(%59) <{operandSegmentSizes = array<i32: 0, 0, 1, 0, 0, 0>}> ({
        "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @foo, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
        "omp.terminator"() : () -> ()
      }) : (!llvm.ptr) -> ()
      "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @foo, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "map_info_members", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg33: !llvm.ptr):
    %40 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %41 = "llvm.alloca"(%40) <{alignment = 8 : i64, elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>}> : (i32) -> !llvm.ptr
    %42 = "llvm.mlir.constant"() <{value = 0 : index}> : () -> i64
    %43 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64
    %44 = "llvm.mlir.constant"() <{value = 9 : index}> : () -> i64
    %45 = "llvm.mlir.constant"() <{value = 48 : i32}> : () -> i32
    "llvm.intr.memcpy"(%41, %arg33, %45) <{arg_attrs = [{llvm.align = 8 : i64}, {llvm.align = 8 : i64}, {}], isVolatile = false}> : (!llvm.ptr, !llvm.ptr, i32) -> ()
    %46 = "llvm.getelementptr"(%41, %42) <{elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: 0, 7, -2147483648, 0>}> : (!llvm.ptr, i64) -> !llvm.ptr
    %47 = "llvm.load"(%46) <{ordering = 0 : i64}> : (!llvm.ptr) -> i64
    %48 = "llvm.getelementptr"(%41, %42) <{elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: 0, 7, -2147483648, 1>}> : (!llvm.ptr, i64) -> !llvm.ptr
    %49 = "llvm.load"(%48) <{ordering = 0 : i64}> : (!llvm.ptr) -> i64
    %50 = "llvm.getelementptr"(%41, %42) <{elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: 0, 7, -2147483648, 2>}> : (!llvm.ptr, i64) -> !llvm.ptr
    %51 = "llvm.load"(%50) <{ordering = 0 : i64}> : (!llvm.ptr) -> i64
    %52 = "llvm.sub"(%43, %47) <{overflowFlags = 0 : i32}> : (i64, i64) -> i64
    %53 = "llvm.sub"(%44, %47) <{overflowFlags = 0 : i32}> : (i64, i64) -> i64
    %54 = "omp.map.bounds"(%52, %53, %49, %51, %47) <{operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>, stride_in_bytes = true}> : (i64, i64, i64, i64, i64) -> !omp.map_bounds_ty
    %55 = "llvm.getelementptr"(%arg33) <{elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: 0, 0>}> : (!llvm.ptr) -> !llvm.ptr
    %56 = "omp.map.info"(%arg33, %55, %54) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, operandSegmentSizes = array<i32: 1, 1, 0, 1>, partial_map = false, var_ptr_ptr_type = f32, var_ptr_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>}> : (!llvm.ptr, !llvm.ptr, !omp.map_bounds_ty) -> !llvm.ptr
    %57 = "omp.map.info"(%arg33, %56) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to>, members_index = [[0]], operandSegmentSizes = array<i32: 1, 0, 1, 0>, partial_map = false, var_ptr_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>}> : (!llvm.ptr, !llvm.ptr) -> !llvm.ptr
    "omp.target"(%57, %56) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0>}> ({
    ^bb0(%arg34: !llvm.ptr, %arg35: !llvm.ptr):
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr)>, linkage = #llvm.linkage<external>, sym_name = "control_flow", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg29: !llvm.ptr, %arg30: !llvm.ptr):
    %31 = "llvm.load"(%arg30) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
    %32 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    %33 = "llvm.icmp"(%31, %32) <{predicate = 1 : i64}> : (i32, i32) -> i1
    "llvm.cond_br"(%33)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb1:  // pred: ^bb0
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @foo, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    %34 = "omp.map.info"(%arg29) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    "omp.target"(%34) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0>}> ({
    ^bb0(%arg32: !llvm.ptr):
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr) -> ()
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @foo, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    "llvm.br"()[^bb2] : () -> ()
  ^bb2:  // 2 preds: ^bb0, ^bb1
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @foo, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    %35 = "omp.map.info"(%arg29) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    "omp.target_data"(%35) <{operandSegmentSizes = array<i32: 0, 0, 1, 0, 0, 0>}> ({
      "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @foo, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
      %36 = "llvm.load"(%arg30) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
      %37 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
      %38 = "llvm.icmp"(%36, %37) <{predicate = 1 : i64}> : (i32, i32) -> i1
      "llvm.cond_br"(%38)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
    ^bb1:  // pred: ^bb0
      "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @foo, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
      %39 = "omp.map.info"(%arg29) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr
      "omp.target"(%39) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0>}> ({
      ^bb0(%arg31: !llvm.ptr):
        "omp.terminator"() : () -> ()
      }) : (!llvm.ptr) -> ()
      "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @foo, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
      "llvm.br"()[^bb2] : () -> ()
    ^bb2:  // 2 preds: ^bb0, ^bb1
      "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @foo, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr) -> ()
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @foo, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "block_args", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg23: !llvm.ptr):
    "omp.parallel"(%arg23) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 1, 0>, private_syms = [@privatizer]}> ({
    ^bb0(%arg27: !llvm.ptr):
      %30 = "omp.map.info"(%arg27) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr
      "omp.target"(%30) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0>}> ({
      ^bb0(%arg28: !llvm.ptr):
        "omp.terminator"() : () -> ()
      }) : (!llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr) -> ()
    "omp.parallel"(%arg23) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 1, 0>, private_syms = [@privatizer]}> ({
    ^bb0(%arg24: !llvm.ptr):
      %28 = "omp.map.info"(%arg24) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr
      "omp.target_data"(%28) <{operandSegmentSizes = array<i32: 0, 0, 1, 0, 0, 0>}> ({
        "omp.parallel"(%arg24) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 1, 0>, private_syms = [@privatizer]}> ({
        ^bb0(%arg25: !llvm.ptr):
          %29 = "omp.map.info"(%arg25) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr
          "omp.target"(%29) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0>}> ({
          ^bb0(%arg26: !llvm.ptr):
            "omp.terminator"() : () -> ()
          }) : (!llvm.ptr) -> ()
          "omp.terminator"() : () -> ()
        }) : (!llvm.ptr) -> ()
        "omp.terminator"() : () -> ()
      }) : (!llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "reuse_tests", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %21 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %22 = "llvm.mlir.addressof"() <{global_name = @global_scalar}> : () -> !llvm.ptr
    %23 = "omp.map.info"(%22) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    "omp.target_data"(%23) <{operandSegmentSizes = array<i32: 0, 0, 1, 0, 0, 0>}> ({
      %26 = "omp.map.info"(%22) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr
      %27 = "omp.map.info"(%22) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr
      "omp.target"(%26, %27) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0>}> ({
      ^bb0(%arg21: !llvm.ptr, %arg22: !llvm.ptr):
        "omp.terminator"() : () -> ()
      }) : (!llvm.ptr, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr) -> ()
    %24 = "llvm.load"(%22) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
    %25 = "omp.map.info"(%22) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    "omp.target"(%25, %24) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1>}> ({
    ^bb0(%arg20: !llvm.ptr):
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr, i32) -> ()
    "omp.target"(%21) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1>}> ({
      "omp.terminator"() : () -> ()
    }) : (i32) -> ()
    "omp.target"(%21) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1>}> ({
      "omp.terminator"() : () -> ()
    }) : (i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, i32, i1)>, linkage = #llvm.linkage<external>, sym_name = "all_non_map_clauses", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg15: !llvm.ptr, %arg16: i32, %arg17: i1):
    %20 = "omp.map.info"(%arg15) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    "omp.target_data"(%arg16, %arg17, %20) <{operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0>}> ({
      "omp.terminator"() : () -> ()
    }) : (i32, i1, !llvm.ptr) -> ()
    "omp.target"(%arg15, %arg15, %arg15, %arg16, %arg17, %arg15, %arg15, %arg16) <{depend_iterated_kinds = [], depend_kinds = [#omp<clause_task_depend(taskdependin)>], in_reduction_byref = array<i1: false>, in_reduction_syms = [@reduction], kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 1, 1, 1, 0, 1, 0, 0, 0, 1, 1, 0, 0, 0, 1, 1>, private_maps = array<i64: -1>, private_syms = [@privatizer]}> ({
    ^bb0(%arg18: !llvm.ptr, %arg19: !llvm.ptr):
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr, !llvm.ptr, !llvm.ptr, i32, i1, !llvm.ptr, !llvm.ptr, i32) -> ()
    "omp.target_enter_data"(%arg15, %arg16, %arg17) <{depend_iterated_kinds = [], depend_kinds = [#omp<clause_task_depend(taskdependin)>], operandSegmentSizes = array<i32: 1, 0, 1, 1, 0, 0>}> : (!llvm.ptr, i32, i1) -> ()
    "omp.target_exit_data"(%arg15, %arg16, %arg17) <{depend_iterated_kinds = [], depend_kinds = [#omp<clause_task_depend(taskdependin)>], operandSegmentSizes = array<i32: 1, 0, 1, 1, 0, 0>}> : (!llvm.ptr, i32, i1) -> ()
    "omp.target_update"(%arg15, %arg16, %arg17) <{depend_iterated_kinds = [], depend_kinds = [#omp<clause_task_depend(taskdependin)>], operandSegmentSizes = array<i32: 1, 0, 1, 1, 0, 0>}> : (!llvm.ptr, i32, i1) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, i64)>, linkage = #llvm.linkage<external>, sym_name = "private_with_map_idx", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg12: !llvm.ptr, %arg13: i64):
    %12 = "llvm.mlir.undef"() : () -> !llvm.struct<(ptr, i64)>
    %13 = "llvm.insertvalue"(%12, %arg12) <{position = array<i64: 0>}> : (!llvm.struct<(ptr, i64)>, !llvm.ptr) -> !llvm.struct<(ptr, i64)>
    %14 = "llvm.insertvalue"(%13, %arg13) <{position = array<i64: 1>}> : (!llvm.struct<(ptr, i64)>, i64) -> !llvm.struct<(ptr, i64)>
    %15 = "llvm.extractvalue"(%14) <{position = array<i64: 0>}> : (!llvm.struct<(ptr, i64)>) -> !llvm.ptr
    %16 = "llvm.extractvalue"(%14) <{position = array<i64: 1>}> : (!llvm.struct<(ptr, i64)>) -> i64
    %17 = "llvm.mlir.undef"() : () -> !llvm.struct<(ptr, i64)>
    %18 = "llvm.insertvalue"(%17, %15) <{position = array<i64: 0>}> : (!llvm.struct<(ptr, i64)>, !llvm.ptr) -> !llvm.struct<(ptr, i64)>
    %19 = "llvm.insertvalue"(%18, %16) <{position = array<i64: 1>}> : (!llvm.struct<(ptr, i64)>, i64) -> !llvm.struct<(ptr, i64)>
    "omp.target"(%19) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0>, private_maps = array<i64: 0>, private_syms = [@struct_firstprivatizer]}> ({
    ^bb0(%arg14: !llvm.struct<(ptr, i64)>):
      "omp.terminator"() : () -> ()
    }) : (!llvm.struct<(ptr, i64)>) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = firstprivate}>, sym_name = "struct_firstprivatizer", type = !llvm.struct<(ptr, i64)>}> ({
  }, {
  ^bb0(%arg10: !llvm.struct<(ptr, i64)>, %arg11: !llvm.struct<(ptr, i64)>):
    "omp.yield"(%arg10) : (!llvm.struct<(ptr, i64)>) -> ()
  }, {
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i64)>, linkage = #llvm.linkage<external>, sym_name = "map_from_global_gep", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg8: i64):
    %9 = "llvm.mlir.addressof"() <{global_name = @global_array}> : () -> !llvm.ptr
    %10 = "llvm.getelementptr"(%9, %arg8) <{elem_type = i8, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i64) -> !llvm.ptr
    %11 = "omp.map.info"(%10) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    "omp.target"(%11) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0>}> ({
    ^bb0(%arg9: !llvm.ptr):
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "reciprocal_a", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %6 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %7 = "llvm.alloca"(%6) <{elem_type = i32}> : (i64) -> !llvm.ptr
    %8 = "omp.map.info"(%7) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    "omp.target"(%8) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0>}> ({
    ^bb0(%arg7: !llvm.ptr):
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr) -> ()
    "llvm.call"(%6) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @reciprocal_b, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (i64) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i64)>, linkage = #llvm.linkage<external>, sym_name = "reciprocal_b", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg5: i64):
    %3 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %4 = "llvm.alloca"(%3) <{elem_type = i32}> : (i64) -> !llvm.ptr
    %5 = "omp.map.info"(%4) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    "omp.target"(%5) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0>}> ({
    ^bb0(%arg6: !llvm.ptr):
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr) -> ()
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @reciprocal_a, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "foo", sym_visibility = "private", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) {omp.declare_target = #omp.declaretarget<device_type = (any), capture_clause = (enter)>} : () -> ()
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = firstprivate}>, sym_name = "privatizer", type = i32}> ({
  }, {
  ^bb0(%arg3: !llvm.ptr, %arg4: !llvm.ptr):
    %2 = "llvm.load"(%arg3) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
    "llvm.store"(%2, %arg4) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
    "omp.yield"(%arg4) : (!llvm.ptr) -> ()
  }, {
  }) : () -> ()
  "omp.declare_reduction"() <{sym_name = "reduction", type = i32}> ({
  }, {
  ^bb0(%arg2: i32):
    %1 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    "omp.yield"(%1) : (i32) -> ()
  }, {
  ^bb0(%arg0: i32, %arg1: i32):
    %0 = "llvm.add"(%arg0, %arg1) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
    "omp.yield"(%0) : (i32) -> ()
  }, {
  }, {
  }, {
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, constant, global_type = i32, linkage = #llvm.linkage<external>, sym_name = "global_scalar", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = !llvm.array<8 x i8>, linkage = #llvm.linkage<external>, sym_name = "global_array", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i32, linkage = #llvm.linkage<external>, sym_name = "declare_target_enter_any", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) {omp.declare_target = #omp.declaretarget<device_type = (any), capture_clause = (enter), automap = false>} : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i32, linkage = #llvm.linkage<external>, sym_name = "declare_target_enter_host", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) {omp.declare_target = #omp.declaretarget<device_type = (host), capture_clause = (enter), automap = false>} : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i32, linkage = #llvm.linkage<external>, sym_name = "declare_target_enter_nohost", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) {omp.declare_target = #omp.declaretarget<device_type = (nohost), capture_clause = (enter), automap = false>} : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i32, linkage = #llvm.linkage<external>, sym_name = "declare_target_link_any", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) {omp.declare_target = #omp.declaretarget<device_type = (any), capture_clause = (link), automap = false>} : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i32, linkage = #llvm.linkage<external>, sym_name = "declare_target_link_host", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) {omp.declare_target = #omp.declaretarget<device_type = (host), capture_clause = (link), automap = false>} : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i32, linkage = #llvm.linkage<external>, sym_name = "declare_target_link_nohost", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) {omp.declare_target = #omp.declaretarget<device_type = (nohost), capture_clause = (link), automap = false>} : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{llvm.nocapture}, {llvm.nocapture}, {}, {llvm.signext}, {}], function_type = !llvm.func<void (ptr, ptr, ptr, i8, i32)>, linkage = #llvm.linkage<external>, sym_name = "LangRTPlaceholderFunc", sym_visibility = "private", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
}) {omp.is_target_device = true} : () -> ()

