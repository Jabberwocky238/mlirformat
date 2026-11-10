"builtin.module"() ({
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "_QMmodFfailingEi_private_i32", type = i32}> ({
  }, {
  }, {
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{fir.bindc_name = "i", llvm.nocapture}], frame_pointer = #llvm.framePointerKind<all>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "_QMotherProutine", target_cpu = "gfx90a", target_features = #llvm.target_features<["+16-bit-insts", "+atomic-buffer-global-pk-add-f16-insts", "+atomic-fadd-rtn-insts", "+ci-insts", "+dl-insts", "+dot1-insts", "+dot10-insts", "+dot2-insts", "+dot3-insts", "+dot4-insts", "+dot5-insts", "+dot6-insts", "+dot7-insts", "+dpp", "+gfx8-insts", "+gfx9-insts", "+gfx90a-insts", "+gws", "+image-insts", "+mai-insts", "+s-memrealtime", "+s-memtime-inst", "+wavefrontsize64"]>, unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg5: !llvm.ptr):
    "llvm.return"() : () -> ()
  }) {omp.declare_target = #omp.declaretarget<device_type = (nohost), capture_clause = (to)>} : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{fir.bindc_name = "d", llvm.nocapture}], frame_pointer = #llvm.framePointerKind<all>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "_QMmodPfailing", target_cpu = "gfx90a", target_features = #llvm.target_features<["+16-bit-insts", "+atomic-buffer-global-pk-add-f16-insts", "+atomic-fadd-rtn-insts", "+ci-insts", "+dl-insts", "+dot1-insts", "+dot10-insts", "+dot2-insts", "+dot3-insts", "+dot4-insts", "+dot5-insts", "+dot6-insts", "+dot7-insts", "+dpp", "+gfx8-insts", "+gfx9-insts", "+gfx90a-insts", "+gws", "+image-insts", "+mai-insts", "+s-memrealtime", "+s-memtime-inst", "+wavefrontsize64"]>, unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr):
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %1 = "llvm.alloca"(%0) <{elem_type = i32}> {bindc_name = "i"} : (i64) -> !llvm.ptr<5>
    %2 = "llvm.addrspacecast"(%1) : (!llvm.ptr<5>) -> !llvm.ptr
    %3 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %4 = "omp.map.info"(%2) <{map_capture_type = #omp<variable_capture_kind(ByCopy)>, map_type = #omp<clause_map_flags implicit>, name = "i", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    %5 = "omp.map.info"(%arg0) <{map_capture_type = #omp<variable_capture_kind(ByCopy)>, map_type = #omp<clause_map_flags implicit>, name = "d", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    "omp.target"(%4, %5) <{kernel_type = #omp<kernel_type(spmd)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0>}> ({
    ^bb0(%arg1: !llvm.ptr, %arg2: !llvm.ptr):
      %6 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
      "omp.teams"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
        "omp.parallel"(%arg1) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 1, 0>, private_syms = [@_QMmodFfailingEi_private_i32]}> ({
        ^bb0(%arg3: !llvm.ptr):
          %7 = "llvm.load"(%arg2) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
          "omp.distribute"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0>}> ({
            "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>}> ({
              "omp.loop_nest"(%6, %7, %6) <{loop_inclusive}> ({
              ^bb0(%arg4: i32):
                "llvm.store"(%arg4, %arg3) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
                "llvm.call"(%arg3) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @_QMotherProutine, fastmathFlags = #llvm.fastmath<contract>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (!llvm.ptr) -> ()
                "omp.yield"() : () -> ()
              }) : (i32, i32, i32) -> ()
            }) {omp.composite} : () -> ()
          }) {omp.composite} : () -> ()
          "omp.terminator"() : () -> ()
        }) {omp.composite} : (!llvm.ptr) -> ()
        "omp.terminator"() : () -> ()
      }) {omp.combined} : () -> ()
      "omp.terminator"() : () -> ()
    }) {omp.combined} : (!llvm.ptr, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) {omp.declare_target = #omp.declaretarget<device_type = (host), capture_clause = (to)>} : () -> ()
}) {dlti.dl_spec = #dlti.dl_spec<"dlti.alloca_memory_space" = 5 : ui32>, llvm.data_layout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128:128:48-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8:9", llvm.target_triple = "amdgcn-amd-amdhsa", omp.is_gpu = true, omp.is_target_device = true} : () -> ()

