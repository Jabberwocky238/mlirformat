module {
  llvm.func @llvm_nvvm_tcgen05_alloc(%arg0: !llvm.ptr, %arg1: i32) {
    nvvm.tcgen05.alloc %arg0, %arg1 : !llvm.ptr, i32
    nvvm.tcgen05.alloc %arg0, %arg1 {group = #nvvm.cta_group<cta_2>} : !llvm.ptr, i32
    llvm.return
  }
  llvm.func @llvm_nvvm_tcgen05_alloc_shared(%arg0: !llvm.ptr<3>, %arg1: i32) {
    nvvm.tcgen05.alloc %arg0, %arg1 : !llvm.ptr<3>, i32
    nvvm.tcgen05.alloc %arg0, %arg1 {group = #nvvm.cta_group<cta_2>} : !llvm.ptr<3>, i32
    llvm.return
  }
  llvm.func @llvm_nvvm_tcgen05_dealloc(%arg0: !llvm.ptr<6>, %arg1: i32) {
    nvvm.tcgen05.dealloc %arg0, %arg1 : !llvm.ptr<6>, i32
    nvvm.tcgen05.dealloc %arg0, %arg1 {group = #nvvm.cta_group<cta_2>} : !llvm.ptr<6>, i32
    llvm.return
  }
  llvm.func @llvm_nvvm_tcgen05_relinquish_alloc_permit() {
    nvvm.tcgen05.relinquish_alloc_permit
    nvvm.tcgen05.relinquish_alloc_permit {group = #nvvm.cta_group<cta_2>}
    llvm.return
  }
}

