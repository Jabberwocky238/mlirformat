"builtin.module"() ({
  "func.func"() <{function_type = () -> i32, sym_name = "rocdl_special_regs"}> ({
    %172 = "rocdl.workitem.id.x"() : () -> i32
    %173 = "rocdl.workitem.id.y"() : () -> i32
    %174 = "rocdl.workitem.id.z"() : () -> i32
    %175 = "rocdl.workgroup.id.x"() : () -> i32
    %176 = "rocdl.workgroup.id.y"() : () -> i32
    %177 = "rocdl.workgroup.id.z"() : () -> i32
    %178 = "rocdl.cluster.id.x"() : () -> i32
    %179 = "rocdl.cluster.id.y"() : () -> i32
    %180 = "rocdl.cluster.id.z"() : () -> i32
    %181 = "rocdl.workgroup.dim.x"() : () -> i32
    %182 = "rocdl.workgroup.dim.y"() : () -> i32
    %183 = "rocdl.workgroup.dim.z"() : () -> i32
    %184 = "rocdl.grid.dim.x"() : () -> i32
    %185 = "rocdl.grid.dim.y"() : () -> i32
    %186 = "rocdl.grid.dim.z"() : () -> i32
    "llvm.return"(%172) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, f32, f32) -> f32, sym_name = "rocdl.fmed3.scalar"}> ({
  ^bb0(%arg101: f32, %arg102: f32, %arg103: f32):
    %171 = "rocdl.fmed3"(%arg101, %arg102, %arg103) : (f32, f32, f32) -> f32
    "llvm.return"(%171) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xf16>, vector<4xf16>, vector<4xf16>) -> vector<4xf16>, sym_name = "rocdl.fmed3.vector"}> ({
  ^bb0(%arg98: vector<4xf16>, %arg99: vector<4xf16>, %arg100: vector<4xf16>):
    %170 = "rocdl.fmed3"(%arg98, %arg99, %arg100) : (vector<4xf16>, vector<4xf16>, vector<4xf16>) -> vector<4xf16>
    "llvm.return"(%170) : (vector<4xf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, f16, bf16) -> (), sym_name = "rocdl.math.ops"}> ({
  ^bb0(%arg95: f32, %arg96: f16, %arg97: bf16):
    %149 = "rocdl.tanh"(%arg95) : (f32) -> f32
    %150 = "rocdl.tanh"(%arg96) : (f16) -> f16
    %151 = "rocdl.tanh"(%arg97) : (bf16) -> bf16
    %152 = "rocdl.sin"(%arg95) : (f32) -> f32
    %153 = "rocdl.sin"(%arg96) : (f16) -> f16
    %154 = "rocdl.sin"(%arg97) : (bf16) -> bf16
    %155 = "rocdl.cos"(%arg95) : (f32) -> f32
    %156 = "rocdl.cos"(%arg96) : (f16) -> f16
    %157 = "rocdl.cos"(%arg97) : (bf16) -> bf16
    %158 = "rocdl.rcp"(%arg95) : (f32) -> f32
    %159 = "rocdl.rcp"(%arg96) : (f16) -> f16
    %160 = "rocdl.rcp"(%arg97) : (bf16) -> bf16
    %161 = "rocdl.exp2"(%arg95) : (f32) -> f32
    %162 = "rocdl.exp2"(%arg96) : (f16) -> f16
    %163 = "rocdl.exp2"(%arg97) : (bf16) -> bf16
    %164 = "rocdl.log"(%arg95) : (f32) -> f32
    %165 = "rocdl.log"(%arg96) : (f16) -> f16
    %166 = "rocdl.log"(%arg97) : (bf16) -> bf16
    %167 = "rocdl.sqrt"(%arg95) : (f32) -> f32
    %168 = "rocdl.sqrt"(%arg96) : (f16) -> f16
    %169 = "rocdl.sqrt"(%arg97) : (bf16) -> bf16
    "llvm.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "rocdl.barrier"}> ({
    "rocdl.barrier"() : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "rocdl.sched_barrier"}> ({
    "rocdl.sched.barrier"() <{mask = 0 : i32}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "rocdl_sched_group_barrier"}> ({
    "rocdl.sched.group.barrier"() <{groupId = 0 : i32, mask = 8 : i32, size = 1 : i32}> : () -> ()
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
  ^bb0(%arg77: f32, %arg78: f32, %arg79: vector<32xf32>, %arg80: i32, %arg81: vector<16xf32>, %arg82: vector<4xf32>, %arg83: vector<4xf16>, %arg84: vector<32xi32>, %arg85: vector<16xi32>, %arg86: vector<4xi32>, %arg87: vector<2xi16>, %arg88: vector<4xi16>, %arg89: vector<4xf64>, %arg90: f64, %arg91: i64, %arg92: vector<2xf32>, %arg93: vector<8xbf16>, %arg94: vector<8xf16>):
    %112 = "rocdl.mfma.f32.32x32x1f32"(%arg77, %arg78, %arg79, %arg80, %arg80, %arg80) : (f32, f32, vector<32xf32>, i32, i32, i32) -> vector<32xf32>
    %113 = "rocdl.mfma.f32.16x16x1f32"(%arg77, %arg78, %arg81, %arg80, %arg80, %arg80) : (f32, f32, vector<16xf32>, i32, i32, i32) -> vector<16xf32>
    %114 = "rocdl.mfma.f32.4x4x1f32"(%arg77, %arg78, %arg82, %arg80, %arg80, %arg80) : (f32, f32, vector<4xf32>, i32, i32, i32) -> vector<4xf32>
    %115 = "rocdl.mfma.f32.32x32x2f32"(%arg77, %arg78, %arg81, %arg80, %arg80, %arg80) : (f32, f32, vector<16xf32>, i32, i32, i32) -> vector<16xf32>
    %116 = "rocdl.mfma.f32.16x16x4f32"(%arg77, %arg78, %arg82, %arg80, %arg80, %arg80) : (f32, f32, vector<4xf32>, i32, i32, i32) -> vector<4xf32>
    %117 = "rocdl.mfma.f32.32x32x4f16"(%arg83, %arg83, %arg79, %arg80, %arg80, %arg80) : (vector<4xf16>, vector<4xf16>, vector<32xf32>, i32, i32, i32) -> vector<32xf32>
    %118 = "rocdl.mfma.f32.16x16x4f16"(%arg83, %arg83, %arg81, %arg80, %arg80, %arg80) : (vector<4xf16>, vector<4xf16>, vector<16xf32>, i32, i32, i32) -> vector<16xf32>
    %119 = "rocdl.mfma.f32.4x4x4f16"(%arg83, %arg83, %arg82, %arg80, %arg80, %arg80) : (vector<4xf16>, vector<4xf16>, vector<4xf32>, i32, i32, i32) -> vector<4xf32>
    %120 = "rocdl.mfma.f32.32x32x8f16"(%arg83, %arg83, %arg81, %arg80, %arg80, %arg80) : (vector<4xf16>, vector<4xf16>, vector<16xf32>, i32, i32, i32) -> vector<16xf32>
    %121 = "rocdl.mfma.f32.16x16x16f16"(%arg83, %arg83, %arg82, %arg80, %arg80, %arg80) : (vector<4xf16>, vector<4xf16>, vector<4xf32>, i32, i32, i32) -> vector<4xf32>
    %122 = "rocdl.mfma.i32.32x32x4i8"(%arg80, %arg80, %arg84, %arg80, %arg80, %arg80) : (i32, i32, vector<32xi32>, i32, i32, i32) -> vector<32xi32>
    %123 = "rocdl.mfma.i32.16x16x4i8"(%arg80, %arg80, %arg85, %arg80, %arg80, %arg80) : (i32, i32, vector<16xi32>, i32, i32, i32) -> vector<16xi32>
    %124 = "rocdl.mfma.i32.4x4x4i8"(%arg80, %arg80, %arg86, %arg80, %arg80, %arg80) : (i32, i32, vector<4xi32>, i32, i32, i32) -> vector<4xi32>
    %125 = "rocdl.mfma.i32.32x32x8i8"(%arg80, %arg80, %arg85, %arg80, %arg80, %arg80) : (i32, i32, vector<16xi32>, i32, i32, i32) -> vector<16xi32>
    %126 = "rocdl.mfma.i32.16x16x16i8"(%arg80, %arg80, %arg86, %arg80, %arg80, %arg80) : (i32, i32, vector<4xi32>, i32, i32, i32) -> vector<4xi32>
    %127 = "rocdl.mfma.f32.32x32x2bf16"(%arg87, %arg87, %arg79, %arg80, %arg80, %arg80) : (vector<2xi16>, vector<2xi16>, vector<32xf32>, i32, i32, i32) -> vector<32xf32>
    %128 = "rocdl.mfma.f32.16x16x2bf16"(%arg87, %arg87, %arg81, %arg80, %arg80, %arg80) : (vector<2xi16>, vector<2xi16>, vector<16xf32>, i32, i32, i32) -> vector<16xf32>
    %129 = "rocdl.mfma.f32.4x4x2bf16"(%arg87, %arg87, %arg82, %arg80, %arg80, %arg80) : (vector<2xi16>, vector<2xi16>, vector<4xf32>, i32, i32, i32) -> vector<4xf32>
    %130 = "rocdl.mfma.f32.32x32x4bf16"(%arg87, %arg87, %arg81, %arg80, %arg80, %arg80) : (vector<2xi16>, vector<2xi16>, vector<16xf32>, i32, i32, i32) -> vector<16xf32>
    %131 = "rocdl.mfma.f32.16x16x8bf16"(%arg87, %arg87, %arg82, %arg80, %arg80, %arg80) : (vector<2xi16>, vector<2xi16>, vector<4xf32>, i32, i32, i32) -> vector<4xf32>
    %132 = "rocdl.mfma.f32.32x32x4bf16.1k"(%arg88, %arg88, %arg79, %arg80, %arg80, %arg80) : (vector<4xi16>, vector<4xi16>, vector<32xf32>, i32, i32, i32) -> vector<32xf32>
    %133 = "rocdl.mfma.f32.16x16x4bf16.1k"(%arg88, %arg88, %arg81, %arg80, %arg80, %arg80) : (vector<4xi16>, vector<4xi16>, vector<16xf32>, i32, i32, i32) -> vector<16xf32>
    %134 = "rocdl.mfma.f32.4x4x4bf16.1k"(%arg88, %arg88, %arg82, %arg80, %arg80, %arg80) : (vector<4xi16>, vector<4xi16>, vector<4xf32>, i32, i32, i32) -> vector<4xf32>
    %135 = "rocdl.mfma.f32.32x32x8bf16.1k"(%arg88, %arg88, %arg81, %arg80, %arg80, %arg80) : (vector<4xi16>, vector<4xi16>, vector<16xf32>, i32, i32, i32) -> vector<16xf32>
    %136 = "rocdl.mfma.f32.16x16x16bf16.1k"(%arg88, %arg88, %arg82, %arg80, %arg80, %arg80) : (vector<4xi16>, vector<4xi16>, vector<4xf32>, i32, i32, i32) -> vector<4xf32>
    %137 = "rocdl.mfma.f64.16x16x4f64"(%arg90, %arg90, %arg89, %arg80, %arg80, %arg80) : (f64, f64, vector<4xf64>, i32, i32, i32) -> vector<4xf64>
    %138 = "rocdl.mfma.f64.4x4x4f64"(%arg90, %arg90, %arg90, %arg80, %arg80, %arg80) : (f64, f64, f64, i32, i32, i32) -> f64
    %139 = "rocdl.mfma.i32.16x16x32.i8"(%arg91, %arg91, %arg86, %arg80, %arg80, %arg80) : (i64, i64, vector<4xi32>, i32, i32, i32) -> vector<4xi32>
    %140 = "rocdl.mfma.i32.32x32x16.i8"(%arg91, %arg91, %arg85, %arg80, %arg80, %arg80) : (i64, i64, vector<16xi32>, i32, i32, i32) -> vector<16xi32>
    %141 = "rocdl.mfma.f32.16x16x8.xf32"(%arg92, %arg92, %arg82, %arg80, %arg80, %arg80) : (vector<2xf32>, vector<2xf32>, vector<4xf32>, i32, i32, i32) -> vector<4xf32>
    %142 = "rocdl.mfma.f32.32x32x4.xf32"(%arg92, %arg92, %arg81, %arg80, %arg80, %arg80) : (vector<2xf32>, vector<2xf32>, vector<16xf32>, i32, i32, i32) -> vector<16xf32>
    %143 = "rocdl.mfma.f32.16x16x32.bf16"(%arg93, %arg93, %arg82, %arg80, %arg80, %arg80) : (vector<8xbf16>, vector<8xbf16>, vector<4xf32>, i32, i32, i32) -> vector<4xf32>
    %144 = "rocdl.mfma.i32.16x16x64.i8"(%arg86, %arg86, %arg86, %arg80, %arg80, %arg80) : (vector<4xi32>, vector<4xi32>, vector<4xi32>, i32, i32, i32) -> vector<4xi32>
    %145 = "rocdl.mfma.f32.16x16x32.f16"(%arg94, %arg94, %arg82, %arg80, %arg80, %arg80) : (vector<8xf16>, vector<8xf16>, vector<4xf32>, i32, i32, i32) -> vector<4xi32>
    %146 = "rocdl.mfma.f32.32x32x16.bf16"(%arg93, %arg93, %arg81, %arg80, %arg80, %arg80) : (vector<8xbf16>, vector<8xbf16>, vector<16xf32>, i32, i32, i32) -> vector<16xf32>
    %147 = "rocdl.mfma.i32.32x32x32.i8"(%arg86, %arg86, %arg85, %arg80, %arg80, %arg80) : (vector<4xi32>, vector<4xi32>, vector<16xi32>, i32, i32, i32) -> vector<16xi32>
    %148 = "rocdl.mfma.f32.32x32x16.f16"(%arg94, %arg94, %arg81, %arg80, %arg80, %arg80) : (vector<8xf16>, vector<8xf16>, vector<16xf32>, i32, i32, i32) -> vector<16xf32>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<4xf32> (i32, vector<4xf16>, vector<8xf16>, vector<4xf32>, vector<16xf32>, vector<4xi16>, vector<8xi16>, vector<2xi32>, vector<4xi32>, vector<16xi32>, vector<16xf16>, vector<8xbf16>, vector<16xbf16>, vector<8xi32>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.smfmac", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg63: i32, %arg64: vector<4xf16>, %arg65: vector<8xf16>, %arg66: vector<4xf32>, %arg67: vector<16xf32>, %arg68: vector<4xi16>, %arg69: vector<8xi16>, %arg70: vector<2xi32>, %arg71: vector<4xi32>, %arg72: vector<16xi32>, %arg73: vector<16xf16>, %arg74: vector<8xbf16>, %arg75: vector<16xbf16>, %arg76: vector<8xi32>):
    %83 = "llvm.mlir.constant"() <{value = 42 : i32}> : () -> i32
    %84 = "rocdl.smfmac.f32.16x16x32.f16"(%arg64, %arg65, %arg66, %83, %83, %83) : (vector<4xf16>, vector<8xf16>, vector<4xf32>, i32, i32, i32) -> vector<4xf32>
    %85 = "rocdl.smfmac.f32.32x32x16.f16"(%arg64, %arg65, %arg67, %83, %83, %83) : (vector<4xf16>, vector<8xf16>, vector<16xf32>, i32, i32, i32) -> vector<16xf32>
    %86 = "rocdl.smfmac.f32.16x16x32.bf16"(%arg68, %arg69, %arg66, %83, %83, %83) : (vector<4xi16>, vector<8xi16>, vector<4xf32>, i32, i32, i32) -> vector<4xf32>
    %87 = "rocdl.smfmac.f32.32x32x16.bf16"(%arg68, %arg69, %arg67, %83, %83, %83) : (vector<4xi16>, vector<8xi16>, vector<16xf32>, i32, i32, i32) -> vector<16xf32>
    %88 = "rocdl.smfmac.i32.16x16x64.i8"(%arg70, %arg71, %arg71, %83, %83, %83) : (vector<2xi32>, vector<4xi32>, vector<4xi32>, i32, i32, i32) -> vector<4xi32>
    %89 = "rocdl.smfmac.i32.32x32x32.i8"(%arg70, %arg71, %arg72, %83, %83, %83) : (vector<2xi32>, vector<4xi32>, vector<16xi32>, i32, i32, i32) -> vector<16xi32>
    %90 = "rocdl.smfmac.f32.16x16x64.bf8.bf8"(%arg70, %arg71, %arg66, %83, %83, %83) : (vector<2xi32>, vector<4xi32>, vector<4xf32>, i32, i32, i32) -> vector<4xf32>
    %91 = "rocdl.smfmac.f32.16x16x64.bf8.fp8"(%arg70, %arg71, %arg66, %83, %83, %83) : (vector<2xi32>, vector<4xi32>, vector<4xf32>, i32, i32, i32) -> vector<4xf32>
    %92 = "rocdl.smfmac.f32.16x16x64.fp8.bf8"(%arg70, %arg71, %arg66, %83, %83, %83) : (vector<2xi32>, vector<4xi32>, vector<4xf32>, i32, i32, i32) -> vector<4xf32>
    %93 = "rocdl.smfmac.f32.16x16x64.fp8.fp8"(%arg70, %arg71, %arg66, %83, %83, %83) : (vector<2xi32>, vector<4xi32>, vector<4xf32>, i32, i32, i32) -> vector<4xf32>
    %94 = "rocdl.smfmac.f32.32x32x32.bf8.bf8"(%arg70, %arg71, %arg67, %83, %83, %83) : (vector<2xi32>, vector<4xi32>, vector<16xf32>, i32, i32, i32) -> vector<16xf32>
    %95 = "rocdl.smfmac.f32.32x32x32.bf8.fp8"(%arg70, %arg71, %arg67, %83, %83, %83) : (vector<2xi32>, vector<4xi32>, vector<16xf32>, i32, i32, i32) -> vector<16xf32>
    %96 = "rocdl.smfmac.f32.32x32x32.fp8.bf8"(%arg70, %arg71, %arg67, %83, %83, %83) : (vector<2xi32>, vector<4xi32>, vector<16xf32>, i32, i32, i32) -> vector<16xf32>
    %97 = "rocdl.smfmac.f32.32x32x32.fp8.fp8"(%arg70, %arg71, %arg67, %83, %83, %83) : (vector<2xi32>, vector<4xi32>, vector<16xf32>, i32, i32, i32) -> vector<16xf32>
    %98 = "rocdl.smfmac.f32.16x16x64.f16"(%arg65, %arg73, %arg66, %83, %83, %83) : (vector<8xf16>, vector<16xf16>, vector<4xf32>, i32, i32, i32) -> vector<4xf32>
    %99 = "rocdl.smfmac.f32.32x32x32.f16"(%arg65, %arg73, %arg67, %83, %83, %83) : (vector<8xf16>, vector<16xf16>, vector<16xf32>, i32, i32, i32) -> vector<16xf32>
    %100 = "rocdl.smfmac.f32.16x16x64.bf16"(%arg74, %arg75, %arg66, %83, %83, %83) : (vector<8xbf16>, vector<16xbf16>, vector<4xf32>, i32, i32, i32) -> vector<4xf32>
    %101 = "rocdl.smfmac.f32.32x32x32.bf16"(%arg74, %arg75, %arg67, %83, %83, %83) : (vector<8xbf16>, vector<16xbf16>, vector<16xf32>, i32, i32, i32) -> vector<16xf32>
    %102 = "rocdl.smfmac.i32.16x16x128.i8"(%arg71, %arg76, %arg71, %83, %83, %83) : (vector<4xi32>, vector<8xi32>, vector<4xi32>, i32, i32, i32) -> vector<4xi32>
    %103 = "rocdl.smfmac.f32.16x16x128.bf8.bf8"(%arg71, %arg76, %arg66, %83, %83, %83) : (vector<4xi32>, vector<8xi32>, vector<4xf32>, i32, i32, i32) -> vector<4xf32>
    %104 = "rocdl.smfmac.f32.16x16x128.bf8.fp8"(%arg71, %arg76, %arg66, %83, %83, %83) : (vector<4xi32>, vector<8xi32>, vector<4xf32>, i32, i32, i32) -> vector<4xf32>
    %105 = "rocdl.smfmac.f32.16x16x128.fp8.bf8"(%arg71, %arg76, %arg66, %83, %83, %83) : (vector<4xi32>, vector<8xi32>, vector<4xf32>, i32, i32, i32) -> vector<4xf32>
    %106 = "rocdl.smfmac.f32.16x16x128.fp8.fp8"(%arg71, %arg76, %arg66, %83, %83, %83) : (vector<4xi32>, vector<8xi32>, vector<4xf32>, i32, i32, i32) -> vector<4xf32>
    %107 = "rocdl.smfmac.i32.32x32x64.i8"(%arg71, %arg76, %arg72, %83, %83, %83) : (vector<4xi32>, vector<8xi32>, vector<16xi32>, i32, i32, i32) -> vector<16xi32>
    %108 = "rocdl.smfmac.f32.32x32x64.bf8.bf8"(%arg71, %arg76, %arg67, %83, %83, %83) : (vector<4xi32>, vector<8xi32>, vector<16xf32>, i32, i32, i32) -> vector<16xf32>
    %109 = "rocdl.smfmac.f32.32x32x64.bf8.fp8"(%arg71, %arg76, %arg67, %83, %83, %83) : (vector<4xi32>, vector<8xi32>, vector<16xf32>, i32, i32, i32) -> vector<16xf32>
    %110 = "rocdl.smfmac.f32.32x32x64.fp8.bf8"(%arg71, %arg76, %arg67, %83, %83, %83) : (vector<4xi32>, vector<8xi32>, vector<16xf32>, i32, i32, i32) -> vector<16xf32>
    %111 = "rocdl.smfmac.f32.32x32x64.fp8.fp8"(%arg71, %arg76, %arg67, %83, %83, %83) : (vector<4xi32>, vector<8xi32>, vector<16xf32>, i32, i32, i32) -> vector<16xf32>
    "llvm.return"(%84) : (vector<4xf32>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, vector<16xf32>, vector<8xi32>, vector<6xi32>, vector<4xi32>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.mfma.scale.f32.32x32x64.f8f6f4", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg58: i32, %arg59: vector<16xf32>, %arg60: vector<8xi32>, %arg61: vector<6xi32>, %arg62: vector<4xi32>):
    %53 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    %54 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %55 = "llvm.mlir.constant"() <{value = 2 : i32}> : () -> i32
    %56 = "llvm.mlir.constant"() <{value = 3 : i32}> : () -> i32
    %57 = "llvm.mlir.constant"() <{value = 4 : i32}> : () -> i32
    %58 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg60, %arg60, %arg59, %53, %53, %53, %arg58, %53, %arg58) : (vector<8xi32>, vector<8xi32>, vector<16xf32>, i32, i32, i32, i32, i32, i32) -> vector<16xf32>
    %59 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg60, %arg60, %arg59, %53, %54, %53, %arg58, %53, %arg58) : (vector<8xi32>, vector<8xi32>, vector<16xf32>, i32, i32, i32, i32, i32, i32) -> vector<16xf32>
    %60 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg60, %arg61, %arg59, %53, %55, %53, %arg58, %53, %arg58) : (vector<8xi32>, vector<6xi32>, vector<16xf32>, i32, i32, i32, i32, i32, i32) -> vector<16xf32>
    %61 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg60, %arg61, %arg59, %53, %56, %53, %arg58, %53, %arg58) : (vector<8xi32>, vector<6xi32>, vector<16xf32>, i32, i32, i32, i32, i32, i32) -> vector<16xf32>
    %62 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg60, %arg62, %arg59, %53, %57, %53, %arg58, %53, %arg58) : (vector<8xi32>, vector<4xi32>, vector<16xf32>, i32, i32, i32, i32, i32, i32) -> vector<16xf32>
    %63 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg60, %arg60, %arg59, %54, %53, %53, %arg58, %53, %arg58) : (vector<8xi32>, vector<8xi32>, vector<16xf32>, i32, i32, i32, i32, i32, i32) -> vector<16xf32>
    %64 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg60, %arg60, %arg59, %54, %54, %53, %arg58, %53, %arg58) : (vector<8xi32>, vector<8xi32>, vector<16xf32>, i32, i32, i32, i32, i32, i32) -> vector<16xf32>
    %65 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg60, %arg61, %arg59, %54, %55, %53, %arg58, %53, %arg58) : (vector<8xi32>, vector<6xi32>, vector<16xf32>, i32, i32, i32, i32, i32, i32) -> vector<16xf32>
    %66 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg60, %arg61, %arg59, %54, %56, %53, %arg58, %53, %arg58) : (vector<8xi32>, vector<6xi32>, vector<16xf32>, i32, i32, i32, i32, i32, i32) -> vector<16xf32>
    %67 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg60, %arg62, %arg59, %54, %57, %53, %arg58, %53, %arg58) : (vector<8xi32>, vector<4xi32>, vector<16xf32>, i32, i32, i32, i32, i32, i32) -> vector<16xf32>
    %68 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg61, %arg60, %arg59, %55, %53, %53, %arg58, %53, %arg58) : (vector<6xi32>, vector<8xi32>, vector<16xf32>, i32, i32, i32, i32, i32, i32) -> vector<16xf32>
    %69 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg61, %arg60, %arg59, %55, %54, %53, %arg58, %53, %arg58) : (vector<6xi32>, vector<8xi32>, vector<16xf32>, i32, i32, i32, i32, i32, i32) -> vector<16xf32>
    %70 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg61, %arg61, %arg59, %55, %55, %53, %arg58, %53, %arg58) : (vector<6xi32>, vector<6xi32>, vector<16xf32>, i32, i32, i32, i32, i32, i32) -> vector<16xf32>
    %71 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg61, %arg61, %arg59, %55, %56, %53, %arg58, %53, %arg58) : (vector<6xi32>, vector<6xi32>, vector<16xf32>, i32, i32, i32, i32, i32, i32) -> vector<16xf32>
    %72 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg61, %arg62, %arg59, %55, %57, %53, %arg58, %53, %arg58) : (vector<6xi32>, vector<4xi32>, vector<16xf32>, i32, i32, i32, i32, i32, i32) -> vector<16xf32>
    %73 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg61, %arg60, %arg59, %56, %53, %53, %arg58, %53, %arg58) : (vector<6xi32>, vector<8xi32>, vector<16xf32>, i32, i32, i32, i32, i32, i32) -> vector<16xf32>
    %74 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg61, %arg60, %arg59, %56, %54, %53, %arg58, %53, %arg58) : (vector<6xi32>, vector<8xi32>, vector<16xf32>, i32, i32, i32, i32, i32, i32) -> vector<16xf32>
    %75 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg61, %arg61, %arg59, %56, %55, %53, %arg58, %53, %arg58) : (vector<6xi32>, vector<6xi32>, vector<16xf32>, i32, i32, i32, i32, i32, i32) -> vector<16xf32>
    %76 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg61, %arg61, %arg59, %56, %56, %53, %arg58, %53, %arg58) : (vector<6xi32>, vector<6xi32>, vector<16xf32>, i32, i32, i32, i32, i32, i32) -> vector<16xf32>
    %77 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg61, %arg62, %arg59, %56, %57, %53, %arg58, %53, %arg58) : (vector<6xi32>, vector<4xi32>, vector<16xf32>, i32, i32, i32, i32, i32, i32) -> vector<16xf32>
    %78 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg62, %arg60, %arg59, %57, %53, %53, %arg58, %53, %arg58) : (vector<4xi32>, vector<8xi32>, vector<16xf32>, i32, i32, i32, i32, i32, i32) -> vector<16xf32>
    %79 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg62, %arg60, %arg59, %57, %54, %53, %arg58, %53, %arg58) : (vector<4xi32>, vector<8xi32>, vector<16xf32>, i32, i32, i32, i32, i32, i32) -> vector<16xf32>
    %80 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg62, %arg61, %arg59, %57, %55, %53, %arg58, %53, %arg58) : (vector<4xi32>, vector<6xi32>, vector<16xf32>, i32, i32, i32, i32, i32, i32) -> vector<16xf32>
    %81 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg62, %arg61, %arg59, %57, %56, %53, %arg58, %53, %arg58) : (vector<4xi32>, vector<6xi32>, vector<16xf32>, i32, i32, i32, i32, i32, i32) -> vector<16xf32>
    %82 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg62, %arg62, %arg59, %57, %57, %53, %arg58, %53, %arg58) : (vector<4xi32>, vector<4xi32>, vector<16xf32>, i32, i32, i32, i32, i32, i32) -> vector<16xf32>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, vector<4xf32>, vector<8xi32>, vector<6xi32>, vector<4xi32>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.mfma.scale.f32.16x16x128.f8f6f4", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg53: i32, %arg54: vector<4xf32>, %arg55: vector<8xi32>, %arg56: vector<6xi32>, %arg57: vector<4xi32>):
    %23 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    %24 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %25 = "llvm.mlir.constant"() <{value = 2 : i32}> : () -> i32
    %26 = "llvm.mlir.constant"() <{value = 3 : i32}> : () -> i32
    %27 = "llvm.mlir.constant"() <{value = 4 : i32}> : () -> i32
    %28 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg55, %arg55, %arg54, %23, %23, %23, %arg53, %23, %arg53) : (vector<8xi32>, vector<8xi32>, vector<4xf32>, i32, i32, i32, i32, i32, i32) -> vector<4xf32>
    %29 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg55, %arg55, %arg54, %23, %24, %23, %arg53, %23, %arg53) : (vector<8xi32>, vector<8xi32>, vector<4xf32>, i32, i32, i32, i32, i32, i32) -> vector<4xf32>
    %30 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg55, %arg56, %arg54, %23, %25, %23, %arg53, %23, %arg53) : (vector<8xi32>, vector<6xi32>, vector<4xf32>, i32, i32, i32, i32, i32, i32) -> vector<4xf32>
    %31 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg55, %arg56, %arg54, %23, %26, %23, %arg53, %23, %arg53) : (vector<8xi32>, vector<6xi32>, vector<4xf32>, i32, i32, i32, i32, i32, i32) -> vector<4xf32>
    %32 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg55, %arg57, %arg54, %23, %27, %23, %arg53, %23, %arg53) : (vector<8xi32>, vector<4xi32>, vector<4xf32>, i32, i32, i32, i32, i32, i32) -> vector<4xf32>
    %33 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg55, %arg55, %arg54, %24, %23, %23, %arg53, %23, %arg53) : (vector<8xi32>, vector<8xi32>, vector<4xf32>, i32, i32, i32, i32, i32, i32) -> vector<4xf32>
    %34 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg55, %arg55, %arg54, %24, %24, %23, %arg53, %23, %arg53) : (vector<8xi32>, vector<8xi32>, vector<4xf32>, i32, i32, i32, i32, i32, i32) -> vector<4xf32>
    %35 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg55, %arg56, %arg54, %24, %25, %23, %arg53, %23, %arg53) : (vector<8xi32>, vector<6xi32>, vector<4xf32>, i32, i32, i32, i32, i32, i32) -> vector<4xf32>
    %36 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg55, %arg56, %arg54, %24, %26, %23, %arg53, %23, %arg53) : (vector<8xi32>, vector<6xi32>, vector<4xf32>, i32, i32, i32, i32, i32, i32) -> vector<4xf32>
    %37 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg55, %arg57, %arg54, %24, %27, %23, %arg53, %23, %arg53) : (vector<8xi32>, vector<4xi32>, vector<4xf32>, i32, i32, i32, i32, i32, i32) -> vector<4xf32>
    %38 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg56, %arg55, %arg54, %25, %23, %23, %arg53, %23, %arg53) : (vector<6xi32>, vector<8xi32>, vector<4xf32>, i32, i32, i32, i32, i32, i32) -> vector<4xf32>
    %39 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg56, %arg55, %arg54, %25, %24, %23, %arg53, %23, %arg53) : (vector<6xi32>, vector<8xi32>, vector<4xf32>, i32, i32, i32, i32, i32, i32) -> vector<4xf32>
    %40 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg56, %arg56, %arg54, %25, %25, %23, %arg53, %23, %arg53) : (vector<6xi32>, vector<6xi32>, vector<4xf32>, i32, i32, i32, i32, i32, i32) -> vector<4xf32>
    %41 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg56, %arg56, %arg54, %25, %26, %23, %arg53, %23, %arg53) : (vector<6xi32>, vector<6xi32>, vector<4xf32>, i32, i32, i32, i32, i32, i32) -> vector<4xf32>
    %42 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg56, %arg57, %arg54, %25, %27, %23, %arg53, %23, %arg53) : (vector<6xi32>, vector<4xi32>, vector<4xf32>, i32, i32, i32, i32, i32, i32) -> vector<4xf32>
    %43 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg56, %arg55, %arg54, %26, %23, %23, %arg53, %23, %arg53) : (vector<6xi32>, vector<8xi32>, vector<4xf32>, i32, i32, i32, i32, i32, i32) -> vector<4xf32>
    %44 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg56, %arg55, %arg54, %26, %24, %23, %arg53, %23, %arg53) : (vector<6xi32>, vector<8xi32>, vector<4xf32>, i32, i32, i32, i32, i32, i32) -> vector<4xf32>
    %45 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg56, %arg56, %arg54, %26, %25, %23, %arg53, %23, %arg53) : (vector<6xi32>, vector<6xi32>, vector<4xf32>, i32, i32, i32, i32, i32, i32) -> vector<4xf32>
    %46 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg56, %arg56, %arg54, %26, %26, %23, %arg53, %23, %arg53) : (vector<6xi32>, vector<6xi32>, vector<4xf32>, i32, i32, i32, i32, i32, i32) -> vector<4xf32>
    %47 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg56, %arg57, %arg54, %26, %27, %23, %arg53, %23, %arg53) : (vector<6xi32>, vector<4xi32>, vector<4xf32>, i32, i32, i32, i32, i32, i32) -> vector<4xf32>
    %48 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg57, %arg55, %arg54, %27, %23, %23, %arg53, %23, %arg53) : (vector<4xi32>, vector<8xi32>, vector<4xf32>, i32, i32, i32, i32, i32, i32) -> vector<4xf32>
    %49 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg57, %arg55, %arg54, %27, %24, %23, %arg53, %23, %arg53) : (vector<4xi32>, vector<8xi32>, vector<4xf32>, i32, i32, i32, i32, i32, i32) -> vector<4xf32>
    %50 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg57, %arg56, %arg54, %27, %25, %23, %arg53, %23, %arg53) : (vector<4xi32>, vector<6xi32>, vector<4xf32>, i32, i32, i32, i32, i32, i32) -> vector<4xf32>
    %51 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg57, %arg56, %arg54, %27, %26, %23, %arg53, %23, %arg53) : (vector<4xi32>, vector<6xi32>, vector<4xf32>, i32, i32, i32, i32, i32, i32) -> vector<4xf32>
    %52 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg57, %arg57, %arg54, %27, %27, %23, %arg53, %23, %arg53) : (vector<4xi32>, vector<4xi32>, vector<4xf32>, i32, i32, i32, i32, i32, i32) -> vector<4xf32>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<4xf16> (ptr<3>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.ds.read.tr", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg52: !llvm.ptr<3>):
    %18 = "rocdl.ds.read.tr4.b64"(%arg52) : (!llvm.ptr<3>) -> vector<2xi32>
    %19 = "rocdl.ds.read.tr6.b96"(%arg52) : (!llvm.ptr<3>) -> vector<3xi32>
    %20 = "rocdl.ds.read.tr8.b64"(%arg52) : (!llvm.ptr<3>) -> vector<2xi32>
    %21 = "rocdl.ds.read.tr16.b64"(%arg52) : (!llvm.ptr<3>) -> vector<4xf16>
    %22 = "rocdl.ds.read.tr16.b64"(%arg52) : (!llvm.ptr<3>) -> vector<4xbf16>
    "llvm.return"(%21) : (vector<4xf16>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<1>, ptr<3>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.load.tr.ops", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg50: !llvm.ptr<1>, %arg51: !llvm.ptr<3>):
    %6 = "rocdl.global.load.tr4.b64"(%arg50) : (!llvm.ptr<1>) -> vector<2xi32>
    %7 = "rocdl.global.load.tr.b64"(%arg50) : (!llvm.ptr<1>) -> vector<2xi32>
    %8 = "rocdl.global.load.tr6.b96"(%arg50) : (!llvm.ptr<1>) -> vector<3xi32>
    %9 = "rocdl.global.load.tr.b128"(%arg50) : (!llvm.ptr<1>) -> vector<8xi16>
    %10 = "rocdl.global.load.tr.b128"(%arg50) : (!llvm.ptr<1>) -> vector<8xf16>
    %11 = "rocdl.global.load.tr.b128"(%arg50) : (!llvm.ptr<1>) -> vector<8xbf16>
    %12 = "rocdl.ds.load.tr4.b64"(%arg51) : (!llvm.ptr<3>) -> vector<2xi32>
    %13 = "rocdl.ds.load.tr8.b64"(%arg51) : (!llvm.ptr<3>) -> vector<2xi32>
    %14 = "rocdl.ds.load.tr6.b96"(%arg51) : (!llvm.ptr<3>) -> vector<3xi32>
    %15 = "rocdl.ds.load.tr16.b128"(%arg51) : (!llvm.ptr<3>) -> vector<8xi16>
    %16 = "rocdl.ds.load.tr16.b128"(%arg51) : (!llvm.ptr<3>) -> vector<8xf16>
    %17 = "rocdl.ds.load.tr16.b128"(%arg51) : (!llvm.ptr<3>) -> vector<8xbf16>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<7>, ptr<3>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.load.to.lds", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg48: !llvm.ptr<7>, %arg49: !llvm.ptr<3>):
    "rocdl.load.to.lds"(%arg48, %arg49) <{aux = 0 : i32, offset = 0 : i32, size = 4 : i32}> : (!llvm.ptr<7>, !llvm.ptr<3>) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<1>, ptr<3>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.global.load.lds", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg46: !llvm.ptr<1>, %arg47: !llvm.ptr<3>):
    "rocdl.global.load.lds"(%arg46, %arg47) <{aux = 0 : i32, offset = 0 : i32, size = 4 : i32}> : (!llvm.ptr<1>, !llvm.ptr<3>) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<1>, ptr<3>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.global.load.async.to.lds", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg44: !llvm.ptr<1>, %arg45: !llvm.ptr<3>):
    "rocdl.global.load.async.to.lds.b8"(%arg44, %arg45) <{aux = 0 : i32, offset = 0 : i32}> : (!llvm.ptr<1>, !llvm.ptr<3>) -> ()
    "rocdl.global.load.async.to.lds.b32"(%arg44, %arg45) <{aux = 0 : i32, offset = 0 : i32}> : (!llvm.ptr<1>, !llvm.ptr<3>) -> ()
    "rocdl.global.load.async.to.lds.b64"(%arg44, %arg45) <{aux = 0 : i32, offset = 0 : i32}> : (!llvm.ptr<1>, !llvm.ptr<3>) -> ()
    "rocdl.global.load.async.to.lds.b128"(%arg44, %arg45) <{aux = 0 : i32, offset = 0 : i32}> : (!llvm.ptr<1>, !llvm.ptr<3>) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<1>, ptr<3>, i32)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.cluster.load.async.to.lds", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg41: !llvm.ptr<1>, %arg42: !llvm.ptr<3>, %arg43: i32):
    "rocdl.cluster.load.async.to.lds.b8"(%arg41, %arg42, %arg43) <{cpol = 0 : i32, offset = 0 : i32}> : (!llvm.ptr<1>, !llvm.ptr<3>, i32) -> ()
    "rocdl.cluster.load.async.to.lds.b32"(%arg41, %arg42, %arg43) <{cpol = 0 : i32, offset = 0 : i32}> : (!llvm.ptr<1>, !llvm.ptr<3>, i32) -> ()
    "rocdl.cluster.load.async.to.lds.b64"(%arg41, %arg42, %arg43) <{cpol = 0 : i32, offset = 0 : i32}> : (!llvm.ptr<1>, !llvm.ptr<3>, i32) -> ()
    "rocdl.cluster.load.async.to.lds.b128"(%arg41, %arg42, %arg43) <{cpol = 0 : i32, offset = 0 : i32}> : (!llvm.ptr<1>, !llvm.ptr<3>, i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (vector<4xi32>, vector<8xi32>, vector<4xi32>, vector<4xi32>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.tensor.load.to.lds", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg37: vector<4xi32>, %arg38: vector<8xi32>, %arg39: vector<4xi32>, %arg40: vector<4xi32>):
    "rocdl.tensor.load.to.lds"(%arg37, %arg38, %arg39, %arg40) <{cachePolicy = 0 : i32}> : (vector<4xi32>, vector<8xi32>, vector<4xi32>, vector<4xi32>) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (vector<4xi32>, vector<8xi32>, vector<4xi32>, vector<4xi32>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.tensor.store.from.lds", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg33: vector<4xi32>, %arg34: vector<8xi32>, %arg35: vector<4xi32>, %arg36: vector<4xi32>):
    "rocdl.tensor.store.from.lds"(%arg33, %arg34, %arg35, %arg36) <{cachePolicy = 0 : i32}> : (vector<4xi32>, vector<8xi32>, vector<4xi32>, vector<4xi32>) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (vector<4xi32>, vector<8xi32>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.tensor.load.to.lds.d2", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg31: vector<4xi32>, %arg32: vector<8xi32>):
    "rocdl.tensor.load.to.lds.d2"(%arg31, %arg32) <{cachePolicy = 0 : i32}> : (vector<4xi32>, vector<8xi32>) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (vector<4xi32>, vector<8xi32>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.tensor.store.from.lds.d2", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg29: vector<4xi32>, %arg30: vector<8xi32>):
    "rocdl.tensor.store.from.lds.d2"(%arg29, %arg30) <{cachePolicy = 0 : i32}> : (vector<4xi32>, vector<8xi32>) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<ptr<8> (ptr, i16, i64, i32)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.make.buffer.rsrc", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg25: !llvm.ptr, %arg26: i16, %arg27: i64, %arg28: i32):
    %5 = "rocdl.make.buffer.rsrc"(%arg25, %arg26, %arg27, %arg28) : (!llvm.ptr, i16, i64, i32) -> !llvm.ptr<8>
    "llvm.return"(%5) : (!llvm.ptr<8>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<8>, i32, i32, i32, f32, vector<2xf32>, vector<4xf32>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.raw.ptr.buffer.f32", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg18: !llvm.ptr<8>, %arg19: i32, %arg20: i32, %arg21: i32, %arg22: f32, %arg23: vector<2xf32>, %arg24: vector<4xf32>):
    %2 = "rocdl.raw.ptr.buffer.load"(%arg18, %arg19, %arg20, %arg21) : (!llvm.ptr<8>, i32, i32, i32) -> f32
    %3 = "rocdl.raw.ptr.buffer.load"(%arg18, %arg19, %arg20, %arg21) : (!llvm.ptr<8>, i32, i32, i32) -> vector<2xf32>
    %4 = "rocdl.raw.ptr.buffer.load"(%arg18, %arg19, %arg20, %arg21) : (!llvm.ptr<8>, i32, i32, i32) -> vector<4xf32>
    "rocdl.raw.ptr.buffer.store"(%arg22, %arg18, %arg19, %arg20, %arg21) : (f32, !llvm.ptr<8>, i32, i32, i32) -> ()
    "rocdl.raw.ptr.buffer.store"(%arg23, %arg18, %arg19, %arg20, %arg21) : (vector<2xf32>, !llvm.ptr<8>, i32, i32, i32) -> ()
    "rocdl.raw.ptr.buffer.store"(%arg24, %arg18, %arg19, %arg19, %arg21) : (vector<4xf32>, !llvm.ptr<8>, i32, i32, i32) -> ()
    "rocdl.raw.ptr.buffer.atomic.fadd"(%arg22, %arg18, %arg19, %arg20, %arg21) : (f32, !llvm.ptr<8>, i32, i32, i32) -> ()
    "rocdl.raw.ptr.buffer.atomic.fmax"(%arg22, %arg18, %arg19, %arg20, %arg21) : (f32, !llvm.ptr<8>, i32, i32, i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<8>, ptr<3>, i32, i32, i32, i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.raw.ptr.buffer.load.lds", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg11: !llvm.ptr<8>, %arg12: !llvm.ptr<3>, %arg13: i32, %arg14: i32, %arg15: i32, %arg16: i32, %arg17: i32):
    "rocdl.raw.ptr.buffer.load.lds"(%arg11, %arg12, %arg13, %arg14, %arg15, %arg16, %arg17) : (!llvm.ptr<8>, !llvm.ptr<3>, i32, i32, i32, i32, i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<8>, i32, i32, i32, i32, vector<2xi32>, vector<4xi32>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.raw.ptr.buffer.i32", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg4: !llvm.ptr<8>, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: i32, %arg9: vector<2xi32>, %arg10: vector<4xi32>):
    "rocdl.raw.ptr.buffer.atomic.smax"(%arg8, %arg4, %arg5, %arg6, %arg7) : (i32, !llvm.ptr<8>, i32, i32, i32) -> ()
    "rocdl.raw.ptr.buffer.atomic.umin"(%arg8, %arg4, %arg5, %arg6, %arg7) : (i32, !llvm.ptr<8>, i32, i32, i32) -> ()
    %1 = "rocdl.raw.ptr.buffer.atomic.cmpswap"(%arg8, %arg8, %arg4, %arg5, %arg6, %arg7) : (i32, i32, !llvm.ptr<8>, i32, i32, i32) -> i32
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<1>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.global.prefetch", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg3: !llvm.ptr<1>):
    "rocdl.global.prefetch"(%arg3) <{scope = 0 : i32}> : (!llvm.ptr<1>) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.flat.prefetch", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg2: !llvm.ptr):
    "rocdl.flat.prefetch"(%arg2) <{scope = 0 : i32}> : (!llvm.ptr) -> ()
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
    %65 = "rocdl.raw.buffer.load"(%arg36, %arg37, %arg38, %arg39) : (vector<4xi32>, i32, i32, i32) -> f32
    %66 = "rocdl.raw.buffer.load"(%arg36, %arg37, %arg38, %arg39) : (vector<4xi32>, i32, i32, i32) -> vector<2xf32>
    %67 = "rocdl.raw.buffer.load"(%arg36, %arg37, %arg38, %arg39) : (vector<4xi32>, i32, i32, i32) -> vector<4xf32>
    "rocdl.raw.buffer.store"(%arg40, %arg36, %arg37, %arg38, %arg39) : (f32, vector<4xi32>, i32, i32, i32) -> ()
    "rocdl.raw.buffer.store"(%arg41, %arg36, %arg37, %arg38, %arg39) : (vector<2xf32>, vector<4xi32>, i32, i32, i32) -> ()
    "rocdl.raw.buffer.store"(%arg42, %arg36, %arg37, %arg37, %arg39) : (vector<4xf32>, vector<4xi32>, i32, i32, i32) -> ()
    "rocdl.raw.buffer.atomic.fadd"(%arg40, %arg36, %arg37, %arg38, %arg39) : (f32, vector<4xi32>, i32, i32, i32) -> ()
    "rocdl.raw.buffer.atomic.fmax"(%arg40, %arg36, %arg37, %arg38, %arg39) : (f32, vector<4xi32>, i32, i32, i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (vector<4xi32>, i32, i32, i32, i32, vector<2xi32>, vector<4xi32>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.raw.buffer.i32", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg29: vector<4xi32>, %arg30: i32, %arg31: i32, %arg32: i32, %arg33: i32, %arg34: vector<2xi32>, %arg35: vector<4xi32>):
    "rocdl.raw.buffer.atomic.smax"(%arg33, %arg29, %arg30, %arg31, %arg32) : (i32, vector<4xi32>, i32, i32, i32) -> ()
    "rocdl.raw.buffer.atomic.umin"(%arg33, %arg29, %arg30, %arg31, %arg32) : (i32, vector<4xi32>, i32, i32, i32) -> ()
    %64 = "rocdl.raw.buffer.atomic.cmpswap"(%arg33, %arg33, %arg29, %arg30, %arg31, %arg32) : (i32, i32, vector<4xi32>, i32, i32, i32) -> i32
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
    %0 = "rocdl.wmma.scale.f32.16x16x128.f8f6f4"(%arg0, %arg0, %arg2, %arg4, %arg4) <{fmtA = 0 : i32, fmtB = 0 : i32, fmtScaleA = 0 : i32, fmtScaleB = 0 : i32, modC = 0 : i16, reuseA = false, reuseB = false, scaleAType = 0 : i32, scaleBType = 0 : i32}> : (vector<8xi32>, vector<8xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %1 = "rocdl.wmma.scale16.f32.16x16x128.f8f6f4"(%arg0, %arg0, %arg2, %arg5, %arg5) <{fmtA = 0 : i32, fmtB = 0 : i32, fmtScaleA = 0 : i32, fmtScaleB = 0 : i32, modC = 0 : i16, reuseA = false, reuseB = false, scaleAType = 0 : i32, scaleBType = 0 : i32}> : (vector<8xi32>, vector<8xi32>, vector<4xf32>, i64, i64) -> vector<4xf32>
    %2 = "rocdl.wmma.scale.f32.32x16x128.f4"(%arg1, %arg1, %arg3, %arg4, %arg4) <{fmtScaleA = 0 : i32, fmtScaleB = 0 : i32, modC = 0 : i16, reuseA = false, reuseB = false, scaleAType = 0 : i32, scaleBType = 0 : i32}> : (vector<4xi32>, vector<4xi32>, vector<16xf32>, i32, i32) -> vector<16xf32>
    %3 = "rocdl.wmma.scale16.f32.32x16x128.f4"(%arg1, %arg1, %arg3, %arg5, %arg5) <{fmtScaleA = 0 : i32, fmtScaleB = 0 : i32, modC = 0 : i16, reuseA = false, reuseB = false, scaleAType = 0 : i32, scaleBType = 0 : i32}> : (vector<4xi32>, vector<4xi32>, vector<16xf32>, i64, i64) -> vector<16xf32>
    "llvm.return"() : () -> ()
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

