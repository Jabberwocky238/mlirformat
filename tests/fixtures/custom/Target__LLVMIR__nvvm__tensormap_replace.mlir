module {
  llvm.func @tensormap_replace_global_address(%arg0: !llvm.ptr<1>, %arg1: i64) {
    nvvm.tensormap.replace field = global_address, new_value = %arg1 in %arg0 : !llvm.ptr<1>, i64
    llvm.return
  }
  llvm.func @tensormap_replace_rank(%arg0: !llvm.ptr<1>, %arg1: i32) {
    nvvm.tensormap.replace field = rank, new_value = %arg1 in %arg0 : !llvm.ptr<1>, i32
    llvm.return
  }
  llvm.func @tensormap_replace_box_dim(%arg0: !llvm.ptr<1>, %arg1: i32) {
    nvvm.tensormap.replace field = box_dim[1], new_value = %arg1 in %arg0 : !llvm.ptr<1>, i32
    llvm.return
  }
  llvm.func @tensormap_replace_global_dim(%arg0: !llvm.ptr<1>, %arg1: i32) {
    nvvm.tensormap.replace field = global_dim[1], new_value = %arg1 in %arg0 : !llvm.ptr<1>, i32
    llvm.return
  }
  llvm.func @tensormap_replace_global_stride(%arg0: !llvm.ptr<1>, %arg1: i64) {
    nvvm.tensormap.replace field = global_stride[1], new_value = %arg1 in %arg0 : !llvm.ptr<1>, i64
    llvm.return
  }
  llvm.func @tensormap_replace_element_stride(%arg0: !llvm.ptr<1>, %arg1: i32) {
    nvvm.tensormap.replace field = element_stride[1], new_value = %arg1 in %arg0 : !llvm.ptr<1>, i32
    llvm.return
  }
  llvm.func @tensormap_replace_elemtype(%arg0: !llvm.ptr<1>) {
    nvvm.tensormap.replace field = elemtype, new_value = #nvvm.tensormap_elemtype<u8> in %arg0 : !llvm.ptr<1>
    nvvm.tensormap.replace field = elemtype, new_value = #nvvm.tensormap_elemtype<u16> in %arg0 : !llvm.ptr<1>
    nvvm.tensormap.replace field = elemtype, new_value = #nvvm.tensormap_elemtype<u32> in %arg0 : !llvm.ptr<1>
    nvvm.tensormap.replace field = elemtype, new_value = #nvvm.tensormap_elemtype<s32> in %arg0 : !llvm.ptr<1>
    nvvm.tensormap.replace field = elemtype, new_value = #nvvm.tensormap_elemtype<u64> in %arg0 : !llvm.ptr<1>
    nvvm.tensormap.replace field = elemtype, new_value = #nvvm.tensormap_elemtype<s64> in %arg0 : !llvm.ptr<1>
    nvvm.tensormap.replace field = elemtype, new_value = #nvvm.tensormap_elemtype<f16> in %arg0 : !llvm.ptr<1>
    nvvm.tensormap.replace field = elemtype, new_value = #nvvm.tensormap_elemtype<f32> in %arg0 : !llvm.ptr<1>
    nvvm.tensormap.replace field = elemtype, new_value = #nvvm.tensormap_elemtype<f32.ftz> in %arg0 : !llvm.ptr<1>
    nvvm.tensormap.replace field = elemtype, new_value = #nvvm.tensormap_elemtype<f64> in %arg0 : !llvm.ptr<1>
    nvvm.tensormap.replace field = elemtype, new_value = #nvvm.tensormap_elemtype<bf16> in %arg0 : !llvm.ptr<1>
    nvvm.tensormap.replace field = elemtype, new_value = #nvvm.tensormap_elemtype<tf32> in %arg0 : !llvm.ptr<1>
    nvvm.tensormap.replace field = elemtype, new_value = #nvvm.tensormap_elemtype<tf32.ftz> in %arg0 : !llvm.ptr<1>
    nvvm.tensormap.replace field = elemtype, new_value = #nvvm.tensormap_elemtype<b4x16> in %arg0 : !llvm.ptr<1>
    nvvm.tensormap.replace field = elemtype, new_value = #nvvm.tensormap_elemtype<b4x16_p64> in %arg0 : !llvm.ptr<1>
    nvvm.tensormap.replace field = elemtype, new_value = #nvvm.tensormap_elemtype<b6x16_p32> in %arg0 : !llvm.ptr<1>
    llvm.return
  }
  llvm.func @tensormap_replace_interleave_layout(%arg0: !llvm.ptr<1>) {
    nvvm.tensormap.replace field = interleave_layout, new_value = #nvvm.tensormap_interleave_layout<no_interleave> in %arg0 : !llvm.ptr<1>
    nvvm.tensormap.replace field = interleave_layout, new_value = #nvvm.tensormap_interleave_layout<b16> in %arg0 : !llvm.ptr<1>
    nvvm.tensormap.replace field = interleave_layout, new_value = #nvvm.tensormap_interleave_layout<b32> in %arg0 : !llvm.ptr<1>
    llvm.return
  }
  llvm.func @tensormap_replace_swizzle_mode(%arg0: !llvm.ptr<1>) {
    nvvm.tensormap.replace field = swizzle_mode, new_value = #nvvm.tensormap_swizzle_mode<no_swizzling> in %arg0 : !llvm.ptr<1>
    nvvm.tensormap.replace field = swizzle_mode, new_value = #nvvm.tensormap_swizzle_mode<b32> in %arg0 : !llvm.ptr<1>
    nvvm.tensormap.replace field = swizzle_mode, new_value = #nvvm.tensormap_swizzle_mode<b64> in %arg0 : !llvm.ptr<1>
    nvvm.tensormap.replace field = swizzle_mode, new_value = #nvvm.tensormap_swizzle_mode<b128> in %arg0 : !llvm.ptr<1>
    nvvm.tensormap.replace field = swizzle_mode, new_value = #nvvm.tensormap_swizzle_mode<b96> in %arg0 : !llvm.ptr<1>
    llvm.return
  }
  llvm.func @tensormap_replace_swizzle_atomicity(%arg0: !llvm.ptr<1>) {
    nvvm.tensormap.replace field = swizzle_atomicity, new_value = #nvvm.tensormap_swizzle_atomicity<b16> in %arg0 : !llvm.ptr<1>
    nvvm.tensormap.replace field = swizzle_atomicity, new_value = #nvvm.tensormap_swizzle_atomicity<b32> in %arg0 : !llvm.ptr<1>
    nvvm.tensormap.replace field = swizzle_atomicity, new_value = #nvvm.tensormap_swizzle_atomicity<b32_flip_b8> in %arg0 : !llvm.ptr<1>
    nvvm.tensormap.replace field = swizzle_atomicity, new_value = #nvvm.tensormap_swizzle_atomicity<b64> in %arg0 : !llvm.ptr<1>
    llvm.return
  }
  llvm.func @tensormap_replace_fill_mode(%arg0: !llvm.ptr<1>) {
    nvvm.tensormap.replace field = fill_mode, new_value = #nvvm.tensormap_fill_mode<zero> in %arg0 : !llvm.ptr<1>
    nvvm.tensormap.replace field = fill_mode, new_value = #nvvm.tensormap_fill_mode<oob_nan> in %arg0 : !llvm.ptr<1>
    llvm.return
  }
}

