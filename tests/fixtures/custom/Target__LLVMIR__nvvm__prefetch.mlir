module {
  llvm.func @prefetch_L1(%arg0: !llvm.ptr, %arg1: !llvm.ptr<5>, %arg2: !llvm.ptr<1>) {
    nvvm.prefetch level = L1, %arg0 : !llvm.ptr
    nvvm.prefetch level = L1, %arg1 : !llvm.ptr<5>
    nvvm.prefetch level = L1, %arg2 : !llvm.ptr<1>
    llvm.return
  }
  llvm.func @prefetch_L2(%arg0: !llvm.ptr, %arg1: !llvm.ptr<5>, %arg2: !llvm.ptr<1>) {
    nvvm.prefetch level = L2, %arg0 : !llvm.ptr
    nvvm.prefetch level = L2, %arg1 : !llvm.ptr<5>
    nvvm.prefetch level = L2, %arg2 : !llvm.ptr<1>
    llvm.return
  }
  llvm.func @prefetch_L2_eviction_priority(%arg0: !llvm.ptr<1>) {
    nvvm.prefetch level = L2, evict_priority = evict_last, %arg0 : !llvm.ptr<1>
    nvvm.prefetch level = L2, evict_priority = evict_normal, %arg0 : !llvm.ptr<1>
    llvm.return
  }
  llvm.func @prefetch_L1_uniform(%arg0: !llvm.ptr) {
    nvvm.prefetch level = L1 uniform, %arg0 : !llvm.ptr
    llvm.return
  }
  llvm.func @prefetch_tensormap(%arg0: !llvm.ptr, %arg1: !llvm.ptr<4>) {
    nvvm.prefetch tensormap, %arg0 : !llvm.ptr
    nvvm.prefetch tensormap, %arg1 : !llvm.ptr<4>
    nvvm.prefetch tensormap in_param_space, %arg0 : !llvm.ptr
    llvm.return
  }
}

