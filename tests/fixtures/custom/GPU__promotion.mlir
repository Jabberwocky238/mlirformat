module {
  gpu.module @foo {
    gpu.func @memref3d(%arg0: memref<5x4xf32> {gpu.test_promote_workgroup}) kernel {
      "use"(%arg0) : (memref<5x4xf32>) -> ()
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @foo {
    gpu.func @memref5d(%arg0: memref<8x7x6x5x4xf32> {gpu.test_promote_workgroup}) kernel {
      "use"(%arg0) : (memref<8x7x6x5x4xf32>) -> ()
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @foo {
    gpu.func @insert(%arg0: memref<4xf32> {gpu.test_promote_workgroup}) workgroup(%arg1 : memref<1x1xf64, #gpu.address_space<workgroup>>) private(%arg2 : memref<1x1xi64, 5>) kernel {
      "use"(%arg0) : (memref<4xf32>) -> ()
      gpu.return
    }
  }
}

