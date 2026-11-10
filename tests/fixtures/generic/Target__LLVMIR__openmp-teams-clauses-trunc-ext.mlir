"builtin.module"() ({
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "_QFnum_threads_arg_2Ei_private_i32", type = i32}> ({
  }, {
  }, {
  }) : () -> ()
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "_QFnum_threads_const_2Ei_private_i32", type = i32}> ({
  }, {
  }, {
  }) : () -> ()
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "_QFnum_threads_arg_8Ei_private_i32", type = i32}> ({
  }, {
  }, {
  }) : () -> ()
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "_QFnum_threads_const_8Ei_private_i32", type = i32}> ({
  }, {
  }, {
  }) : () -> ()
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "_QFthread_limit_arg_2Ei_private_i32", type = i32}> ({
  }, {
  }, {
  }) : () -> ()
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "_QFthread_limit_const_2Ei_private_i32", type = i32}> ({
  }, {
  }, {
  }) : () -> ()
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "_QFthread_limit_arg_8Ei_private_i32", type = i32}> ({
  }, {
  }, {
  }) : () -> ()
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "_QFthread_limit_const_8Ei_private_i32", type = i32}> ({
  }, {
  }, {
  }) : () -> ()
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "_QFnum_teams_arg_2Ei_private_i32", type = i32}> ({
  }, {
  }, {
  }) : () -> ()
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "_QFnum_teams_const_2Ei_private_i32", type = i32}> ({
  }, {
  }, {
  }) : () -> ()
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "_QFnum_teams_arg_8Ei_private_i32", type = i32}> ({
  }, {
  }, {
  }) : () -> ()
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "_QFnum_teams_const_8Ei_private_i32", type = i32}> ({
  }, {
  }, {
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{fir.bindc_name = "n", llvm.noalias, llvm.nocapture}], function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "_QPnum_teams_const_8", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg106: !llvm.ptr):
    %84 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %85 = "llvm.mlir.constant"() <{value = 137 : i64}> : () -> i64
    %86 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %87 = "llvm.alloca"(%86) <{elem_type = i32}> {bindc_name = "i"} : (i64) -> !llvm.ptr
    %88 = "llvm.load"(%arg106) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
    %89 = "omp.map.info"(%87) <{map_capture_type = #omp<variable_capture_kind(ByCopy)>, map_type = #omp<clause_map_flags implicit>, name = "i", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    %90 = "omp.map.info"(%arg106) <{map_capture_type = #omp<variable_capture_kind(ByCopy)>, map_type = #omp<clause_map_flags implicit>, name = "n", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    "omp.target"(%84, %88, %84, %85, %89, %90) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 2, 0, 0, 0>}> ({
    ^bb0(%arg107: i32, %arg108: i32, %arg109: i32, %arg110: i64, %arg111: !llvm.ptr, %arg112: !llvm.ptr):
      "omp.teams"(%arg110) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1, 0, 0, 0>}> ({
        "omp.distribute"(%arg111) <{operandSegmentSizes = array<i32: 0, 0, 0, 1>, private_syms = [@_QFnum_teams_const_8Ei_private_i32]}> ({
        ^bb0(%arg113: !llvm.ptr):
          "omp.loop_nest"(%arg107, %arg108, %arg109) <{loop_inclusive}> ({
          ^bb0(%arg114: i32):
            "llvm.store"(%arg114, %arg113) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
            "omp.yield"() : () -> ()
          }) : (i32, i32, i32) -> ()
        }) : (!llvm.ptr) -> ()
        "omp.terminator"() : () -> ()
      }) {omp.combined} : (i64) -> ()
      "omp.terminator"() : () -> ()
    }) {omp.combined} : (i32, i32, i32, i64, !llvm.ptr, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{fir.bindc_name = "n", llvm.noalias, llvm.nocapture}, {fir.bindc_name = "t", llvm.noalias, llvm.nocapture}], function_type = !llvm.func<void (ptr, ptr)>, linkage = #llvm.linkage<external>, sym_name = "_QPnum_teams_arg_8", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg95: !llvm.ptr, %arg96: !llvm.ptr):
    %76 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %77 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %78 = "llvm.alloca"(%77) <{elem_type = i32}> {bindc_name = "i"} : (i64) -> !llvm.ptr
    %79 = "llvm.load"(%arg95) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
    %80 = "llvm.load"(%arg96) <{ordering = 0 : i64}> : (!llvm.ptr) -> i64
    %81 = "omp.map.info"(%arg96) <{map_capture_type = #omp<variable_capture_kind(ByCopy)>, map_type = #omp<clause_map_flags implicit>, name = "t", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i64}> : (!llvm.ptr) -> !llvm.ptr
    %82 = "omp.map.info"(%78) <{map_capture_type = #omp<variable_capture_kind(ByCopy)>, map_type = #omp<clause_map_flags implicit>, name = "i", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    %83 = "omp.map.info"(%arg95) <{map_capture_type = #omp<variable_capture_kind(ByCopy)>, map_type = #omp<clause_map_flags implicit>, name = "n", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    "omp.target"(%76, %79, %76, %80, %81, %82, %83) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 3, 0, 0, 0>}> ({
    ^bb0(%arg97: i32, %arg98: i32, %arg99: i32, %arg100: i64, %arg101: !llvm.ptr, %arg102: !llvm.ptr, %arg103: !llvm.ptr):
      "omp.teams"(%arg100) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1, 0, 0, 0>}> ({
        "omp.distribute"(%arg102) <{operandSegmentSizes = array<i32: 0, 0, 0, 1>, private_syms = [@_QFnum_teams_arg_8Ei_private_i32]}> ({
        ^bb0(%arg104: !llvm.ptr):
          "omp.loop_nest"(%arg97, %arg98, %arg99) <{loop_inclusive}> ({
          ^bb0(%arg105: i32):
            "llvm.store"(%arg105, %arg104) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
            "omp.yield"() : () -> ()
          }) : (i32, i32, i32) -> ()
        }) : (!llvm.ptr) -> ()
        "omp.terminator"() : () -> ()
      }) {omp.combined} : (i64) -> ()
      "omp.terminator"() : () -> ()
    }) {omp.combined} : (i32, i32, i32, i64, !llvm.ptr, !llvm.ptr, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{fir.bindc_name = "n", llvm.noalias, llvm.nocapture}], function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "_QPnum_teams_const_2", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg86: !llvm.ptr):
    %69 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %70 = "llvm.mlir.constant"() <{value = 137 : i16}> : () -> i16
    %71 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %72 = "llvm.alloca"(%71) <{elem_type = i32}> {bindc_name = "i"} : (i64) -> !llvm.ptr
    %73 = "llvm.load"(%arg86) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
    %74 = "omp.map.info"(%72) <{map_capture_type = #omp<variable_capture_kind(ByCopy)>, map_type = #omp<clause_map_flags implicit>, name = "i", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    %75 = "omp.map.info"(%arg86) <{map_capture_type = #omp<variable_capture_kind(ByCopy)>, map_type = #omp<clause_map_flags implicit>, name = "n", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    "omp.target"(%69, %73, %69, %70, %74, %75) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 2, 0, 0, 0>}> ({
    ^bb0(%arg87: i32, %arg88: i32, %arg89: i32, %arg90: i16, %arg91: !llvm.ptr, %arg92: !llvm.ptr):
      "omp.teams"(%arg90) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1, 0, 0, 0>}> ({
        "omp.distribute"(%arg91) <{operandSegmentSizes = array<i32: 0, 0, 0, 1>, private_syms = [@_QFnum_teams_const_2Ei_private_i32]}> ({
        ^bb0(%arg93: !llvm.ptr):
          "omp.loop_nest"(%arg87, %arg88, %arg89) <{loop_inclusive}> ({
          ^bb0(%arg94: i32):
            "llvm.store"(%arg94, %arg93) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
            "omp.yield"() : () -> ()
          }) : (i32, i32, i32) -> ()
        }) : (!llvm.ptr) -> ()
        "omp.terminator"() : () -> ()
      }) {omp.combined} : (i16) -> ()
      "omp.terminator"() : () -> ()
    }) {omp.combined} : (i32, i32, i32, i16, !llvm.ptr, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{fir.bindc_name = "n", llvm.noalias, llvm.nocapture}, {fir.bindc_name = "t", llvm.noalias, llvm.nocapture}], function_type = !llvm.func<void (ptr, ptr)>, linkage = #llvm.linkage<external>, sym_name = "_QPnum_teams_arg_2", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg75: !llvm.ptr, %arg76: !llvm.ptr):
    %61 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %62 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %63 = "llvm.alloca"(%62) <{elem_type = i32}> {bindc_name = "i"} : (i64) -> !llvm.ptr
    %64 = "llvm.load"(%arg75) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
    %65 = "llvm.load"(%arg76) <{ordering = 0 : i64}> : (!llvm.ptr) -> i16
    %66 = "omp.map.info"(%arg76) <{map_capture_type = #omp<variable_capture_kind(ByCopy)>, map_type = #omp<clause_map_flags implicit>, name = "t", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i16}> : (!llvm.ptr) -> !llvm.ptr
    %67 = "omp.map.info"(%63) <{map_capture_type = #omp<variable_capture_kind(ByCopy)>, map_type = #omp<clause_map_flags implicit>, name = "i", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    %68 = "omp.map.info"(%arg75) <{map_capture_type = #omp<variable_capture_kind(ByCopy)>, map_type = #omp<clause_map_flags implicit>, name = "n", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    "omp.target"(%61, %64, %61, %65, %66, %67, %68) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 3, 0, 0, 0>}> ({
    ^bb0(%arg77: i32, %arg78: i32, %arg79: i32, %arg80: i16, %arg81: !llvm.ptr, %arg82: !llvm.ptr, %arg83: !llvm.ptr):
      "omp.teams"(%arg80) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1, 0, 0, 0>}> ({
        "omp.distribute"(%arg82) <{operandSegmentSizes = array<i32: 0, 0, 0, 1>, private_syms = [@_QFnum_teams_arg_2Ei_private_i32]}> ({
        ^bb0(%arg84: !llvm.ptr):
          "omp.loop_nest"(%arg77, %arg78, %arg79) <{loop_inclusive}> ({
          ^bb0(%arg85: i32):
            "llvm.store"(%arg85, %arg84) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
            "omp.yield"() : () -> ()
          }) : (i32, i32, i32) -> ()
        }) : (!llvm.ptr) -> ()
        "omp.terminator"() : () -> ()
      }) {omp.combined} : (i16) -> ()
      "omp.terminator"() : () -> ()
    }) {omp.combined} : (i32, i32, i32, i16, !llvm.ptr, !llvm.ptr, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{fir.bindc_name = "n", llvm.noalias, llvm.nocapture}], function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "_QPthread_limit_const_8", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg67: !llvm.ptr):
    %54 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %55 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %56 = "llvm.alloca"(%55) <{elem_type = i32}> {bindc_name = "i"} : (i64) -> !llvm.ptr
    %57 = "llvm.load"(%arg67) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
    %58 = "omp.map.info"(%56) <{map_capture_type = #omp<variable_capture_kind(ByCopy)>, map_type = #omp<clause_map_flags implicit>, name = "i", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    %59 = "omp.map.info"(%arg67) <{map_capture_type = #omp<variable_capture_kind(ByCopy)>, map_type = #omp<clause_map_flags implicit>, name = "n", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    "omp.target"(%54, %57, %54, %58, %59) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 2, 0, 0, 0>}> ({
    ^bb0(%arg68: i32, %arg69: i32, %arg70: i32, %arg71: !llvm.ptr, %arg72: !llvm.ptr):
      %60 = "llvm.mlir.constant"() <{value = 137 : i64}> : () -> i64
      "omp.teams"(%60) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 1>}> ({
        "omp.distribute"(%arg71) <{operandSegmentSizes = array<i32: 0, 0, 0, 1>, private_syms = [@_QFthread_limit_const_8Ei_private_i32]}> ({
        ^bb0(%arg73: !llvm.ptr):
          "omp.loop_nest"(%arg68, %arg69, %arg70) <{loop_inclusive}> ({
          ^bb0(%arg74: i32):
            "llvm.store"(%arg74, %arg73) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
            "omp.yield"() : () -> ()
          }) : (i32, i32, i32) -> ()
        }) : (!llvm.ptr) -> ()
        "omp.terminator"() : () -> ()
      }) {omp.combined} : (i64) -> ()
      "omp.terminator"() : () -> ()
    }) {omp.combined} : (i32, i32, i32, !llvm.ptr, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{fir.bindc_name = "n", llvm.noalias, llvm.nocapture}, {fir.bindc_name = "t", llvm.noalias, llvm.nocapture}], function_type = !llvm.func<void (ptr, ptr)>, linkage = #llvm.linkage<external>, sym_name = "_QPthread_limit_arg_8", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg57: !llvm.ptr, %arg58: !llvm.ptr):
    %46 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %47 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %48 = "llvm.alloca"(%47) <{elem_type = i32}> {bindc_name = "i"} : (i64) -> !llvm.ptr
    %49 = "llvm.load"(%arg57) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
    %50 = "omp.map.info"(%arg58) <{map_capture_type = #omp<variable_capture_kind(ByCopy)>, map_type = #omp<clause_map_flags implicit>, name = "t", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i64}> : (!llvm.ptr) -> !llvm.ptr
    %51 = "omp.map.info"(%48) <{map_capture_type = #omp<variable_capture_kind(ByCopy)>, map_type = #omp<clause_map_flags implicit>, name = "i", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    %52 = "omp.map.info"(%arg57) <{map_capture_type = #omp<variable_capture_kind(ByCopy)>, map_type = #omp<clause_map_flags implicit>, name = "n", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    "omp.target"(%46, %49, %46, %50, %51, %52) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 3, 0, 0, 0>}> ({
    ^bb0(%arg59: i32, %arg60: i32, %arg61: i32, %arg62: !llvm.ptr, %arg63: !llvm.ptr, %arg64: !llvm.ptr):
      %53 = "llvm.load"(%arg62) <{ordering = 0 : i64}> : (!llvm.ptr) -> i64
      "omp.teams"(%53) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 1>}> ({
        "omp.distribute"(%arg63) <{operandSegmentSizes = array<i32: 0, 0, 0, 1>, private_syms = [@_QFthread_limit_arg_8Ei_private_i32]}> ({
        ^bb0(%arg65: !llvm.ptr):
          "omp.loop_nest"(%arg59, %arg60, %arg61) <{loop_inclusive}> ({
          ^bb0(%arg66: i32):
            "llvm.store"(%arg66, %arg65) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
            "omp.yield"() : () -> ()
          }) : (i32, i32, i32) -> ()
        }) : (!llvm.ptr) -> ()
        "omp.terminator"() : () -> ()
      }) {omp.combined} : (i64) -> ()
      "omp.terminator"() : () -> ()
    }) {omp.combined} : (i32, i32, i32, !llvm.ptr, !llvm.ptr, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{fir.bindc_name = "n", llvm.noalias, llvm.nocapture}], function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "_QPthread_limit_const_2", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg49: !llvm.ptr):
    %39 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %40 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %41 = "llvm.alloca"(%40) <{elem_type = i32}> {bindc_name = "i"} : (i64) -> !llvm.ptr
    %42 = "llvm.load"(%arg49) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
    %43 = "omp.map.info"(%41) <{map_capture_type = #omp<variable_capture_kind(ByCopy)>, map_type = #omp<clause_map_flags implicit>, name = "i", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    %44 = "omp.map.info"(%arg49) <{map_capture_type = #omp<variable_capture_kind(ByCopy)>, map_type = #omp<clause_map_flags implicit>, name = "n", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    "omp.target"(%39, %42, %39, %43, %44) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 2, 0, 0, 0>}> ({
    ^bb0(%arg50: i32, %arg51: i32, %arg52: i32, %arg53: !llvm.ptr, %arg54: !llvm.ptr):
      %45 = "llvm.mlir.constant"() <{value = 137 : i16}> : () -> i16
      "omp.teams"(%45) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 1>}> ({
        "omp.distribute"(%arg53) <{operandSegmentSizes = array<i32: 0, 0, 0, 1>, private_syms = [@_QFthread_limit_const_2Ei_private_i32]}> ({
        ^bb0(%arg55: !llvm.ptr):
          "omp.loop_nest"(%arg50, %arg51, %arg52) <{loop_inclusive}> ({
          ^bb0(%arg56: i32):
            "llvm.store"(%arg56, %arg55) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
            "omp.yield"() : () -> ()
          }) : (i32, i32, i32) -> ()
        }) : (!llvm.ptr) -> ()
        "omp.terminator"() : () -> ()
      }) {omp.combined} : (i16) -> ()
      "omp.terminator"() : () -> ()
    }) {omp.combined} : (i32, i32, i32, !llvm.ptr, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{fir.bindc_name = "n", llvm.noalias, llvm.nocapture}, {fir.bindc_name = "t", llvm.noalias, llvm.nocapture}], function_type = !llvm.func<void (ptr, ptr)>, linkage = #llvm.linkage<external>, sym_name = "_QPthread_limit_arg_2", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg39: !llvm.ptr, %arg40: !llvm.ptr):
    %31 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %32 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %33 = "llvm.alloca"(%32) <{elem_type = i32}> {bindc_name = "i"} : (i64) -> !llvm.ptr
    %34 = "llvm.load"(%arg39) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
    %35 = "omp.map.info"(%arg40) <{map_capture_type = #omp<variable_capture_kind(ByCopy)>, map_type = #omp<clause_map_flags implicit>, name = "t", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i16}> : (!llvm.ptr) -> !llvm.ptr
    %36 = "omp.map.info"(%33) <{map_capture_type = #omp<variable_capture_kind(ByCopy)>, map_type = #omp<clause_map_flags implicit>, name = "i", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    %37 = "omp.map.info"(%arg39) <{map_capture_type = #omp<variable_capture_kind(ByCopy)>, map_type = #omp<clause_map_flags implicit>, name = "n", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    "omp.target"(%31, %34, %31, %35, %36, %37) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 3, 0, 0, 0>}> ({
    ^bb0(%arg41: i32, %arg42: i32, %arg43: i32, %arg44: !llvm.ptr, %arg45: !llvm.ptr, %arg46: !llvm.ptr):
      %38 = "llvm.load"(%arg44) <{ordering = 0 : i64}> : (!llvm.ptr) -> i16
      "omp.teams"(%38) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 1>}> ({
        "omp.distribute"(%arg45) <{operandSegmentSizes = array<i32: 0, 0, 0, 1>, private_syms = [@_QFthread_limit_arg_2Ei_private_i32]}> ({
        ^bb0(%arg47: !llvm.ptr):
          "omp.loop_nest"(%arg41, %arg42, %arg43) <{loop_inclusive}> ({
          ^bb0(%arg48: i32):
            "llvm.store"(%arg48, %arg47) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
            "omp.yield"() : () -> ()
          }) : (i32, i32, i32) -> ()
        }) : (!llvm.ptr) -> ()
        "omp.terminator"() : () -> ()
      }) {omp.combined} : (i16) -> ()
      "omp.terminator"() : () -> ()
    }) {omp.combined} : (i32, i32, i32, !llvm.ptr, !llvm.ptr, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{fir.bindc_name = "n", llvm.noalias, llvm.nocapture}], function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "_QPnum_threads_const_8", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg30: !llvm.ptr):
    %24 = "llvm.mlir.constant"() <{value = 137 : i64}> : () -> i64
    %25 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %26 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %27 = "llvm.alloca"(%26) <{elem_type = i32}> {bindc_name = "i"} : (i64) -> !llvm.ptr
    %28 = "llvm.load"(%arg30) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
    %29 = "omp.map.info"(%27) <{map_capture_type = #omp<variable_capture_kind(ByCopy)>, map_type = #omp<clause_map_flags implicit>, name = "i", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    %30 = "omp.map.info"(%arg30) <{map_capture_type = #omp<variable_capture_kind(ByCopy)>, map_type = #omp<clause_map_flags implicit>, name = "n", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    "omp.target"(%25, %28, %25, %24, %29, %30) <{kernel_type = #omp<kernel_type(spmd)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 2, 0, 0, 0>}> ({
    ^bb0(%arg31: i32, %arg32: i32, %arg33: i32, %arg34: i64, %arg35: !llvm.ptr, %arg36: !llvm.ptr):
      "omp.teams"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
        "omp.parallel"(%arg34, %arg35) <{operandSegmentSizes = array<i32: 0, 0, 0, 1, 1, 0>, private_syms = [@_QFnum_threads_const_8Ei_private_i32]}> ({
        ^bb0(%arg37: !llvm.ptr):
          "omp.distribute"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0>}> ({
            "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>}> ({
              "omp.loop_nest"(%arg31, %arg32, %arg33) <{loop_inclusive}> ({
              ^bb0(%arg38: i32):
                "llvm.store"(%arg38, %arg37) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
                "omp.yield"() : () -> ()
              }) : (i32, i32, i32) -> ()
            }) {omp.composite} : () -> ()
          }) {omp.composite} : () -> ()
          "omp.terminator"() : () -> ()
        }) {omp.composite} : (i64, !llvm.ptr) -> ()
        "omp.terminator"() : () -> ()
      }) {omp.combined} : () -> ()
      "omp.terminator"() : () -> ()
    }) {omp.combined} : (i32, i32, i32, i64, !llvm.ptr, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{fir.bindc_name = "n", llvm.noalias, llvm.nocapture}], function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "_QPnum_threads_arg_8", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg20: !llvm.ptr):
    %15 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %16 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %17 = "llvm.alloca"(%16) <{elem_type = i64}> {bindc_name = "t"} : (i64) -> !llvm.ptr
    %18 = "llvm.alloca"(%16) <{elem_type = i32}> {bindc_name = "i"} : (i64) -> !llvm.ptr
    %19 = "llvm.load"(%17) <{ordering = 0 : i64}> : (!llvm.ptr) -> i64
    %20 = "llvm.load"(%arg20) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
    %21 = "omp.map.info"(%17) <{map_capture_type = #omp<variable_capture_kind(ByCopy)>, map_type = #omp<clause_map_flags implicit>, name = "t", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i64}> : (!llvm.ptr) -> !llvm.ptr
    %22 = "omp.map.info"(%18) <{map_capture_type = #omp<variable_capture_kind(ByCopy)>, map_type = #omp<clause_map_flags implicit>, name = "i", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    %23 = "omp.map.info"(%arg20) <{map_capture_type = #omp<variable_capture_kind(ByCopy)>, map_type = #omp<clause_map_flags implicit>, name = "n", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    "omp.target"(%15, %20, %15, %19, %21, %22, %23) <{kernel_type = #omp<kernel_type(spmd)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 3, 0, 0, 0>}> ({
    ^bb0(%arg21: i32, %arg22: i32, %arg23: i32, %arg24: i64, %arg25: !llvm.ptr, %arg26: !llvm.ptr, %arg27: !llvm.ptr):
      "omp.teams"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
        "omp.parallel"(%arg24, %arg26) <{operandSegmentSizes = array<i32: 0, 0, 0, 1, 1, 0>, private_syms = [@_QFnum_threads_arg_8Ei_private_i32]}> ({
        ^bb0(%arg28: !llvm.ptr):
          "omp.distribute"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0>}> ({
            "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>}> ({
              "omp.loop_nest"(%arg21, %arg22, %arg23) <{loop_inclusive}> ({
              ^bb0(%arg29: i32):
                "llvm.store"(%arg29, %arg28) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
                "omp.yield"() : () -> ()
              }) : (i32, i32, i32) -> ()
            }) {omp.composite} : () -> ()
          }) {omp.composite} : () -> ()
          "omp.terminator"() : () -> ()
        }) {omp.composite} : (i64, !llvm.ptr) -> ()
        "omp.terminator"() : () -> ()
      }) {omp.combined} : () -> ()
      "omp.terminator"() : () -> ()
    }) {omp.combined} : (i32, i32, i32, i64, !llvm.ptr, !llvm.ptr, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{fir.bindc_name = "n", llvm.noalias, llvm.nocapture}], function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "_QPnum_threads_const_2", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg11: !llvm.ptr):
    %8 = "llvm.mlir.constant"() <{value = 137 : i16}> : () -> i16
    %9 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %10 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %11 = "llvm.alloca"(%10) <{elem_type = i32}> {bindc_name = "i"} : (i64) -> !llvm.ptr
    %12 = "llvm.load"(%arg11) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
    %13 = "omp.map.info"(%11) <{map_capture_type = #omp<variable_capture_kind(ByCopy)>, map_type = #omp<clause_map_flags implicit>, name = "i", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    %14 = "omp.map.info"(%arg11) <{map_capture_type = #omp<variable_capture_kind(ByCopy)>, map_type = #omp<clause_map_flags implicit>, name = "n", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    "omp.target"(%9, %12, %9, %8, %13, %14) <{kernel_type = #omp<kernel_type(spmd)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 2, 0, 0, 0>}> ({
    ^bb0(%arg12: i32, %arg13: i32, %arg14: i32, %arg15: i16, %arg16: !llvm.ptr, %arg17: !llvm.ptr):
      "omp.teams"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
        "omp.parallel"(%arg15, %arg16) <{operandSegmentSizes = array<i32: 0, 0, 0, 1, 1, 0>, private_syms = [@_QFnum_threads_const_2Ei_private_i32]}> ({
        ^bb0(%arg18: !llvm.ptr):
          "omp.distribute"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0>}> ({
            "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>}> ({
              "omp.loop_nest"(%arg12, %arg13, %arg14) <{loop_inclusive}> ({
              ^bb0(%arg19: i32):
                "llvm.store"(%arg19, %arg18) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
                "omp.yield"() : () -> ()
              }) : (i32, i32, i32) -> ()
            }) {omp.composite} : () -> ()
          }) {omp.composite} : () -> ()
          "omp.terminator"() : () -> ()
        }) {omp.composite} : (i16, !llvm.ptr) -> ()
        "omp.terminator"() : () -> ()
      }) {omp.combined} : () -> ()
      "omp.terminator"() : () -> ()
    }) {omp.combined} : (i32, i32, i32, i16, !llvm.ptr, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{fir.bindc_name = "n", llvm.noalias, llvm.nocapture}, {fir.bindc_name = "t", llvm.noalias, llvm.nocapture}], function_type = !llvm.func<void (ptr, ptr)>, linkage = #llvm.linkage<external>, sym_name = "_QPnum_threads_arg_2", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    %0 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %1 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %2 = "llvm.alloca"(%1) <{elem_type = i32}> {bindc_name = "i"} : (i64) -> !llvm.ptr
    %3 = "llvm.load"(%arg1) <{ordering = 0 : i64}> : (!llvm.ptr) -> i16
    %4 = "llvm.load"(%arg0) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
    %5 = "omp.map.info"(%arg1) <{map_capture_type = #omp<variable_capture_kind(ByCopy)>, map_type = #omp<clause_map_flags implicit>, name = "t", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i16}> : (!llvm.ptr) -> !llvm.ptr
    %6 = "omp.map.info"(%2) <{map_capture_type = #omp<variable_capture_kind(ByCopy)>, map_type = #omp<clause_map_flags implicit>, name = "i", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    %7 = "omp.map.info"(%arg0) <{map_capture_type = #omp<variable_capture_kind(ByCopy)>, map_type = #omp<clause_map_flags implicit>, name = "n", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    "omp.target"(%0, %4, %0, %3, %5, %6, %7) <{kernel_type = #omp<kernel_type(spmd)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 3, 0, 0, 0>}> ({
    ^bb0(%arg2: i32, %arg3: i32, %arg4: i32, %arg5: i16, %arg6: !llvm.ptr, %arg7: !llvm.ptr, %arg8: !llvm.ptr):
      "omp.teams"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
        "omp.parallel"(%arg5, %arg7) <{operandSegmentSizes = array<i32: 0, 0, 0, 1, 1, 0>, private_syms = [@_QFnum_threads_arg_2Ei_private_i32]}> ({
        ^bb0(%arg9: !llvm.ptr):
          "omp.distribute"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0>}> ({
            "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>}> ({
              "omp.loop_nest"(%arg2, %arg3, %arg4) <{loop_inclusive}> ({
              ^bb0(%arg10: i32):
                "llvm.store"(%arg10, %arg9) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
                "omp.yield"() : () -> ()
              }) : (i32, i32, i32) -> ()
            }) {omp.composite} : () -> ()
          }) {omp.composite} : () -> ()
          "omp.terminator"() : () -> ()
        }) {omp.composite} : (i16, !llvm.ptr) -> ()
        "omp.terminator"() : () -> ()
      }) {omp.combined} : () -> ()
      "omp.terminator"() : () -> ()
    }) {omp.combined} : (i32, i32, i32, i16, !llvm.ptr, !llvm.ptr, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) {dlti.dl_spec = #dlti.dl_spec<!llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, i128 = dense<128> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, "dlti.endianness" = "little", "dlti.mangling_mode" = "e", "dlti.legal_int_widths" = array<i32: 8, 16, 32, 64>, "dlti.stack_alignment" = 128 : i64>, fir.defaultkind = "a1c4d8i4l4r4", fir.kindmap = "", llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", llvm.ident = "flang version 22.0.0 (git@github.com:mjklemm/llvm-project.git 5d9164c24a474793ab325116c5f782dce0577574)", llvm.target_triple = "x86_64-unknown-linux-gnu", omp.is_gpu = false, omp.is_target_device = false, omp.requires = #omp<clause_requires none>, omp.target_triples = [], omp.version = #omp.version<version = 31>} : () -> ()

