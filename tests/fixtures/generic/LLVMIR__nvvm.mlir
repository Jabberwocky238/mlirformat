"builtin.module"() ({
  "func.func"() <{function_type = () -> i32, sym_name = "nvvm_special_regs"}> ({
    %45 = "nvvm.read.ptx.sreg.tid.x"() : () -> i32
    %46 = "nvvm.read.ptx.sreg.tid.y"() : () -> i32
    %47 = "nvvm.read.ptx.sreg.tid.z"() : () -> i32
    %48 = "nvvm.read.ptx.sreg.ntid.x"() : () -> i32
    %49 = "nvvm.read.ptx.sreg.ntid.y"() : () -> i32
    %50 = "nvvm.read.ptx.sreg.ntid.z"() : () -> i32
    %51 = "nvvm.read.ptx.sreg.ctaid.x"() : () -> i32
    %52 = "nvvm.read.ptx.sreg.ctaid.y"() : () -> i32
    %53 = "nvvm.read.ptx.sreg.ctaid.z"() : () -> i32
    %54 = "nvvm.read.ptx.sreg.nctaid.x"() : () -> i32
    %55 = "nvvm.read.ptx.sreg.nctaid.y"() : () -> i32
    %56 = "nvvm.read.ptx.sreg.nctaid.z"() : () -> i32
    "llvm.return"(%45) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32) -> f32, sym_name = "nvvm_rcp"}> ({
  ^bb0(%arg154: f32):
    %44 = "nvvm.rcp.approx.ftz.f"(%arg154) : (f32) -> f32
    "llvm.return"(%44) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "llvm_nvvm_barrier0"}> ({
    "nvvm.barrier0"() : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "llvm_nvvm_barrier", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg152: i32, %arg153: i32):
    "nvvm.barrier"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> ()
    "nvvm.barrier"(%arg152) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i32) -> ()
    "nvvm.barrier"(%arg152, %arg153) <{operandSegmentSizes = array<i32: 1, 1, 0>}> : (i32, i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "llvm_nvvm_barrier_arrive", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg150: i32, %arg151: i32):
    "nvvm.barrier.arrive"(%arg151) : (i32) -> ()
    "nvvm.barrier.arrive"(%arg150, %arg151) : (i32, i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "llvm_nvvm_cluster_arrive"}> ({
    "nvvm.cluster.arrive"() : () -> ()
    "nvvm.cluster.arrive"() <{aligned}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "llvm_nvvm_cluster_arrive_relaxed"}> ({
    "nvvm.cluster.arrive.relaxed"() : () -> ()
    "nvvm.cluster.arrive.relaxed"() <{aligned}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "llvm_nvvm_cluster_wait"}> ({
    "nvvm.cluster.wait"() : () -> ()
    "nvvm.cluster.wait"() <{aligned}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32, i32, i32, f32) -> i32, sym_name = "nvvm_shfl"}> ({
  ^bb0(%arg145: i32, %arg146: i32, %arg147: i32, %arg148: i32, %arg149: f32):
    %39 = "nvvm.shfl.sync"(%arg145, %arg148, %arg146, %arg147) <{kind = #nvvm<shfl_kind bfly>}> : (i32, i32, i32, i32) -> i32
    %40 = "nvvm.shfl.sync"(%arg145, %arg149, %arg146, %arg147) <{kind = #nvvm<shfl_kind bfly>}> : (i32, f32, i32, i32) -> f32
    %41 = "nvvm.shfl.sync"(%arg145, %arg149, %arg146, %arg147) <{kind = #nvvm<shfl_kind up>}> : (i32, f32, i32, i32) -> f32
    %42 = "nvvm.shfl.sync"(%arg145, %arg149, %arg146, %arg147) <{kind = #nvvm<shfl_kind down>}> : (i32, f32, i32, i32) -> f32
    %43 = "nvvm.shfl.sync"(%arg145, %arg149, %arg146, %arg147) <{kind = #nvvm<shfl_kind idx>}> : (i32, f32, i32, i32) -> f32
    "llvm.return"(%39) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32, i32, i32, f32) -> !llvm.struct<(i32, i1)>, sym_name = "nvvm_shfl_pred"}> ({
  ^bb0(%arg140: i32, %arg141: i32, %arg142: i32, %arg143: i32, %arg144: f32):
    %37 = "nvvm.shfl.sync"(%arg140, %arg143, %arg141, %arg142) <{kind = #nvvm<shfl_kind bfly>, return_value_and_is_valid}> : (i32, i32, i32, i32) -> !llvm.struct<(i32, i1)>
    %38 = "nvvm.shfl.sync"(%arg140, %arg144, %arg141, %arg142) <{kind = #nvvm<shfl_kind bfly>, return_value_and_is_valid}> : (i32, f32, i32, i32) -> !llvm.struct<(f32, i1)>
    "llvm.return"(%37) : (!llvm.struct<(i32, i1)>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i1) -> i32, sym_name = "nvvm_vote"}> ({
  ^bb0(%arg138: i32, %arg139: i1):
    %33 = "nvvm.vote.sync"(%arg138, %arg139) <{kind = #nvvm<vote_sync_kind ballot>}> : (i32, i1) -> i32
    %34 = "nvvm.vote.sync"(%arg138, %arg139) <{kind = #nvvm<vote_sync_kind all>}> : (i32, i1) -> i1
    %35 = "nvvm.vote.sync"(%arg138, %arg139) <{kind = #nvvm<vote_sync_kind any>}> : (i32, i1) -> i1
    %36 = "nvvm.vote.sync"(%arg138, %arg139) <{kind = #nvvm<vote_sync_kind uni>}> : (i32, i1) -> i1
    "llvm.return"(%33) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> (), sym_name = "llvm_nvvm_bar_warp_sync"}> ({
  ^bb0(%arg137: i32):
    "nvvm.bar.warp.sync"(%arg137) : (i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, f32, f32, f32, f32, f32, f32, f32, f32) -> (), sym_name = "nvvm_mma_m8n8k4_row_col_f32_f32"}> ({
  ^bb0(%arg125: vector<2xf16>, %arg126: vector<2xf16>, %arg127: vector<2xf16>, %arg128: vector<2xf16>, %arg129: f32, %arg130: f32, %arg131: f32, %arg132: f32, %arg133: f32, %arg134: f32, %arg135: f32, %arg136: f32):
    %32 = "nvvm.mma.sync"(%arg125, %arg126, %arg127, %arg128, %arg129, %arg130, %arg131, %arg132, %arg133, %arg134, %arg135, %arg136) <{layoutA = #nvvm.mma_layout<row>, layoutB = #nvvm.mma_layout<col>, multiplicandAPtxType = #nvvm.mma_type<f16>, multiplicandBPtxType = #nvvm.mma_type<f16>, operandSegmentSizes = array<i32: 2, 2, 8>, shape = #nvvm.shape<m = 8, n = 8, k = 4>}> : (vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, f32, f32, f32, f32, f32, f32, f32, f32) -> !llvm.struct<(f32, f32, f32, f32, f32, f32, f32, f32)>
    "llvm.return"(%32) : (!llvm.struct<(f32, f32, f32, f32, f32, f32, f32, f32)>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>) -> (), sym_name = "nvvm_mma_m8n8k4_f16_f16"}> ({
  ^bb0(%arg117: vector<2xf16>, %arg118: vector<2xf16>, %arg119: vector<2xf16>, %arg120: vector<2xf16>, %arg121: vector<2xf16>, %arg122: vector<2xf16>, %arg123: vector<2xf16>, %arg124: vector<2xf16>):
    %31 = "nvvm.mma.sync"(%arg117, %arg118, %arg119, %arg120, %arg121, %arg122, %arg123, %arg124) <{layoutA = #nvvm.mma_layout<row>, layoutB = #nvvm.mma_layout<col>, multiplicandAPtxType = #nvvm.mma_type<f16>, multiplicandBPtxType = #nvvm.mma_type<f16>, operandSegmentSizes = array<i32: 2, 2, 4>, shape = #nvvm.shape<m = 8, n = 8, k = 4>}> : (vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>) -> !llvm.struct<(vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>)>
    "llvm.return"(%31) : (!llvm.struct<(vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>)>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32, i32, f32, f32, f32, f32) -> (), sym_name = "nvvm_mma_m16n8k8_bf16_bf16"}> ({
  ^bb0(%arg110: i32, %arg111: i32, %arg112: i32, %arg113: f32, %arg114: f32, %arg115: f32, %arg116: f32):
    %30 = "nvvm.mma.sync"(%arg110, %arg111, %arg112, %arg113, %arg114, %arg115, %arg116) <{layoutA = #nvvm.mma_layout<row>, layoutB = #nvvm.mma_layout<col>, multiplicandAPtxType = #nvvm.mma_type<bf16>, multiplicandBPtxType = #nvvm.mma_type<bf16>, operandSegmentSizes = array<i32: 2, 1, 4>, shape = #nvvm.shape<m = 16, n = 8, k = 8>}> : (i32, i32, i32, f32, f32, f32, f32) -> !llvm.struct<(f32, f32, f32, f32)>
    "llvm.return"(%30) : (!llvm.struct<(f32, f32, f32, f32)>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32, i32, i32, i32, i32, f32, f32, f32, f32) -> (), sym_name = "nvvm_mma_m16n8k16_bf16_bf16"}> ({
  ^bb0(%arg100: i32, %arg101: i32, %arg102: i32, %arg103: i32, %arg104: i32, %arg105: i32, %arg106: f32, %arg107: f32, %arg108: f32, %arg109: f32):
    %29 = "nvvm.mma.sync"(%arg100, %arg101, %arg102, %arg103, %arg104, %arg105, %arg106, %arg107, %arg108, %arg109) <{layoutA = #nvvm.mma_layout<row>, layoutB = #nvvm.mma_layout<col>, multiplicandAPtxType = #nvvm.mma_type<bf16>, multiplicandBPtxType = #nvvm.mma_type<bf16>, operandSegmentSizes = array<i32: 4, 2, 4>, shape = #nvvm.shape<m = 16, n = 8, k = 16>}> : (i32, i32, i32, i32, i32, i32, f32, f32, f32, f32) -> !llvm.struct<(f32, f32, f32, f32)>
    "llvm.return"(%29) : (!llvm.struct<(f32, f32, f32, f32)>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32, i32, i32) -> (), sym_name = "nvvm_mma_m8n8k16_s8_s8"}> ({
  ^bb0(%arg96: i32, %arg97: i32, %arg98: i32, %arg99: i32):
    %28 = "nvvm.mma.sync"(%arg96, %arg97, %arg98, %arg99) <{intOverflowBehavior = #nvvm.mma_int_overflow<wrapped>, layoutA = #nvvm.mma_layout<row>, layoutB = #nvvm.mma_layout<col>, multiplicandAPtxType = #nvvm.mma_type<s8>, multiplicandBPtxType = #nvvm.mma_type<s8>, operandSegmentSizes = array<i32: 1, 1, 2>, shape = #nvvm.shape<m = 8, n = 8, k = 16>}> : (i32, i32, i32, i32) -> !llvm.struct<(i32, i32)>
    "llvm.return"(%28) : (!llvm.struct<(i32, i32)>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>) -> (), sym_name = "nvvm_mma_m16n8k8_f16_f16"}> ({
  ^bb0(%arg91: vector<2xf16>, %arg92: vector<2xf16>, %arg93: vector<2xf16>, %arg94: vector<2xf16>, %arg95: vector<2xf16>):
    %27 = "nvvm.mma.sync"(%arg91, %arg92, %arg93, %arg94, %arg95) <{layoutA = #nvvm.mma_layout<row>, layoutB = #nvvm.mma_layout<col>, multiplicandAPtxType = #nvvm.mma_type<f16>, multiplicandBPtxType = #nvvm.mma_type<f16>, operandSegmentSizes = array<i32: 2, 1, 2>, shape = #nvvm.shape<m = 16, n = 8, k = 8>}> : (vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>) -> !llvm.struct<(vector<2xf16>, vector<2xf16>)>
    "llvm.return"(%27) : (!llvm.struct<(vector<2xf16>, vector<2xf16>)>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>) -> (), sym_name = "nvvm_mma_m16n8k16_f16_f16"}> ({
  ^bb0(%arg83: vector<2xf16>, %arg84: vector<2xf16>, %arg85: vector<2xf16>, %arg86: vector<2xf16>, %arg87: vector<2xf16>, %arg88: vector<2xf16>, %arg89: vector<2xf16>, %arg90: vector<2xf16>):
    %26 = "nvvm.mma.sync"(%arg83, %arg84, %arg85, %arg86, %arg87, %arg88, %arg89, %arg90) <{layoutA = #nvvm.mma_layout<row>, layoutB = #nvvm.mma_layout<col>, multiplicandAPtxType = #nvvm.mma_type<f16>, multiplicandBPtxType = #nvvm.mma_type<f16>, operandSegmentSizes = array<i32: 4, 2, 2>, shape = #nvvm.shape<m = 16, n = 8, k = 16>}> : (vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>) -> !llvm.struct<(vector<2xf16>, vector<2xf16>)>
    "llvm.return"(%26) : (!llvm.struct<(vector<2xf16>, vector<2xf16>)>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, f32, f32, f32, f32) -> (), sym_name = "nvvm_mma_m16n8k16_f32_f32"}> ({
  ^bb0(%arg73: vector<2xf16>, %arg74: vector<2xf16>, %arg75: vector<2xf16>, %arg76: vector<2xf16>, %arg77: vector<2xf16>, %arg78: vector<2xf16>, %arg79: f32, %arg80: f32, %arg81: f32, %arg82: f32):
    %25 = "nvvm.mma.sync"(%arg73, %arg74, %arg75, %arg76, %arg77, %arg78, %arg79, %arg80, %arg81, %arg82) <{layoutA = #nvvm.mma_layout<row>, layoutB = #nvvm.mma_layout<col>, multiplicandAPtxType = #nvvm.mma_type<f16>, multiplicandBPtxType = #nvvm.mma_type<f16>, operandSegmentSizes = array<i32: 4, 2, 4>, shape = #nvvm.shape<m = 16, n = 8, k = 16>}> : (vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, f32, f32, f32, f32) -> !llvm.struct<(f32, f32, f32, f32)>
    "llvm.return"(%25) : (!llvm.struct<(f32, f32, f32, f32)>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32, i32, f32, f32, f32, f32) -> (), sym_name = "nvvm_mma_m16n8k4_tf32_f32"}> ({
  ^bb0(%arg66: i32, %arg67: i32, %arg68: i32, %arg69: f32, %arg70: f32, %arg71: f32, %arg72: f32):
    %24 = "nvvm.mma.sync"(%arg66, %arg67, %arg68, %arg69, %arg70, %arg71, %arg72) <{layoutA = #nvvm.mma_layout<row>, layoutB = #nvvm.mma_layout<col>, multiplicandAPtxType = #nvvm.mma_type<tf32>, multiplicandBPtxType = #nvvm.mma_type<tf32>, operandSegmentSizes = array<i32: 2, 1, 4>, shape = #nvvm.shape<m = 16, n = 8, k = 4>}> : (i32, i32, i32, f32, f32, f32, f32) -> !llvm.struct<(f32, f32, f32, f32)>
    "llvm.return"(%24) : (!llvm.struct<(f32, f32, f32, f32)>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32, i32, i32, i32, i32, i32) -> (), sym_name = "nvvm_mma_m16n8k16_s8_s8"}> ({
  ^bb0(%arg59: i32, %arg60: i32, %arg61: i32, %arg62: i32, %arg63: i32, %arg64: i32, %arg65: i32):
    %23 = "nvvm.mma.sync"(%arg59, %arg60, %arg61, %arg62, %arg63, %arg64, %arg65) <{intOverflowBehavior = #nvvm.mma_int_overflow<wrapped>, layoutA = #nvvm.mma_layout<row>, layoutB = #nvvm.mma_layout<col>, multiplicandAPtxType = #nvvm.mma_type<s8>, multiplicandBPtxType = #nvvm.mma_type<s8>, operandSegmentSizes = array<i32: 2, 1, 4>, shape = #nvvm.shape<m = 16, n = 8, k = 16>}> : (i32, i32, i32, i32, i32, i32, i32) -> !llvm.struct<(i32, i32, i32, i32)>
    "llvm.return"(%23) : (!llvm.struct<(i32, i32, i32, i32)>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32, i32, i32, i32, i32, i32) -> (), sym_name = "nvvm_mma_m16n8k16_s8_u8"}> ({
  ^bb0(%arg52: i32, %arg53: i32, %arg54: i32, %arg55: i32, %arg56: i32, %arg57: i32, %arg58: i32):
    %22 = "nvvm.mma.sync"(%arg52, %arg53, %arg54, %arg55, %arg56, %arg57, %arg58) <{intOverflowBehavior = #nvvm.mma_int_overflow<satfinite>, layoutA = #nvvm.mma_layout<row>, layoutB = #nvvm.mma_layout<col>, multiplicandAPtxType = #nvvm.mma_type<s8>, multiplicandBPtxType = #nvvm.mma_type<u8>, operandSegmentSizes = array<i32: 2, 1, 4>, shape = #nvvm.shape<m = 16, n = 8, k = 16>}> : (i32, i32, i32, i32, i32, i32, i32) -> !llvm.struct<(i32, i32, i32, i32)>
    "llvm.return"(%22) : (!llvm.struct<(i32, i32, i32, i32)>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32, i32, i32, i32, i32, i32, i32, i32, i32) -> (), sym_name = "nvvm_mma_m16n8k256_b1_b1"}> ({
  ^bb0(%arg42: i32, %arg43: i32, %arg44: i32, %arg45: i32, %arg46: i32, %arg47: i32, %arg48: i32, %arg49: i32, %arg50: i32, %arg51: i32):
    %21 = "nvvm.mma.sync"(%arg42, %arg43, %arg44, %arg45, %arg46, %arg47, %arg48, %arg49, %arg50, %arg51) <{b1Op = #nvvm.mma_b1op<xor_popc>, layoutA = #nvvm.mma_layout<row>, layoutB = #nvvm.mma_layout<col>, multiplicandAPtxType = #nvvm.mma_type<b1>, multiplicandBPtxType = #nvvm.mma_type<b1>, operandSegmentSizes = array<i32: 4, 2, 4>, shape = #nvvm.shape<m = 16, n = 8, k = 256>}> : (i32, i32, i32, i32, i32, i32, i32, i32, i32, i32) -> !llvm.struct<(i32, i32, i32, i32)>
    "llvm.return"(%21) : (!llvm.struct<(i32, i32, i32, i32)>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32, i32, i32, i32, i32, i32) -> (), sym_name = "nvvm_mma_m16n8k128_b1_b1"}> ({
  ^bb0(%arg35: i32, %arg36: i32, %arg37: i32, %arg38: i32, %arg39: i32, %arg40: i32, %arg41: i32):
    %20 = "nvvm.mma.sync"(%arg35, %arg36, %arg37, %arg38, %arg39, %arg40, %arg41) <{b1Op = #nvvm.mma_b1op<xor_popc>, layoutA = #nvvm.mma_layout<row>, layoutB = #nvvm.mma_layout<col>, multiplicandAPtxType = #nvvm.mma_type<b1>, multiplicandBPtxType = #nvvm.mma_type<b1>, operandSegmentSizes = array<i32: 2, 1, 4>, shape = #nvvm.shape<m = 16, n = 8, k = 128>}> : (i32, i32, i32, i32, i32, i32, i32) -> !llvm.struct<(i32, i32, i32, i32)>
    "llvm.return"(%20) : (!llvm.struct<(i32, i32, i32, i32)>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32, i32, i32) -> (), sym_name = "nvvm_mma_m8n8k128_b1_b1"}> ({
  ^bb0(%arg31: i32, %arg32: i32, %arg33: i32, %arg34: i32):
    %19 = "nvvm.mma.sync"(%arg31, %arg32, %arg33, %arg34) <{b1Op = #nvvm.mma_b1op<xor_popc>, layoutA = #nvvm.mma_layout<row>, layoutB = #nvvm.mma_layout<col>, multiplicandAPtxType = #nvvm.mma_type<b1>, multiplicandBPtxType = #nvvm.mma_type<b1>, operandSegmentSizes = array<i32: 1, 1, 2>, shape = #nvvm.shape<m = 8, n = 8, k = 128>}> : (i32, i32, i32, i32) -> !llvm.struct<(i32, i32)>
    "llvm.return"(%19) : (!llvm.struct<(i32, i32)>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32, i32, i32, i32, i32, i32) -> (), sym_name = "nvvm_mma_m16n8k32_s4_s4"}> ({
  ^bb0(%arg24: i32, %arg25: i32, %arg26: i32, %arg27: i32, %arg28: i32, %arg29: i32, %arg30: i32):
    %18 = "nvvm.mma.sync"(%arg24, %arg25, %arg26, %arg27, %arg28, %arg29, %arg30) <{intOverflowBehavior = #nvvm.mma_int_overflow<wrapped>, layoutA = #nvvm.mma_layout<row>, layoutB = #nvvm.mma_layout<col>, multiplicandAPtxType = #nvvm.mma_type<s4>, multiplicandBPtxType = #nvvm.mma_type<s4>, operandSegmentSizes = array<i32: 2, 1, 4>, shape = #nvvm.shape<m = 16, n = 8, k = 32>}> : (i32, i32, i32, i32, i32, i32, i32) -> !llvm.struct<(i32, i32, i32, i32)>
    "llvm.return"(%18) : (!llvm.struct<(i32, i32, i32, i32)>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!llvm.ptr, i32) -> !llvm.struct<(i32, i32, i32, i32)>, sym_name = "nvvm_wmma_load_tf32"}> ({
  ^bb0(%arg22: !llvm.ptr, %arg23: i32):
    %17 = "nvvm.wmma.load"(%arg22, %arg23) <{eltype = #nvvm.mma_type<tf32>, frag = #nvvm.mma_frag<a>, k = 8 : i32, layout = #nvvm.mma_layout<row>, m = 16 : i32, n = 16 : i32}> : (!llvm.ptr, i32) -> !llvm.struct<(i32, i32, i32, i32)>
    "llvm.return"(%17) : (!llvm.struct<(i32, i32, i32, i32)>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32, i32, i32, i32, i32, i32, i32, f32, f32, f32, f32, f32, f32, f32, f32) -> !llvm.struct<(f32, f32, f32, f32, f32, f32, f32, f32)>, sym_name = "nvvm_wmma_mma"}> ({
  ^bb0(%arg6: i32, %arg7: i32, %arg8: i32, %arg9: i32, %arg10: i32, %arg11: i32, %arg12: i32, %arg13: i32, %arg14: f32, %arg15: f32, %arg16: f32, %arg17: f32, %arg18: f32, %arg19: f32, %arg20: f32, %arg21: f32):
    %16 = "nvvm.wmma.mma"(%arg6, %arg7, %arg8, %arg9, %arg10, %arg11, %arg12, %arg13, %arg14, %arg15, %arg16, %arg17, %arg18, %arg19, %arg20, %arg21) <{eltypeA = #nvvm.mma_type<tf32>, eltypeB = #nvvm.mma_type<f32>, k = 8 : i32, layoutA = #nvvm.mma_layout<row>, layoutB = #nvvm.mma_layout<row>, m = 16 : i32, n = 16 : i32}> : (i32, i32, i32, i32, i32, i32, i32, i32, f32, f32, f32, f32, f32, f32, f32, f32) -> !llvm.struct<(f32, f32, f32, f32, f32, f32, f32, f32)>
    "llvm.return"(%16) : (!llvm.struct<(f32, f32, f32, f32, f32, f32, f32, f32)>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<3>, ptr<1>)>, linkage = #llvm.linkage<external>, sym_name = "cp_async", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg4: !llvm.ptr<3>, %arg5: !llvm.ptr<1>):
    "nvvm.cp.async.shared.global"(%arg4, %arg5) <{modifier = #nvvm<load_cache_modifier ca>, size = 16 : i32}> : (!llvm.ptr<3>, !llvm.ptr<1>) -> ()
    "nvvm.cp.async.shared.global"(%arg4, %arg5) <{modifier = #nvvm<load_cache_modifier cg>, size = 16 : i32}> : (!llvm.ptr<3>, !llvm.ptr<1>) -> ()
    "nvvm.cp.async.commit.group"() : () -> ()
    "nvvm.cp.async.wait.group"() <{n = 0 : i32}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "redux_sync", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg2: i32, %arg3: i32):
    %8 = "nvvm.redux.sync"(%arg2, %arg3) <{abs = false, kind = #nvvm<redux_kind add>, nan = false}> : (i32, i32) -> i32
    %9 = "nvvm.redux.sync"(%arg2, %arg3) <{abs = false, kind = #nvvm<redux_kind max>, nan = false}> : (i32, i32) -> i32
    %10 = "nvvm.redux.sync"(%arg2, %arg3) <{abs = false, kind = #nvvm<redux_kind min>, nan = false}> : (i32, i32) -> i32
    %11 = "nvvm.redux.sync"(%arg2, %arg3) <{abs = false, kind = #nvvm<redux_kind umax>, nan = false}> : (i32, i32) -> i32
    %12 = "nvvm.redux.sync"(%arg2, %arg3) <{abs = false, kind = #nvvm<redux_kind umin>, nan = false}> : (i32, i32) -> i32
    %13 = "nvvm.redux.sync"(%arg2, %arg3) <{abs = false, kind = #nvvm<redux_kind and>, nan = false}> : (i32, i32) -> i32
    %14 = "nvvm.redux.sync"(%arg2, %arg3) <{abs = false, kind = #nvvm<redux_kind or>, nan = false}> : (i32, i32) -> i32
    %15 = "nvvm.redux.sync"(%arg2, %arg3) <{abs = false, kind = #nvvm<redux_kind xor>, nan = false}> : (i32, i32) -> i32
    "llvm.return"(%8) : (i32) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<f32 (f32, i32)>, linkage = #llvm.linkage<external>, sym_name = "redux_sync_f32", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: f32, %arg1: i32):
    %0 = "nvvm.redux.sync"(%arg0, %arg1) <{abs = false, kind = #nvvm<redux_kind fmin>, nan = false}> : (f32, i32) -> f32
    %1 = "nvvm.redux.sync"(%arg0, %arg1) <{abs = true, kind = #nvvm<redux_kind fmin>, nan = false}> : (f32, i32) -> f32
    %2 = "nvvm.redux.sync"(%arg0, %arg1) <{abs = false, kind = #nvvm<redux_kind fmin>, nan = false}> {NaN = true} : (f32, i32) -> f32
    %3 = "nvvm.redux.sync"(%arg0, %arg1) <{abs = true, kind = #nvvm<redux_kind fmin>, nan = false}> {NaN = true} : (f32, i32) -> f32
    %4 = "nvvm.redux.sync"(%arg0, %arg1) <{abs = false, kind = #nvvm<redux_kind fmax>, nan = false}> : (f32, i32) -> f32
    %5 = "nvvm.redux.sync"(%arg0, %arg1) <{abs = true, kind = #nvvm<redux_kind fmax>, nan = false}> : (f32, i32) -> f32
    %6 = "nvvm.redux.sync"(%arg0, %arg1) <{abs = false, kind = #nvvm<redux_kind fmax>, nan = false}> {NaN = true} : (f32, i32) -> f32
    %7 = "nvvm.redux.sync"(%arg0, %arg1) <{abs = true, kind = #nvvm<redux_kind fmax>, nan = false}> {NaN = true} : (f32, i32) -> f32
    "llvm.return"(%0) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<private>, sym_name = "mbarrier_init_generic", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg28: !llvm.ptr):
    %17 = "nvvm.read.ptx.sreg.ntid.x"() : () -> i32
    "nvvm.mbarrier.init"(%arg28, %17) : (!llvm.ptr, i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<3>)>, linkage = #llvm.linkage<private>, sym_name = "mbarrier_init_shared", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg27: !llvm.ptr<3>):
    %16 = "nvvm.read.ptx.sreg.ntid.x"() : () -> i32
    "nvvm.mbarrier.init"(%arg27, %16) : (!llvm.ptr<3>, i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<private>, sym_name = "mbarrier_inval_generic", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg26: !llvm.ptr):
    "nvvm.mbarrier.inval"(%arg26) : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<3>)>, linkage = #llvm.linkage<private>, sym_name = "mbarrier_inval_shared", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg25: !llvm.ptr<3>):
    "nvvm.mbarrier.inval"(%arg25) : (!llvm.ptr<3>) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<private>, sym_name = "mbarrier_arrive", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg24: !llvm.ptr):
    %15 = "nvvm.mbarrier.arrive"(%arg24) <{relaxed = false, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr) -> i64
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<3>)>, linkage = #llvm.linkage<private>, sym_name = "mbarrier_arrive_shared", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg23: !llvm.ptr<3>):
    %14 = "nvvm.mbarrier.arrive"(%arg23) <{relaxed = false, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr<3>) -> i64
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<private>, sym_name = "mbarrier_arrive_nocomplete", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg22: !llvm.ptr):
    %12 = "nvvm.read.ptx.sreg.ntid.x"() : () -> i32
    %13 = "nvvm.mbarrier.arrive.nocomplete"(%arg22, %12) : (!llvm.ptr, i32) -> i64
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<3>)>, linkage = #llvm.linkage<private>, sym_name = "mbarrier_arrive_nocomplete_shared", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg21: !llvm.ptr<3>):
    %10 = "nvvm.read.ptx.sreg.ntid.x"() : () -> i32
    %11 = "nvvm.mbarrier.arrive.nocomplete"(%arg21, %10) : (!llvm.ptr<3>, i32) -> i64
    "llvm.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "wgmma_fence_aligned"}> ({
    "nvvm.wgmma.fence.aligned"() : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "wgmma_commit_group_sync_aligned"}> ({
    "nvvm.wgmma.commit.group.sync.aligned"() : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "wgmma_wait_group_sync_aligned"}> ({
    "nvvm.wgmma.wait.group.sync.aligned"() <{group = 0 : i64}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "griddepcontrol_wait"}> ({
    "nvvm.griddepcontrol"() <{kind = #nvvm<grid_dep_action wait>}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "griddepcontrol_launch_dependents"}> ({
    "nvvm.griddepcontrol"() <{kind = #nvvm<grid_dep_action launch_dependents>}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!llvm.ptr, !llvm.ptr<3>, i32) -> (), sym_name = "mapa"}> ({
  ^bb0(%arg18: !llvm.ptr, %arg19: !llvm.ptr<3>, %arg20: i32):
    %8 = "nvvm.mapa"(%arg18, %arg20) : (!llvm.ptr, i32) -> !llvm.ptr
    %9 = "nvvm.mapa"(%arg19, %arg20) : (!llvm.ptr<3>, i32) -> !llvm.ptr<7>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i64, i32) -> (), sym_name = "match_sync"}> ({
  ^bb0(%arg15: i32, %arg16: i64, %arg17: i32):
    %4 = "nvvm.match.sync"(%arg17, %arg15) <{kind = #nvvm<match_sync_kind any>}> : (i32, i32) -> i32
    %5 = "nvvm.match.sync"(%arg17, %arg15) <{kind = #nvvm<match_sync_kind all>}> : (i32, i32) -> !llvm.struct<(i32, i1)>
    %6 = "nvvm.match.sync"(%arg17, %arg16) <{kind = #nvvm<match_sync_kind any>}> : (i32, i64) -> i32
    %7 = "nvvm.match.sync"(%arg17, %arg16) <{kind = #nvvm<match_sync_kind all>}> : (i32, i64) -> !llvm.struct<(i32, i1)>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!llvm.ptr, !llvm.ptr<3>, i64) -> (), sym_name = "st_bulk"}> ({
  ^bb0(%arg12: !llvm.ptr, %arg13: !llvm.ptr<3>, %arg14: i64):
    "nvvm.st.bulk"(%arg12, %arg14) <{initVal = 0 : i64}> : (!llvm.ptr, i64) -> ()
    "nvvm.st.bulk"(%arg13, %arg14) <{initVal = 0 : i64}> : (!llvm.ptr<3>, i64) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xi8>, vector<4xi8>, i32) -> (), sym_name = "dot_accumulate_4way"}> ({
  ^bb0(%arg9: vector<4xi8>, %arg10: vector<4xi8>, %arg11: i32):
    %2 = "nvvm.dot.accumulate.4way"(%arg9, %arg10, %arg11) <{a_type = #nvvm.dot_accumulate_type<unsigned>, b_type = #nvvm.dot_accumulate_type<unsigned>}> : (vector<4xi8>, vector<4xi8>, i32) -> i32
    %3 = "nvvm.dot.accumulate.4way"(%arg9, %arg10, %arg11) <{a_type = #nvvm.dot_accumulate_type<signed>, b_type = #nvvm.dot_accumulate_type<signed>}> : (vector<4xi8>, vector<4xi8>, i32) -> i32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xi16>, vector<4xi8>, i32) -> (), sym_name = "dot_accumulate_2way"}> ({
  ^bb0(%arg6: vector<2xi16>, %arg7: vector<4xi8>, %arg8: i32):
    %0 = "nvvm.dot.accumulate.2way"(%arg6, %arg7, %arg8) <{a_type = #nvvm.dot_accumulate_type<unsigned>, b_hi = false, b_type = #nvvm.dot_accumulate_type<unsigned>}> : (vector<2xi16>, vector<4xi8>, i32) -> i32
    %1 = "nvvm.dot.accumulate.2way"(%arg6, %arg7, %arg8) <{a_type = #nvvm.dot_accumulate_type<signed>, b_hi = true, b_type = #nvvm.dot_accumulate_type<signed>}> : (vector<2xi16>, vector<4xi8>, i32) -> i32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!llvm.ptr, !llvm.ptr<5>, !llvm.ptr<1>, !llvm.ptr<4>) -> (), sym_name = "prefetch"}> ({
  ^bb0(%arg2: !llvm.ptr, %arg3: !llvm.ptr<5>, %arg4: !llvm.ptr<1>, %arg5: !llvm.ptr<4>):
    "nvvm.prefetch"(%arg2) <{cacheLevel = #nvvm<prefetch_cache_level L1>}> : (!llvm.ptr) -> ()
    "nvvm.prefetch"(%arg3) <{cacheLevel = #nvvm<prefetch_cache_level L1>}> : (!llvm.ptr<5>) -> ()
    "nvvm.prefetch"(%arg4) <{cacheLevel = #nvvm<prefetch_cache_level L1>}> : (!llvm.ptr<1>) -> ()
    "nvvm.prefetch"(%arg2) <{cacheLevel = #nvvm<prefetch_cache_level L2>}> : (!llvm.ptr) -> ()
    "nvvm.prefetch"(%arg3) <{cacheLevel = #nvvm<prefetch_cache_level L2>}> : (!llvm.ptr<5>) -> ()
    "nvvm.prefetch"(%arg4) <{cacheLevel = #nvvm<prefetch_cache_level L2>}> : (!llvm.ptr<1>) -> ()
    "nvvm.prefetch"(%arg4) <{cacheLevel = #nvvm<prefetch_cache_level L2>, evictPriority = #nvvm<cache_eviction_priority evict_last>}> : (!llvm.ptr<1>) -> ()
    "nvvm.prefetch"(%arg4) <{cacheLevel = #nvvm<prefetch_cache_level L2>, evictPriority = #nvvm<cache_eviction_priority evict_normal>}> : (!llvm.ptr<1>) -> ()
    "nvvm.prefetch"(%arg2) <{cacheLevel = #nvvm<prefetch_cache_level L1>, uniform}> : (!llvm.ptr) -> ()
    "nvvm.prefetch"(%arg2) <{tensormap}> : (!llvm.ptr) -> ()
    "nvvm.prefetch"(%arg5) <{tensormap}> : (!llvm.ptr<4>) -> ()
    "nvvm.prefetch"(%arg2) <{in_param_space, tensormap}> : (!llvm.ptr) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!llvm.ptr, !llvm.ptr<4>) -> (), sym_name = "prefetch_tensormap"}> ({
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr<4>):
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!ptr.ptr<#nvvm.memory_space<global>>, !ptr.ptr<#nvvm.memory_space<shared>>, !ptr.ptr<#nvvm.memory_space<constant>>, !ptr.ptr<#nvvm.memory_space<local>>, !ptr.ptr<#nvvm.memory_space<tensor>>, !ptr.ptr<#nvvm.memory_space<shared_cluster>>) -> !ptr.ptr<#nvvm.memory_space<generic>>, sym_name = "nvvm_address_space", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "module_1", targets = [#nvvm.target<chip = "sm_90", features = "+ptx70", flags = {fast, ftz}, link = ["my_device_lib.bc"]>]}> ({
  ^bb0:
  }) : () -> ()
  "gpu.module"() <{sym_name = "module_2", targets = [#nvvm.target<chip = "sm_90">, #nvvm.target<chip = "sm_80">, #nvvm.target<chip = "sm_70">]}> ({
  ^bb0:
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{llvm.byval = i32, nvvm.grid_constant}], function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "kernel_func", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr):
    "llvm.return"() : () -> ()
  }) {nvvm.kernel} : () -> ()
}) : () -> ()

// -----
// -----
// -----
