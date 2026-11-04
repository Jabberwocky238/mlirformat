module {
  llvm.func @mbarrier_arrive_generic(%arg0: !llvm.ptr, %arg1: i32) {
    %0 = nvvm.mbarrier.arrive %arg0 : !llvm.ptr -> i64
    %1 = nvvm.mbarrier.arrive %arg0, %arg1 : !llvm.ptr -> i64
    %2 = nvvm.mbarrier.arrive %arg0, %arg1 : !llvm.ptr -> i64
    %3 = nvvm.mbarrier.arrive %arg0, %arg1 {scope = #nvvm.mem_scope<cluster>} : !llvm.ptr -> i64
    %4 = nvvm.mbarrier.arrive %arg0 {relaxed = true} : !llvm.ptr -> i64
    %5 = nvvm.mbarrier.arrive %arg0, %arg1 {relaxed = true} : !llvm.ptr -> i64
    %6 = nvvm.mbarrier.arrive %arg0, %arg1 {relaxed = true} : !llvm.ptr -> i64
    %7 = nvvm.mbarrier.arrive %arg0, %arg1 {relaxed = true, scope = #nvvm.mem_scope<cluster>} : !llvm.ptr -> i64
    llvm.return
  }
  llvm.func @mbarrier_arrive_shared(%arg0: !llvm.ptr<3>, %arg1: i32) {
    %0 = nvvm.mbarrier.arrive %arg0 : !llvm.ptr<3> -> i64
    %1 = nvvm.mbarrier.arrive %arg0, %arg1 : !llvm.ptr<3> -> i64
    %2 = nvvm.mbarrier.arrive %arg0, %arg1 : !llvm.ptr<3> -> i64
    %3 = nvvm.mbarrier.arrive %arg0, %arg1 {scope = #nvvm.mem_scope<cluster>} : !llvm.ptr<3> -> i64
    %4 = nvvm.mbarrier.arrive %arg0 {relaxed = true} : !llvm.ptr<3> -> i64
    %5 = nvvm.mbarrier.arrive %arg0, %arg1 {relaxed = true} : !llvm.ptr<3> -> i64
    %6 = nvvm.mbarrier.arrive %arg0, %arg1 {relaxed = true} : !llvm.ptr<3> -> i64
    %7 = nvvm.mbarrier.arrive %arg0, %arg1 {relaxed = true, scope = #nvvm.mem_scope<cluster>} : !llvm.ptr<3> -> i64
    llvm.return
  }
  llvm.func @mbarrier_arrive_shared_cluster(%arg0: !llvm.ptr<7>, %arg1: i32) {
    nvvm.mbarrier.arrive %arg0 : !llvm.ptr<7>
    nvvm.mbarrier.arrive %arg0, %arg1 : !llvm.ptr<7>
    nvvm.mbarrier.arrive %arg0, %arg1 : !llvm.ptr<7>
    nvvm.mbarrier.arrive %arg0, %arg1 {scope = #nvvm.mem_scope<cluster>} : !llvm.ptr<7>
    nvvm.mbarrier.arrive %arg0 {relaxed = true} : !llvm.ptr<7>
    nvvm.mbarrier.arrive %arg0, %arg1 {relaxed = true} : !llvm.ptr<7>
    nvvm.mbarrier.arrive %arg0, %arg1 {relaxed = true} : !llvm.ptr<7>
    nvvm.mbarrier.arrive %arg0, %arg1 {relaxed = true, scope = #nvvm.mem_scope<cluster>} : !llvm.ptr<7>
    llvm.return
  }
  llvm.func @mbarrier_arrive_nocomplete(%arg0: !llvm.ptr) {
    %0 = nvvm.read.ptx.sreg.ntid.x : i32
    %1 = nvvm.mbarrier.arrive.nocomplete %arg0, %0 : !llvm.ptr, i32 -> i64
    llvm.return
  }
  llvm.func @mbarrier_arrive_nocomplete_shared(%arg0: !llvm.ptr<3>) {
    %0 = nvvm.read.ptx.sreg.ntid.x : i32
    %1 = nvvm.mbarrier.arrive.nocomplete %arg0, %0 : !llvm.ptr<3>, i32 -> i64
    llvm.return
  }
  llvm.func @mbarrier_arrive_ignore_retval(%arg0: i32, %arg1: !llvm.ptr<3>) {
    nvvm.mbarrier.arrive %arg1, %arg0 : !llvm.ptr<3>
    nvvm.mbarrier.arrive %arg1, %arg0 : !llvm.ptr<3>
    llvm.return
  }
}

