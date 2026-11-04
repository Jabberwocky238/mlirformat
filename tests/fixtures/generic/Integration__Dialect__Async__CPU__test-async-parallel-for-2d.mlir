"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 2 : index}> : () -> index
    %3 = "arith.constant"() <{value = 8 : index}> : () -> index
    %4 = "arith.constant"() <{value = 0 : index}> : () -> index
    %5 = "arith.constant"() <{value = 8 : index}> : () -> index
    %6 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<8x8xf32>
    %7 = "memref.cast"(%6) : (memref<8x8xf32>) -> memref<*xf32>
    "scf.parallel"(%4, %4, %5, %5, %1, %1) <{operandSegmentSizes = array<i32: 2, 2, 2, 0>}> ({
    ^bb0(%arg10: index, %arg11: index):
      "memref.store"(%0, %6, %arg10, %arg11) : (f32, memref<8x8xf32>, index, index) -> ()
      "scf.reduce"() : () -> ()
    }) : (index, index, index, index, index, index) -> ()
    "scf.parallel"(%4, %4, %5, %5, %1, %1) <{operandSegmentSizes = array<i32: 2, 2, 2, 0>}> ({
    ^bb0(%arg8: index, %arg9: index):
      %20 = "arith.muli"(%arg8, %3) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %21 = "arith.addi"(%arg9, %20) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %22 = "arith.index_cast"(%21) : (index) -> i32
      %23 = "arith.sitofp"(%22) : (i32) -> f32
      %24 = "memref.load"(%6, %arg8, %arg9) : (memref<8x8xf32>, index, index) -> f32
      %25 = "arith.addf"(%23, %24) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "memref.store"(%25, %6, %arg8, %arg9) : (f32, memref<8x8xf32>, index, index) -> ()
      "scf.reduce"() : () -> ()
    }) : (index, index, index, index, index, index) -> ()
    "func.call"(%7) <{callee = @printMemrefF32}> : (memref<*xf32>) -> ()
    "scf.parallel"(%4, %4, %5, %5, %1, %1) <{operandSegmentSizes = array<i32: 2, 2, 2, 0>}> ({
    ^bb0(%arg6: index, %arg7: index):
      "memref.store"(%0, %6, %arg6, %arg7) : (f32, memref<8x8xf32>, index, index) -> ()
      "scf.reduce"() : () -> ()
    }) : (index, index, index, index, index, index) -> ()
    "scf.parallel"(%4, %4, %5, %5, %2, %1) <{operandSegmentSizes = array<i32: 2, 2, 2, 0>}> ({
    ^bb0(%arg4: index, %arg5: index):
      %14 = "arith.muli"(%arg4, %3) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %15 = "arith.addi"(%arg5, %14) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %16 = "arith.index_cast"(%15) : (index) -> i32
      %17 = "arith.sitofp"(%16) : (i32) -> f32
      %18 = "memref.load"(%6, %arg4, %arg5) : (memref<8x8xf32>, index, index) -> f32
      %19 = "arith.addf"(%17, %18) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "memref.store"(%19, %6, %arg4, %arg5) : (f32, memref<8x8xf32>, index, index) -> ()
      "scf.reduce"() : () -> ()
    }) : (index, index, index, index, index, index) -> ()
    "func.call"(%7) <{callee = @printMemrefF32}> : (memref<*xf32>) -> ()
    "scf.parallel"(%4, %4, %5, %5, %1, %1) <{operandSegmentSizes = array<i32: 2, 2, 2, 0>}> ({
    ^bb0(%arg2: index, %arg3: index):
      "memref.store"(%0, %6, %arg2, %arg3) : (f32, memref<8x8xf32>, index, index) -> ()
      "scf.reduce"() : () -> ()
    }) : (index, index, index, index, index, index) -> ()
    "scf.parallel"(%4, %4, %5, %5, %1, %2) <{operandSegmentSizes = array<i32: 2, 2, 2, 0>}> ({
    ^bb0(%arg0: index, %arg1: index):
      %8 = "arith.muli"(%arg0, %3) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %9 = "arith.addi"(%arg1, %8) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %10 = "arith.index_cast"(%9) : (index) -> i32
      %11 = "arith.sitofp"(%10) : (i32) -> f32
      %12 = "memref.load"(%6, %arg0, %arg1) : (memref<8x8xf32>, index, index) -> f32
      %13 = "arith.addf"(%11, %12) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "memref.store"(%13, %6, %arg0, %arg1) : (f32, memref<8x8xf32>, index, index) -> ()
      "scf.reduce"() : () -> ()
    }) : (index, index, index, index, index, index) -> ()
    "func.call"(%7) <{callee = @printMemrefF32}> : (memref<*xf32>) -> ()
    "memref.dealloc"(%6) : (memref<8x8xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) {llvm.emit_c_interface} : () -> ()
}) : () -> ()

