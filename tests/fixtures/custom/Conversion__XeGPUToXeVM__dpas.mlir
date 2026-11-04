module {
  gpu.module @test_kernel {
    func.func @dpas(%arg0: vector<8xf16>, %arg1: vector<16xf16>, %arg2: vector<8xf32>) -> vector<8xf32> {
      %0 = xegpu.dpas %arg0, %arg1, %arg2 : vector<8xf16>, vector<16xf16>, vector<8xf32> -> vector<8xf32>
      return %0 : vector<8xf32>
    }
  }
}

