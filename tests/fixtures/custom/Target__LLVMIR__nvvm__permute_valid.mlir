module {
  llvm.func @test_prmt_default(%arg0: i32, %arg1: i32, %arg2: i32) -> i32 {
    %0 = nvvm.prmt <default> %arg0, %arg1, %arg2 : i32
    llvm.return %0 : i32
  }
  llvm.func @test_prmt_f4e(%arg0: i32, %arg1: i32, %arg2: i32) -> i32 {
    %0 = nvvm.prmt <f4e> %arg0, %arg1, %arg2 : i32
    llvm.return %0 : i32
  }
  llvm.func @test_prmt_b4e(%arg0: i32, %arg1: i32, %arg2: i32) -> i32 {
    %0 = nvvm.prmt <b4e> %arg0, %arg1, %arg2 : i32
    llvm.return %0 : i32
  }
  llvm.func @test_prmt_rc8(%arg0: i32, %arg1: i32) -> i32 {
    %0 = nvvm.prmt <rc8> %arg0, %arg1 : i32
    llvm.return %0 : i32
  }
  llvm.func @test_prmt_ecl(%arg0: i32, %arg1: i32) -> i32 {
    %0 = nvvm.prmt <ecl> %arg0, %arg1 : i32
    llvm.return %0 : i32
  }
  llvm.func @test_prmt_ecr(%arg0: i32, %arg1: i32) -> i32 {
    %0 = nvvm.prmt <ecr> %arg0, %arg1 : i32
    llvm.return %0 : i32
  }
  llvm.func @test_prmt_rc16(%arg0: i32, %arg1: i32) -> i32 {
    %0 = nvvm.prmt <rc16> %arg0, %arg1 : i32
    llvm.return %0 : i32
  }
  llvm.func @test_prmt_mixed(%arg0: i32, %arg1: i32, %arg2: i32) -> i32 {
    %0 = nvvm.prmt <default> %arg0, %arg1, %arg2 : i32
    %1 = nvvm.prmt <rc8> %arg0, %0 : i32
    %2 = nvvm.prmt <f4e> %arg1, %1, %arg0 : i32
    llvm.return %2 : i32
  }
}

