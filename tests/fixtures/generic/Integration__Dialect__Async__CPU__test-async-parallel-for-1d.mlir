"builtin.module"() ({
  "func.func"() <{function_type = () -> index, sym_name = "zero", sym_visibility = "private"}> ({
    %27 = "arith.constant"() <{value = 0 : index}> : () -> index
    "func.return"(%27) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 2 : index}> : () -> index
    %3 = "arith.constant"() <{value = 3 : index}> : () -> index
    %4 = "arith.constant"() <{value = 0 : index}> : () -> index
    %5 = "arith.constant"() <{value = 9 : index}> : () -> index
    %6 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<9xf32>
    %7 = "memref.cast"(%6) : (memref<9xf32>) -> memref<*xf32>
    "scf.parallel"(%4, %5, %1) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>}> ({
    ^bb0(%arg6: index):
      "memref.store"(%0, %6, %arg6) : (f32, memref<9xf32>, index) -> ()
      "scf.reduce"() : () -> ()
    }) : (index, index, index) -> ()
    "scf.parallel"(%4, %5, %1) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>}> ({
    ^bb0(%arg5: index):
      %23 = "arith.index_cast"(%arg5) : (index) -> i32
      %24 = "arith.sitofp"(%23) : (i32) -> f32
      %25 = "memref.load"(%6, %arg5) : (memref<9xf32>, index) -> f32
      %26 = "arith.addf"(%24, %25) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "memref.store"(%26, %6, %arg5) : (f32, memref<9xf32>, index) -> ()
      "scf.reduce"() : () -> ()
    }) : (index, index, index) -> ()
    "func.call"(%7) <{callee = @printMemrefF32}> : (memref<*xf32>) -> ()
    "scf.parallel"(%4, %5, %1) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>}> ({
    ^bb0(%arg4: index):
      "memref.store"(%0, %6, %arg4) : (f32, memref<9xf32>, index) -> ()
      "scf.reduce"() : () -> ()
    }) : (index, index, index) -> ()
    "scf.parallel"(%4, %5, %2) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>}> ({
    ^bb0(%arg3: index):
      %19 = "arith.index_cast"(%arg3) : (index) -> i32
      %20 = "arith.sitofp"(%19) : (i32) -> f32
      %21 = "memref.load"(%6, %arg3) : (memref<9xf32>, index) -> f32
      %22 = "arith.addf"(%20, %21) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "memref.store"(%22, %6, %arg3) : (f32, memref<9xf32>, index) -> ()
      "scf.reduce"() : () -> ()
    }) : (index, index, index) -> ()
    "func.call"(%7) <{callee = @printMemrefF32}> : (memref<*xf32>) -> ()
    "scf.parallel"(%4, %5, %1) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>}> ({
    ^bb0(%arg2: index):
      "memref.store"(%0, %6, %arg2) : (f32, memref<9xf32>, index) -> ()
      "scf.reduce"() : () -> ()
    }) : (index, index, index) -> ()
    %8 = "arith.constant"() <{value = -20 : index}> : () -> index
    %9 = "arith.constant"() <{value = -11 : index}> : () -> index
    "scf.parallel"(%8, %9, %3) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>}> ({
    ^bb0(%arg1: index):
      %13 = "arith.index_cast"(%arg1) : (index) -> i32
      %14 = "arith.sitofp"(%13) : (i32) -> f32
      %15 = "arith.constant"() <{value = 20 : index}> : () -> index
      %16 = "arith.addi"(%arg1, %15) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %17 = "memref.load"(%6, %16) : (memref<9xf32>, index) -> f32
      %18 = "arith.addf"(%14, %17) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "memref.store"(%18, %6, %16) : (f32, memref<9xf32>, index) -> ()
      "scf.reduce"() : () -> ()
    }) : (index, index, index) -> ()
    "func.call"(%7) <{callee = @printMemrefF32}> : (memref<*xf32>) -> ()
    %10 = "func.call"() <{callee = @zero}> : () -> index
    %11 = "func.call"() <{callee = @zero}> : () -> index
    "scf.parallel"(%10, %11, %1) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>}> ({
    ^bb0(%arg0: index):
      %12 = "arith.constant"() <{value = false}> : () -> i1
      "cf.assert"(%12) <{msg = "should never be executed"}> : (i1) -> ()
      "scf.reduce"() : () -> ()
    }) : (index, index, index) -> ()
    "memref.dealloc"(%6) : (memref<9xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) {llvm.emit_c_interface} : () -> ()
}) : () -> ()

