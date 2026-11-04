module {
  llvm.func @test_nvvm_elect_sync() -> i1 {
    %0 = nvvm.elect.sync -> i1
    llvm.return %0 : i1
  }
  llvm.func @test_nvvm_elect_sync_mask(%arg0: i32) -> i1 {
    %0 = nvvm.elect.sync %arg0 -> i1
    llvm.return %0 : i1
  }
}

