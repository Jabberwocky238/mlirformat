module {
  llvm.func @mbarrier_arrive_drop_generic(%arg0: !llvm.ptr, %arg1: i32) {
    %0 = nvvm.mbarrier.arrive_drop %arg0 : !llvm.ptr -> i64
    %1 = nvvm.mbarrier.arrive_drop %arg0, %arg1 : !llvm.ptr -> i64
    %2 = nvvm.mbarrier.arrive_drop %arg0, %arg1 : !llvm.ptr -> i64
    %3 = nvvm.mbarrier.arrive_drop %arg0, %arg1 {scope = #nvvm.mem_scope<cluster>} : !llvm.ptr -> i64
    %4 = nvvm.mbarrier.arrive_drop %arg0 {relaxed = true} : !llvm.ptr -> i64
    %5 = nvvm.mbarrier.arrive_drop %arg0, %arg1 {relaxed = true} : !llvm.ptr -> i64
    %6 = nvvm.mbarrier.arrive_drop %arg0, %arg1 {relaxed = true} : !llvm.ptr -> i64
    %7 = nvvm.mbarrier.arrive_drop %arg0, %arg1 {relaxed = true, scope = #nvvm.mem_scope<cluster>} : !llvm.ptr -> i64
    llvm.return
  }
  llvm.func @mbarrier_arrive_drop_shared(%arg0: !llvm.ptr<3>, %arg1: i32) {
    %0 = nvvm.mbarrier.arrive_drop %arg0 : !llvm.ptr<3> -> i64
    %1 = nvvm.mbarrier.arrive_drop %arg0, %arg1 : !llvm.ptr<3> -> i64
    %2 = nvvm.mbarrier.arrive_drop %arg0, %arg1 : !llvm.ptr<3> -> i64
    %3 = nvvm.mbarrier.arrive_drop %arg0, %arg1 {scope = #nvvm.mem_scope<cluster>} : !llvm.ptr<3> -> i64
    %4 = nvvm.mbarrier.arrive_drop %arg0 {relaxed = true} : !llvm.ptr<3> -> i64
    %5 = nvvm.mbarrier.arrive_drop %arg0, %arg1 {relaxed = true} : !llvm.ptr<3> -> i64
    %6 = nvvm.mbarrier.arrive_drop %arg0, %arg1 {relaxed = true} : !llvm.ptr<3> -> i64
    %7 = nvvm.mbarrier.arrive_drop %arg0, %arg1 {relaxed = true, scope = #nvvm.mem_scope<cluster>} : !llvm.ptr<3> -> i64
    llvm.return
  }
  llvm.func @mbarrier_arrive_drop_shared_cluster(%arg0: !llvm.ptr<7>, %arg1: i32) {
    nvvm.mbarrier.arrive_drop %arg0 : !llvm.ptr<7>
    nvvm.mbarrier.arrive_drop %arg0, %arg1 : !llvm.ptr<7>
    nvvm.mbarrier.arrive_drop %arg0, %arg1 : !llvm.ptr<7>
    nvvm.mbarrier.arrive_drop %arg0, %arg1 {scope = #nvvm.mem_scope<cluster>} : !llvm.ptr<7>
    nvvm.mbarrier.arrive_drop %arg0 {relaxed = true} : !llvm.ptr<7>
    nvvm.mbarrier.arrive_drop %arg0, %arg1 {relaxed = true} : !llvm.ptr<7>
    nvvm.mbarrier.arrive_drop %arg0, %arg1 {relaxed = true} : !llvm.ptr<7>
    nvvm.mbarrier.arrive_drop %arg0, %arg1 {relaxed = true, scope = #nvvm.mem_scope<cluster>} : !llvm.ptr<7>
    llvm.return
  }
  llvm.func @mbarrier_arrive_drop_nocomplete(%arg0: !llvm.ptr) {
    %0 = nvvm.read.ptx.sreg.ntid.x : i32
    %1 = nvvm.mbarrier.arrive_drop.nocomplete %arg0, %0 : !llvm.ptr, i32 -> i64
    llvm.return
  }
  llvm.func @mbarrier_arrive_drop_nocomplete_shared(%arg0: !llvm.ptr<3>) {
    %0 = nvvm.read.ptx.sreg.ntid.x : i32
    %1 = nvvm.mbarrier.arrive_drop.nocomplete %arg0, %0 : !llvm.ptr<3>, i32 -> i64
    llvm.return
  }
}

