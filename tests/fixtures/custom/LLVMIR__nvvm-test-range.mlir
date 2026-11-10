module {
  gpu.module @module {
    gpu.func @kernel_1() kernel {
      %0 = nvvm.read.ptx.sreg.tid.x range <i32, 0, 32> : i32
      %1 = nvvm.read.ptx.sreg.tid.y range <i32, 0, 128> : i32
      %2 = nvvm.read.ptx.sreg.tid.z range <i32, 0, 4> : i32
      %3 = nvvm.read.ptx.sreg.cluster.ctaid.x : i32
      %4 = ub.poison : i1
      %c64_i32 = arith.constant 64 : i32
      %5 = arith.cmpi sgt, %0, %c64_i32 : i32
      scf.if %5 {
        gpu.printf "threadidx"
      }
      %6 = arith.cmpi sgt, %1, %c64_i32 : i32
      scf.if %6 {
        gpu.printf "threadidy"
      }
      %7 = arith.cmpi sgt, %2, %c64_i32 : i32
      scf.if %7 {
        gpu.printf "threadidz"
      }
      %8 = arith.select %4, %3, %c64_i32 : i32
      gpu.printf "ctaidx", %8 : i32
      gpu.return
    }
  }
}

