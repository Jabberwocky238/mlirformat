module {
  llvm.func @mbarrier_try_wait_state(%arg0: !llvm.ptr, %arg1: i64) {
    %0 = nvvm.mbarrier.try_wait %arg0, %arg1 : !llvm.ptr, i64 -> i1
    %1 = nvvm.mbarrier.try_wait %arg0, %arg1 {scope = #nvvm.mem_scope<cluster>} : !llvm.ptr, i64 -> i1
    %2 = nvvm.mbarrier.try_wait %arg0, %arg1 {relaxed = true} : !llvm.ptr, i64 -> i1
    %3 = nvvm.mbarrier.try_wait %arg0, %arg1 {relaxed = true, scope = #nvvm.mem_scope<cluster>} : !llvm.ptr, i64 -> i1
    llvm.return
  }
  llvm.func @mbarrier_try_wait_state_with_timelimit(%arg0: !llvm.ptr, %arg1: i64, %arg2: i32) {
    %0 = nvvm.mbarrier.try_wait %arg0, %arg1, %arg2 : !llvm.ptr, i64, i32 -> i1
    %1 = nvvm.mbarrier.try_wait %arg0, %arg1, %arg2 {scope = #nvvm.mem_scope<cluster>} : !llvm.ptr, i64, i32 -> i1
    %2 = nvvm.mbarrier.try_wait %arg0, %arg1, %arg2 {relaxed = true} : !llvm.ptr, i64, i32 -> i1
    %3 = nvvm.mbarrier.try_wait %arg0, %arg1, %arg2 {relaxed = true, scope = #nvvm.mem_scope<cluster>} : !llvm.ptr, i64, i32 -> i1
    llvm.return
  }
  llvm.func @mbarrier_try_wait_shared_state(%arg0: !llvm.ptr<3>, %arg1: i64) {
    %0 = nvvm.mbarrier.try_wait %arg0, %arg1 : !llvm.ptr<3>, i64 -> i1
    %1 = nvvm.mbarrier.try_wait %arg0, %arg1 {scope = #nvvm.mem_scope<cluster>} : !llvm.ptr<3>, i64 -> i1
    %2 = nvvm.mbarrier.try_wait %arg0, %arg1 {relaxed = true} : !llvm.ptr<3>, i64 -> i1
    %3 = nvvm.mbarrier.try_wait %arg0, %arg1 {relaxed = true, scope = #nvvm.mem_scope<cluster>} : !llvm.ptr<3>, i64 -> i1
    llvm.return
  }
  llvm.func @mbarrier_try_wait_shared_state_with_timelimit(%arg0: !llvm.ptr<3>, %arg1: i64, %arg2: i32) {
    %0 = nvvm.mbarrier.try_wait %arg0, %arg1, %arg2 : !llvm.ptr<3>, i64, i32 -> i1
    %1 = nvvm.mbarrier.try_wait %arg0, %arg1, %arg2 {scope = #nvvm.mem_scope<cluster>} : !llvm.ptr<3>, i64, i32 -> i1
    %2 = nvvm.mbarrier.try_wait %arg0, %arg1, %arg2 {relaxed = true} : !llvm.ptr<3>, i64, i32 -> i1
    %3 = nvvm.mbarrier.try_wait %arg0, %arg1, %arg2 {relaxed = true, scope = #nvvm.mem_scope<cluster>} : !llvm.ptr<3>, i64, i32 -> i1
    llvm.return
  }
  llvm.func @mbarrier_try_wait_phase(%arg0: !llvm.ptr, %arg1: i32) {
    %0 = nvvm.mbarrier.try_wait %arg0, %arg1 : !llvm.ptr, i32 -> i1
    %1 = nvvm.mbarrier.try_wait %arg0, %arg1 {scope = #nvvm.mem_scope<cluster>} : !llvm.ptr, i32 -> i1
    %2 = nvvm.mbarrier.try_wait %arg0, %arg1 {relaxed = true} : !llvm.ptr, i32 -> i1
    %3 = nvvm.mbarrier.try_wait %arg0, %arg1 {relaxed = true, scope = #nvvm.mem_scope<cluster>} : !llvm.ptr, i32 -> i1
    llvm.return
  }
  llvm.func @mbarrier_try_wait_phase_with_timelimit(%arg0: !llvm.ptr, %arg1: i32, %arg2: i32) {
    %0 = nvvm.mbarrier.try_wait %arg0, %arg1, %arg2 : !llvm.ptr, i32, i32 -> i1
    %1 = nvvm.mbarrier.try_wait %arg0, %arg1, %arg2 {scope = #nvvm.mem_scope<cluster>} : !llvm.ptr, i32, i32 -> i1
    %2 = nvvm.mbarrier.try_wait %arg0, %arg1, %arg2 {relaxed = true} : !llvm.ptr, i32, i32 -> i1
    %3 = nvvm.mbarrier.try_wait %arg0, %arg1, %arg2 {relaxed = true, scope = #nvvm.mem_scope<cluster>} : !llvm.ptr, i32, i32 -> i1
    llvm.return
  }
  llvm.func @mbarrier_try_wait_shared_phase(%arg0: !llvm.ptr<3>, %arg1: i32) {
    %0 = nvvm.mbarrier.try_wait %arg0, %arg1 : !llvm.ptr<3>, i32 -> i1
    %1 = nvvm.mbarrier.try_wait %arg0, %arg1 {scope = #nvvm.mem_scope<cluster>} : !llvm.ptr<3>, i32 -> i1
    %2 = nvvm.mbarrier.try_wait %arg0, %arg1 {relaxed = true} : !llvm.ptr<3>, i32 -> i1
    %3 = nvvm.mbarrier.try_wait %arg0, %arg1 {relaxed = true, scope = #nvvm.mem_scope<cluster>} : !llvm.ptr<3>, i32 -> i1
    llvm.return
  }
  llvm.func @mbarrier_try_wait_shared_phase_with_timelimit(%arg0: !llvm.ptr<3>, %arg1: i32, %arg2: i32) {
    %0 = nvvm.mbarrier.try_wait %arg0, %arg1, %arg2 : !llvm.ptr<3>, i32, i32 -> i1
    %1 = nvvm.mbarrier.try_wait %arg0, %arg1, %arg2 {scope = #nvvm.mem_scope<cluster>} : !llvm.ptr<3>, i32, i32 -> i1
    %2 = nvvm.mbarrier.try_wait %arg0, %arg1, %arg2 {relaxed = true} : !llvm.ptr<3>, i32, i32 -> i1
    %3 = nvvm.mbarrier.try_wait %arg0, %arg1, %arg2 {relaxed = true, scope = #nvvm.mem_scope<cluster>} : !llvm.ptr<3>, i32, i32 -> i1
    llvm.return
  }
}

