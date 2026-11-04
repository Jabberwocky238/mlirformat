module {
  gpu.module @kernel {
    gpu.func @private(%arg0: f32) private(%arg1 : memref<4xf32, #gpu.address_space<private>>) {
      %c0 = arith.constant 0 : index
      memref.store %arg0, %arg1[%c0] : memref<4xf32, #gpu.address_space<private>>
      "terminator"() : () -> ()
    }
  }
}

// -----
module {
  gpu.module @kernel {
    gpu.func @workgroup(%arg0: f32) workgroup(%arg1 : memref<4xf32, #gpu.address_space<workgroup>>) {
      %c0 = arith.constant 0 : index
      memref.store %arg0, %arg1[%c0] : memref<4xf32, #gpu.address_space<workgroup>>
      "terminator"() : () -> ()
    }
  }
}

// -----
module {
  gpu.module @kernel {
    gpu.func @workgroup3d(%arg0: f32) workgroup(%arg1 : memref<4x2x6xf32, #gpu.address_space<workgroup>>) {
      %c0 = arith.constant 0 : index
      memref.store %arg0, %arg1[%c0, %c0, %c0] : memref<4x2x6xf32, #gpu.address_space<workgroup>>
      "terminator"() : () -> ()
    }
  }
}

// -----
module {
  gpu.module @kernel {
    gpu.func @multiple(%arg0: f32) workgroup(%arg1 : memref<1xf32, #gpu.address_space<workgroup>>, %arg2 : memref<2xf32, #gpu.address_space<workgroup>>) private(%arg3 : memref<3xf32, #gpu.address_space<private>>, %arg4 : memref<4xf32, #gpu.address_space<private>>) {
      %c0 = arith.constant 0 : index
      memref.store %arg0, %arg1[%c0] : memref<1xf32, #gpu.address_space<workgroup>>
      memref.store %arg0, %arg2[%c0] : memref<2xf32, #gpu.address_space<workgroup>>
      memref.store %arg0, %arg3[%c0] : memref<3xf32, #gpu.address_space<private>>
      memref.store %arg0, %arg4[%c0] : memref<4xf32, #gpu.address_space<private>>
      "terminator"() : () -> ()
    }
  }
}

// -----
module {
  gpu.module @kernel {
    gpu.func @explicitAlign(%arg0: index) workgroup(%arg1 : memref<48xf32, #gpu.address_space<workgroup>> {llvm.align = 8 : i64}) private(%arg2 : memref<48xf32, #gpu.address_space<private>> {llvm.align = 4 : i64}) {
      %0 = memref.load %arg1[%arg0] : memref<48xf32, #gpu.address_space<workgroup>>
      memref.store %0, %arg2[%arg0] : memref<48xf32, #gpu.address_space<private>>
      "terminator"() : () -> ()
    }
  }
}

