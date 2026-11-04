module {
  llvm.func @llvm_nvvm_tcgen05_shift(%arg0: !llvm.ptr<6>) {
    nvvm.tcgen05.shift %arg0 : !llvm.ptr<6>
    nvvm.tcgen05.shift %arg0 {group = #nvvm.cta_group<cta_2>} : !llvm.ptr<6>
    llvm.return
  }
}

