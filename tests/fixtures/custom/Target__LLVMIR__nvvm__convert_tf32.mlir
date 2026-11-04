module {
  llvm.func @convert_float_to_tf32_rna(%arg0: f32) -> i32 {
    %0 = nvvm.convert.float.to.tf32 %arg0 {rnd = #nvvm.fp_rnd_mode<rna>}
    llvm.return %0 : i32
  }
  llvm.func @convert_float_to_tf32_rna_sf(%arg0: f32) -> i32 {
    %0 = nvvm.convert.float.to.tf32 %arg0 {rnd = #nvvm.fp_rnd_mode<rna>, sat = #nvvm.sat_mode<satfinite>}
    llvm.return %0 : i32
  }
  llvm.func @convert_float_to_tf32_rn(%arg0: f32) -> i32 {
    %0 = nvvm.convert.float.to.tf32 %arg0 {rnd = #nvvm.fp_rnd_mode<rn>}
    llvm.return %0 : i32
  }
  llvm.func @convert_float_to_tf32_rn_relu(%arg0: f32) -> i32 {
    %0 = nvvm.convert.float.to.tf32 %arg0 {relu = true, rnd = #nvvm.fp_rnd_mode<rn>}
    llvm.return %0 : i32
  }
  llvm.func @convert_float_to_tf32_rn_sf(%arg0: f32) -> i32 {
    %0 = nvvm.convert.float.to.tf32 %arg0 {rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<satfinite>}
    llvm.return %0 : i32
  }
  llvm.func @convert_float_to_tf32_rn_relu_sf(%arg0: f32) -> i32 {
    %0 = nvvm.convert.float.to.tf32 %arg0 {relu = true, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<satfinite>}
    llvm.return %0 : i32
  }
  llvm.func @convert_float_to_tf32_rz(%arg0: f32) -> i32 {
    %0 = nvvm.convert.float.to.tf32 %arg0 {rnd = #nvvm.fp_rnd_mode<rz>}
    llvm.return %0 : i32
  }
  llvm.func @convert_float_to_tf32_rz_relu(%arg0: f32) -> i32 {
    %0 = nvvm.convert.float.to.tf32 %arg0 {relu = true, rnd = #nvvm.fp_rnd_mode<rz>}
    llvm.return %0 : i32
  }
  llvm.func @convert_float_to_tf32_rz_sf(%arg0: f32) -> i32 {
    %0 = nvvm.convert.float.to.tf32 %arg0 {rnd = #nvvm.fp_rnd_mode<rz>, sat = #nvvm.sat_mode<satfinite>}
    llvm.return %0 : i32
  }
  llvm.func @convert_float_to_tf32_rz_relu_sf(%arg0: f32) -> i32 {
    %0 = nvvm.convert.float.to.tf32 %arg0 {relu = true, rnd = #nvvm.fp_rnd_mode<rz>, sat = #nvvm.sat_mode<satfinite>}
    llvm.return %0 : i32
  }
}

