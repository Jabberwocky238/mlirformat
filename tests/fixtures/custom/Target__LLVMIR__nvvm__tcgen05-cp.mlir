module {
  llvm.func @nvvm_tcgen05_cp_128x256b(%arg0: !llvm.ptr<6>, %arg1: i64) {
    nvvm.tcgen05.cp %arg0, %arg1 {shape = #nvvm.tcgen05_cp_shape<shape_128x256b>}
    nvvm.tcgen05.cp %arg0, %arg1 {group = #nvvm.cta_group<cta_2>, shape = #nvvm.tcgen05_cp_shape<shape_128x256b>}
    nvvm.tcgen05.cp %arg0, %arg1 {group = #nvvm.cta_group<cta_2>, shape = #nvvm.tcgen05_cp_shape<shape_128x256b>, srcFormat = #nvvm.tcgen05_cp_src_fmt<b4x16_p64>}
    nvvm.tcgen05.cp %arg0, %arg1 {group = #nvvm.cta_group<cta_2>, shape = #nvvm.tcgen05_cp_shape<shape_128x256b>, srcFormat = #nvvm.tcgen05_cp_src_fmt<b6x16_p32>}
    llvm.return
  }
  llvm.func @nvvm_tcgen05_cp_4x256b(%arg0: !llvm.ptr<6>, %arg1: i64) {
    nvvm.tcgen05.cp %arg0, %arg1 {shape = #nvvm.tcgen05_cp_shape<shape_4x256b>}
    nvvm.tcgen05.cp %arg0, %arg1 {group = #nvvm.cta_group<cta_2>, shape = #nvvm.tcgen05_cp_shape<shape_4x256b>}
    nvvm.tcgen05.cp %arg0, %arg1 {group = #nvvm.cta_group<cta_2>, shape = #nvvm.tcgen05_cp_shape<shape_4x256b>, srcFormat = #nvvm.tcgen05_cp_src_fmt<b4x16_p64>}
    nvvm.tcgen05.cp %arg0, %arg1 {group = #nvvm.cta_group<cta_2>, shape = #nvvm.tcgen05_cp_shape<shape_4x256b>, srcFormat = #nvvm.tcgen05_cp_src_fmt<b6x16_p32>}
    llvm.return
  }
  llvm.func @nvvm_tcgen05_cp_128x128b(%arg0: !llvm.ptr<6>, %arg1: i64) {
    nvvm.tcgen05.cp %arg0, %arg1 {shape = #nvvm.tcgen05_cp_shape<shape_128x128b>}
    nvvm.tcgen05.cp %arg0, %arg1 {group = #nvvm.cta_group<cta_2>, shape = #nvvm.tcgen05_cp_shape<shape_128x128b>}
    nvvm.tcgen05.cp %arg0, %arg1 {group = #nvvm.cta_group<cta_2>, shape = #nvvm.tcgen05_cp_shape<shape_128x128b>, srcFormat = #nvvm.tcgen05_cp_src_fmt<b4x16_p64>}
    nvvm.tcgen05.cp %arg0, %arg1 {group = #nvvm.cta_group<cta_2>, shape = #nvvm.tcgen05_cp_shape<shape_128x128b>, srcFormat = #nvvm.tcgen05_cp_src_fmt<b6x16_p32>}
    llvm.return
  }
  llvm.func @nvvm_tcgen05_cp_64x128b(%arg0: !llvm.ptr<6>, %arg1: i64) {
    nvvm.tcgen05.cp %arg0, %arg1 {multicast = #nvvm.tcgen05_cp_multicast<warpx2_02_13>, shape = #nvvm.tcgen05_cp_shape<shape_64x128b>}
    nvvm.tcgen05.cp %arg0, %arg1 {group = #nvvm.cta_group<cta_2>, multicast = #nvvm.tcgen05_cp_multicast<warpx2_02_13>, shape = #nvvm.tcgen05_cp_shape<shape_64x128b>}
    nvvm.tcgen05.cp %arg0, %arg1 {multicast = #nvvm.tcgen05_cp_multicast<warpx2_02_13>, shape = #nvvm.tcgen05_cp_shape<shape_64x128b>, srcFormat = #nvvm.tcgen05_cp_src_fmt<b4x16_p64>}
    nvvm.tcgen05.cp %arg0, %arg1 {group = #nvvm.cta_group<cta_2>, multicast = #nvvm.tcgen05_cp_multicast<warpx2_01_23>, shape = #nvvm.tcgen05_cp_shape<shape_64x128b>, srcFormat = #nvvm.tcgen05_cp_src_fmt<b6x16_p32>}
    llvm.return
  }
  llvm.func @nvvm_tcgen05_cp_32x128b(%arg0: !llvm.ptr<6>, %arg1: i64) {
    nvvm.tcgen05.cp %arg0, %arg1 {multicast = #nvvm.tcgen05_cp_multicast<warpx4>, shape = #nvvm.tcgen05_cp_shape<shape_32x128b>}
    nvvm.tcgen05.cp %arg0, %arg1 {group = #nvvm.cta_group<cta_2>, multicast = #nvvm.tcgen05_cp_multicast<warpx4>, shape = #nvvm.tcgen05_cp_shape<shape_32x128b>}
    nvvm.tcgen05.cp %arg0, %arg1 {group = #nvvm.cta_group<cta_2>, multicast = #nvvm.tcgen05_cp_multicast<warpx4>, shape = #nvvm.tcgen05_cp_shape<shape_32x128b>, srcFormat = #nvvm.tcgen05_cp_src_fmt<b4x16_p64>}
    nvvm.tcgen05.cp %arg0, %arg1 {multicast = #nvvm.tcgen05_cp_multicast<warpx4>, shape = #nvvm.tcgen05_cp_shape<shape_32x128b>, srcFormat = #nvvm.tcgen05_cp_src_fmt<b6x16_p32>}
    llvm.return
  }
}

