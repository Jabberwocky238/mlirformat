"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xi32>, vector<2xi32>, vector<4xf32>, i32, i16, i16, i32, i16, i16) -> (), sym_name = "nvvm_mxf8f6f4_blockscale_mma_e2m1_e2m1"}> ({
  ^bb0(%arg243: vector<4xi32>, %arg244: vector<2xi32>, %arg245: vector<4xf32>, %arg246: i32, %arg247: i16, %arg248: i16, %arg249: i32, %arg250: i16, %arg251: i16):
    %27 = "nvvm.mma.block_scale"(%arg243, %arg244, %arg245, %arg246, %arg247, %arg248, %arg249, %arg250, %arg251) <{blockScaleFormat = #nvvm.block_scale_format<ue8m0>, kind = #nvvm.block_scale_kind<mxf8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e2m1>, multiplicandBPtxType = #nvvm.mma_type<e2m1>, operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 1, 1>, scaleVecSize = #nvvm.scale_vec_size<x1>, shape = #nvvm.shape<m = 16, n = 8, k = 32>}> : (vector<4xi32>, vector<2xi32>, vector<4xf32>, i32, i16, i16, i32, i16, i16) -> !llvm.struct<(vector<4xf32>)>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xi32>, vector<2xi32>, vector<4xf32>, i32, i16, i16, i32, i16, i16) -> (), sym_name = "nvvm_mxf8f6f4_blockscale_mma_e2m1_e2m3"}> ({
  ^bb0(%arg234: vector<4xi32>, %arg235: vector<2xi32>, %arg236: vector<4xf32>, %arg237: i32, %arg238: i16, %arg239: i16, %arg240: i32, %arg241: i16, %arg242: i16):
    %26 = "nvvm.mma.block_scale"(%arg234, %arg235, %arg236, %arg237, %arg238, %arg239, %arg240, %arg241, %arg242) <{blockScaleFormat = #nvvm.block_scale_format<ue8m0>, kind = #nvvm.block_scale_kind<mxf8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e2m1>, multiplicandBPtxType = #nvvm.mma_type<e2m3>, operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 1, 1>, scaleVecSize = #nvvm.scale_vec_size<x1>, shape = #nvvm.shape<m = 16, n = 8, k = 32>}> : (vector<4xi32>, vector<2xi32>, vector<4xf32>, i32, i16, i16, i32, i16, i16) -> !llvm.struct<(vector<4xf32>)>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xi32>, vector<2xi32>, vector<4xf32>, i32, i16, i16, i32, i16, i16) -> (), sym_name = "nvvm_mxf8f6f4_blockscale_mma_e2m1_e3m2"}> ({
  ^bb0(%arg225: vector<4xi32>, %arg226: vector<2xi32>, %arg227: vector<4xf32>, %arg228: i32, %arg229: i16, %arg230: i16, %arg231: i32, %arg232: i16, %arg233: i16):
    %25 = "nvvm.mma.block_scale"(%arg225, %arg226, %arg227, %arg228, %arg229, %arg230, %arg231, %arg232, %arg233) <{blockScaleFormat = #nvvm.block_scale_format<ue8m0>, kind = #nvvm.block_scale_kind<mxf8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e2m1>, multiplicandBPtxType = #nvvm.mma_type<e3m2>, operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 1, 1>, scaleVecSize = #nvvm.scale_vec_size<x1>, shape = #nvvm.shape<m = 16, n = 8, k = 32>}> : (vector<4xi32>, vector<2xi32>, vector<4xf32>, i32, i16, i16, i32, i16, i16) -> !llvm.struct<(vector<4xf32>)>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xi32>, vector<2xi32>, vector<4xf32>, i32, i16, i16, i32, i16, i16) -> (), sym_name = "nvvm_mxf8f6f4_blockscale_mma_e2m1_e4m3"}> ({
  ^bb0(%arg216: vector<4xi32>, %arg217: vector<2xi32>, %arg218: vector<4xf32>, %arg219: i32, %arg220: i16, %arg221: i16, %arg222: i32, %arg223: i16, %arg224: i16):
    %24 = "nvvm.mma.block_scale"(%arg216, %arg217, %arg218, %arg219, %arg220, %arg221, %arg222, %arg223, %arg224) <{blockScaleFormat = #nvvm.block_scale_format<ue8m0>, kind = #nvvm.block_scale_kind<mxf8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e2m1>, multiplicandBPtxType = #nvvm.mma_type<e4m3>, operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 1, 1>, scaleVecSize = #nvvm.scale_vec_size<x1>, shape = #nvvm.shape<m = 16, n = 8, k = 32>}> : (vector<4xi32>, vector<2xi32>, vector<4xf32>, i32, i16, i16, i32, i16, i16) -> !llvm.struct<(vector<4xf32>)>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xi32>, vector<2xi32>, vector<4xf32>, i32, i16, i16, i32, i16, i16) -> (), sym_name = "nvvm_mxf8f6f4_blockscale_mma_e2m1_e5m2"}> ({
  ^bb0(%arg207: vector<4xi32>, %arg208: vector<2xi32>, %arg209: vector<4xf32>, %arg210: i32, %arg211: i16, %arg212: i16, %arg213: i32, %arg214: i16, %arg215: i16):
    %23 = "nvvm.mma.block_scale"(%arg207, %arg208, %arg209, %arg210, %arg211, %arg212, %arg213, %arg214, %arg215) <{blockScaleFormat = #nvvm.block_scale_format<ue8m0>, kind = #nvvm.block_scale_kind<mxf8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e2m1>, multiplicandBPtxType = #nvvm.mma_type<e5m2>, operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 1, 1>, scaleVecSize = #nvvm.scale_vec_size<x1>, shape = #nvvm.shape<m = 16, n = 8, k = 32>}> : (vector<4xi32>, vector<2xi32>, vector<4xf32>, i32, i16, i16, i32, i16, i16) -> !llvm.struct<(vector<4xf32>)>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xi32>, vector<2xi32>, vector<4xf32>, i32, i16, i16, i32, i16, i16) -> (), sym_name = "nvvm_mxf8f6f4_blockscale_mma_e2m3_e2m1"}> ({
  ^bb0(%arg198: vector<4xi32>, %arg199: vector<2xi32>, %arg200: vector<4xf32>, %arg201: i32, %arg202: i16, %arg203: i16, %arg204: i32, %arg205: i16, %arg206: i16):
    %22 = "nvvm.mma.block_scale"(%arg198, %arg199, %arg200, %arg201, %arg202, %arg203, %arg204, %arg205, %arg206) <{blockScaleFormat = #nvvm.block_scale_format<ue8m0>, kind = #nvvm.block_scale_kind<mxf8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e2m3>, multiplicandBPtxType = #nvvm.mma_type<e2m1>, operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 1, 1>, scaleVecSize = #nvvm.scale_vec_size<x1>, shape = #nvvm.shape<m = 16, n = 8, k = 32>}> : (vector<4xi32>, vector<2xi32>, vector<4xf32>, i32, i16, i16, i32, i16, i16) -> !llvm.struct<(vector<4xf32>)>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xi32>, vector<2xi32>, vector<4xf32>, i32, i16, i16, i32, i16, i16) -> (), sym_name = "nvvm_mxf8f6f4_blockscale_mma_e2m3_e2m3"}> ({
  ^bb0(%arg189: vector<4xi32>, %arg190: vector<2xi32>, %arg191: vector<4xf32>, %arg192: i32, %arg193: i16, %arg194: i16, %arg195: i32, %arg196: i16, %arg197: i16):
    %21 = "nvvm.mma.block_scale"(%arg189, %arg190, %arg191, %arg192, %arg193, %arg194, %arg195, %arg196, %arg197) <{blockScaleFormat = #nvvm.block_scale_format<ue8m0>, kind = #nvvm.block_scale_kind<mxf8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e2m3>, multiplicandBPtxType = #nvvm.mma_type<e2m3>, operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 1, 1>, scaleVecSize = #nvvm.scale_vec_size<x1>, shape = #nvvm.shape<m = 16, n = 8, k = 32>}> : (vector<4xi32>, vector<2xi32>, vector<4xf32>, i32, i16, i16, i32, i16, i16) -> !llvm.struct<(vector<4xf32>)>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xi32>, vector<2xi32>, vector<4xf32>, i32, i16, i16, i32, i16, i16) -> (), sym_name = "nvvm_mxf8f6f4_blockscale_mma_e2m3_e3m2"}> ({
  ^bb0(%arg180: vector<4xi32>, %arg181: vector<2xi32>, %arg182: vector<4xf32>, %arg183: i32, %arg184: i16, %arg185: i16, %arg186: i32, %arg187: i16, %arg188: i16):
    %20 = "nvvm.mma.block_scale"(%arg180, %arg181, %arg182, %arg183, %arg184, %arg185, %arg186, %arg187, %arg188) <{blockScaleFormat = #nvvm.block_scale_format<ue8m0>, kind = #nvvm.block_scale_kind<mxf8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e2m3>, multiplicandBPtxType = #nvvm.mma_type<e3m2>, operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 1, 1>, scaleVecSize = #nvvm.scale_vec_size<x1>, shape = #nvvm.shape<m = 16, n = 8, k = 32>}> : (vector<4xi32>, vector<2xi32>, vector<4xf32>, i32, i16, i16, i32, i16, i16) -> !llvm.struct<(vector<4xf32>)>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xi32>, vector<2xi32>, vector<4xf32>, i32, i16, i16, i32, i16, i16) -> (), sym_name = "nvvm_mxf8f6f4_blockscale_mma_e2m3_e4m3"}> ({
  ^bb0(%arg171: vector<4xi32>, %arg172: vector<2xi32>, %arg173: vector<4xf32>, %arg174: i32, %arg175: i16, %arg176: i16, %arg177: i32, %arg178: i16, %arg179: i16):
    %19 = "nvvm.mma.block_scale"(%arg171, %arg172, %arg173, %arg174, %arg175, %arg176, %arg177, %arg178, %arg179) <{blockScaleFormat = #nvvm.block_scale_format<ue8m0>, kind = #nvvm.block_scale_kind<mxf8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e2m3>, multiplicandBPtxType = #nvvm.mma_type<e4m3>, operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 1, 1>, scaleVecSize = #nvvm.scale_vec_size<x1>, shape = #nvvm.shape<m = 16, n = 8, k = 32>}> : (vector<4xi32>, vector<2xi32>, vector<4xf32>, i32, i16, i16, i32, i16, i16) -> !llvm.struct<(vector<4xf32>)>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xi32>, vector<2xi32>, vector<4xf32>, i32, i16, i16, i32, i16, i16) -> (), sym_name = "nvvm_mxf8f6f4_blockscale_mma_e2m3_e5m2"}> ({
  ^bb0(%arg162: vector<4xi32>, %arg163: vector<2xi32>, %arg164: vector<4xf32>, %arg165: i32, %arg166: i16, %arg167: i16, %arg168: i32, %arg169: i16, %arg170: i16):
    %18 = "nvvm.mma.block_scale"(%arg162, %arg163, %arg164, %arg165, %arg166, %arg167, %arg168, %arg169, %arg170) <{blockScaleFormat = #nvvm.block_scale_format<ue8m0>, kind = #nvvm.block_scale_kind<mxf8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e2m3>, multiplicandBPtxType = #nvvm.mma_type<e5m2>, operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 1, 1>, scaleVecSize = #nvvm.scale_vec_size<x1>, shape = #nvvm.shape<m = 16, n = 8, k = 32>}> : (vector<4xi32>, vector<2xi32>, vector<4xf32>, i32, i16, i16, i32, i16, i16) -> !llvm.struct<(vector<4xf32>)>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xi32>, vector<2xi32>, vector<4xf32>, i32, i16, i16, i32, i16, i16) -> (), sym_name = "nvvm_mxf8f6f4_blockscale_mma_e3m2_e2m1"}> ({
  ^bb0(%arg153: vector<4xi32>, %arg154: vector<2xi32>, %arg155: vector<4xf32>, %arg156: i32, %arg157: i16, %arg158: i16, %arg159: i32, %arg160: i16, %arg161: i16):
    %17 = "nvvm.mma.block_scale"(%arg153, %arg154, %arg155, %arg156, %arg157, %arg158, %arg159, %arg160, %arg161) <{blockScaleFormat = #nvvm.block_scale_format<ue8m0>, kind = #nvvm.block_scale_kind<mxf8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e3m2>, multiplicandBPtxType = #nvvm.mma_type<e2m1>, operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 1, 1>, scaleVecSize = #nvvm.scale_vec_size<x1>, shape = #nvvm.shape<m = 16, n = 8, k = 32>}> : (vector<4xi32>, vector<2xi32>, vector<4xf32>, i32, i16, i16, i32, i16, i16) -> !llvm.struct<(vector<4xf32>)>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xi32>, vector<2xi32>, vector<4xf32>, i32, i16, i16, i32, i16, i16) -> (), sym_name = "nvvm_mxf8f6f4_blockscale_mma_e3m2_e2m3"}> ({
  ^bb0(%arg144: vector<4xi32>, %arg145: vector<2xi32>, %arg146: vector<4xf32>, %arg147: i32, %arg148: i16, %arg149: i16, %arg150: i32, %arg151: i16, %arg152: i16):
    %16 = "nvvm.mma.block_scale"(%arg144, %arg145, %arg146, %arg147, %arg148, %arg149, %arg150, %arg151, %arg152) <{blockScaleFormat = #nvvm.block_scale_format<ue8m0>, kind = #nvvm.block_scale_kind<mxf8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e3m2>, multiplicandBPtxType = #nvvm.mma_type<e2m3>, operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 1, 1>, scaleVecSize = #nvvm.scale_vec_size<x1>, shape = #nvvm.shape<m = 16, n = 8, k = 32>}> : (vector<4xi32>, vector<2xi32>, vector<4xf32>, i32, i16, i16, i32, i16, i16) -> !llvm.struct<(vector<4xf32>)>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xi32>, vector<2xi32>, vector<4xf32>, i32, i16, i16, i32, i16, i16) -> (), sym_name = "nvvm_mxf8f6f4_blockscale_mma_e3m2_e3m2"}> ({
  ^bb0(%arg135: vector<4xi32>, %arg136: vector<2xi32>, %arg137: vector<4xf32>, %arg138: i32, %arg139: i16, %arg140: i16, %arg141: i32, %arg142: i16, %arg143: i16):
    %15 = "nvvm.mma.block_scale"(%arg135, %arg136, %arg137, %arg138, %arg139, %arg140, %arg141, %arg142, %arg143) <{blockScaleFormat = #nvvm.block_scale_format<ue8m0>, kind = #nvvm.block_scale_kind<mxf8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e3m2>, multiplicandBPtxType = #nvvm.mma_type<e3m2>, operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 1, 1>, scaleVecSize = #nvvm.scale_vec_size<x1>, shape = #nvvm.shape<m = 16, n = 8, k = 32>}> : (vector<4xi32>, vector<2xi32>, vector<4xf32>, i32, i16, i16, i32, i16, i16) -> !llvm.struct<(vector<4xf32>)>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xi32>, vector<2xi32>, vector<4xf32>, i32, i16, i16, i32, i16, i16) -> (), sym_name = "nvvm_mxf8f6f4_blockscale_mma_e3m2_e4m3"}> ({
  ^bb0(%arg126: vector<4xi32>, %arg127: vector<2xi32>, %arg128: vector<4xf32>, %arg129: i32, %arg130: i16, %arg131: i16, %arg132: i32, %arg133: i16, %arg134: i16):
    %14 = "nvvm.mma.block_scale"(%arg126, %arg127, %arg128, %arg129, %arg130, %arg131, %arg132, %arg133, %arg134) <{blockScaleFormat = #nvvm.block_scale_format<ue8m0>, kind = #nvvm.block_scale_kind<mxf8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e3m2>, multiplicandBPtxType = #nvvm.mma_type<e4m3>, operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 1, 1>, scaleVecSize = #nvvm.scale_vec_size<x1>, shape = #nvvm.shape<m = 16, n = 8, k = 32>}> : (vector<4xi32>, vector<2xi32>, vector<4xf32>, i32, i16, i16, i32, i16, i16) -> !llvm.struct<(vector<4xf32>)>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xi32>, vector<2xi32>, vector<4xf32>, i32, i16, i16, i32, i16, i16) -> (), sym_name = "nvvm_mxf8f6f4_blockscale_mma_e3m2_e5m2"}> ({
  ^bb0(%arg117: vector<4xi32>, %arg118: vector<2xi32>, %arg119: vector<4xf32>, %arg120: i32, %arg121: i16, %arg122: i16, %arg123: i32, %arg124: i16, %arg125: i16):
    %13 = "nvvm.mma.block_scale"(%arg117, %arg118, %arg119, %arg120, %arg121, %arg122, %arg123, %arg124, %arg125) <{blockScaleFormat = #nvvm.block_scale_format<ue8m0>, kind = #nvvm.block_scale_kind<mxf8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e3m2>, multiplicandBPtxType = #nvvm.mma_type<e5m2>, operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 1, 1>, scaleVecSize = #nvvm.scale_vec_size<x1>, shape = #nvvm.shape<m = 16, n = 8, k = 32>}> : (vector<4xi32>, vector<2xi32>, vector<4xf32>, i32, i16, i16, i32, i16, i16) -> !llvm.struct<(vector<4xf32>)>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xi32>, vector<2xi32>, vector<4xf32>, i32, i16, i16, i32, i16, i16) -> (), sym_name = "nvvm_mxf8f6f4_blockscale_mma_e4m3_e2m1"}> ({
  ^bb0(%arg108: vector<4xi32>, %arg109: vector<2xi32>, %arg110: vector<4xf32>, %arg111: i32, %arg112: i16, %arg113: i16, %arg114: i32, %arg115: i16, %arg116: i16):
    %12 = "nvvm.mma.block_scale"(%arg108, %arg109, %arg110, %arg111, %arg112, %arg113, %arg114, %arg115, %arg116) <{blockScaleFormat = #nvvm.block_scale_format<ue8m0>, kind = #nvvm.block_scale_kind<mxf8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e4m3>, multiplicandBPtxType = #nvvm.mma_type<e2m1>, operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 1, 1>, scaleVecSize = #nvvm.scale_vec_size<x1>, shape = #nvvm.shape<m = 16, n = 8, k = 32>}> : (vector<4xi32>, vector<2xi32>, vector<4xf32>, i32, i16, i16, i32, i16, i16) -> !llvm.struct<(vector<4xf32>)>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xi32>, vector<2xi32>, vector<4xf32>, i32, i16, i16, i32, i16, i16) -> (), sym_name = "nvvm_mxf8f6f4_blockscale_mma_e4m3_e2m3"}> ({
  ^bb0(%arg99: vector<4xi32>, %arg100: vector<2xi32>, %arg101: vector<4xf32>, %arg102: i32, %arg103: i16, %arg104: i16, %arg105: i32, %arg106: i16, %arg107: i16):
    %11 = "nvvm.mma.block_scale"(%arg99, %arg100, %arg101, %arg102, %arg103, %arg104, %arg105, %arg106, %arg107) <{blockScaleFormat = #nvvm.block_scale_format<ue8m0>, kind = #nvvm.block_scale_kind<mxf8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e4m3>, multiplicandBPtxType = #nvvm.mma_type<e2m3>, operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 1, 1>, scaleVecSize = #nvvm.scale_vec_size<x1>, shape = #nvvm.shape<m = 16, n = 8, k = 32>}> : (vector<4xi32>, vector<2xi32>, vector<4xf32>, i32, i16, i16, i32, i16, i16) -> !llvm.struct<(vector<4xf32>)>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xi32>, vector<2xi32>, vector<4xf32>, i32, i16, i16, i32, i16, i16) -> (), sym_name = "nvvm_mxf8f6f4_blockscale_mma_e4m3_e3m2"}> ({
  ^bb0(%arg90: vector<4xi32>, %arg91: vector<2xi32>, %arg92: vector<4xf32>, %arg93: i32, %arg94: i16, %arg95: i16, %arg96: i32, %arg97: i16, %arg98: i16):
    %10 = "nvvm.mma.block_scale"(%arg90, %arg91, %arg92, %arg93, %arg94, %arg95, %arg96, %arg97, %arg98) <{blockScaleFormat = #nvvm.block_scale_format<ue8m0>, kind = #nvvm.block_scale_kind<mxf8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e4m3>, multiplicandBPtxType = #nvvm.mma_type<e3m2>, operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 1, 1>, scaleVecSize = #nvvm.scale_vec_size<x1>, shape = #nvvm.shape<m = 16, n = 8, k = 32>}> : (vector<4xi32>, vector<2xi32>, vector<4xf32>, i32, i16, i16, i32, i16, i16) -> !llvm.struct<(vector<4xf32>)>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xi32>, vector<2xi32>, vector<4xf32>, i32, i16, i16, i32, i16, i16) -> (), sym_name = "nvvm_mxf8f6f4_blockscale_mma_e4m3_e4m3"}> ({
  ^bb0(%arg81: vector<4xi32>, %arg82: vector<2xi32>, %arg83: vector<4xf32>, %arg84: i32, %arg85: i16, %arg86: i16, %arg87: i32, %arg88: i16, %arg89: i16):
    %9 = "nvvm.mma.block_scale"(%arg81, %arg82, %arg83, %arg84, %arg85, %arg86, %arg87, %arg88, %arg89) <{blockScaleFormat = #nvvm.block_scale_format<ue8m0>, kind = #nvvm.block_scale_kind<mxf8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e4m3>, multiplicandBPtxType = #nvvm.mma_type<e4m3>, operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 1, 1>, scaleVecSize = #nvvm.scale_vec_size<x1>, shape = #nvvm.shape<m = 16, n = 8, k = 32>}> : (vector<4xi32>, vector<2xi32>, vector<4xf32>, i32, i16, i16, i32, i16, i16) -> !llvm.struct<(vector<4xf32>)>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xi32>, vector<2xi32>, vector<4xf32>, i32, i16, i16, i32, i16, i16) -> (), sym_name = "nvvm_mxf8f6f4_blockscale_mma_e4m3_e5m2"}> ({
  ^bb0(%arg72: vector<4xi32>, %arg73: vector<2xi32>, %arg74: vector<4xf32>, %arg75: i32, %arg76: i16, %arg77: i16, %arg78: i32, %arg79: i16, %arg80: i16):
    %8 = "nvvm.mma.block_scale"(%arg72, %arg73, %arg74, %arg75, %arg76, %arg77, %arg78, %arg79, %arg80) <{blockScaleFormat = #nvvm.block_scale_format<ue8m0>, kind = #nvvm.block_scale_kind<mxf8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e4m3>, multiplicandBPtxType = #nvvm.mma_type<e5m2>, operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 1, 1>, scaleVecSize = #nvvm.scale_vec_size<x1>, shape = #nvvm.shape<m = 16, n = 8, k = 32>}> : (vector<4xi32>, vector<2xi32>, vector<4xf32>, i32, i16, i16, i32, i16, i16) -> !llvm.struct<(vector<4xf32>)>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xi32>, vector<2xi32>, vector<4xf32>, i32, i16, i16, i32, i16, i16) -> (), sym_name = "nvvm_mxf8f6f4_blockscale_mma_e5m2_e2m1"}> ({
  ^bb0(%arg63: vector<4xi32>, %arg64: vector<2xi32>, %arg65: vector<4xf32>, %arg66: i32, %arg67: i16, %arg68: i16, %arg69: i32, %arg70: i16, %arg71: i16):
    %7 = "nvvm.mma.block_scale"(%arg63, %arg64, %arg65, %arg66, %arg67, %arg68, %arg69, %arg70, %arg71) <{blockScaleFormat = #nvvm.block_scale_format<ue8m0>, kind = #nvvm.block_scale_kind<mxf8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e5m2>, multiplicandBPtxType = #nvvm.mma_type<e2m1>, operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 1, 1>, scaleVecSize = #nvvm.scale_vec_size<x1>, shape = #nvvm.shape<m = 16, n = 8, k = 32>}> : (vector<4xi32>, vector<2xi32>, vector<4xf32>, i32, i16, i16, i32, i16, i16) -> !llvm.struct<(vector<4xf32>)>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xi32>, vector<2xi32>, vector<4xf32>, i32, i16, i16, i32, i16, i16) -> (), sym_name = "nvvm_mxf8f6f4_blockscale_mma_e5m2_e2m3"}> ({
  ^bb0(%arg54: vector<4xi32>, %arg55: vector<2xi32>, %arg56: vector<4xf32>, %arg57: i32, %arg58: i16, %arg59: i16, %arg60: i32, %arg61: i16, %arg62: i16):
    %6 = "nvvm.mma.block_scale"(%arg54, %arg55, %arg56, %arg57, %arg58, %arg59, %arg60, %arg61, %arg62) <{blockScaleFormat = #nvvm.block_scale_format<ue8m0>, kind = #nvvm.block_scale_kind<mxf8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e5m2>, multiplicandBPtxType = #nvvm.mma_type<e2m3>, operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 1, 1>, scaleVecSize = #nvvm.scale_vec_size<x1>, shape = #nvvm.shape<m = 16, n = 8, k = 32>}> : (vector<4xi32>, vector<2xi32>, vector<4xf32>, i32, i16, i16, i32, i16, i16) -> !llvm.struct<(vector<4xf32>)>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xi32>, vector<2xi32>, vector<4xf32>, i32, i16, i16, i32, i16, i16) -> (), sym_name = "nvvm_mxf8f6f4_blockscale_mma_e5m2_e3m2"}> ({
  ^bb0(%arg45: vector<4xi32>, %arg46: vector<2xi32>, %arg47: vector<4xf32>, %arg48: i32, %arg49: i16, %arg50: i16, %arg51: i32, %arg52: i16, %arg53: i16):
    %5 = "nvvm.mma.block_scale"(%arg45, %arg46, %arg47, %arg48, %arg49, %arg50, %arg51, %arg52, %arg53) <{blockScaleFormat = #nvvm.block_scale_format<ue8m0>, kind = #nvvm.block_scale_kind<mxf8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e5m2>, multiplicandBPtxType = #nvvm.mma_type<e3m2>, operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 1, 1>, scaleVecSize = #nvvm.scale_vec_size<x1>, shape = #nvvm.shape<m = 16, n = 8, k = 32>}> : (vector<4xi32>, vector<2xi32>, vector<4xf32>, i32, i16, i16, i32, i16, i16) -> !llvm.struct<(vector<4xf32>)>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xi32>, vector<2xi32>, vector<4xf32>, i32, i16, i16, i32, i16, i16) -> (), sym_name = "nvvm_mxf8f6f4_blockscale_mma_e5m2_e4m3"}> ({
  ^bb0(%arg36: vector<4xi32>, %arg37: vector<2xi32>, %arg38: vector<4xf32>, %arg39: i32, %arg40: i16, %arg41: i16, %arg42: i32, %arg43: i16, %arg44: i16):
    %4 = "nvvm.mma.block_scale"(%arg36, %arg37, %arg38, %arg39, %arg40, %arg41, %arg42, %arg43, %arg44) <{blockScaleFormat = #nvvm.block_scale_format<ue8m0>, kind = #nvvm.block_scale_kind<mxf8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e5m2>, multiplicandBPtxType = #nvvm.mma_type<e4m3>, operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 1, 1>, scaleVecSize = #nvvm.scale_vec_size<x1>, shape = #nvvm.shape<m = 16, n = 8, k = 32>}> : (vector<4xi32>, vector<2xi32>, vector<4xf32>, i32, i16, i16, i32, i16, i16) -> !llvm.struct<(vector<4xf32>)>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xi32>, vector<2xi32>, vector<4xf32>, i32, i16, i16, i32, i16, i16) -> (), sym_name = "nvvm_mxf8f6f4_blockscale_mma_e5m2_e5m2"}> ({
  ^bb0(%arg27: vector<4xi32>, %arg28: vector<2xi32>, %arg29: vector<4xf32>, %arg30: i32, %arg31: i16, %arg32: i16, %arg33: i32, %arg34: i16, %arg35: i16):
    %3 = "nvvm.mma.block_scale"(%arg27, %arg28, %arg29, %arg30, %arg31, %arg32, %arg33, %arg34, %arg35) <{blockScaleFormat = #nvvm.block_scale_format<ue8m0>, kind = #nvvm.block_scale_kind<mxf8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e5m2>, multiplicandBPtxType = #nvvm.mma_type<e5m2>, operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 1, 1>, scaleVecSize = #nvvm.scale_vec_size<x1>, shape = #nvvm.shape<m = 16, n = 8, k = 32>}> : (vector<4xi32>, vector<2xi32>, vector<4xf32>, i32, i16, i16, i32, i16, i16) -> !llvm.struct<(vector<4xf32>)>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xi32>, vector<2xi32>, vector<4xf32>, i32, i16, i16, i32, i16, i16) -> (), sym_name = "nvvm_mxf4_blockscale_mma"}> ({
  ^bb0(%arg18: vector<4xi32>, %arg19: vector<2xi32>, %arg20: vector<4xf32>, %arg21: i32, %arg22: i16, %arg23: i16, %arg24: i32, %arg25: i16, %arg26: i16):
    %2 = "nvvm.mma.block_scale"(%arg18, %arg19, %arg20, %arg21, %arg22, %arg23, %arg24, %arg25, %arg26) <{blockScaleFormat = #nvvm.block_scale_format<ue8m0>, kind = #nvvm.block_scale_kind<mxf4>, multiplicandAPtxType = #nvvm.mma_type<e2m1>, multiplicandBPtxType = #nvvm.mma_type<e2m1>, operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 1, 1>, scaleVecSize = #nvvm.scale_vec_size<x2>, shape = #nvvm.shape<m = 16, n = 8, k = 64>}> : (vector<4xi32>, vector<2xi32>, vector<4xf32>, i32, i16, i16, i32, i16, i16) -> !llvm.struct<(vector<4xf32>)>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xi32>, vector<2xi32>, vector<4xf32>, i32, i16, i16, i32, i16, i16) -> (), sym_name = "nvvm_mxf4nvf4_blockscale_mma_ue8m0"}> ({
  ^bb0(%arg9: vector<4xi32>, %arg10: vector<2xi32>, %arg11: vector<4xf32>, %arg12: i32, %arg13: i16, %arg14: i16, %arg15: i32, %arg16: i16, %arg17: i16):
    %1 = "nvvm.mma.block_scale"(%arg9, %arg10, %arg11, %arg12, %arg13, %arg14, %arg15, %arg16, %arg17) <{blockScaleFormat = #nvvm.block_scale_format<ue8m0>, kind = #nvvm.block_scale_kind<mxf4nvf4>, multiplicandAPtxType = #nvvm.mma_type<e2m1>, multiplicandBPtxType = #nvvm.mma_type<e2m1>, operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 1, 1>, scaleVecSize = #nvvm.scale_vec_size<x2>, shape = #nvvm.shape<m = 16, n = 8, k = 64>}> : (vector<4xi32>, vector<2xi32>, vector<4xf32>, i32, i16, i16, i32, i16, i16) -> !llvm.struct<(vector<4xf32>)>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xi32>, vector<2xi32>, vector<4xf32>, i32, i16, i16, i32, i16, i16) -> (), sym_name = "nvvm_mxf4nvf4_blockscale_mma_ue4m3"}> ({
  ^bb0(%arg0: vector<4xi32>, %arg1: vector<2xi32>, %arg2: vector<4xf32>, %arg3: i32, %arg4: i16, %arg5: i16, %arg6: i32, %arg7: i16, %arg8: i16):
    %0 = "nvvm.mma.block_scale"(%arg0, %arg1, %arg2, %arg3, %arg4, %arg5, %arg6, %arg7, %arg8) <{blockScaleFormat = #nvvm.block_scale_format<ue4m3>, kind = #nvvm.block_scale_kind<mxf4nvf4>, multiplicandAPtxType = #nvvm.mma_type<e2m1>, multiplicandBPtxType = #nvvm.mma_type<e2m1>, operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 1, 1>, scaleVecSize = #nvvm.scale_vec_size<x4>, shape = #nvvm.shape<m = 16, n = 8, k = 64>}> : (vector<4xi32>, vector<2xi32>, vector<4xf32>, i32, i16, i16, i32, i16, i16) -> !llvm.struct<(vector<4xf32>)>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

