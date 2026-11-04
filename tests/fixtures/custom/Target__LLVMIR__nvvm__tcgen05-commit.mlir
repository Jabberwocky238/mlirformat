module {
  llvm.func @llvm_nvvm_tcgen05_commit_generic(%arg0: !llvm.ptr, %arg1: i16) {
    nvvm.tcgen05.commit %arg0 : !llvm.ptr
    nvvm.tcgen05.commit %arg0 {group = #nvvm.cta_group<cta_2>} : !llvm.ptr
    nvvm.tcgen05.commit %arg0, multicast_mask = %arg1 : !llvm.ptr, i16
    nvvm.tcgen05.commit %arg0, multicast_mask = %arg1 {group = #nvvm.cta_group<cta_2>} : !llvm.ptr, i16
    llvm.return
  }
  llvm.func @llvm_nvvm_tcgen05_commit_shared(%arg0: !llvm.ptr<3>, %arg1: i16) {
    nvvm.tcgen05.commit %arg0 : !llvm.ptr<3>
    nvvm.tcgen05.commit %arg0 {group = #nvvm.cta_group<cta_2>} : !llvm.ptr<3>
    nvvm.tcgen05.commit %arg0, multicast_mask = %arg1 : !llvm.ptr<3>, i16
    nvvm.tcgen05.commit %arg0, multicast_mask = %arg1 {group = #nvvm.cta_group<cta_2>} : !llvm.ptr<3>, i16
    llvm.return
  }
}

