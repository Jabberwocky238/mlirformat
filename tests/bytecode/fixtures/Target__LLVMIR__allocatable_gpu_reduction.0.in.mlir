"builtin.module"() ({
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "_QFfooEi_private_i32", type = i32}> ({
  }, {
  }, {
  }) : () -> () loc("<stdin>":2:3)
  "omp.declare_reduction"() <{byref_element_type = f32, sym_name = "add_reduction_byref_box_heap_f32", type = !llvm.ptr}> ({
    %24 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":7:11)
    %25 = "llvm.alloca"(%24) <{elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>}> : (i64) -> !llvm.ptr<5> loc("<stdin>":8:11)
    %26 = "llvm.addrspacecast"(%25) : (!llvm.ptr<5>) -> !llvm.ptr loc("<stdin>":9:11)
    "omp.yield"(%26) : (!llvm.ptr) -> () loc("<stdin>":10:5)
  }, {
  ^bb0(%arg6: !llvm.ptr loc("<stdin>":12:8), %arg7: !llvm.ptr loc("<stdin>":12:26)):
    "omp.yield"(%arg7) : (!llvm.ptr) -> () loc("<stdin>":13:5)
  }, {
  ^bb0(%arg4: !llvm.ptr loc("<stdin>":15:8), %arg5: !llvm.ptr loc("<stdin>":15:26)):
    %9 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":16:10)
    %10 = "llvm.alloca"(%9) <{alignment = 8 : i64, elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>}> : (i32) -> !llvm.ptr<5> loc("<stdin>":17:11)
    %11 = "llvm.addrspacecast"(%10) : (!llvm.ptr<5>) -> !llvm.ptr loc("<stdin>":18:11)
    %12 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":19:11)
    %13 = "llvm.alloca"(%12) <{alignment = 8 : i64, elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>}> : (i32) -> !llvm.ptr<5> loc("<stdin>":20:11)
    %14 = "llvm.addrspacecast"(%13) : (!llvm.ptr<5>) -> !llvm.ptr loc("<stdin>":21:11)
    %15 = "llvm.mlir.constant"() <{value = 24 : i32}> : () -> i32 loc("<stdin>":22:11)
    "llvm.intr.memcpy"(%14, %arg4, %15) <{isVolatile = false}> : (!llvm.ptr, !llvm.ptr, i32) -> () loc("<stdin>":23:5)
    %16 = "llvm.mlir.constant"() <{value = 24 : i32}> : () -> i32 loc("<stdin>":24:11)
    "llvm.intr.memcpy"(%11, %arg5, %16) <{isVolatile = false}> : (!llvm.ptr, !llvm.ptr, i32) -> () loc("<stdin>":25:5)
    "llvm.br"()[^bb1] : () -> () loc("<stdin>":26:5)
  ^bb1:  // pred: ^bb0
    %17 = "llvm.getelementptr"(%14) <{elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: 0, 0>}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":28:11)
    %18 = "llvm.load"(%17) <{ordering = 0 : i64}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":29:11)
    %19 = "llvm.getelementptr"(%11) <{elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: 0, 0>}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":30:11)
    %20 = "llvm.load"(%19) <{ordering = 0 : i64}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":31:11)
    %21 = "llvm.load"(%18) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32 loc("<stdin>":32:11)
    %22 = "llvm.load"(%20) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32 loc("<stdin>":33:11)
    %23 = "llvm.fadd"(%21, %22) <{fastmathFlags = #llvm.fastmath<contract>}> : (f32, f32) -> f32 loc("<stdin>":34:11)
    "llvm.store"(%23, %18) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> () loc("<stdin>":35:5)
    "omp.yield"(%arg4) : (!llvm.ptr) -> () loc("<stdin>":36:5)
  }, {
  }, {
  }, {
  ^bb0(%arg3: !llvm.ptr loc("<stdin>":40:8)):
    %8 = "llvm.getelementptr"(%arg3) <{elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: 0, 0>}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":41:10)
    "omp.yield"(%8) : (!llvm.ptr) -> () loc("<stdin>":42:5)
  }) : () -> () loc("<stdin>":6:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "foo_", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":45:10)
    %1 = "llvm.alloca"(%0) <{elem_type = i1}> : (i64) -> !llvm.ptr<5> loc("<stdin>":46:10)
    %2 = "llvm.addrspacecast"(%1) : (!llvm.ptr<5>) -> !llvm.ptr loc("<stdin>":47:10)
    %3 = "llvm.getelementptr"(%2) <{elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: 0, 0>}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":48:10)
    %4 = "omp.map.info"(%2, %3) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from|implicit>, name = "", operandSegmentSizes = array<i32: 1, 1, 0, 0>, partial_map = false, var_ptr_ptr_type = f32, var_ptr_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>}> : (!llvm.ptr, !llvm.ptr) -> !llvm.ptr loc("<stdin>":49:10)
    %5 = "omp.map.info"(%2, %4) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|always|implicit>, members_index = [[0]], name = "scalar_alloc", operandSegmentSizes = array<i32: 1, 0, 1, 0>, partial_map = false, var_ptr_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>}> : (!llvm.ptr, !llvm.ptr) -> !llvm.ptr loc("<stdin>":50:10)
    "omp.target"(%5) <{kernel_type = #omp<kernel_type(spmd)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0>}> ({
    ^bb0(%arg0: !llvm.ptr loc("<stdin>":52:10)):
      %6 = "llvm.mlir.constant"() <{value = 1000 : i32}> : () -> i32 loc("<stdin>":53:12)
      %7 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":54:12)
      "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
        "omp.wsloop"(%arg0) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1, 0>, reduction_byref = array<i1: true>, reduction_syms = [@add_reduction_byref_box_heap_f32]}> ({
        ^bb0(%arg1: !llvm.ptr loc("<stdin>":57:14)):
          "omp.loop_nest"(%7, %6, %7) <{loop_inclusive}> ({
          ^bb0(%arg2: i32 loc("<stdin>":59:16)):
            "omp.yield"() : () -> () loc("<stdin>":60:13)
          }) : (i32, i32, i32) -> () loc("<stdin>":58:11)
        }) : (!llvm.ptr) -> () loc("<stdin>":56:9)
        "omp.terminator"() : () -> () loc("<stdin>":63:9)
      }) {omp.combined} : () -> () loc("<stdin>":55:7)
      "omp.terminator"() : () -> () loc("<stdin>":65:7)
    }) {omp.combined} : (!llvm.ptr) -> () loc("<stdin>":51:5)
    "llvm.return"() : () -> () loc("<stdin>":67:5)
  }) : () -> () loc("<stdin>":44:3)
}) {dlti.dl_spec = #dlti.dl_spec<"dlti.alloca_memory_space" = 5 : ui64, "dlti.global_memory_space" = 1 : ui64>, llvm.target_triple = "amdgcn-amd-amdhsa", omp.is_gpu = true, omp.is_target_device = true} : () -> () loc("<stdin>":1:1)
