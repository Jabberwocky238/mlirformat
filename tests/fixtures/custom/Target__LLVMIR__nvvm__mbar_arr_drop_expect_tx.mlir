module {
  llvm.func @mbarrier_arrive_drop_expect_tx_generic(%arg0: !llvm.ptr, %arg1: i32) {
    %0 = nvvm.mbarrier.arrive_drop.expect_tx %arg0, %arg1 : !llvm.ptr, i32 -> i64
    %1 = nvvm.mbarrier.arrive_drop.expect_tx %arg0, %arg1 : !llvm.ptr, i32 -> i64
    %2 = nvvm.mbarrier.arrive_drop.expect_tx %arg0, %arg1 {scope = #nvvm.mem_scope<cluster>} : !llvm.ptr, i32 -> i64
    %3 = nvvm.mbarrier.arrive_drop.expect_tx %arg0, %arg1 {relaxed = true} : !llvm.ptr, i32 -> i64
    %4 = nvvm.mbarrier.arrive_drop.expect_tx %arg0, %arg1 {relaxed = true} : !llvm.ptr, i32 -> i64
    %5 = nvvm.mbarrier.arrive_drop.expect_tx %arg0, %arg1 {relaxed = true, scope = #nvvm.mem_scope<cluster>} : !llvm.ptr, i32 -> i64
    llvm.return
  }
  llvm.func @mbarrier_arrive_drop_expect_tx_shared(%arg0: !llvm.ptr<3>, %arg1: i32) {
    %0 = nvvm.mbarrier.arrive_drop.expect_tx %arg0, %arg1 : !llvm.ptr<3>, i32 -> i64
    %1 = nvvm.mbarrier.arrive_drop.expect_tx %arg0, %arg1 : !llvm.ptr<3>, i32 -> i64
    %2 = nvvm.mbarrier.arrive_drop.expect_tx %arg0, %arg1 {scope = #nvvm.mem_scope<cluster>} : !llvm.ptr<3>, i32 -> i64
    %3 = nvvm.mbarrier.arrive_drop.expect_tx %arg0, %arg1 {relaxed = true} : !llvm.ptr<3>, i32 -> i64
    %4 = nvvm.mbarrier.arrive_drop.expect_tx %arg0, %arg1 {relaxed = true} : !llvm.ptr<3>, i32 -> i64
    %5 = nvvm.mbarrier.arrive_drop.expect_tx %arg0, %arg1 {relaxed = true, scope = #nvvm.mem_scope<cluster>} : !llvm.ptr<3>, i32 -> i64
    llvm.return
  }
  llvm.func @mbarrier_arrive_drop_expect_tx_shared_cluster(%arg0: !llvm.ptr<7>, %arg1: i32) {
    nvvm.mbarrier.arrive_drop.expect_tx %arg0, %arg1 : !llvm.ptr<7>, i32
    nvvm.mbarrier.arrive_drop.expect_tx %arg0, %arg1 : !llvm.ptr<7>, i32
    nvvm.mbarrier.arrive_drop.expect_tx %arg0, %arg1 {scope = #nvvm.mem_scope<cluster>} : !llvm.ptr<7>, i32
    nvvm.mbarrier.arrive_drop.expect_tx %arg0, %arg1 {relaxed = true} : !llvm.ptr<7>, i32
    nvvm.mbarrier.arrive_drop.expect_tx %arg0, %arg1 {relaxed = true} : !llvm.ptr<7>, i32
    nvvm.mbarrier.arrive_drop.expect_tx %arg0, %arg1 {relaxed = true, scope = #nvvm.mem_scope<cluster>} : !llvm.ptr<7>, i32
    llvm.return
  }
}

