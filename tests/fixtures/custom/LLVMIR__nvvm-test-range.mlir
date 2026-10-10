module {
  gpu.module @module {
    gpu.func @kernel_1() kernel {
      %0 = nvvm.read.ptx.sreg.tid.x range <i32, 0, 32> : i32
      %1 = nvvm.read.ptx.sreg.tid.y range <i32, 0, 128> : i32
      %2 = nvvm.read.ptx.sreg.tid.z range <i32, 0, 4> : i32
      %c64_i32 = arith.constant 64 : i32
      %3 = arith.cmpi sgt, %0, %c64_i32 : i32
      scf.if %3 {
        gpu.printf "threadidx"
      }
      %4 = arith.cmpi sgt, %1, %c64_i32 : i32
      scf.if %4 {
        gpu.printf "threadidy"
      }
      %5 = arith.cmpi sgt, %2, %c64_i32 : i32
      scf.if %5 {
        gpu.printf "threadidz"
      }
      gpu.return
    }
  }
}

