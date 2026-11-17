"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr)>, linkage = #llvm.linkage<external>, sym_name = "attach_always_", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg26: !llvm.ptr loc("<stdin>":3:8), %arg27: !llvm.ptr loc("<stdin>":3:27)):
    %14 = "omp.map.info"(%arg26, %arg27) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "", operandSegmentSizes = array<i32: 1, 1, 0, 0>, partial_map = false, var_ptr_ptr_type = i32, var_ptr_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>}> : (!llvm.ptr, !llvm.ptr) -> !llvm.ptr loc("<stdin>":4:11)
    %15 = "omp.map.info"(%arg26, %14) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|always>, members_index = [[0]], name = "x", operandSegmentSizes = array<i32: 1, 0, 1, 0>, partial_map = false, var_ptr_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>}> : (!llvm.ptr, !llvm.ptr) -> !llvm.ptr loc("<stdin>":5:11)
    %16 = "omp.map.info"(%arg26, %arg27) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags always|attach|ref_ptr|ref_ptee>, name = "x", operandSegmentSizes = array<i32: 1, 1, 0, 0>, partial_map = false, var_ptr_ptr_type = i32, var_ptr_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>}> : (!llvm.ptr, !llvm.ptr) -> !llvm.ptr loc("<stdin>":6:11)
    "omp.target"(%15, %16, %14) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0>}> ({
    ^bb0(%arg28: !llvm.ptr loc("<stdin>":8:10), %arg29: !llvm.ptr loc("<stdin>":8:29), %arg30: !llvm.ptr loc("<stdin>":8:48)):
      "omp.terminator"() : () -> () loc("<stdin>":9:7)
    }) : (!llvm.ptr, !llvm.ptr, !llvm.ptr) -> () loc("<stdin>":7:5)
    "llvm.return"() : () -> () loc("<stdin>":11:5)
  }) : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr)>, linkage = #llvm.linkage<external>, sym_name = "attach_never_", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg22: !llvm.ptr loc("<stdin>":14:8), %arg23: !llvm.ptr loc("<stdin>":14:27)):
    %12 = "omp.map.info"(%arg22, %arg23) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "", operandSegmentSizes = array<i32: 1, 1, 0, 0>, partial_map = false, var_ptr_ptr_type = i32, var_ptr_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>}> : (!llvm.ptr, !llvm.ptr) -> !llvm.ptr loc("<stdin>":15:11)
    %13 = "omp.map.info"(%arg22, %12) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|always>, members_index = [[0]], name = "x", operandSegmentSizes = array<i32: 1, 0, 1, 0>, partial_map = false, var_ptr_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>}> : (!llvm.ptr, !llvm.ptr) -> !llvm.ptr loc("<stdin>":16:11)
    "omp.target"(%13, %12) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0>}> ({
    ^bb0(%arg24: !llvm.ptr loc("<stdin>":18:10), %arg25: !llvm.ptr loc("<stdin>":18:29)):
      "omp.terminator"() : () -> () loc("<stdin>":19:7)
    }) : (!llvm.ptr, !llvm.ptr) -> () loc("<stdin>":17:5)
    "llvm.return"() : () -> () loc("<stdin>":21:5)
  }) : () -> () loc("<stdin>":13:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr)>, linkage = #llvm.linkage<external>, sym_name = "attach_auto_", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg17: !llvm.ptr loc("<stdin>":24:8), %arg18: !llvm.ptr loc("<stdin>":24:27)):
    %9 = "omp.map.info"(%arg17, %arg18) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "", operandSegmentSizes = array<i32: 1, 1, 0, 0>, partial_map = false, var_ptr_ptr_type = i32, var_ptr_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>}> : (!llvm.ptr, !llvm.ptr) -> !llvm.ptr loc("<stdin>":25:10)
    %10 = "omp.map.info"(%arg17, %9) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|always>, members_index = [[0]], name = "x", operandSegmentSizes = array<i32: 1, 0, 1, 0>, partial_map = false, var_ptr_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>}> : (!llvm.ptr, !llvm.ptr) -> !llvm.ptr loc("<stdin>":26:11)
    %11 = "omp.map.info"(%arg17, %arg18) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags attach|ref_ptr|ref_ptee>, name = "x", operandSegmentSizes = array<i32: 1, 1, 0, 0>, partial_map = false, var_ptr_ptr_type = i32, var_ptr_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>}> : (!llvm.ptr, !llvm.ptr) -> !llvm.ptr loc("<stdin>":27:11)
    "omp.target"(%10, %11, %9) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0>}> ({
    ^bb0(%arg19: !llvm.ptr loc("<stdin>":29:10), %arg20: !llvm.ptr loc("<stdin>":29:29), %arg21: !llvm.ptr loc("<stdin>":29:48)):
      "omp.terminator"() : () -> () loc("<stdin>":30:7)
    }) : (!llvm.ptr, !llvm.ptr, !llvm.ptr) -> () loc("<stdin>":28:5)
    "llvm.return"() : () -> () loc("<stdin>":32:5)
  }) : () -> () loc("<stdin>":23:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr)>, linkage = #llvm.linkage<external>, sym_name = "ref_ptr_ptee_", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg12: !llvm.ptr loc("<stdin>":35:8), %arg13: !llvm.ptr loc("<stdin>":35:27)):
    %6 = "omp.map.info"(%arg12, %arg13) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|ref_ptr|ref_ptee>, name = "", operandSegmentSizes = array<i32: 1, 1, 0, 0>, partial_map = false, var_ptr_ptr_type = i32, var_ptr_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>}> : (!llvm.ptr, !llvm.ptr) -> !llvm.ptr loc("<stdin>":36:10)
    %7 = "omp.map.info"(%arg12, %6) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|ref_ptr|ref_ptee>, members_index = [[0]], name = "x", operandSegmentSizes = array<i32: 1, 0, 1, 0>, partial_map = false, var_ptr_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>}> : (!llvm.ptr, !llvm.ptr) -> !llvm.ptr loc("<stdin>":37:10)
    %8 = "omp.map.info"(%arg12, %arg13) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags attach|ref_ptr|ref_ptee>, name = "x", operandSegmentSizes = array<i32: 1, 1, 0, 0>, partial_map = false, var_ptr_ptr_type = i32, var_ptr_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>}> : (!llvm.ptr, !llvm.ptr) -> !llvm.ptr loc("<stdin>":38:10)
    "omp.target"(%7, %8, %6) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0>}> ({
    ^bb0(%arg14: !llvm.ptr loc("<stdin>":40:10), %arg15: !llvm.ptr loc("<stdin>":40:29), %arg16: !llvm.ptr loc("<stdin>":40:48)):
      "omp.terminator"() : () -> () loc("<stdin>":41:7)
    }) : (!llvm.ptr, !llvm.ptr, !llvm.ptr) -> () loc("<stdin>":39:5)
    "llvm.return"() : () -> () loc("<stdin>":43:5)
  }) : () -> () loc("<stdin>":34:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr)>, linkage = #llvm.linkage<external>, sym_name = "ref_ptr_", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg8: !llvm.ptr loc("<stdin>":46:8), %arg9: !llvm.ptr loc("<stdin>":46:26)):
    %4 = "omp.map.info"(%arg8) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|ref_ptr>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":47:10)
    %5 = "omp.map.info"(%arg8, %arg9) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags attach|ref_ptr>, name = "x", operandSegmentSizes = array<i32: 1, 1, 0, 0>, partial_map = false, var_ptr_ptr_type = i32, var_ptr_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>}> : (!llvm.ptr, !llvm.ptr) -> !llvm.ptr loc("<stdin>":48:10)
    "omp.target"(%5, %4) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0>}> ({
    ^bb0(%arg10: !llvm.ptr loc("<stdin>":50:10), %arg11: !llvm.ptr loc("<stdin>":50:29)):
      "omp.terminator"() : () -> () loc("<stdin>":51:7)
    }) : (!llvm.ptr, !llvm.ptr) -> () loc("<stdin>":49:5)
    "llvm.return"() : () -> () loc("<stdin>":53:5)
  }) : () -> () loc("<stdin>":45:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr)>, linkage = #llvm.linkage<external>, sym_name = "ref_ptee_", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg4: !llvm.ptr loc("<stdin>":56:8), %arg5: !llvm.ptr loc("<stdin>":56:26)):
    %2 = "omp.map.info"(%arg4, %arg5) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|ref_ptee>, name = "", operandSegmentSizes = array<i32: 1, 1, 0, 0>, partial_map = false, var_ptr_ptr_type = i32, var_ptr_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>}> : (!llvm.ptr, !llvm.ptr) -> !llvm.ptr loc("<stdin>":57:10)
    %3 = "omp.map.info"(%arg4, %arg5) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags attach|ref_ptee>, name = "x", operandSegmentSizes = array<i32: 1, 1, 0, 0>, partial_map = false, var_ptr_ptr_type = i32, var_ptr_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>}> : (!llvm.ptr, !llvm.ptr) -> !llvm.ptr loc("<stdin>":58:10)
    "omp.target"(%3, %2) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0>}> ({
    ^bb0(%arg6: !llvm.ptr loc("<stdin>":60:10), %arg7: !llvm.ptr loc("<stdin>":60:28)):
      "omp.terminator"() : () -> () loc("<stdin>":61:7)
    }) : (!llvm.ptr, !llvm.ptr) -> () loc("<stdin>":59:5)
    "llvm.return"() : () -> () loc("<stdin>":63:5)
  }) : () -> () loc("<stdin>":55:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr)>, linkage = #llvm.linkage<external>, sym_name = "ref_ptr_ptee_attach_never_", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr loc("<stdin>":66:8), %arg1: !llvm.ptr loc("<stdin>":66:26)):
    %0 = "omp.map.info"(%arg0, %arg1) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|ref_ptr|ref_ptee>, name = "", operandSegmentSizes = array<i32: 1, 1, 0, 0>, partial_map = false, var_ptr_ptr_type = i32, var_ptr_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>}> : (!llvm.ptr, !llvm.ptr) -> !llvm.ptr loc("<stdin>":67:10)
    %1 = "omp.map.info"(%arg0, %0) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|ref_ptr|ref_ptee>, members_index = [[0]], name = "x", operandSegmentSizes = array<i32: 1, 0, 1, 0>, partial_map = false, var_ptr_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>}> : (!llvm.ptr, !llvm.ptr) -> !llvm.ptr loc("<stdin>":68:10)
    "omp.target"(%1, %0) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0>}> ({
    ^bb0(%arg2: !llvm.ptr loc("<stdin>":70:10), %arg3: !llvm.ptr loc("<stdin>":70:28)):
      "omp.terminator"() : () -> () loc("<stdin>":71:7)
    }) : (!llvm.ptr, !llvm.ptr) -> () loc("<stdin>":69:5)
    "llvm.return"() : () -> () loc("<stdin>":73:5)
  }) : () -> () loc("<stdin>":65:3)
}) {omp.is_gpu = false, omp.is_target_device = false, omp.requires = #omp<clause_requires none>, omp.target_triples = ["amdgcn-amd-amdhsa"], omp.version = #omp.version<version = 61>} : () -> () loc("<stdin>":1:1)
