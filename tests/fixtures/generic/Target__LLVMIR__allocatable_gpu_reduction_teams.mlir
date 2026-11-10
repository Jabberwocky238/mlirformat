"builtin.module"() ({
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "_QFfooEi_private_i32", type = i32}> ({
  }, {
  }, {
  }) : () -> ()
  "omp.declare_reduction"() <{byref_element_type = f32, sym_name = "add_reduction_byref_box_heap_f32", type = !llvm.ptr}> ({
    %25 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %26 = "llvm.alloca"(%25) <{elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>}> : (i64) -> !llvm.ptr<5>
    %27 = "llvm.addrspacecast"(%26) : (!llvm.ptr<5>) -> !llvm.ptr
    "omp.yield"(%27) : (!llvm.ptr) -> ()
  }, {
  ^bb0(%arg7: !llvm.ptr, %arg8: !llvm.ptr):
    "omp.yield"(%arg8) : (!llvm.ptr) -> ()
  }, {
  ^bb0(%arg5: !llvm.ptr, %arg6: !llvm.ptr):
    %10 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %11 = "llvm.alloca"(%10) <{alignment = 8 : i64, elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>}> : (i32) -> !llvm.ptr<5>
    %12 = "llvm.addrspacecast"(%11) : (!llvm.ptr<5>) -> !llvm.ptr
    %13 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %14 = "llvm.alloca"(%13) <{alignment = 8 : i64, elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>}> : (i32) -> !llvm.ptr<5>
    %15 = "llvm.addrspacecast"(%14) : (!llvm.ptr<5>) -> !llvm.ptr
    %16 = "llvm.mlir.constant"() <{value = 24 : i32}> : () -> i32
    "llvm.intr.memcpy"(%15, %arg5, %16) <{isVolatile = false}> : (!llvm.ptr, !llvm.ptr, i32) -> ()
    %17 = "llvm.mlir.constant"() <{value = 24 : i32}> : () -> i32
    "llvm.intr.memcpy"(%12, %arg6, %17) <{isVolatile = false}> : (!llvm.ptr, !llvm.ptr, i32) -> ()
    %18 = "llvm.getelementptr"(%15) <{elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: 0, 0>}> : (!llvm.ptr) -> !llvm.ptr
    %19 = "llvm.load"(%18) <{ordering = 0 : i64}> : (!llvm.ptr) -> !llvm.ptr
    %20 = "llvm.getelementptr"(%12) <{elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: 0, 0>}> : (!llvm.ptr) -> !llvm.ptr
    %21 = "llvm.load"(%20) <{ordering = 0 : i64}> : (!llvm.ptr) -> !llvm.ptr
    %22 = "llvm.load"(%19) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32
    %23 = "llvm.load"(%21) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32
    %24 = "llvm.fadd"(%22, %23) <{fastmathFlags = #llvm.fastmath<contract>}> : (f32, f32) -> f32
    "llvm.store"(%24, %19) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> ()
    "omp.yield"(%arg5) : (!llvm.ptr) -> ()
  }, {
  }, {
  }, {
  ^bb0(%arg4: !llvm.ptr):
    %9 = "llvm.getelementptr"(%arg4) <{elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: 0, 0>}> : (!llvm.ptr) -> !llvm.ptr
    "omp.yield"(%9) : (!llvm.ptr) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "foo_", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %1 = "llvm.alloca"(%0) <{elem_type = i1}> : (i64) -> !llvm.ptr<5>
    %2 = "llvm.addrspacecast"(%1) : (!llvm.ptr<5>) -> !llvm.ptr
    %3 = "llvm.getelementptr"(%2) <{elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: 0, 0>}> : (!llvm.ptr) -> !llvm.ptr
    %4 = "omp.map.info"(%2, %3) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "", operandSegmentSizes = array<i32: 1, 1, 0, 0>, partial_map = false, var_ptr_ptr_type = f32, var_ptr_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>}> : (!llvm.ptr, !llvm.ptr) -> !llvm.ptr
    %5 = "omp.map.info"(%2, %4) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|always>, members_index = [[0]], name = "scalar_alloc", operandSegmentSizes = array<i32: 1, 0, 1, 0>, partial_map = false, var_ptr_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>}> : (!llvm.ptr, !llvm.ptr) -> !llvm.ptr
    %6 = "omp.map.info"(%2, %3) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags attach>, name = "scalar_alloc", operandSegmentSizes = array<i32: 1, 1, 0, 0>, partial_map = false, var_ptr_ptr_type = f32, var_ptr_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>}> : (!llvm.ptr, !llvm.ptr) -> !llvm.ptr
    "omp.target"(%5) <{kernel_type = #omp<kernel_type(spmd)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0>}> ({
    ^bb0(%arg0: !llvm.ptr):
      %7 = "llvm.mlir.constant"() <{value = 1000000 : i32}> : () -> i32
      %8 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
      "omp.teams"(%arg0) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 1, 0>, reduction_byref = array<i1: true>, reduction_syms = [@add_reduction_byref_box_heap_f32]}> ({
      ^bb0(%arg1: !llvm.ptr):
        "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
          "omp.distribute"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0>}> ({
            "omp.wsloop"(%arg1) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1, 0>, reduction_byref = array<i1: true>, reduction_syms = [@add_reduction_byref_box_heap_f32]}> ({
            ^bb0(%arg2: !llvm.ptr):
              "omp.loop_nest"(%8, %7, %8) <{loop_inclusive}> ({
              ^bb0(%arg3: i32):
                "omp.yield"() : () -> ()
              }) : (i32, i32, i32) -> ()
            }) {omp.composite} : (!llvm.ptr) -> ()
          }) {omp.composite} : () -> ()
          "omp.terminator"() : () -> ()
        }) {omp.composite} : () -> ()
        "omp.terminator"() : () -> ()
      }) {omp.combined} : (!llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) {omp.combined} : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) {dlti.dl_spec = #dlti.dl_spec<"dlti.alloca_memory_space" = 5 : ui64, "dlti.global_memory_space" = 1 : ui64>, llvm.target_triple = "amdgcn-amd-amdhsa", omp.is_gpu = true, omp.is_target_device = true} : () -> ()

