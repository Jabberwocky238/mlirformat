module {
  llvm.func @cp_async_mbarrier_arrive(%arg0: !llvm.ptr<3>, %arg1: !llvm.ptr) {
    nvvm.cp.async.mbarrier.arrive %arg1 : !llvm.ptr
    nvvm.cp.async.mbarrier.arrive %arg1 {noinc = true} : !llvm.ptr
    nvvm.cp.async.mbarrier.arrive %arg0 : !llvm.ptr<3>
    nvvm.cp.async.mbarrier.arrive %arg0 {noinc = true} : !llvm.ptr<3>
    llvm.return
  }
  llvm.func @mbarrier_init_generic(%arg0: !llvm.ptr) {
    %0 = nvvm.read.ptx.sreg.ntid.x : i32
    nvvm.mbarrier.init %arg0, %0 : !llvm.ptr, i32
    llvm.return
  }
  llvm.func @mbarrier_init_shared(%arg0: !llvm.ptr<3>) {
    %0 = nvvm.read.ptx.sreg.ntid.x : i32
    nvvm.mbarrier.init %arg0, %0 : !llvm.ptr<3>, i32
    llvm.return
  }
  llvm.func @mbarrier_inval_generic(%arg0: !llvm.ptr) {
    nvvm.mbarrier.inval %arg0 : !llvm.ptr
    llvm.return
  }
  llvm.func @mbarrier_inval_shared(%arg0: !llvm.ptr<3>) {
    nvvm.mbarrier.inval %arg0 : !llvm.ptr<3>
    llvm.return
  }
}

