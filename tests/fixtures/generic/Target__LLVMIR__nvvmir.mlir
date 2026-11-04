"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 ()>, linkage = #llvm.linkage<external>, sym_name = "nvvm_special_regs", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %56 = "nvvm.read.ptx.sreg.tid.x"() : () -> i32
    %57 = "nvvm.read.ptx.sreg.tid.y"() : () -> i32
    %58 = "nvvm.read.ptx.sreg.tid.z"() : () -> i32
    %59 = "nvvm.read.ptx.sreg.ntid.x"() : () -> i32
    %60 = "nvvm.read.ptx.sreg.ntid.y"() : () -> i32
    %61 = "nvvm.read.ptx.sreg.ntid.z"() : () -> i32
    %62 = "nvvm.read.ptx.sreg.ctaid.x"() : () -> i32
    %63 = "nvvm.read.ptx.sreg.ctaid.y"() : () -> i32
    %64 = "nvvm.read.ptx.sreg.ctaid.z"() : () -> i32
    %65 = "nvvm.read.ptx.sreg.nctaid.x"() : () -> i32
    %66 = "nvvm.read.ptx.sreg.nctaid.y"() : () -> i32
    %67 = "nvvm.read.ptx.sreg.nctaid.z"() : () -> i32
    %68 = "nvvm.read.ptx.sreg.warpsize"() : () -> i32
    %69 = "nvvm.read.ptx.sreg.laneid"() : () -> i32
    %70 = "nvvm.read.ptx.sreg.clusterid.x"() : () -> i32
    %71 = "nvvm.read.ptx.sreg.clusterid.y"() : () -> i32
    %72 = "nvvm.read.ptx.sreg.clusterid.z"() : () -> i32
    %73 = "nvvm.read.ptx.sreg.nclusterid.x"() : () -> i32
    %74 = "nvvm.read.ptx.sreg.nclusterid.y"() : () -> i32
    %75 = "nvvm.read.ptx.sreg.nclusterid.z"() : () -> i32
    %76 = "nvvm.read.ptx.sreg.cluster.ctaid.x"() : () -> i32
    %77 = "nvvm.read.ptx.sreg.cluster.ctaid.y"() : () -> i32
    %78 = "nvvm.read.ptx.sreg.cluster.ctaid.z"() : () -> i32
    %79 = "nvvm.read.ptx.sreg.cluster.nctaid.x"() : () -> i32
    %80 = "nvvm.read.ptx.sreg.cluster.nctaid.y"() : () -> i32
    %81 = "nvvm.read.ptx.sreg.cluster.nctaid.z"() : () -> i32
    %82 = "nvvm.read.ptx.sreg.cluster.ctarank"() : () -> i32
    %83 = "nvvm.read.ptx.sreg.cluster.nctarank"() : () -> i32
    %84 = "nvvm.read.ptx.sreg.clock"() : () -> i32
    %85 = "nvvm.read.ptx.sreg.clock64"() : () -> i64
    %86 = "nvvm.read.ptx.sreg.globaltimer"() : () -> i64
    %87 = "nvvm.read.ptx.sreg.globaltimer.lo"() : () -> i32
    %88 = "nvvm.read.ptx.sreg.tid.x"() <{range = #llvm.constant_range<i32, 0, 64>}> : () -> i32
    %89 = "nvvm.read.ptx.sreg.warpid"() : () -> i32
    %90 = "nvvm.read.ptx.sreg.nwarpid"() : () -> i32
    %91 = "nvvm.read.ptx.sreg.smid"() : () -> i32
    %92 = "nvvm.read.ptx.sreg.nsmid"() : () -> i32
    %93 = "nvvm.read.ptx.sreg.gridid"() : () -> i32
    %94 = "nvvm.read.ptx.sreg.envreg0"() : () -> i32
    %95 = "nvvm.read.ptx.sreg.envreg1"() : () -> i32
    %96 = "nvvm.read.ptx.sreg.envreg2"() : () -> i32
    %97 = "nvvm.read.ptx.sreg.envreg3"() : () -> i32
    %98 = "nvvm.read.ptx.sreg.envreg4"() : () -> i32
    %99 = "nvvm.read.ptx.sreg.envreg5"() : () -> i32
    %100 = "nvvm.read.ptx.sreg.envreg6"() : () -> i32
    %101 = "nvvm.read.ptx.sreg.envreg7"() : () -> i32
    %102 = "nvvm.read.ptx.sreg.envreg8"() : () -> i32
    %103 = "nvvm.read.ptx.sreg.envreg9"() : () -> i32
    %104 = "nvvm.read.ptx.sreg.envreg10"() : () -> i32
    %105 = "nvvm.read.ptx.sreg.envreg11"() : () -> i32
    %106 = "nvvm.read.ptx.sreg.envreg12"() : () -> i32
    %107 = "nvvm.read.ptx.sreg.envreg13"() : () -> i32
    %108 = "nvvm.read.ptx.sreg.envreg14"() : () -> i32
    %109 = "nvvm.read.ptx.sreg.envreg15"() : () -> i32
    %110 = "nvvm.read.ptx.sreg.envreg16"() : () -> i32
    %111 = "nvvm.read.ptx.sreg.envreg17"() : () -> i32
    %112 = "nvvm.read.ptx.sreg.envreg18"() : () -> i32
    %113 = "nvvm.read.ptx.sreg.envreg19"() : () -> i32
    %114 = "nvvm.read.ptx.sreg.envreg20"() : () -> i32
    %115 = "nvvm.read.ptx.sreg.envreg21"() : () -> i32
    %116 = "nvvm.read.ptx.sreg.envreg22"() : () -> i32
    %117 = "nvvm.read.ptx.sreg.envreg23"() : () -> i32
    %118 = "nvvm.read.ptx.sreg.envreg24"() : () -> i32
    %119 = "nvvm.read.ptx.sreg.envreg25"() : () -> i32
    %120 = "nvvm.read.ptx.sreg.envreg26"() : () -> i32
    %121 = "nvvm.read.ptx.sreg.envreg27"() : () -> i32
    %122 = "nvvm.read.ptx.sreg.envreg28"() : () -> i32
    %123 = "nvvm.read.ptx.sreg.envreg29"() : () -> i32
    %124 = "nvvm.read.ptx.sreg.envreg30"() : () -> i32
    %125 = "nvvm.read.ptx.sreg.envreg31"() : () -> i32
    %126 = "nvvm.read.ptx.sreg.lanemask.eq"() : () -> i32
    %127 = "nvvm.read.ptx.sreg.lanemask.le"() : () -> i32
    %128 = "nvvm.read.ptx.sreg.lanemask.lt"() : () -> i32
    %129 = "nvvm.read.ptx.sreg.lanemask.ge"() : () -> i32
    %130 = "nvvm.read.ptx.sreg.lanemask.gt"() : () -> i32
    %131 = "nvvm.read.ptx.sreg.tid.x"() <{range = #llvm.constant_range<i32, 0, 0>}> : () -> i32
    %132 = "nvvm.read.ptx.sreg.tid.x"() <{range = #llvm.constant_range<i32, -1, -1>}> : () -> i32
    %133 = "nvvm.read.ptx.sreg.total.smem.size"() : () -> i32
    %134 = "nvvm.read.ptx.sreg.dynamic.smem.size"() : () -> i32
    %135 = "nvvm.read.ptx.sreg.aggr.smem.size"() : () -> i32
    "llvm.return"(%56) : (i32) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<f32 (f32)>, linkage = #llvm.linkage<external>, sym_name = "nvvm_rcp", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg160: f32):
    %55 = "nvvm.rcp.approx.ftz.f"(%arg160) : (f32) -> f32
    "llvm.return"(%55) : (f32) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "llvm_nvvm_cluster_arrive", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "nvvm.cluster.arrive"() : () -> ()
    "nvvm.cluster.arrive"() <{aligned}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "llvm_nvvm_cluster_arrive_relaxed", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "nvvm.cluster.arrive.relaxed"() : () -> ()
    "nvvm.cluster.arrive.relaxed"() <{aligned}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "llvm_nvvm_cluster_wait", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "nvvm.cluster.wait"() : () -> ()
    "nvvm.cluster.wait"() <{aligned}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (i32, i32, i32, i32, f32)>, linkage = #llvm.linkage<external>, sym_name = "nvvm_shfl", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg155: i32, %arg156: i32, %arg157: i32, %arg158: i32, %arg159: f32):
    %47 = "nvvm.shfl.sync"(%arg155, %arg158, %arg156, %arg157) <{kind = #nvvm<shfl_kind bfly>}> : (i32, i32, i32, i32) -> i32
    %48 = "nvvm.shfl.sync"(%arg155, %arg159, %arg156, %arg157) <{kind = #nvvm<shfl_kind bfly>}> : (i32, f32, i32, i32) -> f32
    %49 = "nvvm.shfl.sync"(%arg155, %arg158, %arg156, %arg157) <{kind = #nvvm<shfl_kind up>}> : (i32, i32, i32, i32) -> i32
    %50 = "nvvm.shfl.sync"(%arg155, %arg159, %arg156, %arg157) <{kind = #nvvm<shfl_kind up>}> : (i32, f32, i32, i32) -> f32
    %51 = "nvvm.shfl.sync"(%arg155, %arg158, %arg156, %arg157) <{kind = #nvvm<shfl_kind down>}> : (i32, i32, i32, i32) -> i32
    %52 = "nvvm.shfl.sync"(%arg155, %arg159, %arg156, %arg157) <{kind = #nvvm<shfl_kind down>}> : (i32, f32, i32, i32) -> f32
    %53 = "nvvm.shfl.sync"(%arg155, %arg158, %arg156, %arg157) <{kind = #nvvm<shfl_kind idx>}> : (i32, i32, i32, i32) -> i32
    %54 = "nvvm.shfl.sync"(%arg155, %arg159, %arg156, %arg157) <{kind = #nvvm<shfl_kind idx>}> : (i32, f32, i32, i32) -> f32
    "llvm.return"(%47) : (i32) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<struct<(i32, i1)> (i32, i32, i32, i32, f32)>, linkage = #llvm.linkage<external>, sym_name = "nvvm_shfl_pred", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg150: i32, %arg151: i32, %arg152: i32, %arg153: i32, %arg154: f32):
    %39 = "nvvm.shfl.sync"(%arg150, %arg153, %arg151, %arg152) <{kind = #nvvm<shfl_kind bfly>, return_value_and_is_valid}> : (i32, i32, i32, i32) -> !llvm.struct<(i32, i1)>
    %40 = "nvvm.shfl.sync"(%arg150, %arg154, %arg151, %arg152) <{kind = #nvvm<shfl_kind bfly>, return_value_and_is_valid}> : (i32, f32, i32, i32) -> !llvm.struct<(f32, i1)>
    %41 = "nvvm.shfl.sync"(%arg150, %arg153, %arg151, %arg152) <{kind = #nvvm<shfl_kind up>, return_value_and_is_valid}> : (i32, i32, i32, i32) -> !llvm.struct<(i32, i1)>
    %42 = "nvvm.shfl.sync"(%arg150, %arg154, %arg151, %arg152) <{kind = #nvvm<shfl_kind up>, return_value_and_is_valid}> : (i32, f32, i32, i32) -> !llvm.struct<(f32, i1)>
    %43 = "nvvm.shfl.sync"(%arg150, %arg153, %arg151, %arg152) <{kind = #nvvm<shfl_kind down>, return_value_and_is_valid}> : (i32, i32, i32, i32) -> !llvm.struct<(i32, i1)>
    %44 = "nvvm.shfl.sync"(%arg150, %arg154, %arg151, %arg152) <{kind = #nvvm<shfl_kind down>, return_value_and_is_valid}> : (i32, f32, i32, i32) -> !llvm.struct<(f32, i1)>
    %45 = "nvvm.shfl.sync"(%arg150, %arg153, %arg151, %arg152) <{kind = #nvvm<shfl_kind idx>, return_value_and_is_valid}> : (i32, i32, i32, i32) -> !llvm.struct<(i32, i1)>
    %46 = "nvvm.shfl.sync"(%arg150, %arg154, %arg151, %arg152) <{kind = #nvvm<shfl_kind idx>, return_value_and_is_valid}> : (i32, f32, i32, i32) -> !llvm.struct<(f32, i1)>
    "llvm.return"(%39) : (!llvm.struct<(i32, i1)>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (i32, i1)>, linkage = #llvm.linkage<external>, sym_name = "nvvm_vote", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg148: i32, %arg149: i1):
    %35 = "nvvm.vote.sync"(%arg148, %arg149) <{kind = #nvvm<vote_sync_kind ballot>}> : (i32, i1) -> i32
    %36 = "nvvm.vote.sync"(%arg148, %arg149) <{kind = #nvvm<vote_sync_kind all>}> : (i32, i1) -> i1
    %37 = "nvvm.vote.sync"(%arg148, %arg149) <{kind = #nvvm<vote_sync_kind any>}> : (i32, i1) -> i1
    %38 = "nvvm.vote.sync"(%arg148, %arg149) <{kind = #nvvm<vote_sync_kind uni>}> : (i32, i1) -> i1
    "llvm.return"(%35) : (i32) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<struct<(f32, f32, f32, f32, f32, f32, f32, f32)> (vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, f32, f32, f32, f32, f32, f32, f32, f32)>, linkage = #llvm.linkage<external>, sym_name = "nvvm_mma_mn8n8k4_row_col_f32_f32", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg136: vector<2xf16>, %arg137: vector<2xf16>, %arg138: vector<2xf16>, %arg139: vector<2xf16>, %arg140: f32, %arg141: f32, %arg142: f32, %arg143: f32, %arg144: f32, %arg145: f32, %arg146: f32, %arg147: f32):
    %34 = "nvvm.mma.sync"(%arg136, %arg137, %arg138, %arg139, %arg140, %arg141, %arg142, %arg143, %arg144, %arg145, %arg146, %arg147) <{layoutA = #nvvm.mma_layout<row>, layoutB = #nvvm.mma_layout<col>, multiplicandAPtxType = #nvvm.mma_type<f16>, multiplicandBPtxType = #nvvm.mma_type<f16>, operandSegmentSizes = array<i32: 2, 2, 8>, shape = #nvvm.shape<m = 8, n = 8, k = 4>}> : (vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, f32, f32, f32, f32, f32, f32, f32, f32) -> !llvm.struct<(f32, f32, f32, f32, f32, f32, f32, f32)>
    "llvm.return"(%34) : (!llvm.struct<(f32, f32, f32, f32, f32, f32, f32, f32)>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<struct<(vector<2xf16>, vector<2xf16>)> (vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>)>, linkage = #llvm.linkage<external>, sym_name = "nvvm_mma_m16n8k16_f16_f16", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg128: vector<2xf16>, %arg129: vector<2xf16>, %arg130: vector<2xf16>, %arg131: vector<2xf16>, %arg132: vector<2xf16>, %arg133: vector<2xf16>, %arg134: vector<2xf16>, %arg135: vector<2xf16>):
    %33 = "nvvm.mma.sync"(%arg128, %arg129, %arg130, %arg131, %arg132, %arg133, %arg134, %arg135) <{layoutA = #nvvm.mma_layout<row>, layoutB = #nvvm.mma_layout<col>, multiplicandAPtxType = #nvvm.mma_type<f16>, multiplicandBPtxType = #nvvm.mma_type<f16>, operandSegmentSizes = array<i32: 4, 2, 2>, shape = #nvvm.shape<m = 16, n = 8, k = 16>}> : (vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>) -> !llvm.struct<(vector<2xf16>, vector<2xf16>)>
    "llvm.return"(%33) : (!llvm.struct<(vector<2xf16>, vector<2xf16>)>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<struct<(f32, f32, f32, f32)> (i32, i32, i32, i32, i32, i32, f32, f32, f32, f32)>, linkage = #llvm.linkage<external>, sym_name = "nvvm_mma_m16n8k16_bf16_bf16", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg118: i32, %arg119: i32, %arg120: i32, %arg121: i32, %arg122: i32, %arg123: i32, %arg124: f32, %arg125: f32, %arg126: f32, %arg127: f32):
    %32 = "nvvm.mma.sync"(%arg118, %arg119, %arg120, %arg121, %arg122, %arg123, %arg124, %arg125, %arg126, %arg127) <{layoutA = #nvvm.mma_layout<row>, layoutB = #nvvm.mma_layout<col>, multiplicandAPtxType = #nvvm.mma_type<bf16>, multiplicandBPtxType = #nvvm.mma_type<bf16>, operandSegmentSizes = array<i32: 4, 2, 4>, shape = #nvvm.shape<m = 16, n = 8, k = 16>}> : (i32, i32, i32, i32, i32, i32, f32, f32, f32, f32) -> !llvm.struct<(f32, f32, f32, f32)>
    "llvm.return"(%32) : (!llvm.struct<(f32, f32, f32, f32)>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<struct<(f32, f32, f32, f32)> (vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, f32, f32, f32, f32)>, linkage = #llvm.linkage<external>, sym_name = "nvvm_mma_m16n8k16_f32_f32", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg108: vector<2xf16>, %arg109: vector<2xf16>, %arg110: vector<2xf16>, %arg111: vector<2xf16>, %arg112: vector<2xf16>, %arg113: vector<2xf16>, %arg114: f32, %arg115: f32, %arg116: f32, %arg117: f32):
    %31 = "nvvm.mma.sync"(%arg108, %arg109, %arg110, %arg111, %arg112, %arg113, %arg114, %arg115, %arg116, %arg117) <{layoutA = #nvvm.mma_layout<row>, layoutB = #nvvm.mma_layout<col>, multiplicandAPtxType = #nvvm.mma_type<f16>, multiplicandBPtxType = #nvvm.mma_type<f16>, operandSegmentSizes = array<i32: 4, 2, 4>, shape = #nvvm.shape<m = 16, n = 8, k = 16>}> : (vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, f32, f32, f32, f32) -> !llvm.struct<(f32, f32, f32, f32)>
    "llvm.return"(%31) : (!llvm.struct<(f32, f32, f32, f32)>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<struct<(i32, i32, i32, i32)> (i32, i32, i32, i32, i32, i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "nvvm_mma_m16n8k16_s8_s8", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg101: i32, %arg102: i32, %arg103: i32, %arg104: i32, %arg105: i32, %arg106: i32, %arg107: i32):
    %30 = "nvvm.mma.sync"(%arg101, %arg102, %arg103, %arg104, %arg105, %arg106, %arg107) <{intOverflowBehavior = #nvvm.mma_int_overflow<wrapped>, layoutA = #nvvm.mma_layout<row>, layoutB = #nvvm.mma_layout<col>, multiplicandAPtxType = #nvvm.mma_type<s8>, multiplicandBPtxType = #nvvm.mma_type<s8>, operandSegmentSizes = array<i32: 2, 1, 4>, shape = #nvvm.shape<m = 16, n = 8, k = 16>}> : (i32, i32, i32, i32, i32, i32, i32) -> !llvm.struct<(i32, i32, i32, i32)>
    "llvm.return"(%30) : (!llvm.struct<(i32, i32, i32, i32)>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<struct<(i32, i32, i32, i32)> (i32, i32, i32, i32, i32, i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "nvvm_mma_m16n8k16_s8_u8", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg94: i32, %arg95: i32, %arg96: i32, %arg97: i32, %arg98: i32, %arg99: i32, %arg100: i32):
    %29 = "nvvm.mma.sync"(%arg94, %arg95, %arg96, %arg97, %arg98, %arg99, %arg100) <{intOverflowBehavior = #nvvm.mma_int_overflow<satfinite>, layoutA = #nvvm.mma_layout<row>, layoutB = #nvvm.mma_layout<col>, multiplicandAPtxType = #nvvm.mma_type<s8>, multiplicandBPtxType = #nvvm.mma_type<u8>, operandSegmentSizes = array<i32: 2, 1, 4>, shape = #nvvm.shape<m = 16, n = 8, k = 16>}> : (i32, i32, i32, i32, i32, i32, i32) -> !llvm.struct<(i32, i32, i32, i32)>
    "llvm.return"(%29) : (!llvm.struct<(i32, i32, i32, i32)>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<struct<(i32, i32, i32, i32)> (i32, i32, i32, i32, i32, i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "nvvm_mma_m16n8k128_b1_b1", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg87: i32, %arg88: i32, %arg89: i32, %arg90: i32, %arg91: i32, %arg92: i32, %arg93: i32):
    %28 = "nvvm.mma.sync"(%arg87, %arg88, %arg89, %arg90, %arg91, %arg92, %arg93) <{b1Op = #nvvm.mma_b1op<xor_popc>, layoutA = #nvvm.mma_layout<row>, layoutB = #nvvm.mma_layout<col>, multiplicandAPtxType = #nvvm.mma_type<b1>, multiplicandBPtxType = #nvvm.mma_type<b1>, operandSegmentSizes = array<i32: 2, 1, 4>, shape = #nvvm.shape<m = 16, n = 8, k = 128>}> : (i32, i32, i32, i32, i32, i32, i32) -> !llvm.struct<(i32, i32, i32, i32)>
    "llvm.return"(%28) : (!llvm.struct<(i32, i32, i32, i32)>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<struct<(i32, i32, i32, i32)> (i32, i32, i32, i32, i32, i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "nvvm_mma_m16n8k32_s4_s4", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg80: i32, %arg81: i32, %arg82: i32, %arg83: i32, %arg84: i32, %arg85: i32, %arg86: i32):
    %27 = "nvvm.mma.sync"(%arg80, %arg81, %arg82, %arg83, %arg84, %arg85, %arg86) <{intOverflowBehavior = #nvvm.mma_int_overflow<satfinite>, layoutA = #nvvm.mma_layout<row>, layoutB = #nvvm.mma_layout<col>, multiplicandAPtxType = #nvvm.mma_type<s4>, multiplicandBPtxType = #nvvm.mma_type<s4>, operandSegmentSizes = array<i32: 2, 1, 4>, shape = #nvvm.shape<m = 16, n = 8, k = 32>}> : (i32, i32, i32, i32, i32, i32, i32) -> !llvm.struct<(i32, i32, i32, i32)>
    "llvm.return"(%27) : (!llvm.struct<(i32, i32, i32, i32)>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<struct<(f64, f64)> (f64, f64, f64, f64)>, linkage = #llvm.linkage<external>, sym_name = "nvvm_mma_m8n8k4_f64_f64", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg76: f64, %arg77: f64, %arg78: f64, %arg79: f64):
    %26 = "nvvm.mma.sync"(%arg76, %arg77, %arg78, %arg79) <{layoutA = #nvvm.mma_layout<row>, layoutB = #nvvm.mma_layout<col>, multiplicandAPtxType = #nvvm.mma_type<f64>, multiplicandBPtxType = #nvvm.mma_type<f64>, operandSegmentSizes = array<i32: 1, 1, 2>, shape = #nvvm.shape<m = 8, n = 8, k = 4>}> : (f64, f64, f64, f64) -> !llvm.struct<(f64, f64)>
    "llvm.return"(%26) : (!llvm.struct<(f64, f64)>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<struct<(f32, f32, f32, f32)> (i32, i32, i32, f32, f32, f32, f32)>, linkage = #llvm.linkage<external>, sym_name = "nvvm_mma_m16n8k4_tf32_f32", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg69: i32, %arg70: i32, %arg71: i32, %arg72: f32, %arg73: f32, %arg74: f32, %arg75: f32):
    %25 = "nvvm.mma.sync"(%arg69, %arg70, %arg71, %arg72, %arg73, %arg74, %arg75) <{layoutA = #nvvm.mma_layout<row>, layoutB = #nvvm.mma_layout<col>, multiplicandAPtxType = #nvvm.mma_type<tf32>, multiplicandBPtxType = #nvvm.mma_type<tf32>, operandSegmentSizes = array<i32: 2, 1, 4>, shape = #nvvm.shape<m = 16, n = 8, k = 4>}> : (i32, i32, i32, f32, f32, f32, f32) -> !llvm.struct<(f32, f32, f32, f32)>
    "llvm.return"(%25) : (!llvm.struct<(f32, f32, f32, f32)>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<3>, i32)>, linkage = #llvm.linkage<external>, sym_name = "gpu_wmma_load_op", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg67: !llvm.ptr<3>, %arg68: i32):
    %24 = "nvvm.wmma.load"(%arg67, %arg68) <{eltype = #nvvm.mma_type<f16>, frag = #nvvm.mma_frag<a>, k = 16 : i32, layout = #nvvm.mma_layout<row>, m = 16 : i32, n = 16 : i32}> : (!llvm.ptr<3>, i32) -> !llvm.struct<(vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>)>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<3>, i32, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>)>, linkage = #llvm.linkage<external>, sym_name = "gpu_wmma_store_op", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg61: !llvm.ptr<3>, %arg62: i32, %arg63: vector<2xf16>, %arg64: vector<2xf16>, %arg65: vector<2xf16>, %arg66: vector<2xf16>):
    "nvvm.wmma.store"(%arg61, %arg63, %arg64, %arg65, %arg66, %arg62) <{eltype = #nvvm.mma_type<f16>, k = 16 : i32, layout = #nvvm.mma_layout<row>, m = 16 : i32, n = 16 : i32}> : (!llvm.ptr<3>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>)>, linkage = #llvm.linkage<external>, sym_name = "gpu_wmma_mma_op", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg41: vector<2xf16>, %arg42: vector<2xf16>, %arg43: vector<2xf16>, %arg44: vector<2xf16>, %arg45: vector<2xf16>, %arg46: vector<2xf16>, %arg47: vector<2xf16>, %arg48: vector<2xf16>, %arg49: vector<2xf16>, %arg50: vector<2xf16>, %arg51: vector<2xf16>, %arg52: vector<2xf16>, %arg53: vector<2xf16>, %arg54: vector<2xf16>, %arg55: vector<2xf16>, %arg56: vector<2xf16>, %arg57: vector<2xf16>, %arg58: vector<2xf16>, %arg59: vector<2xf16>, %arg60: vector<2xf16>):
    %23 = "nvvm.wmma.mma"(%arg41, %arg42, %arg43, %arg44, %arg45, %arg46, %arg47, %arg48, %arg49, %arg50, %arg51, %arg52, %arg53, %arg54, %arg55, %arg56, %arg57, %arg58, %arg59, %arg60) <{eltypeA = #nvvm.mma_type<f16>, eltypeB = #nvvm.mma_type<f16>, k = 16 : i32, layoutA = #nvvm.mma_layout<row>, layoutB = #nvvm.mma_layout<row>, m = 16 : i32, n = 16 : i32}> : (vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>) -> !llvm.struct<(vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>)>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, i32)>, linkage = #llvm.linkage<external>, sym_name = "nvvm_wmma_load_tf32", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg39: !llvm.ptr, %arg40: i32):
    %22 = "nvvm.wmma.load"(%arg39, %arg40) <{eltype = #nvvm.mma_type<tf32>, frag = #nvvm.mma_frag<a>, k = 8 : i32, layout = #nvvm.mma_layout<row>, m = 16 : i32, n = 16 : i32}> : (!llvm.ptr, i32) -> !llvm.struct<(i32, i32, i32, i32)>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, i32, i32, i32, i32, i32, i32, i32, f32, f32, f32, f32, f32, f32, f32, f32)>, linkage = #llvm.linkage<external>, sym_name = "nvvm_wmma_mma", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg23: i32, %arg24: i32, %arg25: i32, %arg26: i32, %arg27: i32, %arg28: i32, %arg29: i32, %arg30: i32, %arg31: f32, %arg32: f32, %arg33: f32, %arg34: f32, %arg35: f32, %arg36: f32, %arg37: f32, %arg38: f32):
    %21 = "nvvm.wmma.mma"(%arg23, %arg24, %arg25, %arg26, %arg27, %arg28, %arg29, %arg30, %arg31, %arg32, %arg33, %arg34, %arg35, %arg36, %arg37, %arg38) <{eltypeA = #nvvm.mma_type<tf32>, eltypeB = #nvvm.mma_type<f32>, k = 8 : i32, layoutA = #nvvm.mma_layout<row>, layoutB = #nvvm.mma_layout<row>, m = 16 : i32, n = 16 : i32}> : (i32, i32, i32, i32, i32, i32, i32, i32, f32, f32, f32, f32, f32, f32, f32, f32) -> !llvm.struct<(f32, f32, f32, f32, f32, f32, f32, f32)>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, i32)>, linkage = #llvm.linkage<external>, sym_name = "nvvm_wmma_load_a_f64", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg21: !llvm.ptr, %arg22: i32):
    %20 = "nvvm.wmma.load"(%arg21, %arg22) <{eltype = #nvvm.mma_type<f64>, frag = #nvvm.mma_frag<a>, k = 4 : i32, layout = #nvvm.mma_layout<row>, m = 8 : i32, n = 8 : i32}> : (!llvm.ptr, i32) -> f64
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, i32)>, linkage = #llvm.linkage<external>, sym_name = "nvvm_wmma_load_c_f64", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg19: !llvm.ptr, %arg20: i32):
    %19 = "nvvm.wmma.load"(%arg19, %arg20) <{eltype = #nvvm.mma_type<f64>, frag = #nvvm.mma_frag<c>, k = 4 : i32, layout = #nvvm.mma_layout<row>, m = 8 : i32, n = 8 : i32}> : (!llvm.ptr, i32) -> !llvm.struct<(f64, f64)>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (f64, f64, f64, f64)>, linkage = #llvm.linkage<external>, sym_name = "nvvm_wmma_mma_f64", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg15: f64, %arg16: f64, %arg17: f64, %arg18: f64):
    %18 = "nvvm.wmma.mma"(%arg15, %arg16, %arg17, %arg18) <{eltypeA = #nvvm.mma_type<f64>, eltypeB = #nvvm.mma_type<f64>, k = 4 : i32, layoutA = #nvvm.mma_layout<row>, layoutB = #nvvm.mma_layout<col>, m = 8 : i32, n = 8 : i32}> : (f64, f64, f64, f64) -> !llvm.struct<(f64, f64)>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, i32, f64, f64)>, linkage = #llvm.linkage<external>, sym_name = "nvvm_wmma_store_d_f64", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg11: !llvm.ptr, %arg12: i32, %arg13: f64, %arg14: f64):
    "nvvm.wmma.store"(%arg11, %arg13, %arg14, %arg12) <{eltype = #nvvm.mma_type<f64>, k = 4 : i32, layout = #nvvm.mma_layout<row>, m = 8 : i32, n = 8 : i32}> : (!llvm.ptr, f64, f64, i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<3>, ptr<1>)>, linkage = #llvm.linkage<external>, sym_name = "cp_async", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg9: !llvm.ptr<3>, %arg10: !llvm.ptr<1>):
    "nvvm.cp.async.shared.global"(%arg9, %arg10) <{modifier = #nvvm<load_cache_modifier ca>, size = 4 : i32}> : (!llvm.ptr<3>, !llvm.ptr<1>) -> ()
    "nvvm.cp.async.shared.global"(%arg9, %arg10) <{modifier = #nvvm<load_cache_modifier ca>, size = 8 : i32}> : (!llvm.ptr<3>, !llvm.ptr<1>) -> ()
    "nvvm.cp.async.shared.global"(%arg9, %arg10) <{modifier = #nvvm<load_cache_modifier ca>, size = 16 : i32}> : (!llvm.ptr<3>, !llvm.ptr<1>) -> ()
    "nvvm.cp.async.shared.global"(%arg9, %arg10) <{modifier = #nvvm<load_cache_modifier cg>, size = 16 : i32}> : (!llvm.ptr<3>, !llvm.ptr<1>) -> ()
    "nvvm.cp.async.commit.group"() : () -> ()
    "nvvm.cp.async.wait.group"() <{n = 0 : i32}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<3>, ptr<1>, i32)>, linkage = #llvm.linkage<external>, sym_name = "async_cp_zfill", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg6: !llvm.ptr<3>, %arg7: !llvm.ptr<1>, %arg8: i32):
    "nvvm.cp.async.shared.global"(%arg6, %arg7, %arg8) <{modifier = #nvvm<load_cache_modifier ca>, size = 4 : i32}> : (!llvm.ptr<3>, !llvm.ptr<1>, i32) -> ()
    "nvvm.cp.async.shared.global"(%arg6, %arg7, %arg8) <{modifier = #nvvm<load_cache_modifier ca>, size = 8 : i32}> : (!llvm.ptr<3>, !llvm.ptr<1>, i32) -> ()
    "nvvm.cp.async.shared.global"(%arg6, %arg7, %arg8) <{modifier = #nvvm<load_cache_modifier ca>, size = 16 : i32}> : (!llvm.ptr<3>, !llvm.ptr<1>, i32) -> ()
    "nvvm.cp.async.shared.global"(%arg6, %arg7, %arg8) <{modifier = #nvvm<load_cache_modifier cg>, size = 16 : i32}> : (!llvm.ptr<3>, !llvm.ptr<1>, i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "llvm_nvvm_setmaxregister", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "nvvm.setmaxregister"() <{action = #nvvm<action increase>, regCount = 256 : i32}> : () -> ()
    "nvvm.setmaxregister"() <{action = #nvvm<action decrease>, regCount = 24 : i32}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "llvm_nvvm_cp_async_bulk_commit_group", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "nvvm.cp.async.bulk.commit.group"() : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "llvm_nvvm_cp_async_bulk_wait_group", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "nvvm.cp.async.bulk.wait_group"() <{group = 0 : i32}> : () -> ()
    "nvvm.cp.async.bulk.wait_group"() <{group = 3 : i32}> : () -> ()
    "nvvm.cp.async.bulk.wait_group"() <{group = 0 : i32, read}> : () -> ()
    "nvvm.cp.async.bulk.wait_group"() <{group = 3 : i32, read}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<3>)>, linkage = #llvm.linkage<external>, sym_name = "ld_matrix", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg5: !llvm.ptr<3>):
    %0 = "nvvm.ldmatrix"(%arg5) <{eltType = #nvvm.ld_st_matrix_elt_type<b16>, layout = #nvvm.mma_layout<row>, num = 1 : i32, shape = #nvvm.ld_st_matrix_shape<m = 8, n = 8>}> : (!llvm.ptr<3>) -> i32
    %1 = "nvvm.ldmatrix"(%arg5) <{eltType = #nvvm.ld_st_matrix_elt_type<b16>, layout = #nvvm.mma_layout<row>, num = 2 : i32, shape = #nvvm.ld_st_matrix_shape<m = 8, n = 8>}> : (!llvm.ptr<3>) -> !llvm.struct<(i32, i32)>
    %2 = "nvvm.ldmatrix"(%arg5) <{eltType = #nvvm.ld_st_matrix_elt_type<b16>, layout = #nvvm.mma_layout<row>, num = 4 : i32, shape = #nvvm.ld_st_matrix_shape<m = 8, n = 8>}> : (!llvm.ptr<3>) -> !llvm.struct<(i32, i32, i32, i32)>
    %3 = "nvvm.ldmatrix"(%arg5) <{eltType = #nvvm.ld_st_matrix_elt_type<b16>, layout = #nvvm.mma_layout<col>, num = 1 : i32, shape = #nvvm.ld_st_matrix_shape<m = 8, n = 8>}> : (!llvm.ptr<3>) -> i32
    %4 = "nvvm.ldmatrix"(%arg5) <{eltType = #nvvm.ld_st_matrix_elt_type<b16>, layout = #nvvm.mma_layout<col>, num = 2 : i32, shape = #nvvm.ld_st_matrix_shape<m = 8, n = 8>}> : (!llvm.ptr<3>) -> !llvm.struct<(i32, i32)>
    %5 = "nvvm.ldmatrix"(%arg5) <{eltType = #nvvm.ld_st_matrix_elt_type<b16>, layout = #nvvm.mma_layout<col>, num = 4 : i32, shape = #nvvm.ld_st_matrix_shape<m = 8, n = 8>}> : (!llvm.ptr<3>) -> !llvm.struct<(i32, i32, i32, i32)>
    %6 = "nvvm.ldmatrix"(%arg5) <{eltType = #nvvm.ld_st_matrix_elt_type<b8x16.b6x16_p32>, layout = #nvvm.mma_layout<row>, num = 1 : i32, shape = #nvvm.ld_st_matrix_shape<m = 8, n = 16>}> : (!llvm.ptr<3>) -> i32
    %7 = "nvvm.ldmatrix"(%arg5) <{eltType = #nvvm.ld_st_matrix_elt_type<b8x16.b6x16_p32>, layout = #nvvm.mma_layout<row>, num = 2 : i32, shape = #nvvm.ld_st_matrix_shape<m = 8, n = 16>}> : (!llvm.ptr<3>) -> !llvm.struct<(i32, i32)>
    %8 = "nvvm.ldmatrix"(%arg5) <{eltType = #nvvm.ld_st_matrix_elt_type<b8x16.b6x16_p32>, layout = #nvvm.mma_layout<row>, num = 4 : i32, shape = #nvvm.ld_st_matrix_shape<m = 8, n = 16>}> : (!llvm.ptr<3>) -> !llvm.struct<(i32, i32, i32, i32)>
    %9 = "nvvm.ldmatrix"(%arg5) <{eltType = #nvvm.ld_st_matrix_elt_type<b8x16.b4x16_p64>, layout = #nvvm.mma_layout<row>, num = 1 : i32, shape = #nvvm.ld_st_matrix_shape<m = 8, n = 16>}> : (!llvm.ptr<3>) -> i32
    %10 = "nvvm.ldmatrix"(%arg5) <{eltType = #nvvm.ld_st_matrix_elt_type<b8x16.b4x16_p64>, layout = #nvvm.mma_layout<row>, num = 2 : i32, shape = #nvvm.ld_st_matrix_shape<m = 8, n = 16>}> : (!llvm.ptr<3>) -> !llvm.struct<(i32, i32)>
    %11 = "nvvm.ldmatrix"(%arg5) <{eltType = #nvvm.ld_st_matrix_elt_type<b8x16.b4x16_p64>, layout = #nvvm.mma_layout<row>, num = 4 : i32, shape = #nvvm.ld_st_matrix_shape<m = 8, n = 16>}> : (!llvm.ptr<3>) -> !llvm.struct<(i32, i32, i32, i32)>
    %12 = "nvvm.ldmatrix"(%arg5) <{eltType = #nvvm.ld_st_matrix_elt_type<b8>, layout = #nvvm.mma_layout<col>, num = 1 : i32, shape = #nvvm.ld_st_matrix_shape<m = 16, n = 16>}> : (!llvm.ptr<3>) -> !llvm.struct<(i32, i32)>
    %13 = "nvvm.ldmatrix"(%arg5) <{eltType = #nvvm.ld_st_matrix_elt_type<b8>, layout = #nvvm.mma_layout<col>, num = 2 : i32, shape = #nvvm.ld_st_matrix_shape<m = 16, n = 16>}> : (!llvm.ptr<3>) -> !llvm.struct<(i32, i32, i32, i32)>
    %14 = "nvvm.ldmatrix"(%arg5) <{eltType = #nvvm.ld_st_matrix_elt_type<b8x16.b6x16_p32>, layout = #nvvm.mma_layout<col>, num = 1 : i32, shape = #nvvm.ld_st_matrix_shape<m = 16, n = 16>}> : (!llvm.ptr<3>) -> !llvm.struct<(i32, i32)>
    %15 = "nvvm.ldmatrix"(%arg5) <{eltType = #nvvm.ld_st_matrix_elt_type<b8x16.b6x16_p32>, layout = #nvvm.mma_layout<col>, num = 2 : i32, shape = #nvvm.ld_st_matrix_shape<m = 16, n = 16>}> : (!llvm.ptr<3>) -> !llvm.struct<(i32, i32, i32, i32)>
    %16 = "nvvm.ldmatrix"(%arg5) <{eltType = #nvvm.ld_st_matrix_elt_type<b8x16.b4x16_p64>, layout = #nvvm.mma_layout<col>, num = 1 : i32, shape = #nvvm.ld_st_matrix_shape<m = 16, n = 16>}> : (!llvm.ptr<3>) -> !llvm.struct<(i32, i32)>
    %17 = "nvvm.ldmatrix"(%arg5) <{eltType = #nvvm.ld_st_matrix_elt_type<b8x16.b4x16_p64>, layout = #nvvm.mma_layout<col>, num = 2 : i32, shape = #nvvm.ld_st_matrix_shape<m = 16, n = 16>}> : (!llvm.ptr<3>) -> !llvm.struct<(i32, i32, i32, i32)>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<3>, i32, i32, i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "st_matrix", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr<3>, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32):
    "nvvm.stmatrix"(%arg0, %arg1) <{eltType = #nvvm.ld_st_matrix_elt_type<b16>, layout = #nvvm.mma_layout<row>, shape = #nvvm.ld_st_matrix_shape<m = 8, n = 8>}> : (!llvm.ptr<3>, i32) -> ()
    "nvvm.stmatrix"(%arg0, %arg1) <{eltType = #nvvm.ld_st_matrix_elt_type<b16>, layout = #nvvm.mma_layout<col>, shape = #nvvm.ld_st_matrix_shape<m = 8, n = 8>}> : (!llvm.ptr<3>, i32) -> ()
    "nvvm.stmatrix"(%arg0, %arg1) <{eltType = #nvvm.ld_st_matrix_elt_type<b8>, layout = #nvvm.mma_layout<col>, shape = #nvvm.ld_st_matrix_shape<m = 16, n = 8>}> : (!llvm.ptr<3>, i32) -> ()
    "nvvm.stmatrix"(%arg0, %arg1, %arg2) <{eltType = #nvvm.ld_st_matrix_elt_type<b16>, layout = #nvvm.mma_layout<row>, shape = #nvvm.ld_st_matrix_shape<m = 8, n = 8>}> : (!llvm.ptr<3>, i32, i32) -> ()
    "nvvm.stmatrix"(%arg0, %arg1, %arg2) <{eltType = #nvvm.ld_st_matrix_elt_type<b16>, layout = #nvvm.mma_layout<col>, shape = #nvvm.ld_st_matrix_shape<m = 8, n = 8>}> : (!llvm.ptr<3>, i32, i32) -> ()
    "nvvm.stmatrix"(%arg0, %arg1, %arg2) <{eltType = #nvvm.ld_st_matrix_elt_type<b8>, layout = #nvvm.mma_layout<col>, shape = #nvvm.ld_st_matrix_shape<m = 16, n = 8>}> : (!llvm.ptr<3>, i32, i32) -> ()
    "nvvm.stmatrix"(%arg0, %arg1, %arg2, %arg3, %arg4) <{eltType = #nvvm.ld_st_matrix_elt_type<b16>, layout = #nvvm.mma_layout<row>, shape = #nvvm.ld_st_matrix_shape<m = 8, n = 8>}> : (!llvm.ptr<3>, i32, i32, i32, i32) -> ()
    "nvvm.stmatrix"(%arg0, %arg1, %arg2, %arg3, %arg4) <{eltType = #nvvm.ld_st_matrix_elt_type<b16>, layout = #nvvm.mma_layout<col>, shape = #nvvm.ld_st_matrix_shape<m = 8, n = 8>}> : (!llvm.ptr<3>, i32, i32, i32, i32) -> ()
    "nvvm.stmatrix"(%arg0, %arg1, %arg2, %arg3, %arg4) <{eltType = #nvvm.ld_st_matrix_elt_type<b8>, layout = #nvvm.mma_layout<col>, shape = #nvvm.ld_st_matrix_shape<m = 16, n = 8>}> : (!llvm.ptr<3>, i32, i32, i32, i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "kernel_func", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) {nvvm.kernel} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "kernel_func", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) {nvvm.kernel, nvvm.maxntid = array<i32: 1, 23, 32>} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "kernel_func", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) {nvvm.kernel, nvvm.reqntid = array<i32: 1, 23, 32>} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "kernel_func", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) {nvvm.cluster_dim = array<i32: 3, 5, 7>, nvvm.kernel} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "kernel_func", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) {nvvm.cluster_max_blocks = 8 : i64, nvvm.kernel} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "kernel_func", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) {nvvm.kernel, nvvm.minctasm = 16 : i64} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "kernel_func", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) {nvvm.kernel, nvvm.maxnreg = 16 : i64} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "kernel_func", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) {nvvm.kernel, nvvm.maxnreg = 32 : i64, nvvm.maxntid = array<i32: 1, 23, 32>, nvvm.minctasm = 16 : i64} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "kernel_func", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) {nvvm.blocksareclusters, nvvm.cluster_dim = array<i32: 3, 5, 7>, nvvm.kernel, nvvm.reqntid = array<i32: 1, 23, 32>} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{llvm.byval = i32, nvvm.grid_constant}], function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "kernel_func", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr):
    "llvm.return"() : () -> ()
  }) {nvvm.kernel} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{llvm.byval = i32, nvvm.grid_constant}, {}, {llvm.byval = f32, nvvm.grid_constant}], function_type = !llvm.func<void (ptr, f32, ptr)>, linkage = #llvm.linkage<external>, sym_name = "kernel_func", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr, %arg1: f32, %arg2: !llvm.ptr):
    "llvm.return"() : () -> ()
  }) {nvvm.kernel} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "nvvm_exit", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "nvvm.exit"() : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "nvvm_breakpoint", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "nvvm.breakpoint"() : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "nvvm_wgmma_fence_aligned", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "nvvm.wgmma.fence.aligned"() : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "nvvm_wgmma_commit_group_aligned", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "nvvm.wgmma.commit.group.sync.aligned"() : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "nvvm_wgmma_wait_group_aligned", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "nvvm.wgmma.wait.group.sync.aligned"() <{group = 0 : i64}> : () -> ()
    "nvvm.wgmma.wait.group.sync.aligned"() <{group = 20 : i64}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "nvvm_griddepcontrol_wait", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "nvvm.griddepcontrol"() <{kind = #nvvm<grid_dep_action wait>}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "nvvm_griddepcontrol_launch_dependents", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "nvvm.griddepcontrol"() <{kind = #nvvm<grid_dep_action launch_dependents>}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr<3>, i32)>, linkage = #llvm.linkage<external>, sym_name = "nvvm_mapa", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr<3>, %arg2: i32):
    %0 = "nvvm.mapa"(%arg0, %arg2) : (!llvm.ptr, i32) -> !llvm.ptr
    %1 = "nvvm.mapa"(%arg1, %arg2) : (!llvm.ptr<3>, i32) -> !llvm.ptr<7>
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "nvvm_redux_sync", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg2: i32, %arg3: i32):
    %8 = "nvvm.redux.sync"(%arg2, %arg3) <{abs = false, kind = #nvvm<redux_kind add>, nan = false}> : (i32, i32) -> i32
    %9 = "nvvm.redux.sync"(%arg2, %arg3) <{abs = false, kind = #nvvm<redux_kind umax>, nan = false}> : (i32, i32) -> i32
    %10 = "nvvm.redux.sync"(%arg2, %arg3) <{abs = false, kind = #nvvm<redux_kind umin>, nan = false}> : (i32, i32) -> i32
    %11 = "nvvm.redux.sync"(%arg2, %arg3) <{abs = false, kind = #nvvm<redux_kind and>, nan = false}> : (i32, i32) -> i32
    %12 = "nvvm.redux.sync"(%arg2, %arg3) <{abs = false, kind = #nvvm<redux_kind or>, nan = false}> : (i32, i32) -> i32
    %13 = "nvvm.redux.sync"(%arg2, %arg3) <{abs = false, kind = #nvvm<redux_kind xor>, nan = false}> : (i32, i32) -> i32
    %14 = "nvvm.redux.sync"(%arg2, %arg3) <{abs = false, kind = #nvvm<redux_kind max>, nan = false}> : (i32, i32) -> i32
    %15 = "nvvm.redux.sync"(%arg2, %arg3) <{abs = false, kind = #nvvm<redux_kind min>, nan = false}> : (i32, i32) -> i32
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (f32, i32)>, linkage = #llvm.linkage<external>, sym_name = "nvvm_redux_sync_f32", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: f32, %arg1: i32):
    %0 = "nvvm.redux.sync"(%arg0, %arg1) <{abs = false, kind = #nvvm<redux_kind fmin>, nan = false}> : (f32, i32) -> f32
    %1 = "nvvm.redux.sync"(%arg0, %arg1) <{abs = true, kind = #nvvm<redux_kind fmin>, nan = false}> : (f32, i32) -> f32
    %2 = "nvvm.redux.sync"(%arg0, %arg1) <{abs = false, kind = #nvvm<redux_kind fmin>, nan = true}> : (f32, i32) -> f32
    %3 = "nvvm.redux.sync"(%arg0, %arg1) <{abs = true, kind = #nvvm<redux_kind fmin>, nan = true}> : (f32, i32) -> f32
    %4 = "nvvm.redux.sync"(%arg0, %arg1) <{abs = false, kind = #nvvm<redux_kind fmax>, nan = false}> : (f32, i32) -> f32
    %5 = "nvvm.redux.sync"(%arg0, %arg1) <{abs = true, kind = #nvvm<redux_kind fmax>, nan = false}> : (f32, i32) -> f32
    %6 = "nvvm.redux.sync"(%arg0, %arg1) <{abs = false, kind = #nvvm<redux_kind fmax>, nan = true}> : (f32, i32) -> f32
    %7 = "nvvm.redux.sync"(%arg0, %arg1) <{abs = true, kind = #nvvm<redux_kind fmax>, nan = true}> : (f32, i32) -> f32
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, i32, i64)>, linkage = #llvm.linkage<external>, sym_name = "nvvm_match_sync", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i32, %arg1: i32, %arg2: i64):
    %0 = "nvvm.match.sync"(%arg0, %arg1) <{kind = #nvvm<match_sync_kind any>}> : (i32, i32) -> i32
    %1 = "nvvm.match.sync"(%arg0, %arg1) <{kind = #nvvm<match_sync_kind all>}> : (i32, i32) -> !llvm.struct<(i32, i1)>
    %2 = "nvvm.match.sync"(%arg0, %arg2) <{kind = #nvvm<match_sync_kind any>}> : (i32, i64) -> i32
    %3 = "nvvm.match.sync"(%arg0, %arg2) <{kind = #nvvm<match_sync_kind all>}> : (i32, i64) -> !llvm.struct<(i32, i1)>
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr<3>, i64)>, linkage = #llvm.linkage<external>, sym_name = "nvvm_st_bulk", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr<3>, %arg2: i64):
    "nvvm.st.bulk"(%arg0, %arg2) <{initVal = 0 : i64}> : (!llvm.ptr, i64) -> ()
    "nvvm.st.bulk"(%arg1, %arg2) <{initVal = 0 : i64}> : (!llvm.ptr<3>, i64) -> ()
    "nvvm.st.bulk"(%arg0, %arg2) <{initVal = 0 : i64}> : (!llvm.ptr, i64) -> ()
    "nvvm.st.bulk"(%arg1, %arg2) <{initVal = 0 : i64}> : (!llvm.ptr<3>, i64) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (vector<4xi8>, vector<4xi8>, i32)>, linkage = #llvm.linkage<external>, sym_name = "nvvm_dot_accumulate_4way", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: vector<4xi8>, %arg1: vector<4xi8>, %arg2: i32):
    %0 = "nvvm.dot.accumulate.4way"(%arg0, %arg1, %arg2) <{a_type = #nvvm.dot_accumulate_type<unsigned>, b_type = #nvvm.dot_accumulate_type<unsigned>}> : (vector<4xi8>, vector<4xi8>, i32) -> i32
    %1 = "nvvm.dot.accumulate.4way"(%arg0, %arg1, %arg2) <{a_type = #nvvm.dot_accumulate_type<signed>, b_type = #nvvm.dot_accumulate_type<unsigned>}> : (vector<4xi8>, vector<4xi8>, i32) -> i32
    %2 = "nvvm.dot.accumulate.4way"(%arg0, %arg1, %arg2) <{a_type = #nvvm.dot_accumulate_type<unsigned>, b_type = #nvvm.dot_accumulate_type<signed>}> : (vector<4xi8>, vector<4xi8>, i32) -> i32
    %3 = "nvvm.dot.accumulate.4way"(%arg0, %arg1, %arg2) <{a_type = #nvvm.dot_accumulate_type<signed>, b_type = #nvvm.dot_accumulate_type<signed>}> : (vector<4xi8>, vector<4xi8>, i32) -> i32
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (vector<2xi16>, vector<4xi8>, i32)>, linkage = #llvm.linkage<external>, sym_name = "nvvm_dot_accumulate_2way", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: vector<2xi16>, %arg1: vector<4xi8>, %arg2: i32):
    %0 = "nvvm.dot.accumulate.2way"(%arg0, %arg1, %arg2) <{a_type = #nvvm.dot_accumulate_type<unsigned>, b_hi = false, b_type = #nvvm.dot_accumulate_type<unsigned>}> : (vector<2xi16>, vector<4xi8>, i32) -> i32
    %1 = "nvvm.dot.accumulate.2way"(%arg0, %arg1, %arg2) <{a_type = #nvvm.dot_accumulate_type<unsigned>, b_hi = true, b_type = #nvvm.dot_accumulate_type<unsigned>}> : (vector<2xi16>, vector<4xi8>, i32) -> i32
    %2 = "nvvm.dot.accumulate.2way"(%arg0, %arg1, %arg2) <{a_type = #nvvm.dot_accumulate_type<signed>, b_hi = false, b_type = #nvvm.dot_accumulate_type<unsigned>}> : (vector<2xi16>, vector<4xi8>, i32) -> i32
    %3 = "nvvm.dot.accumulate.2way"(%arg0, %arg1, %arg2) <{a_type = #nvvm.dot_accumulate_type<signed>, b_hi = true, b_type = #nvvm.dot_accumulate_type<unsigned>}> : (vector<2xi16>, vector<4xi8>, i32) -> i32
    %4 = "nvvm.dot.accumulate.2way"(%arg0, %arg1, %arg2) <{a_type = #nvvm.dot_accumulate_type<unsigned>, b_hi = false, b_type = #nvvm.dot_accumulate_type<signed>}> : (vector<2xi16>, vector<4xi8>, i32) -> i32
    %5 = "nvvm.dot.accumulate.2way"(%arg0, %arg1, %arg2) <{a_type = #nvvm.dot_accumulate_type<unsigned>, b_hi = true, b_type = #nvvm.dot_accumulate_type<signed>}> : (vector<2xi16>, vector<4xi8>, i32) -> i32
    %6 = "nvvm.dot.accumulate.2way"(%arg0, %arg1, %arg2) <{a_type = #nvvm.dot_accumulate_type<signed>, b_hi = false, b_type = #nvvm.dot_accumulate_type<signed>}> : (vector<2xi16>, vector<4xi8>, i32) -> i32
    %7 = "nvvm.dot.accumulate.2way"(%arg0, %arg1, %arg2) <{a_type = #nvvm.dot_accumulate_type<signed>, b_hi = true, b_type = #nvvm.dot_accumulate_type<signed>}> : (vector<2xi16>, vector<4xi8>, i32) -> i32
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32)>, linkage = #llvm.linkage<external>, sym_name = "nanosleep", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i32):
    "nvvm.nanosleep"(%arg0) : (i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

