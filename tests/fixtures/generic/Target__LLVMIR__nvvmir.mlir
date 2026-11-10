"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 ()>, linkage = #llvm.linkage<external>, sym_name = "nvvm_special_regs", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %61 = "nvvm.read.ptx.sreg.tid.x"() : () -> i32
    %62 = "nvvm.read.ptx.sreg.tid.y"() : () -> i32
    %63 = "nvvm.read.ptx.sreg.tid.z"() : () -> i32
    %64 = "nvvm.read.ptx.sreg.ntid.x"() : () -> i32
    %65 = "nvvm.read.ptx.sreg.ntid.y"() : () -> i32
    %66 = "nvvm.read.ptx.sreg.ntid.z"() : () -> i32
    %67 = "nvvm.read.ptx.sreg.ctaid.x"() : () -> i32
    %68 = "nvvm.read.ptx.sreg.ctaid.y"() : () -> i32
    %69 = "nvvm.read.ptx.sreg.ctaid.z"() : () -> i32
    %70 = "nvvm.read.ptx.sreg.nctaid.x"() : () -> i32
    %71 = "nvvm.read.ptx.sreg.nctaid.y"() : () -> i32
    %72 = "nvvm.read.ptx.sreg.nctaid.z"() : () -> i32
    %73 = "nvvm.read.ptx.sreg.warpsize"() : () -> i32
    %74 = "nvvm.read.ptx.sreg.laneid"() : () -> i32
    %75 = "nvvm.read.ptx.sreg.clusterid.x"() : () -> i32
    %76 = "nvvm.read.ptx.sreg.clusterid.y"() : () -> i32
    %77 = "nvvm.read.ptx.sreg.clusterid.z"() : () -> i32
    %78 = "nvvm.read.ptx.sreg.nclusterid.x"() : () -> i32
    %79 = "nvvm.read.ptx.sreg.nclusterid.y"() : () -> i32
    %80 = "nvvm.read.ptx.sreg.nclusterid.z"() : () -> i32
    %81 = "nvvm.read.ptx.sreg.cluster.ctaid.x"() : () -> i32
    %82 = "nvvm.read.ptx.sreg.cluster.ctaid.y"() : () -> i32
    %83 = "nvvm.read.ptx.sreg.cluster.ctaid.z"() : () -> i32
    %84 = "nvvm.read.ptx.sreg.cluster.nctaid.x"() : () -> i32
    %85 = "nvvm.read.ptx.sreg.cluster.nctaid.y"() : () -> i32
    %86 = "nvvm.read.ptx.sreg.cluster.nctaid.z"() : () -> i32
    %87 = "nvvm.read.ptx.sreg.cluster.ctarank"() : () -> i32
    %88 = "nvvm.read.ptx.sreg.cluster.nctarank"() : () -> i32
    %89 = "nvvm.read.ptx.sreg.clock"() : () -> i32
    %90 = "nvvm.read.ptx.sreg.clock64"() : () -> i64
    %91 = "nvvm.read.ptx.sreg.globaltimer"() : () -> i64
    %92 = "nvvm.read.ptx.sreg.globaltimer.lo"() : () -> i32
    %93 = "nvvm.read.ptx.sreg.tid.x"() <{range = #llvm.constant_range<i32, 0, 64>}> : () -> i32
    %94 = "nvvm.read.ptx.sreg.warpid"() : () -> i32
    %95 = "nvvm.read.ptx.sreg.nwarpid"() : () -> i32
    %96 = "nvvm.read.ptx.sreg.smid"() : () -> i32
    %97 = "nvvm.read.ptx.sreg.nsmid"() : () -> i32
    %98 = "nvvm.read.ptx.sreg.gridid"() : () -> i32
    %99 = "nvvm.read.ptx.sreg.envreg0"() : () -> i32
    %100 = "nvvm.read.ptx.sreg.envreg1"() : () -> i32
    %101 = "nvvm.read.ptx.sreg.envreg2"() : () -> i32
    %102 = "nvvm.read.ptx.sreg.envreg3"() : () -> i32
    %103 = "nvvm.read.ptx.sreg.envreg4"() : () -> i32
    %104 = "nvvm.read.ptx.sreg.envreg5"() : () -> i32
    %105 = "nvvm.read.ptx.sreg.envreg6"() : () -> i32
    %106 = "nvvm.read.ptx.sreg.envreg7"() : () -> i32
    %107 = "nvvm.read.ptx.sreg.envreg8"() : () -> i32
    %108 = "nvvm.read.ptx.sreg.envreg9"() : () -> i32
    %109 = "nvvm.read.ptx.sreg.envreg10"() : () -> i32
    %110 = "nvvm.read.ptx.sreg.envreg11"() : () -> i32
    %111 = "nvvm.read.ptx.sreg.envreg12"() : () -> i32
    %112 = "nvvm.read.ptx.sreg.envreg13"() : () -> i32
    %113 = "nvvm.read.ptx.sreg.envreg14"() : () -> i32
    %114 = "nvvm.read.ptx.sreg.envreg15"() : () -> i32
    %115 = "nvvm.read.ptx.sreg.envreg16"() : () -> i32
    %116 = "nvvm.read.ptx.sreg.envreg17"() : () -> i32
    %117 = "nvvm.read.ptx.sreg.envreg18"() : () -> i32
    %118 = "nvvm.read.ptx.sreg.envreg19"() : () -> i32
    %119 = "nvvm.read.ptx.sreg.envreg20"() : () -> i32
    %120 = "nvvm.read.ptx.sreg.envreg21"() : () -> i32
    %121 = "nvvm.read.ptx.sreg.envreg22"() : () -> i32
    %122 = "nvvm.read.ptx.sreg.envreg23"() : () -> i32
    %123 = "nvvm.read.ptx.sreg.envreg24"() : () -> i32
    %124 = "nvvm.read.ptx.sreg.envreg25"() : () -> i32
    %125 = "nvvm.read.ptx.sreg.envreg26"() : () -> i32
    %126 = "nvvm.read.ptx.sreg.envreg27"() : () -> i32
    %127 = "nvvm.read.ptx.sreg.envreg28"() : () -> i32
    %128 = "nvvm.read.ptx.sreg.envreg29"() : () -> i32
    %129 = "nvvm.read.ptx.sreg.envreg30"() : () -> i32
    %130 = "nvvm.read.ptx.sreg.envreg31"() : () -> i32
    %131 = "nvvm.read.ptx.sreg.lanemask.eq"() : () -> i32
    %132 = "nvvm.read.ptx.sreg.lanemask.le"() : () -> i32
    %133 = "nvvm.read.ptx.sreg.lanemask.lt"() : () -> i32
    %134 = "nvvm.read.ptx.sreg.lanemask.ge"() : () -> i32
    %135 = "nvvm.read.ptx.sreg.lanemask.gt"() : () -> i32
    %136 = "nvvm.read.ptx.sreg.tid.x"() <{range = #llvm.constant_range<i32, 0, 0>}> : () -> i32
    %137 = "nvvm.read.ptx.sreg.tid.x"() <{range = #llvm.constant_range<i32, -1, -1>}> : () -> i32
    %138 = "nvvm.read.ptx.sreg.total.smem.size"() : () -> i32
    %139 = "nvvm.read.ptx.sreg.dynamic.smem.size"() : () -> i32
    %140 = "nvvm.read.ptx.sreg.aggr.smem.size"() : () -> i32
    "llvm.return"(%61) : (i32) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<f32 (f32)>, linkage = #llvm.linkage<external>, sym_name = "nvvm_rcp", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg191: f32):
    %60 = "nvvm.rcp.approx.ftz.f"(%arg191) : (f32) -> f32
    "llvm.return"(%60) : (f32) -> ()
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
  ^bb0(%arg186: i32, %arg187: i32, %arg188: i32, %arg189: i32, %arg190: f32):
    %52 = "nvvm.shfl.sync"(%arg186, %arg189, %arg187, %arg188) <{kind = #nvvm<shfl_kind bfly>}> : (i32, i32, i32, i32) -> i32
    %53 = "nvvm.shfl.sync"(%arg186, %arg190, %arg187, %arg188) <{kind = #nvvm<shfl_kind bfly>}> : (i32, f32, i32, i32) -> f32
    %54 = "nvvm.shfl.sync"(%arg186, %arg189, %arg187, %arg188) <{kind = #nvvm<shfl_kind up>}> : (i32, i32, i32, i32) -> i32
    %55 = "nvvm.shfl.sync"(%arg186, %arg190, %arg187, %arg188) <{kind = #nvvm<shfl_kind up>}> : (i32, f32, i32, i32) -> f32
    %56 = "nvvm.shfl.sync"(%arg186, %arg189, %arg187, %arg188) <{kind = #nvvm<shfl_kind down>}> : (i32, i32, i32, i32) -> i32
    %57 = "nvvm.shfl.sync"(%arg186, %arg190, %arg187, %arg188) <{kind = #nvvm<shfl_kind down>}> : (i32, f32, i32, i32) -> f32
    %58 = "nvvm.shfl.sync"(%arg186, %arg189, %arg187, %arg188) <{kind = #nvvm<shfl_kind idx>}> : (i32, i32, i32, i32) -> i32
    %59 = "nvvm.shfl.sync"(%arg186, %arg190, %arg187, %arg188) <{kind = #nvvm<shfl_kind idx>}> : (i32, f32, i32, i32) -> f32
    "llvm.return"(%52) : (i32) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<struct<(i32, i1)> (i32, i32, i32, i32, f32)>, linkage = #llvm.linkage<external>, sym_name = "nvvm_shfl_pred", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg181: i32, %arg182: i32, %arg183: i32, %arg184: i32, %arg185: f32):
    %44 = "nvvm.shfl.sync"(%arg181, %arg184, %arg182, %arg183) <{kind = #nvvm<shfl_kind bfly>, return_value_and_is_valid}> : (i32, i32, i32, i32) -> !llvm.struct<(i32, i1)>
    %45 = "nvvm.shfl.sync"(%arg181, %arg185, %arg182, %arg183) <{kind = #nvvm<shfl_kind bfly>, return_value_and_is_valid}> : (i32, f32, i32, i32) -> !llvm.struct<(f32, i1)>
    %46 = "nvvm.shfl.sync"(%arg181, %arg184, %arg182, %arg183) <{kind = #nvvm<shfl_kind up>, return_value_and_is_valid}> : (i32, i32, i32, i32) -> !llvm.struct<(i32, i1)>
    %47 = "nvvm.shfl.sync"(%arg181, %arg185, %arg182, %arg183) <{kind = #nvvm<shfl_kind up>, return_value_and_is_valid}> : (i32, f32, i32, i32) -> !llvm.struct<(f32, i1)>
    %48 = "nvvm.shfl.sync"(%arg181, %arg184, %arg182, %arg183) <{kind = #nvvm<shfl_kind down>, return_value_and_is_valid}> : (i32, i32, i32, i32) -> !llvm.struct<(i32, i1)>
    %49 = "nvvm.shfl.sync"(%arg181, %arg185, %arg182, %arg183) <{kind = #nvvm<shfl_kind down>, return_value_and_is_valid}> : (i32, f32, i32, i32) -> !llvm.struct<(f32, i1)>
    %50 = "nvvm.shfl.sync"(%arg181, %arg184, %arg182, %arg183) <{kind = #nvvm<shfl_kind idx>, return_value_and_is_valid}> : (i32, i32, i32, i32) -> !llvm.struct<(i32, i1)>
    %51 = "nvvm.shfl.sync"(%arg181, %arg185, %arg182, %arg183) <{kind = #nvvm<shfl_kind idx>, return_value_and_is_valid}> : (i32, f32, i32, i32) -> !llvm.struct<(f32, i1)>
    "llvm.return"(%44) : (!llvm.struct<(i32, i1)>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (i32, i1)>, linkage = #llvm.linkage<external>, sym_name = "nvvm_vote", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg179: i32, %arg180: i1):
    %40 = "nvvm.vote.sync"(%arg179, %arg180) <{kind = #nvvm<vote_sync_kind ballot>}> : (i32, i1) -> i32
    %41 = "nvvm.vote.sync"(%arg179, %arg180) <{kind = #nvvm<vote_sync_kind all>}> : (i32, i1) -> i1
    %42 = "nvvm.vote.sync"(%arg179, %arg180) <{kind = #nvvm<vote_sync_kind any>}> : (i32, i1) -> i1
    %43 = "nvvm.vote.sync"(%arg179, %arg180) <{kind = #nvvm<vote_sync_kind uni>}> : (i32, i1) -> i1
    "llvm.return"(%40) : (i32) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<struct<(f32, f32, f32, f32, f32, f32, f32, f32)> (vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, f32, f32, f32, f32, f32, f32, f32, f32)>, linkage = #llvm.linkage<external>, sym_name = "nvvm_mma_mn8n8k4_row_col_f32_f32", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg167: vector<2xf16>, %arg168: vector<2xf16>, %arg169: vector<2xf16>, %arg170: vector<2xf16>, %arg171: f32, %arg172: f32, %arg173: f32, %arg174: f32, %arg175: f32, %arg176: f32, %arg177: f32, %arg178: f32):
    %39 = "nvvm.mma.sync"(%arg167, %arg168, %arg169, %arg170, %arg171, %arg172, %arg173, %arg174, %arg175, %arg176, %arg177, %arg178) <{layoutA = #nvvm.mma_layout<row>, layoutB = #nvvm.mma_layout<col>, multiplicandAPtxType = #nvvm.mma_type<f16>, multiplicandBPtxType = #nvvm.mma_type<f16>, operandSegmentSizes = array<i32: 2, 2, 8>, shape = #nvvm.shape<m = 8, n = 8, k = 4>}> : (vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, f32, f32, f32, f32, f32, f32, f32, f32) -> !llvm.struct<(f32, f32, f32, f32, f32, f32, f32, f32)>
    "llvm.return"(%39) : (!llvm.struct<(f32, f32, f32, f32, f32, f32, f32, f32)>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<struct<(vector<2xf16>, vector<2xf16>)> (vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>)>, linkage = #llvm.linkage<external>, sym_name = "nvvm_mma_m16n8k16_f16_f16", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg159: vector<2xf16>, %arg160: vector<2xf16>, %arg161: vector<2xf16>, %arg162: vector<2xf16>, %arg163: vector<2xf16>, %arg164: vector<2xf16>, %arg165: vector<2xf16>, %arg166: vector<2xf16>):
    %38 = "nvvm.mma.sync"(%arg159, %arg160, %arg161, %arg162, %arg163, %arg164, %arg165, %arg166) <{layoutA = #nvvm.mma_layout<row>, layoutB = #nvvm.mma_layout<col>, multiplicandAPtxType = #nvvm.mma_type<f16>, multiplicandBPtxType = #nvvm.mma_type<f16>, operandSegmentSizes = array<i32: 4, 2, 2>, shape = #nvvm.shape<m = 16, n = 8, k = 16>}> : (vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>) -> !llvm.struct<(vector<2xf16>, vector<2xf16>)>
    "llvm.return"(%38) : (!llvm.struct<(vector<2xf16>, vector<2xf16>)>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<struct<(f32, f32, f32, f32)> (i32, i32, i32, i32, i32, i32, f32, f32, f32, f32)>, linkage = #llvm.linkage<external>, sym_name = "nvvm_mma_m16n8k16_bf16_bf16", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg149: i32, %arg150: i32, %arg151: i32, %arg152: i32, %arg153: i32, %arg154: i32, %arg155: f32, %arg156: f32, %arg157: f32, %arg158: f32):
    %37 = "nvvm.mma.sync"(%arg149, %arg150, %arg151, %arg152, %arg153, %arg154, %arg155, %arg156, %arg157, %arg158) <{layoutA = #nvvm.mma_layout<row>, layoutB = #nvvm.mma_layout<col>, multiplicandAPtxType = #nvvm.mma_type<bf16>, multiplicandBPtxType = #nvvm.mma_type<bf16>, operandSegmentSizes = array<i32: 4, 2, 4>, shape = #nvvm.shape<m = 16, n = 8, k = 16>}> : (i32, i32, i32, i32, i32, i32, f32, f32, f32, f32) -> !llvm.struct<(f32, f32, f32, f32)>
    "llvm.return"(%37) : (!llvm.struct<(f32, f32, f32, f32)>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<struct<(f32, f32, f32, f32)> (i32, i32, i32, f32, f32, f32, f32)>, linkage = #llvm.linkage<external>, sym_name = "nvvm_mma_m16n8k16_e4m3_e4m3", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg142: i32, %arg143: i32, %arg144: i32, %arg145: f32, %arg146: f32, %arg147: f32, %arg148: f32):
    %36 = "nvvm.mma.sync"(%arg142, %arg143, %arg144, %arg145, %arg146, %arg147, %arg148) <{layoutA = #nvvm.mma_layout<row>, layoutB = #nvvm.mma_layout<col>, multiplicandAPtxType = #nvvm.mma_type<e4m3>, multiplicandBPtxType = #nvvm.mma_type<e4m3>, operandSegmentSizes = array<i32: 2, 1, 4>, shape = #nvvm.shape<m = 16, n = 8, k = 16>}> : (i32, i32, i32, f32, f32, f32, f32) -> !llvm.struct<(f32, f32, f32, f32)>
    "llvm.return"(%36) : (!llvm.struct<(f32, f32, f32, f32)>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<struct<(f32, f32, f32, f32)> (i32, i32, i32, i32, i32, i32, f32, f32, f32, f32)>, linkage = #llvm.linkage<external>, sym_name = "nvvm_mma_m16n8k32_e4m3_e5m2", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg132: i32, %arg133: i32, %arg134: i32, %arg135: i32, %arg136: i32, %arg137: i32, %arg138: f32, %arg139: f32, %arg140: f32, %arg141: f32):
    %35 = "nvvm.mma.sync"(%arg132, %arg133, %arg134, %arg135, %arg136, %arg137, %arg138, %arg139, %arg140, %arg141) <{layoutA = #nvvm.mma_layout<row>, layoutB = #nvvm.mma_layout<col>, multiplicandAPtxType = #nvvm.mma_type<e4m3>, multiplicandBPtxType = #nvvm.mma_type<e5m2>, operandSegmentSizes = array<i32: 4, 2, 4>, shape = #nvvm.shape<m = 16, n = 8, k = 32>}> : (i32, i32, i32, i32, i32, i32, f32, f32, f32, f32) -> !llvm.struct<(f32, f32, f32, f32)>
    "llvm.return"(%35) : (!llvm.struct<(f32, f32, f32, f32)>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<struct<(vector<2xf16>, vector<2xf16>)> (i32, i32, i32, vector<2xf16>, vector<2xf16>)>, linkage = #llvm.linkage<external>, sym_name = "nvvm_mma_m16n8k16_e4m3_e4m3_f16", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg127: i32, %arg128: i32, %arg129: i32, %arg130: vector<2xf16>, %arg131: vector<2xf16>):
    %34 = "nvvm.mma.sync"(%arg127, %arg128, %arg129, %arg130, %arg131) <{layoutA = #nvvm.mma_layout<row>, layoutB = #nvvm.mma_layout<col>, multiplicandAPtxType = #nvvm.mma_type<e4m3>, multiplicandBPtxType = #nvvm.mma_type<e4m3>, operandSegmentSizes = array<i32: 2, 1, 2>, shape = #nvvm.shape<m = 16, n = 8, k = 16>}> : (i32, i32, i32, vector<2xf16>, vector<2xf16>) -> !llvm.struct<(vector<2xf16>, vector<2xf16>)>
    "llvm.return"(%34) : (!llvm.struct<(vector<2xf16>, vector<2xf16>)>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<struct<(vector<2xf16>, vector<2xf16>)> (i32, i32, i32, i32, i32, i32, vector<2xf16>, vector<2xf16>)>, linkage = #llvm.linkage<external>, sym_name = "nvvm_mma_m16n8k32_e4m3_e5m2_f16", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg119: i32, %arg120: i32, %arg121: i32, %arg122: i32, %arg123: i32, %arg124: i32, %arg125: vector<2xf16>, %arg126: vector<2xf16>):
    %33 = "nvvm.mma.sync"(%arg119, %arg120, %arg121, %arg122, %arg123, %arg124, %arg125, %arg126) <{layoutA = #nvvm.mma_layout<row>, layoutB = #nvvm.mma_layout<col>, multiplicandAPtxType = #nvvm.mma_type<e4m3>, multiplicandBPtxType = #nvvm.mma_type<e5m2>, operandSegmentSizes = array<i32: 4, 2, 2>, shape = #nvvm.shape<m = 16, n = 8, k = 32>}> : (i32, i32, i32, i32, i32, i32, vector<2xf16>, vector<2xf16>) -> !llvm.struct<(vector<2xf16>, vector<2xf16>)>
    "llvm.return"(%33) : (!llvm.struct<(vector<2xf16>, vector<2xf16>)>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<struct<(f32, f32, f32, f32)> (vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, f32, f32, f32, f32)>, linkage = #llvm.linkage<external>, sym_name = "nvvm_mma_m16n8k16_f32_f32", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg109: vector<2xf16>, %arg110: vector<2xf16>, %arg111: vector<2xf16>, %arg112: vector<2xf16>, %arg113: vector<2xf16>, %arg114: vector<2xf16>, %arg115: f32, %arg116: f32, %arg117: f32, %arg118: f32):
    %32 = "nvvm.mma.sync"(%arg109, %arg110, %arg111, %arg112, %arg113, %arg114, %arg115, %arg116, %arg117, %arg118) <{layoutA = #nvvm.mma_layout<row>, layoutB = #nvvm.mma_layout<col>, multiplicandAPtxType = #nvvm.mma_type<f16>, multiplicandBPtxType = #nvvm.mma_type<f16>, operandSegmentSizes = array<i32: 4, 2, 4>, shape = #nvvm.shape<m = 16, n = 8, k = 16>}> : (vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, f32, f32, f32, f32) -> !llvm.struct<(f32, f32, f32, f32)>
    "llvm.return"(%32) : (!llvm.struct<(f32, f32, f32, f32)>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<struct<(i32, i32, i32, i32)> (i32, i32, i32, i32, i32, i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "nvvm_mma_m16n8k16_s8_s8", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg102: i32, %arg103: i32, %arg104: i32, %arg105: i32, %arg106: i32, %arg107: i32, %arg108: i32):
    %31 = "nvvm.mma.sync"(%arg102, %arg103, %arg104, %arg105, %arg106, %arg107, %arg108) <{intOverflowBehavior = #nvvm.mma_int_overflow<wrapped>, layoutA = #nvvm.mma_layout<row>, layoutB = #nvvm.mma_layout<col>, multiplicandAPtxType = #nvvm.mma_type<s8>, multiplicandBPtxType = #nvvm.mma_type<s8>, operandSegmentSizes = array<i32: 2, 1, 4>, shape = #nvvm.shape<m = 16, n = 8, k = 16>}> : (i32, i32, i32, i32, i32, i32, i32) -> !llvm.struct<(i32, i32, i32, i32)>
    "llvm.return"(%31) : (!llvm.struct<(i32, i32, i32, i32)>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<struct<(i32, i32, i32, i32)> (i32, i32, i32, i32, i32, i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "nvvm_mma_m16n8k16_s8_u8", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg95: i32, %arg96: i32, %arg97: i32, %arg98: i32, %arg99: i32, %arg100: i32, %arg101: i32):
    %30 = "nvvm.mma.sync"(%arg95, %arg96, %arg97, %arg98, %arg99, %arg100, %arg101) <{intOverflowBehavior = #nvvm.mma_int_overflow<satfinite>, layoutA = #nvvm.mma_layout<row>, layoutB = #nvvm.mma_layout<col>, multiplicandAPtxType = #nvvm.mma_type<s8>, multiplicandBPtxType = #nvvm.mma_type<u8>, operandSegmentSizes = array<i32: 2, 1, 4>, shape = #nvvm.shape<m = 16, n = 8, k = 16>}> : (i32, i32, i32, i32, i32, i32, i32) -> !llvm.struct<(i32, i32, i32, i32)>
    "llvm.return"(%30) : (!llvm.struct<(i32, i32, i32, i32)>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<struct<(i32, i32, i32, i32)> (i32, i32, i32, i32, i32, i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "nvvm_mma_m16n8k128_b1_b1", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg88: i32, %arg89: i32, %arg90: i32, %arg91: i32, %arg92: i32, %arg93: i32, %arg94: i32):
    %29 = "nvvm.mma.sync"(%arg88, %arg89, %arg90, %arg91, %arg92, %arg93, %arg94) <{b1Op = #nvvm.mma_b1op<xor_popc>, layoutA = #nvvm.mma_layout<row>, layoutB = #nvvm.mma_layout<col>, multiplicandAPtxType = #nvvm.mma_type<b1>, multiplicandBPtxType = #nvvm.mma_type<b1>, operandSegmentSizes = array<i32: 2, 1, 4>, shape = #nvvm.shape<m = 16, n = 8, k = 128>}> : (i32, i32, i32, i32, i32, i32, i32) -> !llvm.struct<(i32, i32, i32, i32)>
    "llvm.return"(%29) : (!llvm.struct<(i32, i32, i32, i32)>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<struct<(i32, i32, i32, i32)> (i32, i32, i32, i32, i32, i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "nvvm_mma_m16n8k32_s4_s4", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg81: i32, %arg82: i32, %arg83: i32, %arg84: i32, %arg85: i32, %arg86: i32, %arg87: i32):
    %28 = "nvvm.mma.sync"(%arg81, %arg82, %arg83, %arg84, %arg85, %arg86, %arg87) <{intOverflowBehavior = #nvvm.mma_int_overflow<satfinite>, layoutA = #nvvm.mma_layout<row>, layoutB = #nvvm.mma_layout<col>, multiplicandAPtxType = #nvvm.mma_type<s4>, multiplicandBPtxType = #nvvm.mma_type<s4>, operandSegmentSizes = array<i32: 2, 1, 4>, shape = #nvvm.shape<m = 16, n = 8, k = 32>}> : (i32, i32, i32, i32, i32, i32, i32) -> !llvm.struct<(i32, i32, i32, i32)>
    "llvm.return"(%28) : (!llvm.struct<(i32, i32, i32, i32)>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<struct<(f64, f64)> (f64, f64, f64, f64)>, linkage = #llvm.linkage<external>, sym_name = "nvvm_mma_m8n8k4_f64_f64", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg77: f64, %arg78: f64, %arg79: f64, %arg80: f64):
    %27 = "nvvm.mma.sync"(%arg77, %arg78, %arg79, %arg80) <{layoutA = #nvvm.mma_layout<row>, layoutB = #nvvm.mma_layout<col>, multiplicandAPtxType = #nvvm.mma_type<f64>, multiplicandBPtxType = #nvvm.mma_type<f64>, operandSegmentSizes = array<i32: 1, 1, 2>, shape = #nvvm.shape<m = 8, n = 8, k = 4>}> : (f64, f64, f64, f64) -> !llvm.struct<(f64, f64)>
    "llvm.return"(%27) : (!llvm.struct<(f64, f64)>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<struct<(f32, f32, f32, f32)> (i32, i32, i32, f32, f32, f32, f32)>, linkage = #llvm.linkage<external>, sym_name = "nvvm_mma_m16n8k4_tf32_f32", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg70: i32, %arg71: i32, %arg72: i32, %arg73: f32, %arg74: f32, %arg75: f32, %arg76: f32):
    %26 = "nvvm.mma.sync"(%arg70, %arg71, %arg72, %arg73, %arg74, %arg75, %arg76) <{layoutA = #nvvm.mma_layout<row>, layoutB = #nvvm.mma_layout<col>, multiplicandAPtxType = #nvvm.mma_type<tf32>, multiplicandBPtxType = #nvvm.mma_type<tf32>, operandSegmentSizes = array<i32: 2, 1, 4>, shape = #nvvm.shape<m = 16, n = 8, k = 4>}> : (i32, i32, i32, f32, f32, f32, f32) -> !llvm.struct<(f32, f32, f32, f32)>
    "llvm.return"(%26) : (!llvm.struct<(f32, f32, f32, f32)>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<3>, i32)>, linkage = #llvm.linkage<external>, sym_name = "gpu_wmma_load_op", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg68: !llvm.ptr<3>, %arg69: i32):
    %25 = "nvvm.wmma.load"(%arg68, %arg69) <{eltype = #nvvm.mma_type<f16>, frag = #nvvm.mma_frag<a>, k = 16 : i32, layout = #nvvm.mma_layout<row>, m = 16 : i32, n = 16 : i32}> : (!llvm.ptr<3>, i32) -> !llvm.struct<(vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>)>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<3>, i32, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>)>, linkage = #llvm.linkage<external>, sym_name = "gpu_wmma_store_op", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg62: !llvm.ptr<3>, %arg63: i32, %arg64: vector<2xf16>, %arg65: vector<2xf16>, %arg66: vector<2xf16>, %arg67: vector<2xf16>):
    "nvvm.wmma.store"(%arg62, %arg64, %arg65, %arg66, %arg67, %arg63) <{eltype = #nvvm.mma_type<f16>, k = 16 : i32, layout = #nvvm.mma_layout<row>, m = 16 : i32, n = 16 : i32}> : (!llvm.ptr<3>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>)>, linkage = #llvm.linkage<external>, sym_name = "gpu_wmma_mma_op", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg42: vector<2xf16>, %arg43: vector<2xf16>, %arg44: vector<2xf16>, %arg45: vector<2xf16>, %arg46: vector<2xf16>, %arg47: vector<2xf16>, %arg48: vector<2xf16>, %arg49: vector<2xf16>, %arg50: vector<2xf16>, %arg51: vector<2xf16>, %arg52: vector<2xf16>, %arg53: vector<2xf16>, %arg54: vector<2xf16>, %arg55: vector<2xf16>, %arg56: vector<2xf16>, %arg57: vector<2xf16>, %arg58: vector<2xf16>, %arg59: vector<2xf16>, %arg60: vector<2xf16>, %arg61: vector<2xf16>):
    %24 = "nvvm.wmma.mma"(%arg42, %arg43, %arg44, %arg45, %arg46, %arg47, %arg48, %arg49, %arg50, %arg51, %arg52, %arg53, %arg54, %arg55, %arg56, %arg57, %arg58, %arg59, %arg60, %arg61) <{eltypeA = #nvvm.mma_type<f16>, eltypeB = #nvvm.mma_type<f16>, k = 16 : i32, layoutA = #nvvm.mma_layout<row>, layoutB = #nvvm.mma_layout<row>, m = 16 : i32, n = 16 : i32}> : (vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>) -> !llvm.struct<(vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>)>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, i32)>, linkage = #llvm.linkage<external>, sym_name = "nvvm_wmma_load_tf32", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg40: !llvm.ptr, %arg41: i32):
    %23 = "nvvm.wmma.load"(%arg40, %arg41) <{eltype = #nvvm.mma_type<tf32>, frag = #nvvm.mma_frag<a>, k = 8 : i32, layout = #nvvm.mma_layout<row>, m = 16 : i32, n = 16 : i32}> : (!llvm.ptr, i32) -> !llvm.struct<(i32, i32, i32, i32)>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, i32, i32, i32, i32, i32, i32, i32, f32, f32, f32, f32, f32, f32, f32, f32)>, linkage = #llvm.linkage<external>, sym_name = "nvvm_wmma_mma", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg24: i32, %arg25: i32, %arg26: i32, %arg27: i32, %arg28: i32, %arg29: i32, %arg30: i32, %arg31: i32, %arg32: f32, %arg33: f32, %arg34: f32, %arg35: f32, %arg36: f32, %arg37: f32, %arg38: f32, %arg39: f32):
    %22 = "nvvm.wmma.mma"(%arg24, %arg25, %arg26, %arg27, %arg28, %arg29, %arg30, %arg31, %arg32, %arg33, %arg34, %arg35, %arg36, %arg37, %arg38, %arg39) <{eltypeA = #nvvm.mma_type<tf32>, eltypeB = #nvvm.mma_type<f32>, k = 8 : i32, layoutA = #nvvm.mma_layout<row>, layoutB = #nvvm.mma_layout<row>, m = 16 : i32, n = 16 : i32}> : (i32, i32, i32, i32, i32, i32, i32, i32, f32, f32, f32, f32, f32, f32, f32, f32) -> !llvm.struct<(f32, f32, f32, f32, f32, f32, f32, f32)>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, i32)>, linkage = #llvm.linkage<external>, sym_name = "nvvm_wmma_load_a_f64", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg22: !llvm.ptr, %arg23: i32):
    %21 = "nvvm.wmma.load"(%arg22, %arg23) <{eltype = #nvvm.mma_type<f64>, frag = #nvvm.mma_frag<a>, k = 4 : i32, layout = #nvvm.mma_layout<row>, m = 8 : i32, n = 8 : i32}> : (!llvm.ptr, i32) -> f64
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, i32)>, linkage = #llvm.linkage<external>, sym_name = "nvvm_wmma_load_c_f64", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg20: !llvm.ptr, %arg21: i32):
    %20 = "nvvm.wmma.load"(%arg20, %arg21) <{eltype = #nvvm.mma_type<f64>, frag = #nvvm.mma_frag<c>, k = 4 : i32, layout = #nvvm.mma_layout<row>, m = 8 : i32, n = 8 : i32}> : (!llvm.ptr, i32) -> !llvm.struct<(f64, f64)>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (f64, f64, f64, f64)>, linkage = #llvm.linkage<external>, sym_name = "nvvm_wmma_mma_f64", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg16: f64, %arg17: f64, %arg18: f64, %arg19: f64):
    %19 = "nvvm.wmma.mma"(%arg16, %arg17, %arg18, %arg19) <{eltypeA = #nvvm.mma_type<f64>, eltypeB = #nvvm.mma_type<f64>, k = 4 : i32, layoutA = #nvvm.mma_layout<row>, layoutB = #nvvm.mma_layout<col>, m = 8 : i32, n = 8 : i32}> : (f64, f64, f64, f64) -> !llvm.struct<(f64, f64)>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, i32, f64, f64)>, linkage = #llvm.linkage<external>, sym_name = "nvvm_wmma_store_d_f64", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg12: !llvm.ptr, %arg13: i32, %arg14: f64, %arg15: f64):
    "nvvm.wmma.store"(%arg12, %arg14, %arg15, %arg13) <{eltype = #nvvm.mma_type<f64>, k = 4 : i32, layout = #nvvm.mma_layout<row>, m = 8 : i32, n = 8 : i32}> : (!llvm.ptr, f64, f64, i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<3>, ptr<1>)>, linkage = #llvm.linkage<external>, sym_name = "cp_async", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg10: !llvm.ptr<3>, %arg11: !llvm.ptr<1>):
    "nvvm.cp.async.shared.global"(%arg10, %arg11) <{modifier = #nvvm<load_cache_modifier ca>, size = 4 : i32}> : (!llvm.ptr<3>, !llvm.ptr<1>) -> ()
    "nvvm.cp.async.shared.global"(%arg10, %arg11) <{modifier = #nvvm<load_cache_modifier ca>, size = 8 : i32}> : (!llvm.ptr<3>, !llvm.ptr<1>) -> ()
    "nvvm.cp.async.shared.global"(%arg10, %arg11) <{modifier = #nvvm<load_cache_modifier ca>, size = 16 : i32}> : (!llvm.ptr<3>, !llvm.ptr<1>) -> ()
    "nvvm.cp.async.shared.global"(%arg10, %arg11) <{modifier = #nvvm<load_cache_modifier cg>, size = 16 : i32}> : (!llvm.ptr<3>, !llvm.ptr<1>) -> ()
    "nvvm.cp.async.commit.group"() : () -> ()
    "nvvm.cp.async.wait.group"() <{n = 0 : i32}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<3>, ptr<1>, i32)>, linkage = #llvm.linkage<external>, sym_name = "async_cp_zfill", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg7: !llvm.ptr<3>, %arg8: !llvm.ptr<1>, %arg9: i32):
    "nvvm.cp.async.shared.global"(%arg7, %arg8, %arg9) <{modifier = #nvvm<load_cache_modifier ca>, size = 4 : i32}> : (!llvm.ptr<3>, !llvm.ptr<1>, i32) -> ()
    "nvvm.cp.async.shared.global"(%arg7, %arg8, %arg9) <{modifier = #nvvm<load_cache_modifier ca>, size = 8 : i32}> : (!llvm.ptr<3>, !llvm.ptr<1>, i32) -> ()
    "nvvm.cp.async.shared.global"(%arg7, %arg8, %arg9) <{modifier = #nvvm<load_cache_modifier ca>, size = 16 : i32}> : (!llvm.ptr<3>, !llvm.ptr<1>, i32) -> ()
    "nvvm.cp.async.shared.global"(%arg7, %arg8, %arg9) <{modifier = #nvvm<load_cache_modifier cg>, size = 16 : i32}> : (!llvm.ptr<3>, !llvm.ptr<1>, i32) -> ()
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
  ^bb0(%arg6: !llvm.ptr<3>):
    %1 = "nvvm.ldmatrix"(%arg6) <{eltType = #nvvm.ld_st_matrix_elt_type<b16>, layout = #nvvm.mma_layout<row>, num = 1 : i32, shape = #nvvm.ld_st_matrix_shape<m = 8, n = 8>}> : (!llvm.ptr<3>) -> i32
    %2 = "nvvm.ldmatrix"(%arg6) <{eltType = #nvvm.ld_st_matrix_elt_type<b16>, layout = #nvvm.mma_layout<row>, num = 2 : i32, shape = #nvvm.ld_st_matrix_shape<m = 8, n = 8>}> : (!llvm.ptr<3>) -> !llvm.struct<(i32, i32)>
    %3 = "nvvm.ldmatrix"(%arg6) <{eltType = #nvvm.ld_st_matrix_elt_type<b16>, layout = #nvvm.mma_layout<row>, num = 4 : i32, shape = #nvvm.ld_st_matrix_shape<m = 8, n = 8>}> : (!llvm.ptr<3>) -> !llvm.struct<(i32, i32, i32, i32)>
    %4 = "nvvm.ldmatrix"(%arg6) <{eltType = #nvvm.ld_st_matrix_elt_type<b16>, layout = #nvvm.mma_layout<col>, num = 1 : i32, shape = #nvvm.ld_st_matrix_shape<m = 8, n = 8>}> : (!llvm.ptr<3>) -> i32
    %5 = "nvvm.ldmatrix"(%arg6) <{eltType = #nvvm.ld_st_matrix_elt_type<b16>, layout = #nvvm.mma_layout<col>, num = 2 : i32, shape = #nvvm.ld_st_matrix_shape<m = 8, n = 8>}> : (!llvm.ptr<3>) -> !llvm.struct<(i32, i32)>
    %6 = "nvvm.ldmatrix"(%arg6) <{eltType = #nvvm.ld_st_matrix_elt_type<b16>, layout = #nvvm.mma_layout<col>, num = 4 : i32, shape = #nvvm.ld_st_matrix_shape<m = 8, n = 8>}> : (!llvm.ptr<3>) -> !llvm.struct<(i32, i32, i32, i32)>
    %7 = "nvvm.ldmatrix"(%arg6) <{eltType = #nvvm.ld_st_matrix_elt_type<b8x16.b6x16_p32>, layout = #nvvm.mma_layout<row>, num = 1 : i32, shape = #nvvm.ld_st_matrix_shape<m = 8, n = 16>}> : (!llvm.ptr<3>) -> i32
    %8 = "nvvm.ldmatrix"(%arg6) <{eltType = #nvvm.ld_st_matrix_elt_type<b8x16.b6x16_p32>, layout = #nvvm.mma_layout<row>, num = 2 : i32, shape = #nvvm.ld_st_matrix_shape<m = 8, n = 16>}> : (!llvm.ptr<3>) -> !llvm.struct<(i32, i32)>
    %9 = "nvvm.ldmatrix"(%arg6) <{eltType = #nvvm.ld_st_matrix_elt_type<b8x16.b6x16_p32>, layout = #nvvm.mma_layout<row>, num = 4 : i32, shape = #nvvm.ld_st_matrix_shape<m = 8, n = 16>}> : (!llvm.ptr<3>) -> !llvm.struct<(i32, i32, i32, i32)>
    %10 = "nvvm.ldmatrix"(%arg6) <{eltType = #nvvm.ld_st_matrix_elt_type<b8x16.b4x16_p64>, layout = #nvvm.mma_layout<row>, num = 1 : i32, shape = #nvvm.ld_st_matrix_shape<m = 8, n = 16>}> : (!llvm.ptr<3>) -> i32
    %11 = "nvvm.ldmatrix"(%arg6) <{eltType = #nvvm.ld_st_matrix_elt_type<b8x16.b4x16_p64>, layout = #nvvm.mma_layout<row>, num = 2 : i32, shape = #nvvm.ld_st_matrix_shape<m = 8, n = 16>}> : (!llvm.ptr<3>) -> !llvm.struct<(i32, i32)>
    %12 = "nvvm.ldmatrix"(%arg6) <{eltType = #nvvm.ld_st_matrix_elt_type<b8x16.b4x16_p64>, layout = #nvvm.mma_layout<row>, num = 4 : i32, shape = #nvvm.ld_st_matrix_shape<m = 8, n = 16>}> : (!llvm.ptr<3>) -> !llvm.struct<(i32, i32, i32, i32)>
    %13 = "nvvm.ldmatrix"(%arg6) <{eltType = #nvvm.ld_st_matrix_elt_type<b8>, layout = #nvvm.mma_layout<col>, num = 1 : i32, shape = #nvvm.ld_st_matrix_shape<m = 16, n = 16>}> : (!llvm.ptr<3>) -> !llvm.struct<(i32, i32)>
    %14 = "nvvm.ldmatrix"(%arg6) <{eltType = #nvvm.ld_st_matrix_elt_type<b8>, layout = #nvvm.mma_layout<col>, num = 2 : i32, shape = #nvvm.ld_st_matrix_shape<m = 16, n = 16>}> : (!llvm.ptr<3>) -> !llvm.struct<(i32, i32, i32, i32)>
    %15 = "nvvm.ldmatrix"(%arg6) <{eltType = #nvvm.ld_st_matrix_elt_type<b8x16.b6x16_p32>, layout = #nvvm.mma_layout<col>, num = 1 : i32, shape = #nvvm.ld_st_matrix_shape<m = 16, n = 16>}> : (!llvm.ptr<3>) -> !llvm.struct<(i32, i32)>
    %16 = "nvvm.ldmatrix"(%arg6) <{eltType = #nvvm.ld_st_matrix_elt_type<b8x16.b6x16_p32>, layout = #nvvm.mma_layout<col>, num = 2 : i32, shape = #nvvm.ld_st_matrix_shape<m = 16, n = 16>}> : (!llvm.ptr<3>) -> !llvm.struct<(i32, i32, i32, i32)>
    %17 = "nvvm.ldmatrix"(%arg6) <{eltType = #nvvm.ld_st_matrix_elt_type<b8x16.b4x16_p64>, layout = #nvvm.mma_layout<col>, num = 1 : i32, shape = #nvvm.ld_st_matrix_shape<m = 16, n = 16>}> : (!llvm.ptr<3>) -> !llvm.struct<(i32, i32)>
    %18 = "nvvm.ldmatrix"(%arg6) <{eltType = #nvvm.ld_st_matrix_elt_type<b8x16.b4x16_p64>, layout = #nvvm.mma_layout<col>, num = 2 : i32, shape = #nvvm.ld_st_matrix_shape<m = 16, n = 16>}> : (!llvm.ptr<3>) -> !llvm.struct<(i32, i32, i32, i32)>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<3>, i32, i32, i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "st_matrix", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg1: !llvm.ptr<3>, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32):
    "nvvm.stmatrix"(%arg1, %arg2) <{eltType = #nvvm.ld_st_matrix_elt_type<b16>, layout = #nvvm.mma_layout<row>, shape = #nvvm.ld_st_matrix_shape<m = 8, n = 8>}> : (!llvm.ptr<3>, i32) -> ()
    "nvvm.stmatrix"(%arg1, %arg2) <{eltType = #nvvm.ld_st_matrix_elt_type<b16>, layout = #nvvm.mma_layout<col>, shape = #nvvm.ld_st_matrix_shape<m = 8, n = 8>}> : (!llvm.ptr<3>, i32) -> ()
    "nvvm.stmatrix"(%arg1, %arg2) <{eltType = #nvvm.ld_st_matrix_elt_type<b8>, layout = #nvvm.mma_layout<col>, shape = #nvvm.ld_st_matrix_shape<m = 16, n = 8>}> : (!llvm.ptr<3>, i32) -> ()
    "nvvm.stmatrix"(%arg1, %arg2, %arg3) <{eltType = #nvvm.ld_st_matrix_elt_type<b16>, layout = #nvvm.mma_layout<row>, shape = #nvvm.ld_st_matrix_shape<m = 8, n = 8>}> : (!llvm.ptr<3>, i32, i32) -> ()
    "nvvm.stmatrix"(%arg1, %arg2, %arg3) <{eltType = #nvvm.ld_st_matrix_elt_type<b16>, layout = #nvvm.mma_layout<col>, shape = #nvvm.ld_st_matrix_shape<m = 8, n = 8>}> : (!llvm.ptr<3>, i32, i32) -> ()
    "nvvm.stmatrix"(%arg1, %arg2, %arg3) <{eltType = #nvvm.ld_st_matrix_elt_type<b8>, layout = #nvvm.mma_layout<col>, shape = #nvvm.ld_st_matrix_shape<m = 16, n = 8>}> : (!llvm.ptr<3>, i32, i32) -> ()
    "nvvm.stmatrix"(%arg1, %arg2, %arg3, %arg4, %arg5) <{eltType = #nvvm.ld_st_matrix_elt_type<b16>, layout = #nvvm.mma_layout<row>, shape = #nvvm.ld_st_matrix_shape<m = 8, n = 8>}> : (!llvm.ptr<3>, i32, i32, i32, i32) -> ()
    "nvvm.stmatrix"(%arg1, %arg2, %arg3, %arg4, %arg5) <{eltType = #nvvm.ld_st_matrix_elt_type<b16>, layout = #nvvm.mma_layout<col>, shape = #nvvm.ld_st_matrix_shape<m = 8, n = 8>}> : (!llvm.ptr<3>, i32, i32, i32, i32) -> ()
    "nvvm.stmatrix"(%arg1, %arg2, %arg3, %arg4, %arg5) <{eltType = #nvvm.ld_st_matrix_elt_type<b8>, layout = #nvvm.mma_layout<col>, shape = #nvvm.ld_st_matrix_shape<m = 16, n = 8>}> : (!llvm.ptr<3>, i32, i32, i32, i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (i32)>, linkage = #llvm.linkage<external>, sym_name = "nvvm_movmatrix", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i32):
    %0 = "nvvm.movmatrix"(%arg0) <{eltType = #nvvm.ld_st_matrix_elt_type<b16>, layout = #nvvm.mma_layout<col>, shape = #nvvm.ld_st_matrix_shape<m = 8, n = 8>}> : (i32) -> i32
    "llvm.return"(%0) : (i32) -> ()
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
    %8 = "nvvm.redux.sync"(%arg2, %arg3) <{abs = false, kind = #nvvm<reduction_kind add>, nan = false}> : (i32, i32) -> i32
    %9 = "nvvm.redux.sync"(%arg2, %arg3) <{abs = false, kind = #nvvm<reduction_kind umax>, nan = false}> : (i32, i32) -> i32
    %10 = "nvvm.redux.sync"(%arg2, %arg3) <{abs = false, kind = #nvvm<reduction_kind umin>, nan = false}> : (i32, i32) -> i32
    %11 = "nvvm.redux.sync"(%arg2, %arg3) <{abs = false, kind = #nvvm<reduction_kind and>, nan = false}> : (i32, i32) -> i32
    %12 = "nvvm.redux.sync"(%arg2, %arg3) <{abs = false, kind = #nvvm<reduction_kind or>, nan = false}> : (i32, i32) -> i32
    %13 = "nvvm.redux.sync"(%arg2, %arg3) <{abs = false, kind = #nvvm<reduction_kind xor>, nan = false}> : (i32, i32) -> i32
    %14 = "nvvm.redux.sync"(%arg2, %arg3) <{abs = false, kind = #nvvm<reduction_kind max>, nan = false}> : (i32, i32) -> i32
    %15 = "nvvm.redux.sync"(%arg2, %arg3) <{abs = false, kind = #nvvm<reduction_kind min>, nan = false}> : (i32, i32) -> i32
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (f32, i32)>, linkage = #llvm.linkage<external>, sym_name = "nvvm_redux_sync_f32", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: f32, %arg1: i32):
    %0 = "nvvm.redux.sync"(%arg0, %arg1) <{abs = false, kind = #nvvm<reduction_kind fmin>, nan = false}> : (f32, i32) -> f32
    %1 = "nvvm.redux.sync"(%arg0, %arg1) <{abs = true, kind = #nvvm<reduction_kind fmin>, nan = false}> : (f32, i32) -> f32
    %2 = "nvvm.redux.sync"(%arg0, %arg1) <{abs = false, kind = #nvvm<reduction_kind fmin>, nan = true}> : (f32, i32) -> f32
    %3 = "nvvm.redux.sync"(%arg0, %arg1) <{abs = true, kind = #nvvm<reduction_kind fmin>, nan = true}> : (f32, i32) -> f32
    %4 = "nvvm.redux.sync"(%arg0, %arg1) <{abs = false, kind = #nvvm<reduction_kind fmax>, nan = false}> : (f32, i32) -> f32
    %5 = "nvvm.redux.sync"(%arg0, %arg1) <{abs = true, kind = #nvvm<reduction_kind fmax>, nan = false}> : (f32, i32) -> f32
    %6 = "nvvm.redux.sync"(%arg0, %arg1) <{abs = false, kind = #nvvm<reduction_kind fmax>, nan = true}> : (f32, i32) -> f32
    %7 = "nvvm.redux.sync"(%arg0, %arg1) <{abs = true, kind = #nvvm<reduction_kind fmax>, nan = true}> : (f32, i32) -> f32
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

// -----
"builtin.module"() ({
  "llvm.mlir.global"() <{addr_space = 1 : i32, global_type = i32, linkage = #llvm.linkage<external>, sym_name = "managed_g", unnamed_addr = 0 : i64, value = 0 : i32, visibility_ = 0 : i64}> ({
  }) {nvvm.managed} : () -> ()
  "llvm.mlir.global"() <{addr_space = 1 : i32, global_type = i32, linkage = #llvm.linkage<external>, sym_name = "managed_decl", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) {nvvm.managed} : () -> ()
}) : () -> ()

