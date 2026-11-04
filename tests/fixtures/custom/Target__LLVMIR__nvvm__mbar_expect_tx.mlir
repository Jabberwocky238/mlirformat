module {
  llvm.func @mbarrier_expect_tx_shared(%arg0: !llvm.ptr<3>, %arg1: i32) {
    nvvm.mbarrier.expect_tx %arg0, %arg1 : !llvm.ptr<3>, i32
    nvvm.mbarrier.expect_tx %arg0, %arg1 : !llvm.ptr<3>, i32
    nvvm.mbarrier.expect_tx %arg0, %arg1 {scope = #nvvm.mem_scope<cluster>} : !llvm.ptr<3>, i32
    llvm.return
  }
  llvm.func @mbarrier_expect_tx_shared_cluster(%arg0: !llvm.ptr<7>, %arg1: i32) {
    nvvm.mbarrier.expect_tx %arg0, %arg1 : !llvm.ptr<7>, i32
    nvvm.mbarrier.expect_tx %arg0, %arg1 : !llvm.ptr<7>, i32
    nvvm.mbarrier.expect_tx %arg0, %arg1 {scope = #nvvm.mem_scope<cluster>} : !llvm.ptr<7>, i32
    llvm.return
  }
}

