"builtin.module"() ({
  "llvm.module_flags"() <{flags = [#rocdl.buffer_oob_mode_flag<any>, #rocdl.tbuffer_oob_mode_flag<strict>]}> : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.module_flags"() <{flags = [#llvm.mlir.module_flag<max, "amdgpu.buffer.oob.mode", #rocdl.buffer_oob_mode<relaxed>>]}> : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> i32, sym_name = "rocdl_special_regs"}> ({
    %173 = "rocdl.workitem.id.x"() : () -> i32
    %174 = "rocdl.workitem.id.y"() : () -> i32
    %175 = "rocdl.workitem.id.z"() : () -> i32
    %176 = "rocdl.workgroup.id.x"() : () -> i32
    %177 = "rocdl.workgroup.id.y"() : () -> i32
    %178 = "rocdl.workgroup.id.z"() : () -> i32
    %179 = "rocdl.cluster.id.x"() : () -> i32
    %180 = "rocdl.cluster.id.y"() : () -> i32
    %181 = "rocdl.cluster.id.z"() : () -> i32
    %182 = "rocdl.cluster.workgroup.id.x"() : () -> i32
    %183 = "rocdl.cluster.workgroup.id.y"() : () -> i32
    %184 = "rocdl.cluster.workgroup.id.z"() : () -> i32
    %185 = "rocdl.wave.id"() : () -> i32
    "llvm.return"(%173) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, f32, f32) -> f32, sym_name = "rocdl.fmed3.scalar"}> ({
  ^bb0(%arg117: f32, %arg118: f32, %arg119: f32):
    %172 = "rocdl.fmed3"(%arg117, %arg118, %arg119) : (f32, f32, f32) -> f32
    "llvm.return"(%172) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xf16>, vector<4xf16>, vector<4xf16>) -> vector<4xf16>, sym_name = "rocdl.fmed3.vector"}> ({
  ^bb0(%arg114: vector<4xf16>, %arg115: vector<4xf16>, %arg116: vector<4xf16>):
    %171 = "rocdl.fmed3"(%arg114, %arg115, %arg116) : (vector<4xf16>, vector<4xf16>, vector<4xf16>) -> vector<4xf16>
    "llvm.return"(%171) : (vector<4xf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, f16, bf16) -> (), sym_name = "rocdl.math.ops"}> ({
  ^bb0(%arg111: f32, %arg112: f16, %arg113: bf16):
    %147 = "rocdl.tanh"(%arg111) : (f32) -> f32
    %148 = "rocdl.tanh"(%arg112) : (f16) -> f16
    %149 = "rocdl.tanh"(%arg113) : (bf16) -> bf16
    %150 = "rocdl.sin"(%arg111) : (f32) -> f32
    %151 = "rocdl.sin"(%arg112) : (f16) -> f16
    %152 = "rocdl.sin"(%arg113) : (bf16) -> bf16
    %153 = "rocdl.cos"(%arg111) : (f32) -> f32
    %154 = "rocdl.cos"(%arg112) : (f16) -> f16
    %155 = "rocdl.cos"(%arg113) : (bf16) -> bf16
    %156 = "rocdl.rcp"(%arg111) : (f32) -> f32
    %157 = "rocdl.rcp"(%arg112) : (f16) -> f16
    %158 = "rocdl.rcp"(%arg113) : (bf16) -> bf16
    %159 = "rocdl.exp2"(%arg111) : (f32) -> f32
    %160 = "rocdl.exp2"(%arg112) : (f16) -> f16
    %161 = "rocdl.exp2"(%arg113) : (bf16) -> bf16
    %162 = "rocdl.log"(%arg111) : (f32) -> f32
    %163 = "rocdl.log"(%arg112) : (f16) -> f16
    %164 = "rocdl.log"(%arg113) : (bf16) -> bf16
    %165 = "rocdl.sqrt"(%arg111) : (f32) -> f32
    %166 = "rocdl.sqrt"(%arg112) : (f16) -> f16
    %167 = "rocdl.sqrt"(%arg113) : (bf16) -> bf16
    %168 = "rocdl.rsq"(%arg111) : (f32) -> f32
    %169 = "rocdl.rsq"(%arg112) : (f16) -> f16
    %170 = "rocdl.rsq"(%arg113) : (bf16) -> bf16
    "llvm.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "rocdl.barrier"}> ({
    "rocdl.barrier"() : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "rocdl.wave_barrier"}> ({
    "rocdl.wave.barrier"() : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "rocdl.sched_barrier"}> ({
    "rocdl.sched.barrier"() <{mask = #rocdl<sched_group_mask none>}> : () -> ()
    "rocdl.sched.barrier"() <{mask = #rocdl<sched_group_mask valu|all_vmem>}> : () -> ()
    "rocdl.sched.barrier"() <{mask = #rocdl<sched_group_mask ldsdma>}> : () -> ()
    "rocdl.sched.barrier"() <{mask = #rocdl<sched_group_mask all>}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "rocdl_sched_group_barrier"}> ({
    "rocdl.sched.group.barrier"() <{groupId = 0 : i32, mask = #rocdl<sched_group_mask mfma_wmma>, size = 1 : i32}> : () -> ()
    "rocdl.sched.group.barrier"() <{groupId = 3 : i32, mask = #rocdl<sched_group_mask ldsdma>, size = 2 : i32}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "rocdl_iglp_opt"}> ({
    "rocdl.iglp.opt"() <{variant = 0 : i32}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "rocdl.setprio"}> ({
    "rocdl.s.setprio"() <{priority = 0 : i16}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, f32, vector<32xf32>, i32, vector<16xf32>, vector<4xf32>, vector<4xf16>, vector<32xi32>, vector<16xi32>, vector<4xi32>, vector<2xi16>, vector<4xi16>, vector<4xf64>, f64, i64, vector<2xf32>, vector<8xbf16>, vector<8xf16>) -> (), sym_name = "rocdl.xdlops"}> ({
  ^bb0(%arg93: f32, %arg94: f32, %arg95: vector<32xf32>, %arg96: i32, %arg97: vector<16xf32>, %arg98: vector<4xf32>, %arg99: vector<4xf16>, %arg100: vector<32xi32>, %arg101: vector<16xi32>, %arg102: vector<4xi32>, %arg103: vector<2xi16>, %arg104: vector<4xi16>, %arg105: vector<4xf64>, %arg106: f64, %arg107: i64, %arg108: vector<2xf32>, %arg109: vector<8xbf16>, %arg110: vector<8xf16>):
    %110 = "rocdl.mfma.f32.32x32x1f32"(%arg93, %arg94, %arg95) <{abid = 0 : i32, blgp = #rocdl<mfma_perm_b bcast_first_32>, cbsz = 0 : i32}> : (f32, f32, vector<32xf32>) -> vector<32xf32>
    %111 = "rocdl.mfma.f32.16x16x1f32"(%arg93, %arg94, %arg97) <{abid = 0 : i32, blgp = #rocdl<mfma_perm_b none>, cbsz = 0 : i32}> : (f32, f32, vector<16xf32>) -> vector<16xf32>
    %112 = "rocdl.mfma.f32.4x4x1f32"(%arg93, %arg94, %arg98) <{abid = 0 : i32, blgp = #rocdl<mfma_perm_b none>, cbsz = 0 : i32}> : (f32, f32, vector<4xf32>) -> vector<4xf32>
    %113 = "rocdl.mfma.f32.32x32x2f32"(%arg93, %arg94, %arg97) <{abid = 0 : i32, blgp = #rocdl<mfma_perm_b none>, cbsz = 0 : i32}> : (f32, f32, vector<16xf32>) -> vector<16xf32>
    %114 = "rocdl.mfma.f32.16x16x4f32"(%arg93, %arg94, %arg98) <{abid = 0 : i32, blgp = #rocdl<mfma_perm_b none>, cbsz = 0 : i32}> : (f32, f32, vector<4xf32>) -> vector<4xf32>
    %115 = "rocdl.mfma.f32.32x32x4f16"(%arg99, %arg99, %arg95) <{abid = 0 : i32, blgp = #rocdl<mfma_perm_b none>, cbsz = 0 : i32}> : (vector<4xf16>, vector<4xf16>, vector<32xf32>) -> vector<32xf32>
    %116 = "rocdl.mfma.f32.16x16x4f16"(%arg99, %arg99, %arg97) <{abid = 0 : i32, blgp = #rocdl<mfma_perm_b none>, cbsz = 0 : i32}> : (vector<4xf16>, vector<4xf16>, vector<16xf32>) -> vector<16xf32>
    %117 = "rocdl.mfma.f32.4x4x4f16"(%arg99, %arg99, %arg98) <{abid = 0 : i32, blgp = #rocdl<mfma_perm_b none>, cbsz = 0 : i32}> : (vector<4xf16>, vector<4xf16>, vector<4xf32>) -> vector<4xf32>
    %118 = "rocdl.mfma.f32.32x32x8f16"(%arg99, %arg99, %arg97) <{abid = 0 : i32, blgp = #rocdl<mfma_perm_b none>, cbsz = 0 : i32}> : (vector<4xf16>, vector<4xf16>, vector<16xf32>) -> vector<16xf32>
    %119 = "rocdl.mfma.f32.16x16x16f16"(%arg99, %arg99, %arg98) <{abid = 0 : i32, blgp = #rocdl<mfma_perm_b none>, cbsz = 0 : i32}> : (vector<4xf16>, vector<4xf16>, vector<4xf32>) -> vector<4xf32>
    %120 = "rocdl.mfma.i32.32x32x4i8"(%arg96, %arg96, %arg100) <{abid = 0 : i32, blgp = #rocdl<mfma_perm_b none>, cbsz = 0 : i32}> : (i32, i32, vector<32xi32>) -> vector<32xi32>
    %121 = "rocdl.mfma.i32.16x16x4i8"(%arg96, %arg96, %arg101) <{abid = 0 : i32, blgp = #rocdl<mfma_perm_b none>, cbsz = 0 : i32}> : (i32, i32, vector<16xi32>) -> vector<16xi32>
    %122 = "rocdl.mfma.i32.4x4x4i8"(%arg96, %arg96, %arg102) <{abid = 0 : i32, blgp = #rocdl<mfma_perm_b none>, cbsz = 0 : i32}> : (i32, i32, vector<4xi32>) -> vector<4xi32>
    %123 = "rocdl.mfma.i32.32x32x8i8"(%arg96, %arg96, %arg101) <{abid = 0 : i32, blgp = #rocdl<mfma_perm_b none>, cbsz = 0 : i32}> : (i32, i32, vector<16xi32>) -> vector<16xi32>
    %124 = "rocdl.mfma.i32.16x16x16i8"(%arg96, %arg96, %arg102) <{abid = 0 : i32, blgp = #rocdl<mfma_perm_b none>, cbsz = 0 : i32}> : (i32, i32, vector<4xi32>) -> vector<4xi32>
    %125 = "rocdl.mfma.f32.32x32x2bf16"(%arg103, %arg103, %arg95) <{abid = 0 : i32, blgp = #rocdl<mfma_perm_b none>, cbsz = 0 : i32}> : (vector<2xi16>, vector<2xi16>, vector<32xf32>) -> vector<32xf32>
    %126 = "rocdl.mfma.f32.16x16x2bf16"(%arg103, %arg103, %arg97) <{abid = 0 : i32, blgp = #rocdl<mfma_perm_b none>, cbsz = 0 : i32}> : (vector<2xi16>, vector<2xi16>, vector<16xf32>) -> vector<16xf32>
    %127 = "rocdl.mfma.f32.4x4x2bf16"(%arg103, %arg103, %arg98) <{abid = 0 : i32, blgp = #rocdl<mfma_perm_b none>, cbsz = 0 : i32}> : (vector<2xi16>, vector<2xi16>, vector<4xf32>) -> vector<4xf32>
    %128 = "rocdl.mfma.f32.32x32x4bf16"(%arg103, %arg103, %arg97) <{abid = 0 : i32, blgp = #rocdl<mfma_perm_b none>, cbsz = 0 : i32}> : (vector<2xi16>, vector<2xi16>, vector<16xf32>) -> vector<16xf32>
    %129 = "rocdl.mfma.f32.16x16x8bf16"(%arg103, %arg103, %arg98) <{abid = 0 : i32, blgp = #rocdl<mfma_perm_b none>, cbsz = 0 : i32}> : (vector<2xi16>, vector<2xi16>, vector<4xf32>) -> vector<4xf32>
    %130 = "rocdl.mfma.f32.32x32x4bf16.1k"(%arg104, %arg104, %arg95) <{abid = 0 : i32, blgp = #rocdl<mfma_perm_b none>, cbsz = 0 : i32}> : (vector<4xi16>, vector<4xi16>, vector<32xf32>) -> vector<32xf32>
    %131 = "rocdl.mfma.f32.16x16x4bf16.1k"(%arg104, %arg104, %arg97) <{abid = 0 : i32, blgp = #rocdl<mfma_perm_b none>, cbsz = 0 : i32}> : (vector<4xi16>, vector<4xi16>, vector<16xf32>) -> vector<16xf32>
    %132 = "rocdl.mfma.f32.4x4x4bf16.1k"(%arg104, %arg104, %arg98) <{abid = 0 : i32, blgp = #rocdl<mfma_perm_b none>, cbsz = 0 : i32}> : (vector<4xi16>, vector<4xi16>, vector<4xf32>) -> vector<4xf32>
    %133 = "rocdl.mfma.f32.32x32x8bf16.1k"(%arg104, %arg104, %arg97) <{abid = 0 : i32, blgp = #rocdl<mfma_perm_b none>, cbsz = 0 : i32}> : (vector<4xi16>, vector<4xi16>, vector<16xf32>) -> vector<16xf32>
    %134 = "rocdl.mfma.f32.16x16x16bf16.1k"(%arg104, %arg104, %arg98) <{abid = 0 : i32, blgp = #rocdl<mfma_perm_b none>, cbsz = 0 : i32}> : (vector<4xi16>, vector<4xi16>, vector<4xf32>) -> vector<4xf32>
    %135 = "rocdl.mfma.f64.16x16x4f64"(%arg106, %arg106, %arg105) <{abid = 0 : i32, blgp = #rocdl<mfma_neg_modifier neg_a|neg_b>, cbsz = 0 : i32}> : (f64, f64, vector<4xf64>) -> vector<4xf64>
    %136 = "rocdl.mfma.f64.4x4x4f64"(%arg106, %arg106, %arg106) <{abid = 0 : i32, blgp = #rocdl<mfma_neg_modifier none>, cbsz = 0 : i32}> : (f64, f64, f64) -> f64
    %137 = "rocdl.mfma.i32.16x16x32.i8"(%arg107, %arg107, %arg102) <{abid = 0 : i32, blgp = #rocdl<mfma_perm_b none>, cbsz = 0 : i32}> : (i64, i64, vector<4xi32>) -> vector<4xi32>
    %138 = "rocdl.mfma.i32.32x32x16.i8"(%arg107, %arg107, %arg101) <{abid = 0 : i32, blgp = #rocdl<mfma_perm_b none>, cbsz = 0 : i32}> : (i64, i64, vector<16xi32>) -> vector<16xi32>
    %139 = "rocdl.mfma.f32.16x16x8.xf32"(%arg108, %arg108, %arg98) <{abid = 0 : i32, blgp = #rocdl<mfma_perm_b none>, cbsz = 0 : i32}> : (vector<2xf32>, vector<2xf32>, vector<4xf32>) -> vector<4xf32>
    %140 = "rocdl.mfma.f32.32x32x4.xf32"(%arg108, %arg108, %arg97) <{abid = 0 : i32, blgp = #rocdl<mfma_perm_b none>, cbsz = 0 : i32}> : (vector<2xf32>, vector<2xf32>, vector<16xf32>) -> vector<16xf32>
    %141 = "rocdl.mfma.f32.16x16x32.bf16"(%arg109, %arg109, %arg98) <{abid = 0 : i32, blgp = #rocdl<mfma_perm_b none>, cbsz = 0 : i32}> : (vector<8xbf16>, vector<8xbf16>, vector<4xf32>) -> vector<4xf32>
    %142 = "rocdl.mfma.i32.16x16x64.i8"(%arg102, %arg102, %arg102) <{abid = 0 : i32, blgp = #rocdl<mfma_perm_b none>, cbsz = 0 : i32}> : (vector<4xi32>, vector<4xi32>, vector<4xi32>) -> vector<4xi32>
    %143 = "rocdl.mfma.f32.16x16x32.f16"(%arg110, %arg110, %arg98) <{abid = 0 : i32, blgp = #rocdl<mfma_perm_b none>, cbsz = 0 : i32}> : (vector<8xf16>, vector<8xf16>, vector<4xf32>) -> vector<4xf32>
    %144 = "rocdl.mfma.f32.32x32x16.bf16"(%arg109, %arg109, %arg97) <{abid = 0 : i32, blgp = #rocdl<mfma_perm_b none>, cbsz = 0 : i32}> : (vector<8xbf16>, vector<8xbf16>, vector<16xf32>) -> vector<16xf32>
    %145 = "rocdl.mfma.i32.32x32x32.i8"(%arg102, %arg102, %arg101) <{abid = 0 : i32, blgp = #rocdl<mfma_perm_b none>, cbsz = 0 : i32}> : (vector<4xi32>, vector<4xi32>, vector<16xi32>) -> vector<16xi32>
    %146 = "rocdl.mfma.f32.32x32x16.f16"(%arg110, %arg110, %arg97) <{abid = 0 : i32, blgp = #rocdl<mfma_perm_b none>, cbsz = 0 : i32}> : (vector<8xf16>, vector<8xf16>, vector<16xf32>) -> vector<16xf32>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<4xf32> (i32, vector<4xf16>, vector<8xf16>, vector<4xf32>, vector<16xf32>, vector<4xi16>, vector<8xi16>, vector<2xi32>, vector<4xi32>, vector<16xi32>, vector<16xf16>, vector<8xbf16>, vector<16xbf16>, vector<8xi32>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.smfmac", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg79: i32, %arg80: vector<4xf16>, %arg81: vector<8xf16>, %arg82: vector<4xf32>, %arg83: vector<16xf32>, %arg84: vector<4xi16>, %arg85: vector<8xi16>, %arg86: vector<2xi32>, %arg87: vector<4xi32>, %arg88: vector<16xi32>, %arg89: vector<16xf16>, %arg90: vector<8xbf16>, %arg91: vector<16xbf16>, %arg92: vector<8xi32>):
    %81 = "llvm.mlir.constant"() <{value = 42 : i32}> : () -> i32
    %82 = "rocdl.smfmac.f32.16x16x32.f16"(%arg80, %arg81, %arg82, %81) <{abid = 0 : i32, cbsz = 0 : i32}> : (vector<4xf16>, vector<8xf16>, vector<4xf32>, i32) -> vector<4xf32>
    %83 = "rocdl.smfmac.f32.32x32x16.f16"(%arg80, %arg81, %arg83, %81) <{abid = 0 : i32, cbsz = 0 : i32}> : (vector<4xf16>, vector<8xf16>, vector<16xf32>, i32) -> vector<16xf32>
    %84 = "rocdl.smfmac.f32.16x16x32.bf16"(%arg84, %arg85, %arg82, %81) <{abid = 0 : i32, cbsz = 0 : i32}> : (vector<4xi16>, vector<8xi16>, vector<4xf32>, i32) -> vector<4xf32>
    %85 = "rocdl.smfmac.f32.32x32x16.bf16"(%arg84, %arg85, %arg83, %81) <{abid = 0 : i32, cbsz = 0 : i32}> : (vector<4xi16>, vector<8xi16>, vector<16xf32>, i32) -> vector<16xf32>
    %86 = "rocdl.smfmac.i32.16x16x64.i8"(%arg86, %arg87, %arg87, %81) <{abid = 0 : i32, cbsz = 0 : i32}> : (vector<2xi32>, vector<4xi32>, vector<4xi32>, i32) -> vector<4xi32>
    %87 = "rocdl.smfmac.i32.32x32x32.i8"(%arg86, %arg87, %arg88, %81) <{abid = 0 : i32, cbsz = 0 : i32}> : (vector<2xi32>, vector<4xi32>, vector<16xi32>, i32) -> vector<16xi32>
    %88 = "rocdl.smfmac.f32.16x16x64.bf8.bf8"(%arg86, %arg87, %arg82, %81) <{abid = 0 : i32, cbsz = 0 : i32}> : (vector<2xi32>, vector<4xi32>, vector<4xf32>, i32) -> vector<4xf32>
    %89 = "rocdl.smfmac.f32.16x16x64.bf8.fp8"(%arg86, %arg87, %arg82, %81) <{abid = 0 : i32, cbsz = 0 : i32}> : (vector<2xi32>, vector<4xi32>, vector<4xf32>, i32) -> vector<4xf32>
    %90 = "rocdl.smfmac.f32.16x16x64.fp8.bf8"(%arg86, %arg87, %arg82, %81) <{abid = 0 : i32, cbsz = 0 : i32}> : (vector<2xi32>, vector<4xi32>, vector<4xf32>, i32) -> vector<4xf32>
    %91 = "rocdl.smfmac.f32.16x16x64.fp8.fp8"(%arg86, %arg87, %arg82, %81) <{abid = 0 : i32, cbsz = 0 : i32}> : (vector<2xi32>, vector<4xi32>, vector<4xf32>, i32) -> vector<4xf32>
    %92 = "rocdl.smfmac.f32.32x32x32.bf8.bf8"(%arg86, %arg87, %arg83, %81) <{abid = 0 : i32, cbsz = 0 : i32}> : (vector<2xi32>, vector<4xi32>, vector<16xf32>, i32) -> vector<16xf32>
    %93 = "rocdl.smfmac.f32.32x32x32.bf8.fp8"(%arg86, %arg87, %arg83, %81) <{abid = 0 : i32, cbsz = 0 : i32}> : (vector<2xi32>, vector<4xi32>, vector<16xf32>, i32) -> vector<16xf32>
    %94 = "rocdl.smfmac.f32.32x32x32.fp8.bf8"(%arg86, %arg87, %arg83, %81) <{abid = 0 : i32, cbsz = 0 : i32}> : (vector<2xi32>, vector<4xi32>, vector<16xf32>, i32) -> vector<16xf32>
    %95 = "rocdl.smfmac.f32.32x32x32.fp8.fp8"(%arg86, %arg87, %arg83, %81) <{abid = 0 : i32, cbsz = 0 : i32}> : (vector<2xi32>, vector<4xi32>, vector<16xf32>, i32) -> vector<16xf32>
    %96 = "rocdl.smfmac.f32.16x16x64.f16"(%arg81, %arg89, %arg82, %81) <{abid = 0 : i32, cbsz = 0 : i32}> : (vector<8xf16>, vector<16xf16>, vector<4xf32>, i32) -> vector<4xf32>
    %97 = "rocdl.smfmac.f32.32x32x32.f16"(%arg81, %arg89, %arg83, %81) <{abid = 0 : i32, cbsz = 0 : i32}> : (vector<8xf16>, vector<16xf16>, vector<16xf32>, i32) -> vector<16xf32>
    %98 = "rocdl.smfmac.f32.16x16x64.bf16"(%arg90, %arg91, %arg82, %81) <{abid = 0 : i32, cbsz = 0 : i32}> : (vector<8xbf16>, vector<16xbf16>, vector<4xf32>, i32) -> vector<4xf32>
    %99 = "rocdl.smfmac.f32.32x32x32.bf16"(%arg90, %arg91, %arg83, %81) <{abid = 0 : i32, cbsz = 0 : i32}> : (vector<8xbf16>, vector<16xbf16>, vector<16xf32>, i32) -> vector<16xf32>
    %100 = "rocdl.smfmac.i32.16x16x128.i8"(%arg87, %arg92, %arg87, %81) <{abid = 0 : i32, cbsz = 0 : i32}> : (vector<4xi32>, vector<8xi32>, vector<4xi32>, i32) -> vector<4xi32>
    %101 = "rocdl.smfmac.f32.16x16x128.bf8.bf8"(%arg87, %arg92, %arg82, %81) <{abid = 0 : i32, cbsz = 0 : i32}> : (vector<4xi32>, vector<8xi32>, vector<4xf32>, i32) -> vector<4xf32>
    %102 = "rocdl.smfmac.f32.16x16x128.bf8.fp8"(%arg87, %arg92, %arg82, %81) <{abid = 0 : i32, cbsz = 0 : i32}> : (vector<4xi32>, vector<8xi32>, vector<4xf32>, i32) -> vector<4xf32>
    %103 = "rocdl.smfmac.f32.16x16x128.fp8.bf8"(%arg87, %arg92, %arg82, %81) <{abid = 0 : i32, cbsz = 0 : i32}> : (vector<4xi32>, vector<8xi32>, vector<4xf32>, i32) -> vector<4xf32>
    %104 = "rocdl.smfmac.f32.16x16x128.fp8.fp8"(%arg87, %arg92, %arg82, %81) <{abid = 0 : i32, cbsz = 0 : i32}> : (vector<4xi32>, vector<8xi32>, vector<4xf32>, i32) -> vector<4xf32>
    %105 = "rocdl.smfmac.i32.32x32x64.i8"(%arg87, %arg92, %arg88, %81) <{abid = 0 : i32, cbsz = 0 : i32}> : (vector<4xi32>, vector<8xi32>, vector<16xi32>, i32) -> vector<16xi32>
    %106 = "rocdl.smfmac.f32.32x32x64.bf8.bf8"(%arg87, %arg92, %arg83, %81) <{abid = 0 : i32, cbsz = 0 : i32}> : (vector<4xi32>, vector<8xi32>, vector<16xf32>, i32) -> vector<16xf32>
    %107 = "rocdl.smfmac.f32.32x32x64.bf8.fp8"(%arg87, %arg92, %arg83, %81) <{abid = 0 : i32, cbsz = 0 : i32}> : (vector<4xi32>, vector<8xi32>, vector<16xf32>, i32) -> vector<16xf32>
    %108 = "rocdl.smfmac.f32.32x32x64.fp8.bf8"(%arg87, %arg92, %arg83, %81) <{abid = 0 : i32, cbsz = 0 : i32}> : (vector<4xi32>, vector<8xi32>, vector<16xf32>, i32) -> vector<16xf32>
    %109 = "rocdl.smfmac.f32.32x32x64.fp8.fp8"(%arg87, %arg92, %arg83, %81) <{abid = 0 : i32, cbsz = 0 : i32}> : (vector<4xi32>, vector<8xi32>, vector<16xf32>, i32) -> vector<16xf32>
    "llvm.return"(%82) : (vector<4xf32>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, vector<16xf32>, vector<8xi32>, vector<6xi32>, vector<4xi32>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.mfma.scale.f32.32x32x64.f8f6f4", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg74: i32, %arg75: vector<16xf32>, %arg76: vector<8xi32>, %arg77: vector<6xi32>, %arg78: vector<4xi32>):
    %56 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg76, %arg76, %arg75, %arg74, %arg74) <{blgp = #rocdl<matrix_format fp8_e4m3>, cbsz = #rocdl<matrix_format fp8_e4m3>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<8xi32>, vector<8xi32>, vector<16xf32>, i32, i32) -> vector<16xf32>
    %57 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg76, %arg76, %arg75, %arg74, %arg74) <{blgp = #rocdl<matrix_format fp8_e5m2>, cbsz = #rocdl<matrix_format fp8_e4m3>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<8xi32>, vector<8xi32>, vector<16xf32>, i32, i32) -> vector<16xf32>
    %58 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg76, %arg77, %arg75, %arg74, %arg74) <{blgp = #rocdl<matrix_format fp6_e2m3>, cbsz = #rocdl<matrix_format fp8_e4m3>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<8xi32>, vector<6xi32>, vector<16xf32>, i32, i32) -> vector<16xf32>
    %59 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg76, %arg77, %arg75, %arg74, %arg74) <{blgp = #rocdl<matrix_format fp6_e3m2>, cbsz = #rocdl<matrix_format fp8_e4m3>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<8xi32>, vector<6xi32>, vector<16xf32>, i32, i32) -> vector<16xf32>
    %60 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg76, %arg78, %arg75, %arg74, %arg74) <{blgp = #rocdl<matrix_format fp4_e2m1>, cbsz = #rocdl<matrix_format fp8_e4m3>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<8xi32>, vector<4xi32>, vector<16xf32>, i32, i32) -> vector<16xf32>
    %61 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg76, %arg76, %arg75, %arg74, %arg74) <{blgp = #rocdl<matrix_format fp8_e4m3>, cbsz = #rocdl<matrix_format fp8_e5m2>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<8xi32>, vector<8xi32>, vector<16xf32>, i32, i32) -> vector<16xf32>
    %62 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg76, %arg76, %arg75, %arg74, %arg74) <{blgp = #rocdl<matrix_format fp8_e5m2>, cbsz = #rocdl<matrix_format fp8_e5m2>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<8xi32>, vector<8xi32>, vector<16xf32>, i32, i32) -> vector<16xf32>
    %63 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg76, %arg77, %arg75, %arg74, %arg74) <{blgp = #rocdl<matrix_format fp6_e2m3>, cbsz = #rocdl<matrix_format fp8_e5m2>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<8xi32>, vector<6xi32>, vector<16xf32>, i32, i32) -> vector<16xf32>
    %64 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg76, %arg77, %arg75, %arg74, %arg74) <{blgp = #rocdl<matrix_format fp6_e3m2>, cbsz = #rocdl<matrix_format fp8_e5m2>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<8xi32>, vector<6xi32>, vector<16xf32>, i32, i32) -> vector<16xf32>
    %65 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg76, %arg78, %arg75, %arg74, %arg74) <{blgp = #rocdl<matrix_format fp4_e2m1>, cbsz = #rocdl<matrix_format fp8_e5m2>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<8xi32>, vector<4xi32>, vector<16xf32>, i32, i32) -> vector<16xf32>
    %66 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg77, %arg76, %arg75, %arg74, %arg74) <{blgp = #rocdl<matrix_format fp8_e4m3>, cbsz = #rocdl<matrix_format fp6_e2m3>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<6xi32>, vector<8xi32>, vector<16xf32>, i32, i32) -> vector<16xf32>
    %67 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg77, %arg76, %arg75, %arg74, %arg74) <{blgp = #rocdl<matrix_format fp8_e5m2>, cbsz = #rocdl<matrix_format fp6_e2m3>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<6xi32>, vector<8xi32>, vector<16xf32>, i32, i32) -> vector<16xf32>
    %68 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg77, %arg77, %arg75, %arg74, %arg74) <{blgp = #rocdl<matrix_format fp6_e2m3>, cbsz = #rocdl<matrix_format fp6_e2m3>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<6xi32>, vector<6xi32>, vector<16xf32>, i32, i32) -> vector<16xf32>
    %69 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg77, %arg77, %arg75, %arg74, %arg74) <{blgp = #rocdl<matrix_format fp6_e3m2>, cbsz = #rocdl<matrix_format fp6_e2m3>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<6xi32>, vector<6xi32>, vector<16xf32>, i32, i32) -> vector<16xf32>
    %70 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg77, %arg78, %arg75, %arg74, %arg74) <{blgp = #rocdl<matrix_format fp4_e2m1>, cbsz = #rocdl<matrix_format fp6_e2m3>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<6xi32>, vector<4xi32>, vector<16xf32>, i32, i32) -> vector<16xf32>
    %71 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg77, %arg76, %arg75, %arg74, %arg74) <{blgp = #rocdl<matrix_format fp8_e4m3>, cbsz = #rocdl<matrix_format fp6_e3m2>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<6xi32>, vector<8xi32>, vector<16xf32>, i32, i32) -> vector<16xf32>
    %72 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg77, %arg76, %arg75, %arg74, %arg74) <{blgp = #rocdl<matrix_format fp8_e5m2>, cbsz = #rocdl<matrix_format fp6_e3m2>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<6xi32>, vector<8xi32>, vector<16xf32>, i32, i32) -> vector<16xf32>
    %73 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg77, %arg77, %arg75, %arg74, %arg74) <{blgp = #rocdl<matrix_format fp6_e2m3>, cbsz = #rocdl<matrix_format fp6_e3m2>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<6xi32>, vector<6xi32>, vector<16xf32>, i32, i32) -> vector<16xf32>
    %74 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg77, %arg77, %arg75, %arg74, %arg74) <{blgp = #rocdl<matrix_format fp6_e3m2>, cbsz = #rocdl<matrix_format fp6_e3m2>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<6xi32>, vector<6xi32>, vector<16xf32>, i32, i32) -> vector<16xf32>
    %75 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg77, %arg78, %arg75, %arg74, %arg74) <{blgp = #rocdl<matrix_format fp4_e2m1>, cbsz = #rocdl<matrix_format fp6_e3m2>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<6xi32>, vector<4xi32>, vector<16xf32>, i32, i32) -> vector<16xf32>
    %76 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg78, %arg76, %arg75, %arg74, %arg74) <{blgp = #rocdl<matrix_format fp8_e4m3>, cbsz = #rocdl<matrix_format fp4_e2m1>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<4xi32>, vector<8xi32>, vector<16xf32>, i32, i32) -> vector<16xf32>
    %77 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg78, %arg76, %arg75, %arg74, %arg74) <{blgp = #rocdl<matrix_format fp8_e5m2>, cbsz = #rocdl<matrix_format fp4_e2m1>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<4xi32>, vector<8xi32>, vector<16xf32>, i32, i32) -> vector<16xf32>
    %78 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg78, %arg77, %arg75, %arg74, %arg74) <{blgp = #rocdl<matrix_format fp6_e2m3>, cbsz = #rocdl<matrix_format fp4_e2m1>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<4xi32>, vector<6xi32>, vector<16xf32>, i32, i32) -> vector<16xf32>
    %79 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg78, %arg77, %arg75, %arg74, %arg74) <{blgp = #rocdl<matrix_format fp6_e3m2>, cbsz = #rocdl<matrix_format fp4_e2m1>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<4xi32>, vector<6xi32>, vector<16xf32>, i32, i32) -> vector<16xf32>
    %80 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg78, %arg78, %arg75, %arg74, %arg74) <{blgp = #rocdl<matrix_format fp4_e2m1>, cbsz = #rocdl<matrix_format fp4_e2m1>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<4xi32>, vector<4xi32>, vector<16xf32>, i32, i32) -> vector<16xf32>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, vector<4xf32>, vector<8xi32>, vector<6xi32>, vector<4xi32>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.mfma.scale.f32.16x16x128.f8f6f4", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg69: i32, %arg70: vector<4xf32>, %arg71: vector<8xi32>, %arg72: vector<6xi32>, %arg73: vector<4xi32>):
    %31 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg71, %arg71, %arg70, %arg69, %arg69) <{blgp = #rocdl<matrix_format fp8_e4m3>, cbsz = #rocdl<matrix_format fp8_e4m3>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<8xi32>, vector<8xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %32 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg71, %arg71, %arg70, %arg69, %arg69) <{blgp = #rocdl<matrix_format fp8_e5m2>, cbsz = #rocdl<matrix_format fp8_e4m3>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<8xi32>, vector<8xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %33 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg71, %arg72, %arg70, %arg69, %arg69) <{blgp = #rocdl<matrix_format fp6_e2m3>, cbsz = #rocdl<matrix_format fp8_e4m3>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<8xi32>, vector<6xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %34 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg71, %arg72, %arg70, %arg69, %arg69) <{blgp = #rocdl<matrix_format fp6_e3m2>, cbsz = #rocdl<matrix_format fp8_e4m3>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<8xi32>, vector<6xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %35 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg71, %arg73, %arg70, %arg69, %arg69) <{blgp = #rocdl<matrix_format fp4_e2m1>, cbsz = #rocdl<matrix_format fp8_e4m3>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<8xi32>, vector<4xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %36 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg71, %arg71, %arg70, %arg69, %arg69) <{blgp = #rocdl<matrix_format fp8_e4m3>, cbsz = #rocdl<matrix_format fp8_e5m2>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<8xi32>, vector<8xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %37 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg71, %arg71, %arg70, %arg69, %arg69) <{blgp = #rocdl<matrix_format fp8_e5m2>, cbsz = #rocdl<matrix_format fp8_e5m2>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<8xi32>, vector<8xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %38 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg71, %arg72, %arg70, %arg69, %arg69) <{blgp = #rocdl<matrix_format fp6_e2m3>, cbsz = #rocdl<matrix_format fp8_e5m2>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<8xi32>, vector<6xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %39 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg71, %arg72, %arg70, %arg69, %arg69) <{blgp = #rocdl<matrix_format fp6_e3m2>, cbsz = #rocdl<matrix_format fp8_e5m2>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<8xi32>, vector<6xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %40 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg71, %arg73, %arg70, %arg69, %arg69) <{blgp = #rocdl<matrix_format fp4_e2m1>, cbsz = #rocdl<matrix_format fp8_e5m2>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<8xi32>, vector<4xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %41 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg72, %arg71, %arg70, %arg69, %arg69) <{blgp = #rocdl<matrix_format fp8_e4m3>, cbsz = #rocdl<matrix_format fp6_e2m3>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<6xi32>, vector<8xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %42 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg72, %arg71, %arg70, %arg69, %arg69) <{blgp = #rocdl<matrix_format fp8_e5m2>, cbsz = #rocdl<matrix_format fp6_e2m3>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<6xi32>, vector<8xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %43 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg72, %arg72, %arg70, %arg69, %arg69) <{blgp = #rocdl<matrix_format fp6_e2m3>, cbsz = #rocdl<matrix_format fp6_e2m3>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<6xi32>, vector<6xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %44 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg72, %arg72, %arg70, %arg69, %arg69) <{blgp = #rocdl<matrix_format fp6_e3m2>, cbsz = #rocdl<matrix_format fp6_e2m3>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<6xi32>, vector<6xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %45 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg72, %arg73, %arg70, %arg69, %arg69) <{blgp = #rocdl<matrix_format fp4_e2m1>, cbsz = #rocdl<matrix_format fp6_e2m3>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<6xi32>, vector<4xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %46 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg72, %arg71, %arg70, %arg69, %arg69) <{blgp = #rocdl<matrix_format fp8_e4m3>, cbsz = #rocdl<matrix_format fp6_e3m2>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<6xi32>, vector<8xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %47 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg72, %arg71, %arg70, %arg69, %arg69) <{blgp = #rocdl<matrix_format fp8_e5m2>, cbsz = #rocdl<matrix_format fp6_e3m2>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<6xi32>, vector<8xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %48 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg72, %arg72, %arg70, %arg69, %arg69) <{blgp = #rocdl<matrix_format fp6_e2m3>, cbsz = #rocdl<matrix_format fp6_e3m2>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<6xi32>, vector<6xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %49 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg72, %arg72, %arg70, %arg69, %arg69) <{blgp = #rocdl<matrix_format fp6_e3m2>, cbsz = #rocdl<matrix_format fp6_e3m2>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<6xi32>, vector<6xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %50 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg72, %arg73, %arg70, %arg69, %arg69) <{blgp = #rocdl<matrix_format fp4_e2m1>, cbsz = #rocdl<matrix_format fp6_e3m2>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<6xi32>, vector<4xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %51 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg73, %arg71, %arg70, %arg69, %arg69) <{blgp = #rocdl<matrix_format fp8_e4m3>, cbsz = #rocdl<matrix_format fp4_e2m1>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<4xi32>, vector<8xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %52 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg73, %arg71, %arg70, %arg69, %arg69) <{blgp = #rocdl<matrix_format fp8_e5m2>, cbsz = #rocdl<matrix_format fp4_e2m1>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<4xi32>, vector<8xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %53 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg73, %arg72, %arg70, %arg69, %arg69) <{blgp = #rocdl<matrix_format fp6_e2m3>, cbsz = #rocdl<matrix_format fp4_e2m1>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<4xi32>, vector<6xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %54 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg73, %arg72, %arg70, %arg69, %arg69) <{blgp = #rocdl<matrix_format fp6_e3m2>, cbsz = #rocdl<matrix_format fp4_e2m1>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<4xi32>, vector<6xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %55 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg73, %arg73, %arg70, %arg69, %arg69) <{blgp = #rocdl<matrix_format fp4_e2m1>, cbsz = #rocdl<matrix_format fp4_e2m1>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<4xi32>, vector<4xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<4xf16> (ptr<3>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.ds.read.tr", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg68: !llvm.ptr<3>):
    %26 = "rocdl.ds.read.tr4.b64"(%arg68) : (!llvm.ptr<3>) -> vector<2xi32>
    %27 = "rocdl.ds.read.tr6.b96"(%arg68) : (!llvm.ptr<3>) -> vector<3xi32>
    %28 = "rocdl.ds.read.tr8.b64"(%arg68) : (!llvm.ptr<3>) -> vector<2xi32>
    %29 = "rocdl.ds.read.tr16.b64"(%arg68) : (!llvm.ptr<3>) -> vector<4xf16>
    %30 = "rocdl.ds.read.tr16.b64"(%arg68) : (!llvm.ptr<3>) -> vector<4xbf16>
    "llvm.return"(%29) : (vector<4xf16>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<1>, ptr<3>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.load.tr.ops", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg66: !llvm.ptr<1>, %arg67: !llvm.ptr<3>):
    %14 = "rocdl.global.load.tr4.b64"(%arg66) : (!llvm.ptr<1>) -> vector<2xi32>
    %15 = "rocdl.global.load.tr.b64"(%arg66) : (!llvm.ptr<1>) -> vector<2xi32>
    %16 = "rocdl.global.load.tr6.b96"(%arg66) : (!llvm.ptr<1>) -> vector<3xi32>
    %17 = "rocdl.global.load.tr.b128"(%arg66) : (!llvm.ptr<1>) -> vector<8xi16>
    %18 = "rocdl.global.load.tr.b128"(%arg66) : (!llvm.ptr<1>) -> vector<8xf16>
    %19 = "rocdl.global.load.tr.b128"(%arg66) : (!llvm.ptr<1>) -> vector<8xbf16>
    %20 = "rocdl.ds.load.tr4.b64"(%arg67) : (!llvm.ptr<3>) -> vector<2xi32>
    %21 = "rocdl.ds.load.tr8.b64"(%arg67) : (!llvm.ptr<3>) -> vector<2xi32>
    %22 = "rocdl.ds.load.tr6.b96"(%arg67) : (!llvm.ptr<3>) -> vector<3xi32>
    %23 = "rocdl.ds.load.tr16.b128"(%arg67) : (!llvm.ptr<3>) -> vector<8xi16>
    %24 = "rocdl.ds.load.tr16.b128"(%arg67) : (!llvm.ptr<3>) -> vector<8xf16>
    %25 = "rocdl.ds.load.tr16.b128"(%arg67) : (!llvm.ptr<3>) -> vector<8xbf16>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<7>, ptr<3>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.load.to.lds", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg64: !llvm.ptr<7>, %arg65: !llvm.ptr<3>):
    "rocdl.load.to.lds"(%arg64, %arg65) <{aux = 0 : i32, offset = 0 : i32, size = 4 : i32}> : (!llvm.ptr<7>, !llvm.ptr<3>) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<7>, ptr<3>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.load.async.to.lds", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg62: !llvm.ptr<7>, %arg63: !llvm.ptr<3>):
    "rocdl.load.async.to.lds"(%arg62, %arg63) <{aux = 0 : i32, offset = 0 : i32, size = 4 : i32}> : (!llvm.ptr<7>, !llvm.ptr<3>) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<1>, ptr<3>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.global.load.lds", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg60: !llvm.ptr<1>, %arg61: !llvm.ptr<3>):
    "rocdl.global.load.lds"(%arg60, %arg61) <{aux = 0 : i32, offset = 0 : i32, size = 4 : i32}> : (!llvm.ptr<1>, !llvm.ptr<3>) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<1>, ptr<3>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.global.load.async.lds", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg58: !llvm.ptr<1>, %arg59: !llvm.ptr<3>):
    "rocdl.global.load.async.lds"(%arg58, %arg59) <{aux = 0 : i32, offset = 0 : i32, size = 4 : i32}> : (!llvm.ptr<1>, !llvm.ptr<3>) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<1>, ptr<3>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.global.load.async.to.lds", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg56: !llvm.ptr<1>, %arg57: !llvm.ptr<3>):
    "rocdl.global.load.async.to.lds.b8"(%arg56, %arg57) <{aux = 0 : i32, offset = 0 : i32}> : (!llvm.ptr<1>, !llvm.ptr<3>) -> ()
    "rocdl.global.load.async.to.lds.b32"(%arg56, %arg57) <{aux = 0 : i32, offset = 0 : i32}> : (!llvm.ptr<1>, !llvm.ptr<3>) -> ()
    "rocdl.global.load.async.to.lds.b64"(%arg56, %arg57) <{aux = 0 : i32, offset = 0 : i32}> : (!llvm.ptr<1>, !llvm.ptr<3>) -> ()
    "rocdl.global.load.async.to.lds.b128"(%arg56, %arg57) <{aux = 0 : i32, offset = 0 : i32}> : (!llvm.ptr<1>, !llvm.ptr<3>) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<1>, ptr<3>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.global.store.async.from.lds", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg54: !llvm.ptr<1>, %arg55: !llvm.ptr<3>):
    "rocdl.global.store.async.from.lds.b8"(%arg54, %arg55) <{aux = 0 : i32, offset = 0 : i32}> : (!llvm.ptr<1>, !llvm.ptr<3>) -> ()
    "rocdl.global.store.async.from.lds.b32"(%arg54, %arg55) <{aux = 0 : i32, offset = 0 : i32}> : (!llvm.ptr<1>, !llvm.ptr<3>) -> ()
    "rocdl.global.store.async.from.lds.b64"(%arg54, %arg55) <{aux = 0 : i32, offset = 0 : i32}> : (!llvm.ptr<1>, !llvm.ptr<3>) -> ()
    "rocdl.global.store.async.from.lds.b128"(%arg54, %arg55) <{aux = 0 : i32, offset = 0 : i32}> : (!llvm.ptr<1>, !llvm.ptr<3>) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<1>, ptr<3>, i32)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.cluster.load.async.to.lds", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg51: !llvm.ptr<1>, %arg52: !llvm.ptr<3>, %arg53: i32):
    "rocdl.cluster.load.async.to.lds.b8"(%arg51, %arg52, %arg53) <{cpol = 0 : i32, offset = 0 : i32}> : (!llvm.ptr<1>, !llvm.ptr<3>, i32) -> ()
    "rocdl.cluster.load.async.to.lds.b32"(%arg51, %arg52, %arg53) <{cpol = 0 : i32, offset = 0 : i32}> : (!llvm.ptr<1>, !llvm.ptr<3>, i32) -> ()
    "rocdl.cluster.load.async.to.lds.b64"(%arg51, %arg52, %arg53) <{cpol = 0 : i32, offset = 0 : i32}> : (!llvm.ptr<1>, !llvm.ptr<3>, i32) -> ()
    "rocdl.cluster.load.async.to.lds.b128"(%arg51, %arg52, %arg53) <{cpol = 0 : i32, offset = 0 : i32}> : (!llvm.ptr<1>, !llvm.ptr<3>, i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (vector<4xi32>, vector<8xi32>, vector<4xi32>, vector<4xi32>, vector<8xi32>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.tensor.load.to.lds", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg46: vector<4xi32>, %arg47: vector<8xi32>, %arg48: vector<4xi32>, %arg49: vector<4xi32>, %arg50: vector<8xi32>):
    "rocdl.tensor.load.to.lds"(%arg46, %arg47, %arg48, %arg49, %arg50) <{cachePolicy = 0 : i32}> : (vector<4xi32>, vector<8xi32>, vector<4xi32>, vector<4xi32>, vector<8xi32>) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (vector<4xi32>, vector<8xi32>, vector<4xi32>, vector<4xi32>, vector<8xi32>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.tensor.store.from.lds", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg41: vector<4xi32>, %arg42: vector<8xi32>, %arg43: vector<4xi32>, %arg44: vector<4xi32>, %arg45: vector<8xi32>):
    "rocdl.tensor.store.from.lds"(%arg41, %arg42, %arg43, %arg44, %arg45) <{cachePolicy = 0 : i32}> : (vector<4xi32>, vector<8xi32>, vector<4xi32>, vector<4xi32>, vector<8xi32>) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<ptr<8> (ptr, i16, i64, i32)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.make.buffer.rsrc", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg37: !llvm.ptr, %arg38: i16, %arg39: i64, %arg40: i32):
    %13 = "rocdl.make.buffer.rsrc"(%arg37, %arg38, %arg39, %arg40) : (!llvm.ptr, i16, i64, i32) -> !llvm.ptr<8>
    "llvm.return"(%13) : (!llvm.ptr<8>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<8>, i32, i32, i32, f32, vector<2xf32>, vector<4xf32>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.raw.ptr.buffer.f32", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg30: !llvm.ptr<8>, %arg31: i32, %arg32: i32, %arg33: i32, %arg34: f32, %arg35: vector<2xf32>, %arg36: vector<4xf32>):
    %8 = "rocdl.raw.ptr.buffer.load"(%arg30, %arg31, %arg32) <{aux = 0 : i32}> : (!llvm.ptr<8>, i32, i32) -> f32
    %9 = "rocdl.raw.ptr.buffer.load"(%arg30, %arg31, %arg32) <{aux = 0 : i32}> : (!llvm.ptr<8>, i32, i32) -> vector<2xf32>
    %10 = "rocdl.raw.ptr.buffer.load"(%arg30, %arg31, %arg32) <{aux = 0 : i32}> : (!llvm.ptr<8>, i32, i32) -> vector<4xf32>
    "rocdl.raw.ptr.buffer.store"(%arg34, %arg30, %arg31, %arg32) <{aux = 0 : i32}> : (f32, !llvm.ptr<8>, i32, i32) -> ()
    "rocdl.raw.ptr.buffer.store"(%arg35, %arg30, %arg31, %arg32) <{aux = 0 : i32}> : (vector<2xf32>, !llvm.ptr<8>, i32, i32) -> ()
    "rocdl.raw.ptr.buffer.store"(%arg36, %arg30, %arg31, %arg31) <{aux = 0 : i32}> : (vector<4xf32>, !llvm.ptr<8>, i32, i32) -> ()
    %11 = "rocdl.raw.ptr.buffer.atomic.fadd"(%arg34, %arg30, %arg31, %arg32) <{aux = 0 : i32}> : (f32, !llvm.ptr<8>, i32, i32) -> f32
    %12 = "rocdl.raw.ptr.buffer.atomic.fmax"(%arg34, %arg30, %arg31, %arg32) <{aux = 0 : i32}> : (f32, !llvm.ptr<8>, i32, i32) -> f32
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<8>, ptr<3>, i32, i32, i32, i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.raw.ptr.buffer.load.lds", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg23: !llvm.ptr<8>, %arg24: !llvm.ptr<3>, %arg25: i32, %arg26: i32, %arg27: i32, %arg28: i32, %arg29: i32):
    "rocdl.raw.ptr.buffer.load.lds"(%arg23, %arg24, %arg25, %arg26, %arg27, %arg28) <{aux = 0 : i32}> : (!llvm.ptr<8>, !llvm.ptr<3>, i32, i32, i32, i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<8>, ptr<3>, i32, i32, i32, i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.raw.ptr.buffer.load.async.lds", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg16: !llvm.ptr<8>, %arg17: !llvm.ptr<3>, %arg18: i32, %arg19: i32, %arg20: i32, %arg21: i32, %arg22: i32):
    "rocdl.raw.ptr.buffer.load.async.lds"(%arg16, %arg17, %arg18, %arg19, %arg20, %arg21) <{aux = 0 : i32}> : (!llvm.ptr<8>, !llvm.ptr<3>, i32, i32, i32, i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<8>, i32, i32, i32, i32, vector<2xi32>, vector<4xi32>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.raw.ptr.buffer.i32", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg9: !llvm.ptr<8>, %arg10: i32, %arg11: i32, %arg12: i32, %arg13: i32, %arg14: vector<2xi32>, %arg15: vector<4xi32>):
    %5 = "rocdl.raw.ptr.buffer.atomic.smax"(%arg13, %arg9, %arg10, %arg11) <{aux = 0 : i32}> : (i32, !llvm.ptr<8>, i32, i32) -> i32
    %6 = "rocdl.raw.ptr.buffer.atomic.umin"(%arg13, %arg9, %arg10, %arg11) <{aux = 0 : i32}> : (i32, !llvm.ptr<8>, i32, i32) -> i32
    %7 = "rocdl.raw.ptr.buffer.atomic.cmpswap"(%arg13, %arg13, %arg9, %arg10, %arg11) <{aux = 0 : i32}> : (i32, i32, !llvm.ptr<8>, i32, i32) -> i32
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<1>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.global.prefetch", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg8: !llvm.ptr<1>):
    "rocdl.global.prefetch"(%arg8) <{cachePolicy = 0 : i32}> : (!llvm.ptr<1>) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.flat.prefetch", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg7: !llvm.ptr):
    "rocdl.flat.prefetch"(%arg7) <{cachePolicy = 0 : i32}> : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (vector<4xi32>, i32, i32, i32, ptr<1>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.cachepolicy.enums", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg2: vector<4xi32>, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: !llvm.ptr<1>):
    %1 = "rocdl.raw.buffer.load"(%arg2, %arg3, %arg4) <{aux = #rocdl<pre_gfx12_cache_policy glc|slc>}> : (vector<4xi32>, i32, i32) -> i32
    %2 = "rocdl.raw.buffer.load"(%arg2, %arg3, %arg4) <{aux = #rocdl<gfx942_cache_policy sc0|nt>}> : (vector<4xi32>, i32, i32) -> i32
    "rocdl.global.prefetch"(%arg6) <{cachePolicy = #rocdl<gfx12_cache_policy nt_rt|scope_se>}> : (!llvm.ptr<1>) -> ()
    "rocdl.global.prefetch"(%arg6) <{cachePolicy = #rocdl<gfx12_cache_policy scope_sys|scal>}> : (!llvm.ptr<1>) -> ()
    %3 = "rocdl.raw.buffer.atomic.smax"(%arg5, %arg2, %arg3, %arg4) <{aux = #rocdl<gfx12_atomic_cache_policy nv>}> : (i32, vector<4xi32>, i32, i32) -> i32
    %4 = "rocdl.raw.buffer.atomic.smax"(%arg5, %arg2, %arg3, %arg4) <{aux = 2 : i32}> : (i32, vector<4xi32>, i32, i32) -> i32
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<3>, i64)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.atomic.barriers.arrive", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr<3>, %arg1: i64):
    "rocdl.ds.atomic.async.barrier.arrive.b64"(%arg0) : (!llvm.ptr<3>) -> ()
    %0 = "rocdl.ds.atomic.barrier.arrive.rtn.b64"(%arg0, %arg1) : (!llvm.ptr<3>, i64) -> i64
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (vector<4xi32>, i32, i32, i32, f32, vector<2xf32>, vector<4xf32>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.raw.buffer.f32", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg36: vector<4xi32>, %arg37: i32, %arg38: i32, %arg39: i32, %arg40: f32, %arg41: vector<2xf32>, %arg42: vector<4xf32>):
    %67 = "rocdl.raw.buffer.load"(%arg36, %arg37, %arg38) <{aux = 0 : i32}> : (vector<4xi32>, i32, i32) -> f32
    %68 = "rocdl.raw.buffer.load"(%arg36, %arg37, %arg38) <{aux = 0 : i32}> : (vector<4xi32>, i32, i32) -> vector<2xf32>
    %69 = "rocdl.raw.buffer.load"(%arg36, %arg37, %arg38) <{aux = 0 : i32}> : (vector<4xi32>, i32, i32) -> vector<4xf32>
    "rocdl.raw.buffer.store"(%arg40, %arg36, %arg37, %arg38) <{aux = 0 : i32}> : (f32, vector<4xi32>, i32, i32) -> ()
    "rocdl.raw.buffer.store"(%arg41, %arg36, %arg37, %arg38) <{aux = 0 : i32}> : (vector<2xf32>, vector<4xi32>, i32, i32) -> ()
    "rocdl.raw.buffer.store"(%arg42, %arg36, %arg37, %arg37) <{aux = 0 : i32}> : (vector<4xf32>, vector<4xi32>, i32, i32) -> ()
    %70 = "rocdl.raw.buffer.atomic.fadd"(%arg40, %arg36, %arg37, %arg38) <{aux = 0 : i32}> : (f32, vector<4xi32>, i32, i32) -> f32
    %71 = "rocdl.raw.buffer.atomic.fmax"(%arg40, %arg36, %arg37, %arg38) <{aux = 0 : i32}> : (f32, vector<4xi32>, i32, i32) -> f32
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (vector<4xi32>, i32, i32, i32, i32, vector<2xi32>, vector<4xi32>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.raw.buffer.i32", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg29: vector<4xi32>, %arg30: i32, %arg31: i32, %arg32: i32, %arg33: i32, %arg34: vector<2xi32>, %arg35: vector<4xi32>):
    %64 = "rocdl.raw.buffer.atomic.smax"(%arg33, %arg29, %arg30, %arg31) <{aux = 0 : i32}> : (i32, vector<4xi32>, i32, i32) -> i32
    %65 = "rocdl.raw.buffer.atomic.umin"(%arg33, %arg29, %arg30, %arg31) <{aux = 0 : i32}> : (i32, vector<4xi32>, i32, i32) -> i32
    %66 = "rocdl.raw.buffer.atomic.cmpswap"(%arg33, %arg33, %arg29, %arg30, %arg31) <{aux = 0 : i32}> : (i32, i32, vector<4xi32>, i32, i32) -> i32
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (i32, f16, bf16, i32)>, linkage = #llvm.linkage<external>, sym_name = "rocdl_8bit_floats", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg25: i32, %arg26: f16, %arg27: bf16, %arg28: i32):
    %38 = "llvm.mlir.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %39 = "rocdl.cvt.f32.bf8"(%arg25) <{byteSel = 0 : i32}> : (i32) -> f32
    %40 = "rocdl.cvt.f32.fp8"(%arg25) <{byteSel = 0 : i32}> : (i32) -> f32
    %41 = "rocdl.cvt.scalef32.f32.bf8"(%arg25, %38) <{srcSelIndex = 0 : i32}> : (i32, f32) -> f32
    %42 = "rocdl.cvt.scalef32.f32.fp8"(%arg25, %38) <{srcSelIndex = 0 : i32}> : (i32, f32) -> f32
    %43 = "rocdl.cvt.scalef32.pk.f16.bf8"(%arg25, %38) <{srcLoHiSel = false}> : (i32, f32) -> vector<2xf16>
    %44 = "rocdl.cvt.scalef32.pk.f16.fp8"(%arg25, %38) <{srcLoHiSel = false}> : (i32, f32) -> vector<2xf16>
    %45 = "rocdl.cvt.scalef32.pk.bf16.bf8"(%arg25, %38) <{srcLoHiSel = false}> : (i32, f32) -> vector<2xbf16>
    %46 = "rocdl.cvt.scalef32.pk.bf16.fp8"(%arg25, %38) <{srcLoHiSel = false}> : (i32, f32) -> vector<2xbf16>
    %47 = "rocdl.cvt.scalef32.f16.fp8"(%43, %arg25, %38) <{dstLoHiSel = false, srcSelIndex = 0 : i32}> : (vector<2xf16>, i32, f32) -> vector<2xf16>
    %48 = "rocdl.cvt.scalef32.f16.bf8"(%43, %arg25, %38) <{dstLoHiSel = false, srcSelIndex = 0 : i32}> : (vector<2xf16>, i32, f32) -> vector<2xf16>
    %49 = "rocdl.cvt.pk.bf8.f32"(%39, %40, %arg25) <{wordSel = false}> : (f32, f32, i32) -> i32
    %50 = "rocdl.cvt.pk.fp8.f32"(%39, %40, %49) <{wordSel = false}> : (f32, f32, i32) -> i32
    %51 = "rocdl.cvt.pk.f32.bf8"(%arg25) <{wordSel = false}> : (i32) -> vector<2xf32>
    %52 = "rocdl.cvt.pk.f32.fp8"(%arg25) <{wordSel = false}> : (i32) -> vector<2xf32>
    %53 = "rocdl.cvt.sr.bf8.f32"(%39, %arg28, %50) <{byteSel = 2 : i32}> : (f32, i32, i32) -> i32
    %54 = "rocdl.cvt.sr.fp8.f32"(%40, %arg28, %53) <{byteSel = 3 : i32}> : (f32, i32, i32) -> i32
    %55 = "rocdl.cvt.scalef32.sr.fp8.f32"(%53, %40, %arg28, %38) <{dstSelIndex = 3 : i32}> : (i32, f32, i32, f32) -> i32
    %56 = "rocdl.cvt.scalef32.sr.fp8.f16"(%53, %arg26, %arg28, %38) <{dstSelIndex = 3 : i32}> : (i32, f16, i32, f32) -> i32
    %57 = "rocdl.cvt.scalef32.sr.fp8.bf16"(%53, %arg27, %arg28, %38) <{dstSelIndex = 3 : i32}> : (i32, bf16, i32, f32) -> i32
    %58 = "rocdl.cvt.sr.bf8.f32"(%39, %arg28, %50) <{byteSel = 3 : i32}> : (f32, i32, i32) -> i32
    %59 = "rocdl.cvt.scalef32.sr.bf8.f32"(%50, %40, %arg28, %38) <{dstSelIndex = 3 : i32}> : (i32, f32, i32, f32) -> i32
    %60 = "rocdl.cvt.scalef32.sr.bf8.f16"(%50, %arg26, %arg28, %38) <{dstSelIndex = 3 : i32}> : (i32, f16, i32, f32) -> i32
    %61 = "rocdl.cvt.scalef32.sr.bf8.bf16"(%50, %arg27, %arg28, %38) <{dstSelIndex = 3 : i32}> : (i32, bf16, i32, f32) -> i32
    %62 = "rocdl.cvt.scalef32.pk.f32.fp8"(%arg25, %38) <{srcLoHiSel = false}> : (i32, f32) -> vector<2xf32>
    %63 = "rocdl.cvt.scalef32.pk.f32.bf8"(%arg25, %38) <{srcLoHiSel = false}> : (i32, f32) -> vector<2xf32>
    "llvm.return"(%54) : (i32) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<2xi16> (f32, f32, vector<2xi16>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl_8bit_packed_v2i16", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg22: f32, %arg23: f32, %arg24: vector<2xi16>):
    %35 = "llvm.mlir.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %36 = "rocdl.cvt.scalef32.pk.fp8.f32"(%arg24, %arg22, %arg23, %35) <{dstLoHiSel = false}> : (vector<2xi16>, f32, f32, f32) -> vector<2xi16>
    %37 = "rocdl.cvt.scalef32.pk.bf8.f32"(%arg24, %arg22, %arg23, %35) <{dstLoHiSel = false}> : (vector<2xi16>, f32, f32, f32) -> vector<2xi16>
    "llvm.return"(%36) : (vector<2xi16>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<2xi16> (vector<2xf16>, vector<2xbf16>, vector<2xi16>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl_v2f16_v2i16", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg19: vector<2xf16>, %arg20: vector<2xbf16>, %arg21: vector<2xi16>):
    %30 = "llvm.mlir.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %31 = "rocdl.cvt.scalef32.pk.fp8.f16"(%arg21, %arg19, %30) <{dstLoHiSel = false}> : (vector<2xi16>, vector<2xf16>, f32) -> vector<2xi16>
    %32 = "rocdl.cvt.scalef32.pk.fp8.bf16"(%arg21, %arg20, %30) <{dstLoHiSel = false}> : (vector<2xi16>, vector<2xbf16>, f32) -> vector<2xi16>
    %33 = "rocdl.cvt.scalef32.pk.bf8.f16"(%arg21, %arg19, %30) <{dstLoHiSel = false}> : (vector<2xi16>, vector<2xf16>, f32) -> vector<2xi16>
    %34 = "rocdl.cvt.scalef32.pk.bf8.bf16"(%arg21, %arg20, %30) <{dstLoHiSel = false}> : (vector<2xi16>, vector<2xbf16>, f32) -> vector<2xi16>
    "llvm.return"(%31) : (vector<2xi16>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (vector<6xi32>, vector<16xf32>, vector<32xf32>, vector<32xf16>, vector<32xbf16>, i32, f32)>, linkage = #llvm.linkage<external>, sym_name = "rocdl_6_bit_floats", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg12: vector<6xi32>, %arg13: vector<16xf32>, %arg14: vector<32xf32>, %arg15: vector<32xf16>, %arg16: vector<32xbf16>, %arg17: i32, %arg18: f32):
    %12 = "rocdl.cvt.scalef32.2xpk16.bf6.f32"(%arg13, %arg13, %arg18) : (vector<16xf32>, vector<16xf32>, f32) -> vector<6xi32>
    %13 = "rocdl.cvt.scalef32.2xpk16.fp6.f32"(%arg13, %arg13, %arg18) : (vector<16xf32>, vector<16xf32>, f32) -> vector<6xi32>
    %14 = "rocdl.cvt.scalef32.pk32.bf6.f16"(%arg15, %arg18) : (vector<32xf16>, f32) -> vector<6xi32>
    %15 = "rocdl.cvt.scalef32.pk32.fp6.f16"(%arg15, %arg18) : (vector<32xf16>, f32) -> vector<6xi32>
    %16 = "rocdl.cvt.scalef32.pk32.bf6.bf16"(%arg16, %arg18) : (vector<32xbf16>, f32) -> vector<6xi32>
    %17 = "rocdl.cvt.scalef32.pk32.fp6.bf16"(%arg16, %arg18) : (vector<32xbf16>, f32) -> vector<6xi32>
    %18 = "rocdl.cvt.scalef32.pk32.f32.bf6"(%arg12, %arg18) : (vector<6xi32>, f32) -> vector<32xf32>
    %19 = "rocdl.cvt.scalef32.pk32.f32.fp6"(%arg12, %arg18) : (vector<6xi32>, f32) -> vector<32xf32>
    %20 = "rocdl.cvt.scalef32.pk32.f16.bf6"(%arg12, %arg18) : (vector<6xi32>, f32) -> vector<32xf16>
    %21 = "rocdl.cvt.scalef32.pk32.f16.fp6"(%arg12, %arg18) : (vector<6xi32>, f32) -> vector<32xf16>
    %22 = "rocdl.cvt.scalef32.pk32.bf16.bf6"(%arg12, %arg18) : (vector<6xi32>, f32) -> vector<32xbf16>
    %23 = "rocdl.cvt.scalef32.pk32.bf16.fp6"(%arg12, %arg18) : (vector<6xi32>, f32) -> vector<32xbf16>
    %24 = "rocdl.cvt.scalef32.sr.pk32.bf6.f32"(%arg14, %arg17, %arg18) : (vector<32xf32>, i32, f32) -> vector<6xi32>
    %25 = "rocdl.cvt.scalef32.sr.pk32.fp6.f32"(%arg14, %arg17, %arg18) : (vector<32xf32>, i32, f32) -> vector<6xi32>
    %26 = "rocdl.cvt.scalef32.sr.pk32.bf6.f16"(%arg15, %arg17, %arg18) : (vector<32xf16>, i32, f32) -> vector<6xi32>
    %27 = "rocdl.cvt.scalef32.sr.pk32.fp6.f16"(%arg15, %arg17, %arg18) : (vector<32xf16>, i32, f32) -> vector<6xi32>
    %28 = "rocdl.cvt.scalef32.sr.pk32.bf6.bf16"(%arg16, %arg17, %arg18) : (vector<32xbf16>, i32, f32) -> vector<6xi32>
    %29 = "rocdl.cvt.scalef32.sr.pk32.fp6.bf16"(%arg16, %arg17, %arg18) : (vector<32xbf16>, i32, f32) -> vector<6xi32>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, f32, vector<2xf32>, vector<2xf16>, vector<2xbf16>, i32, f32)>, linkage = #llvm.linkage<external>, sym_name = "rocdl_4_bit_floats", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg5: i32, %arg6: f32, %arg7: vector<2xf32>, %arg8: vector<2xf16>, %arg9: vector<2xbf16>, %arg10: i32, %arg11: f32):
    %3 = "rocdl.cvt.scalef32.pk.fp4.f32"(%arg5, %arg6, %arg6, %arg11) <{dstSelIndex = 0 : i32}> : (i32, f32, f32, f32) -> i32
    %4 = "rocdl.cvt.scalef32.pk.fp4.f16"(%arg5, %arg8, %arg11) <{dstSelIndex = 1 : i32}> : (i32, vector<2xf16>, f32) -> i32
    %5 = "rocdl.cvt.scalef32.pk.fp4.bf16"(%arg5, %arg9, %arg11) <{dstSelIndex = 0 : i32}> : (i32, vector<2xbf16>, f32) -> i32
    %6 = "rocdl.cvt.scalef32.pk.f32.fp4"(%arg5, %arg11) <{srcSelIndex = 0 : i32}> : (i32, f32) -> vector<2xf32>
    %7 = "rocdl.cvt.scalef32.pk.f16.fp4"(%arg5, %arg11) <{srcSelIndex = 1 : i32}> : (i32, f32) -> vector<2xf16>
    %8 = "rocdl.cvt.scalef32.pk.bf16.fp4"(%arg5, %arg11) <{srcSelIndex = 0 : i32}> : (i32, f32) -> vector<2xbf16>
    %9 = "rocdl.cvt.scalef32.sr.pk.fp4.f32"(%arg5, %arg7, %arg10, %arg11) <{dstSelIndex = 0 : i32}> : (i32, vector<2xf32>, i32, f32) -> i32
    %10 = "rocdl.cvt.scalef32.sr.pk.fp4.f16"(%arg5, %arg8, %arg10, %arg11) <{dstSelIndex = 1 : i32}> : (i32, vector<2xf16>, i32, f32) -> i32
    %11 = "rocdl.cvt.scalef32.sr.pk.fp4.bf16"(%arg5, %arg9, %arg10, %arg11) <{dstSelIndex = 0 : i32}> : (i32, vector<2xbf16>, i32, f32) -> i32
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "rocdl.s.waitcnt", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "rocdl.s.waitcnt"() <{bitfield = 0 : i32}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "rocdl.s.sleep", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "rocdl.s.sleep"() <{count = 0 : i32}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "rocdl.s.nop", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "rocdl.s.nop"() <{count = 0 : i16}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "rocdl.s.barrier", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "rocdl.s.barrier"() : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<3>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.s.barrier.init", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg4: !llvm.ptr<3>):
    "rocdl.s.barrier.init"(%arg4) <{memberCnt = 1 : i32}> : (!llvm.ptr<3>) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "rocdl.s.barrier.signal", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "rocdl.s.barrier.signal"() <{id = -1 : i32}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<3>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.s.barrier.signal.var", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg3: !llvm.ptr<3>):
    "rocdl.s.barrier.signal.var"(%arg3) <{memberCnt = 1 : i32}> : (!llvm.ptr<3>) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<3>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.s.barrier.join", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg2: !llvm.ptr<3>):
    "rocdl.s.barrier.join"(%arg2) : (!llvm.ptr<3>) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "rocdl.s.barrier.leave", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "rocdl.s.barrier.leave"() <{id = 1 : i16}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "rocdl.s.barrier.wait", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "rocdl.s.barrier.wait"() <{id = -1 : i16}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "rocdl.s.barrier.signal.isfirst", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %2 = "rocdl.s.barrier.signal.isfirst"() <{id = 1 : i32}> : () -> i1
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "rocdl.s.get.barrier.state", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %1 = "rocdl.s.get.barrier.state"() <{id = 1 : i32}> : () -> i32
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<3>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.s.get.named.barrier.state", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg1: !llvm.ptr<3>):
    %0 = "rocdl.s.get.named.barrier.state"(%arg1) : (!llvm.ptr<3>) -> i32
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<3>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.s.wakeup.barrier", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr<3>):
    "rocdl.s.wakeup.barrier"(%arg0) : (!llvm.ptr<3>) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "rocdl.s.wait.dscnt", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "rocdl.s.wait.dscnt"() <{count = 0 : i16}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "rocdl.s.wait.loadcnt", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "rocdl.s.wait.loadcnt"() <{count = 0 : i16}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "rocdl.s.wait.storecnt", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "rocdl.s.wait.storecnt"() <{count = 0 : i16}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "rocdl.s.wait.expcnt", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "rocdl.s.wait.expcnt"() <{count = 0 : i16}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "rocdl.s.wait.asynccnt", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "rocdl.s.wait.asynccnt"() <{count = 0 : i16}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "rocdl.s.wait.tensorcnt", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "rocdl.s.wait.tensorcnt"() <{count = 0 : i16}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "rocdl.asyncmark", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "rocdl.asyncmark"() : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "rocdl.wait.asyncmark", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "rocdl.wait.asyncmark"() <{count = 0 : i16}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<f32 (f32)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.readfirstlane", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg1: f32):
    %2 = "rocdl.readfirstlane"(%arg1) : (f32) -> f32
    "llvm.return"(%2) : (f32) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<f32 (f32)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.readlane", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: f32):
    %0 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    %1 = "rocdl.readlane"(%arg0, %0) : (f32, i32) -> f32
    "llvm.return"(%1) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<f32 (f32)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.permlanex16", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: f32):
    %0 = "llvm.mlir.constant"() <{value = -1 : i32}> : () -> i32
    %1 = "rocdl.permlanex16"(%arg0, %arg0, %0, %0) <{boundControl = true, fi = false}> : (f32, f32, i32, i32) -> f32
    "llvm.return"(%1) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<struct<(i32, i32)> (i32)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.permlane16.swap", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg1: i32):
    %1 = "rocdl.permlane16.swap"(%arg1, %arg1) <{boundControl = true, fi = false}> : (i32, i32) -> !llvm.struct<(i32, i32)>
    "llvm.return"(%1) : (!llvm.struct<(i32, i32)>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<struct<(i32, i32)> (i32)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.permlane32.swap", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i32):
    %0 = "rocdl.permlane32.swap"(%arg0, %arg0) <{boundControl = true, fi = false}> : (i32, i32) -> !llvm.struct<(i32, i32)>
    "llvm.return"(%0) : (!llvm.struct<(i32, i32)>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (i32)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.permlane16.var", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i32):
    %0 = "llvm.mlir.constant"() <{value = -1 : i32}> : () -> i32
    %1 = "rocdl.permlane16.var"(%arg0, %arg0, %0) <{boundControl = true, fi = false}> : (i32, i32, i32) -> i32
    "llvm.return"(%1) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (i32)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.permlanex16.var", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i32):
    %0 = "llvm.mlir.constant"() <{value = -1 : i32}> : () -> i32
    %1 = "rocdl.permlanex16.var"(%arg0, %arg0, %0) <{boundControl = true, fi = false}> : (i32, i32, i32) -> i32
    "llvm.return"(%1) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, vector<2xi32>, i32)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.cvt.scale.pk8", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i32, %arg1: vector<2xi32>, %arg2: i32):
    %0 = "rocdl.cvt.scale.pk8.f16.fp4"(%arg0, %arg2) <{scaleSel = 0 : i32}> : (i32, i32) -> vector<8xf16>
    %1 = "rocdl.cvt.scale.pk8.bf16.fp4"(%arg0, %arg2) <{scaleSel = 0 : i32}> : (i32, i32) -> vector<8xbf16>
    %2 = "rocdl.cvt.scale.pk8.f32.fp4"(%arg0, %arg2) <{scaleSel = 0 : i32}> : (i32, i32) -> vector<8xf32>
    %3 = "rocdl.cvt.scale.pk8.f16.fp8"(%arg1, %arg2) <{scaleSel = 0 : i32}> : (vector<2xi32>, i32) -> vector<8xf16>
    %4 = "rocdl.cvt.scale.pk8.bf16.fp8"(%arg1, %arg2) <{scaleSel = 0 : i32}> : (vector<2xi32>, i32) -> vector<8xbf16>
    %5 = "rocdl.cvt.scale.pk8.f32.fp8"(%arg1, %arg2) <{scaleSel = 0 : i32}> : (vector<2xi32>, i32) -> vector<8xf32>
    %6 = "rocdl.cvt.scale.pk8.f16.bf8"(%arg1, %arg2) <{scaleSel = 0 : i32}> : (vector<2xi32>, i32) -> vector<8xf16>
    %7 = "rocdl.cvt.scale.pk8.bf16.bf8"(%arg1, %arg2) <{scaleSel = 0 : i32}> : (vector<2xi32>, i32) -> vector<8xbf16>
    %8 = "rocdl.cvt.scale.pk8.f32.bf8"(%arg1, %arg2) <{scaleSel = 0 : i32}> : (vector<2xi32>, i32) -> vector<8xf32>
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (vector<8xf32>, vector<8xf16>, vector<8xbf16>, f32)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.cvt.scalef32.pk8", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: vector<8xf32>, %arg1: vector<8xf16>, %arg2: vector<8xbf16>, %arg3: f32):
    %0 = "rocdl.cvt.scalef32.pk8.fp8.f32"(%arg0, %arg3) : (vector<8xf32>, f32) -> vector<2xi32>
    %1 = "rocdl.cvt.scalef32.pk8.bf8.f32"(%arg0, %arg3) : (vector<8xf32>, f32) -> vector<2xi32>
    %2 = "rocdl.cvt.scalef32.pk8.fp4.f32"(%arg0, %arg3) : (vector<8xf32>, f32) -> i32
    %3 = "rocdl.cvt.scalef32.pk8.fp8.f16"(%arg1, %arg3) : (vector<8xf16>, f32) -> vector<2xi32>
    %4 = "rocdl.cvt.scalef32.pk8.bf8.f16"(%arg1, %arg3) : (vector<8xf16>, f32) -> vector<2xi32>
    %5 = "rocdl.cvt.scalef32.pk8.fp4.f16"(%arg1, %arg3) : (vector<8xf16>, f32) -> i32
    %6 = "rocdl.cvt.scalef32.pk8.fp8.bf16"(%arg2, %arg3) : (vector<8xbf16>, f32) -> vector<2xi32>
    %7 = "rocdl.cvt.scalef32.pk8.bf8.bf16"(%arg2, %arg3) : (vector<8xbf16>, f32) -> vector<2xi32>
    %8 = "rocdl.cvt.scalef32.pk8.fp4.bf16"(%arg2, %arg3) : (vector<8xbf16>, f32) -> i32
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (vector<8xf32>, vector<8xf16>, vector<8xbf16>, i32, f32)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.cvt.scalef32.sr.pk8", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: vector<8xf32>, %arg1: vector<8xf16>, %arg2: vector<8xbf16>, %arg3: i32, %arg4: f32):
    %0 = "rocdl.cvt.scalef32.sr.pk8.fp8.f32"(%arg0, %arg3, %arg4) : (vector<8xf32>, i32, f32) -> vector<2xi32>
    %1 = "rocdl.cvt.scalef32.sr.pk8.bf8.f32"(%arg0, %arg3, %arg4) : (vector<8xf32>, i32, f32) -> vector<2xi32>
    %2 = "rocdl.cvt.scalef32.sr.pk8.fp4.f32"(%arg0, %arg3, %arg4) : (vector<8xf32>, i32, f32) -> i32
    %3 = "rocdl.cvt.scalef32.sr.pk8.fp8.f16"(%arg1, %arg3, %arg4) : (vector<8xf16>, i32, f32) -> vector<2xi32>
    %4 = "rocdl.cvt.scalef32.sr.pk8.bf8.f16"(%arg1, %arg3, %arg4) : (vector<8xf16>, i32, f32) -> vector<2xi32>
    %5 = "rocdl.cvt.scalef32.sr.pk8.fp4.f16"(%arg1, %arg3, %arg4) : (vector<8xf16>, i32, f32) -> i32
    %6 = "rocdl.cvt.scalef32.sr.pk8.fp8.bf16"(%arg2, %arg3, %arg4) : (vector<8xbf16>, i32, f32) -> vector<2xi32>
    %7 = "rocdl.cvt.scalef32.sr.pk8.bf8.bf16"(%arg2, %arg3, %arg4) : (vector<8xbf16>, i32, f32) -> vector<2xi32>
    %8 = "rocdl.cvt.scalef32.sr.pk8.fp4.bf16"(%arg2, %arg3, %arg4) : (vector<8xbf16>, i32, f32) -> i32
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (vector<3xi32>, i32)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.cvt.scale.pk16", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: vector<3xi32>, %arg1: i32):
    %0 = "rocdl.cvt.scale.pk16.f16.fp6"(%arg0, %arg1) <{scaleSel = 0 : i32}> : (vector<3xi32>, i32) -> vector<16xf16>
    %1 = "rocdl.cvt.scale.pk16.bf16.fp6"(%arg0, %arg1) <{scaleSel = 0 : i32}> : (vector<3xi32>, i32) -> vector<16xbf16>
    %2 = "rocdl.cvt.scale.pk16.f32.fp6"(%arg0, %arg1) <{scaleSel = 0 : i32}> : (vector<3xi32>, i32) -> vector<16xf32>
    %3 = "rocdl.cvt.scale.pk16.f16.bf6"(%arg0, %arg1) <{scaleSel = 0 : i32}> : (vector<3xi32>, i32) -> vector<16xf16>
    %4 = "rocdl.cvt.scale.pk16.bf16.bf6"(%arg0, %arg1) <{scaleSel = 0 : i32}> : (vector<3xi32>, i32) -> vector<16xbf16>
    %5 = "rocdl.cvt.scale.pk16.f32.bf6"(%arg0, %arg1) <{scaleSel = 0 : i32}> : (vector<3xi32>, i32) -> vector<16xf32>
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (vector<16xf32>, vector<16xf16>, vector<16xbf16>, f32)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.cvt.scalef32.pk16", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: vector<16xf32>, %arg1: vector<16xf16>, %arg2: vector<16xbf16>, %arg3: f32):
    %0 = "rocdl.cvt.scalef32.pk16.fp6.f16"(%arg1, %arg3) : (vector<16xf16>, f32) -> vector<3xi32>
    %1 = "rocdl.cvt.scalef32.pk16.fp6.bf16"(%arg2, %arg3) : (vector<16xbf16>, f32) -> vector<3xi32>
    %2 = "rocdl.cvt.scalef32.pk16.fp6.f32"(%arg0, %arg3) : (vector<16xf32>, f32) -> vector<3xi32>
    %3 = "rocdl.cvt.scalef32.pk16.bf6.f16"(%arg1, %arg3) : (vector<16xf16>, f32) -> vector<3xi32>
    %4 = "rocdl.cvt.scalef32.pk16.bf6.bf16"(%arg2, %arg3) : (vector<16xbf16>, f32) -> vector<3xi32>
    %5 = "rocdl.cvt.scalef32.pk16.bf6.f32"(%arg0, %arg3) : (vector<16xf32>, f32) -> vector<3xi32>
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (vector<16xf32>, vector<16xf16>, vector<16xbf16>, i32, f32)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.cvt.scalef32.sr.pk16", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: vector<16xf32>, %arg1: vector<16xf16>, %arg2: vector<16xbf16>, %arg3: i32, %arg4: f32):
    %0 = "rocdl.cvt.scalef32.sr.pk16.fp6.f16"(%arg1, %arg3, %arg4) : (vector<16xf16>, i32, f32) -> vector<3xi32>
    %1 = "rocdl.cvt.scalef32.sr.pk16.fp6.bf16"(%arg2, %arg3, %arg4) : (vector<16xbf16>, i32, f32) -> vector<3xi32>
    %2 = "rocdl.cvt.scalef32.sr.pk16.fp6.f32"(%arg0, %arg3, %arg4) : (vector<16xf32>, i32, f32) -> vector<3xi32>
    %3 = "rocdl.cvt.scalef32.sr.pk16.bf6.f16"(%arg1, %arg3, %arg4) : (vector<16xf16>, i32, f32) -> vector<3xi32>
    %4 = "rocdl.cvt.scalef32.sr.pk16.bf6.bf16"(%arg2, %arg3, %arg4) : (vector<16xbf16>, i32, f32) -> vector<3xi32>
    %5 = "rocdl.cvt.scalef32.sr.pk16.bf6.f32"(%arg0, %arg3, %arg4) : (vector<16xf32>, i32, f32) -> vector<3xi32>
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (vector<8xi32>, vector<4xi32>, vector<4xf32>, vector<16xf32>, i32, i64)>, linkage = #llvm.linkage<external>, sym_name = "rocdl_wmma_scale_ops", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: vector<8xi32>, %arg1: vector<4xi32>, %arg2: vector<4xf32>, %arg3: vector<16xf32>, %arg4: i32, %arg5: i64):
    %0 = "rocdl.wmma.scale.f32.16x16x128.f8f6f4"(%arg0, %arg0, %arg2, %arg4, %arg4) <{fmtA = #rocdl<matrix_format fp4_e2m1>, fmtB = #rocdl<matrix_format fp4_e2m1>, fmtScaleA = #rocdl<wmma_matrix_scale_format e8>, fmtScaleB = #rocdl<wmma_matrix_scale_format e8>, modC = #rocdl<wmma_c_modifier none>, reuseA = false, reuseB = false, scaleAType = #rocdl<wmma_matrix_scale row0>, scaleBType = #rocdl<wmma_matrix_scale row0>}> : (vector<8xi32>, vector<8xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %1 = "rocdl.wmma.scale16.f32.16x16x128.f8f6f4"(%arg0, %arg0, %arg2, %arg5, %arg5) <{fmtA = #rocdl<matrix_format fp4_e2m1>, fmtB = #rocdl<matrix_format fp4_e2m1>, fmtScaleA = #rocdl<wmma_matrix_scale_format e8>, fmtScaleB = #rocdl<wmma_matrix_scale_format e8>, modC = #rocdl<wmma_c_modifier none>, reuseA = false, reuseB = false, scaleAType = #rocdl<wmma_matrix_scale row0>, scaleBType = #rocdl<wmma_matrix_scale row0>}> : (vector<8xi32>, vector<8xi32>, vector<4xf32>, i64, i64) -> vector<4xf32>
    %2 = "rocdl.wmma.scale.f32.32x16x128.f4"(%arg1, %arg1, %arg3, %arg4, %arg4) <{fmtScaleA = #rocdl<wmma_matrix_scale_format e8>, fmtScaleB = #rocdl<wmma_matrix_scale_format e8>, modC = #rocdl<wmma_c_modifier none>, reuseA = false, reuseB = false, scaleAType = #rocdl<wmma_matrix_scale row0>, scaleBType = #rocdl<wmma_matrix_scale row0>}> : (vector<4xi32>, vector<4xi32>, vector<16xf32>, i32, i32) -> vector<16xf32>
    %3 = "rocdl.wmma.scale16.f32.32x16x128.f4"(%arg1, %arg1, %arg3, %arg5, %arg5) <{fmtScaleA = #rocdl<wmma_matrix_scale_format e8>, fmtScaleB = #rocdl<wmma_matrix_scale_format e8>, modC = #rocdl<wmma_c_modifier none>, reuseA = false, reuseB = false, scaleAType = #rocdl<wmma_matrix_scale row0>, scaleBType = #rocdl<wmma_matrix_scale row0>}> : (vector<4xi32>, vector<4xi32>, vector<16xf32>, i64, i64) -> vector<16xf32>
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<8xf32> (vector<32xf16>, vector<32xbf16>, vector<16xf16>, vector<16xbf16>, vector<16xi32>, vector<16xi16>, vector<8xf32>, vector<8xi32>, vector<8xf16>, vector<8xbf16>, vector<8xi16>, vector<4xf32>, vector<4xf16>, vector<4xi32>, vector<4xi16>, vector<2xi32>, i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.swmmac", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: vector<32xf16>, %arg1: vector<32xbf16>, %arg2: vector<16xf16>, %arg3: vector<16xbf16>, %arg4: vector<16xi32>, %arg5: vector<16xi16>, %arg6: vector<8xf32>, %arg7: vector<8xi32>, %arg8: vector<8xf16>, %arg9: vector<8xbf16>, %arg10: vector<8xi16>, %arg11: vector<4xf32>, %arg12: vector<4xf16>, %arg13: vector<4xi32>, %arg14: vector<4xi16>, %arg15: vector<2xi32>, %arg16: i32, %arg17: i32):
    %0 = "rocdl.swmmac.f32.16x16x32.f16"(%arg8, %arg2, %arg6, %arg17) : (vector<8xf16>, vector<16xf16>, vector<8xf32>, i32) -> vector<8xf32>
    %1 = "rocdl.swmmac.f32.16x16x32.bf16"(%arg10, %arg5, %arg6, %arg17) : (vector<8xi16>, vector<16xi16>, vector<8xf32>, i32) -> vector<8xf32>
    %2 = "rocdl.swmmac.f16.16x16x32.f16"(%arg8, %arg2, %arg8, %arg17) : (vector<8xf16>, vector<16xf16>, vector<8xf16>, i32) -> vector<8xf16>
    %3 = "rocdl.swmmac.bf16.16x16x32.bf16"(%arg10, %arg5, %arg10, %arg17) : (vector<8xi16>, vector<16xi16>, vector<8xi16>, i32) -> vector<8xi16>
    %4 = "rocdl.swmmac.i32.16x16x32.iu8"(%arg15, %arg13, %arg7, %arg17) <{clamp = false, signA = false, signB = false}> : (vector<2xi32>, vector<4xi32>, vector<8xi32>, i32) -> vector<8xi32>
    %5 = "rocdl.swmmac.i32.16x16x32.iu4"(%arg16, %arg15, %arg7, %arg17) <{clamp = false, signA = false, signB = false}> : (i32, vector<2xi32>, vector<8xi32>, i32) -> vector<8xi32>
    %6 = "rocdl.swmmac.i32.16x16x64.iu4"(%arg15, %arg13, %arg7, %arg17) <{clamp = false, signA = false, signB = false}> : (vector<2xi32>, vector<4xi32>, vector<8xi32>, i32) -> vector<8xi32>
    %7 = "rocdl.swmmac.f32.16x16x32.fp8.fp8"(%arg15, %arg13, %arg6, %arg17) : (vector<2xi32>, vector<4xi32>, vector<8xf32>, i32) -> vector<8xf32>
    %8 = "rocdl.swmmac.f32.16x16x32.fp8.bf8"(%arg15, %arg13, %arg6, %arg17) : (vector<2xi32>, vector<4xi32>, vector<8xf32>, i32) -> vector<8xf32>
    %9 = "rocdl.swmmac.f32.16x16x32.bf8.fp8"(%arg15, %arg13, %arg6, %arg17) : (vector<2xi32>, vector<4xi32>, vector<8xf32>, i32) -> vector<8xf32>
    %10 = "rocdl.swmmac.f32.16x16x32.bf8.bf8"(%arg15, %arg13, %arg6, %arg17) : (vector<2xi32>, vector<4xi32>, vector<8xf32>, i32) -> vector<8xf32>
    %11 = "rocdl.swmmac.f32.16x16x64.f16"(%arg2, %arg0, %arg6, %arg17) <{reuseA = false, reuseB = false, signA = false, signB = false}> : (vector<16xf16>, vector<32xf16>, vector<8xf32>, i32) -> vector<8xf32>
    %12 = "rocdl.swmmac.f32.16x16x64.bf16"(%arg3, %arg1, %arg6, %arg17) <{reuseA = false, reuseB = false, signA = false, signB = false}> : (vector<16xbf16>, vector<32xbf16>, vector<8xf32>, i32) -> vector<8xf32>
    %13 = "rocdl.swmmac.f16.16x16x64.f16"(%arg2, %arg0, %arg8, %arg17) <{reuseA = false, reuseB = false, signA = false, signB = false}> : (vector<16xf16>, vector<32xf16>, vector<8xf16>, i32) -> vector<8xf16>
    %14 = "rocdl.swmmac.bf16.16x16x64.bf16"(%arg3, %arg1, %arg9, %arg17) <{reuseA = false, reuseB = false, signA = false, signB = false}> : (vector<16xbf16>, vector<32xbf16>, vector<8xbf16>, i32) -> vector<8xbf16>
    %15 = "rocdl.swmmac.bf16f32.16x16x64.bf16"(%arg3, %arg1, %arg9, %arg17) <{reuseA = false, reuseB = false, signA = false, signB = false}> : (vector<16xbf16>, vector<32xbf16>, vector<8xbf16>, i32) -> vector<8xbf16>
    %16 = "rocdl.swmmac.f32.16x16x128.fp8.fp8"(%arg7, %arg4, %arg6, %arg17) <{reuseA = false, reuseB = false}> : (vector<8xi32>, vector<16xi32>, vector<8xf32>, i32) -> vector<8xf32>
    %17 = "rocdl.swmmac.f32.16x16x128.fp8.bf8"(%arg7, %arg4, %arg6, %arg17) <{reuseA = false, reuseB = false}> : (vector<8xi32>, vector<16xi32>, vector<8xf32>, i32) -> vector<8xf32>
    %18 = "rocdl.swmmac.f32.16x16x128.bf8.fp8"(%arg7, %arg4, %arg6, %arg17) <{reuseA = false, reuseB = false}> : (vector<8xi32>, vector<16xi32>, vector<8xf32>, i32) -> vector<8xf32>
    %19 = "rocdl.swmmac.f32.16x16x128.bf8.bf8"(%arg7, %arg4, %arg6, %arg17) <{reuseA = false, reuseB = false}> : (vector<8xi32>, vector<16xi32>, vector<8xf32>, i32) -> vector<8xf32>
    %20 = "rocdl.swmmac.f16.16x16x128.fp8.fp8"(%arg7, %arg4, %arg8, %arg17) <{reuseA = false, reuseB = false}> : (vector<8xi32>, vector<16xi32>, vector<8xf16>, i32) -> vector<8xf16>
    %21 = "rocdl.swmmac.f16.16x16x128.fp8.bf8"(%arg7, %arg4, %arg8, %arg17) <{reuseA = false, reuseB = false}> : (vector<8xi32>, vector<16xi32>, vector<8xf16>, i32) -> vector<8xf16>
    %22 = "rocdl.swmmac.f16.16x16x128.bf8.fp8"(%arg7, %arg4, %arg8, %arg17) <{reuseA = false, reuseB = false}> : (vector<8xi32>, vector<16xi32>, vector<8xf16>, i32) -> vector<8xf16>
    %23 = "rocdl.swmmac.f16.16x16x128.bf8.bf8"(%arg7, %arg4, %arg8, %arg17) <{reuseA = false, reuseB = false}> : (vector<8xi32>, vector<16xi32>, vector<8xf16>, i32) -> vector<8xf16>
    %24 = "rocdl.swmmac.i32.16x16x128.iu8"(%arg7, %arg4, %arg7, %arg17) <{clamp = false, reuseA = false, reuseB = false, signA = false, signB = false}> : (vector<8xi32>, vector<16xi32>, vector<8xi32>, i32) -> vector<8xi32>
    %25 = "rocdl.swmmac.f32.16x16x32.f16"(%arg12, %arg8, %arg11, %arg17) : (vector<4xf16>, vector<8xf16>, vector<4xf32>, i32) -> vector<4xf32>
    %26 = "rocdl.swmmac.f32.16x16x32.bf16"(%arg14, %arg10, %arg11, %arg17) : (vector<4xi16>, vector<8xi16>, vector<4xf32>, i32) -> vector<4xf32>
    %27 = "rocdl.swmmac.f16.16x16x32.f16"(%arg12, %arg8, %arg12, %arg17) : (vector<4xf16>, vector<8xf16>, vector<4xf16>, i32) -> vector<4xf16>
    %28 = "rocdl.swmmac.bf16.16x16x32.bf16"(%arg14, %arg10, %arg14, %arg17) : (vector<4xi16>, vector<8xi16>, vector<4xi16>, i32) -> vector<4xi16>
    %29 = "rocdl.swmmac.i32.16x16x32.iu8"(%arg16, %arg15, %arg13, %arg17) <{clamp = false, signA = false, signB = false}> : (i32, vector<2xi32>, vector<4xi32>, i32) -> vector<4xi32>
    %30 = "rocdl.swmmac.i32.16x16x32.iu4"(%arg16, %arg16, %arg13, %arg17) <{clamp = false, signA = false, signB = false}> : (i32, i32, vector<4xi32>, i32) -> vector<4xi32>
    %31 = "rocdl.swmmac.i32.16x16x64.iu4"(%arg16, %arg15, %arg13, %arg17) <{clamp = false, signA = false, signB = false}> : (i32, vector<2xi32>, vector<4xi32>, i32) -> vector<4xi32>
    %32 = "rocdl.swmmac.f32.16x16x32.fp8.fp8"(%arg16, %arg15, %arg11, %arg17) : (i32, vector<2xi32>, vector<4xf32>, i32) -> vector<4xf32>
    %33 = "rocdl.swmmac.f32.16x16x32.fp8.bf8"(%arg16, %arg15, %arg11, %arg17) : (i32, vector<2xi32>, vector<4xf32>, i32) -> vector<4xf32>
    %34 = "rocdl.swmmac.f32.16x16x32.bf8.fp8"(%arg16, %arg15, %arg11, %arg17) : (i32, vector<2xi32>, vector<4xf32>, i32) -> vector<4xf32>
    %35 = "rocdl.swmmac.f32.16x16x32.bf8.bf8"(%arg16, %arg15, %arg11, %arg17) : (i32, vector<2xi32>, vector<4xf32>, i32) -> vector<4xf32>
    "llvm.return"(%0) : (vector<8xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<f32 (vector<2xf16>, vector<2xbf16>, f16, bf16, f32)>, linkage = #llvm.linkage<external>, sym_name = "rocdl_dot_fdot2_family", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: vector<2xf16>, %arg1: vector<2xbf16>, %arg2: f16, %arg3: bf16, %arg4: f32):
    %0 = "rocdl.fdot2"(%arg0, %arg0, %arg4) <{clamp = false}> : (vector<2xf16>, vector<2xf16>, f32) -> f32
    %1 = "rocdl.fdot2"(%arg0, %arg0, %arg4) <{clamp = true}> : (vector<2xf16>, vector<2xf16>, f32) -> f32
    %2 = "rocdl.fdot2.f32.bf16"(%arg1, %arg1, %arg4) <{clamp = false}> : (vector<2xbf16>, vector<2xbf16>, f32) -> f32
    %3 = "rocdl.fdot2.f32.bf16"(%arg1, %arg1, %arg4) <{clamp = true}> : (vector<2xbf16>, vector<2xbf16>, f32) -> f32
    %4 = "rocdl.fdot2.f16.f16"(%arg0, %arg0, %arg2) : (vector<2xf16>, vector<2xf16>, f16) -> f16
    %5 = "rocdl.fdot2.bf16.bf16"(%arg1, %arg1, %arg3) : (vector<2xbf16>, vector<2xbf16>, bf16) -> bf16
    "llvm.return"(%0) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (vector<2xi16>, i32)>, linkage = #llvm.linkage<external>, sym_name = "rocdl_dot_sdot_udot_family", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: vector<2xi16>, %arg1: i32):
    %0 = "rocdl.sdot2"(%arg0, %arg0, %arg1) <{clamp = false}> : (vector<2xi16>, vector<2xi16>, i32) -> i32
    %1 = "rocdl.sdot2"(%arg0, %arg0, %arg1) <{clamp = true}> : (vector<2xi16>, vector<2xi16>, i32) -> i32
    %2 = "rocdl.udot2"(%arg0, %arg0, %arg1) <{clamp = false}> : (vector<2xi16>, vector<2xi16>, i32) -> i32
    %3 = "rocdl.udot2"(%arg0, %arg0, %arg1) <{clamp = true}> : (vector<2xi16>, vector<2xi16>, i32) -> i32
    %4 = "rocdl.sdot4"(%arg1, %arg1, %arg1) <{clamp = false}> : (i32, i32, i32) -> i32
    %5 = "rocdl.sdot4"(%arg1, %arg1, %arg1) <{clamp = true}> : (i32, i32, i32) -> i32
    %6 = "rocdl.udot4"(%arg1, %arg1, %arg1) <{clamp = false}> : (i32, i32, i32) -> i32
    %7 = "rocdl.udot4"(%arg1, %arg1, %arg1) <{clamp = true}> : (i32, i32, i32) -> i32
    %8 = "rocdl.sdot8"(%arg1, %arg1, %arg1) <{clamp = false}> : (i32, i32, i32) -> i32
    %9 = "rocdl.sdot8"(%arg1, %arg1, %arg1) <{clamp = true}> : (i32, i32, i32) -> i32
    %10 = "rocdl.udot8"(%arg1, %arg1, %arg1) <{clamp = false}> : (i32, i32, i32) -> i32
    %11 = "rocdl.udot8"(%arg1, %arg1, %arg1) <{clamp = true}> : (i32, i32, i32) -> i32
    "llvm.return"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (i32)>, linkage = #llvm.linkage<external>, sym_name = "rocdl_dot_sudot_family", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i32):
    %0 = "rocdl.sudot4"(%arg0, %arg0, %arg0) <{clamp = false, signA = false, signB = false}> : (i32, i32, i32) -> i32
    %1 = "rocdl.sudot4"(%arg0, %arg0, %arg0) <{clamp = false, signA = true, signB = false}> : (i32, i32, i32) -> i32
    %2 = "rocdl.sudot4"(%arg0, %arg0, %arg0) <{clamp = false, signA = false, signB = true}> : (i32, i32, i32) -> i32
    %3 = "rocdl.sudot4"(%arg0, %arg0, %arg0) <{clamp = true, signA = true, signB = true}> : (i32, i32, i32) -> i32
    %4 = "rocdl.sudot8"(%arg0, %arg0, %arg0) <{clamp = false, signA = false, signB = false}> : (i32, i32, i32) -> i32
    %5 = "rocdl.sudot8"(%arg0, %arg0, %arg0) <{clamp = false, signA = true, signB = false}> : (i32, i32, i32) -> i32
    %6 = "rocdl.sudot8"(%arg0, %arg0, %arg0) <{clamp = false, signA = false, signB = true}> : (i32, i32, i32) -> i32
    %7 = "rocdl.sudot8"(%arg0, %arg0, %arg0) <{clamp = true, signA = true, signB = true}> : (i32, i32, i32) -> i32
    "llvm.return"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<f32 (i32, f32)>, linkage = #llvm.linkage<external>, sym_name = "rocdl_dot_fp8_family", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i32, %arg1: f32):
    %0 = "rocdl.dot4.f32.fp8.fp8"(%arg0, %arg0, %arg1) : (i32, i32, f32) -> f32
    %1 = "rocdl.dot4.f32.fp8.bf8"(%arg0, %arg0, %arg1) : (i32, i32, f32) -> f32
    %2 = "rocdl.dot4.f32.bf8.fp8"(%arg0, %arg0, %arg1) : (i32, i32, f32) -> f32
    %3 = "rocdl.dot4.f32.bf8.bf8"(%arg0, %arg0, %arg1) : (i32, i32, f32) -> f32
    "llvm.return"(%0) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "module_oob_modes"}> ({
    "llvm.module_flags"() <{flags = [#rocdl.buffer_oob_mode_flag<relaxed>, #rocdl.tbuffer_oob_mode_flag<strict>]}> : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "module_1", targets = [#rocdl.target<O = 1, abi = "500", flags = {daz, fast, unsafe_math}, link = ["my_device_lib.bc"]>]}> ({
  ^bb0:
  }) : () -> ()
  "gpu.module"() <{sym_name = "module_2", targets = [#rocdl.target, #rocdl.target<chip = "gfx90a">]}> ({
  ^bb0:
  }) : () -> ()
  "gpu.module"() <{sym_name = "module_3", targets = [#rocdl.target<O = 1, flags = {daz, fast, unsafe_math}, link = ["my_device_lib.bc"]>]}> ({
  ^bb0:
  }) : () -> ()
}) : () -> ()

