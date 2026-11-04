#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32>, memref<?x?xf32>, memref<?x?xf32>) -> (), sym_name = "linalg_generic"}> ({
  ^bb0(%arg5: memref<?x?xf32>, %arg6: memref<?x?xf32>, %arg7: memref<?x?xf32>):
    "linalg.generic"(%arg5, %arg6, %arg7) <{indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg8: f32, %arg9: f32, %arg10: f32):
      %21 = "arith.addf"(%arg8, %arg9) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%21) : (f32) -> ()
    }) : (memref<?x?xf32>, memref<?x?xf32>, memref<?x?xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %1 = "arith.constant"() <{value = 4.000000e+00 : f32}> : () -> f32
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index
    %3 = "arith.constant"() <{value = 1 : index}> : () -> index
    %4 = "arith.constant"() <{value = 50 : index}> : () -> index
    %5 = "memref.alloc"() <{alignment = 64 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1x10xf32>
    %6 = "memref.alloc"() <{alignment = 64 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1x10xf32>
    %7 = "memref.alloc"() <{alignment = 64 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1x10xf32>
    "linalg.fill"(%0, %5) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32):
      "linalg.yield"(%arg3) : (f32) -> ()
    }) : (f32, memref<1x10xf32>) -> ()
    "linalg.fill"(%0, %6) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg1: f32, %arg2: f32):
      "linalg.yield"(%arg1) : (f32) -> ()
    }) : (f32, memref<1x10xf32>) -> ()
    %8 = "memref.cast"(%5) : (memref<1x10xf32>) -> memref<?x?xf32>
    %9 = "memref.cast"(%6) : (memref<1x10xf32>) -> memref<?x?xf32>
    %10 = "memref.cast"(%7) : (memref<1x10xf32>) -> memref<?x?xf32>
    "func.call"(%8, %9, %10) <{callee = @linalg_generic}> : (memref<?x?xf32>, memref<?x?xf32>, memref<?x?xf32>) -> ()
    %11 = "memref.cast"(%7) : (memref<1x10xf32>) -> memref<*xf32>
    "func.call"(%11) <{callee = @printMemrefF32}> : (memref<*xf32>) -> ()
    "memref.dealloc"(%5) : (memref<1x10xf32>) -> ()
    "memref.dealloc"(%6) : (memref<1x10xf32>) -> ()
    "memref.dealloc"(%7) : (memref<1x10xf32>) -> ()
    %12 = "memref.alloc"() <{alignment = 64 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1024x1024xf32>
    %13 = "memref.alloc"() <{alignment = 64 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1024x1024xf32>
    %14 = "memref.alloc"() <{alignment = 64 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1024x1024xf32>
    %15 = "memref.cast"(%12) : (memref<1024x1024xf32>) -> memref<?x?xf32>
    %16 = "memref.cast"(%13) : (memref<1024x1024xf32>) -> memref<?x?xf32>
    %17 = "memref.cast"(%14) : (memref<1024x1024xf32>) -> memref<?x?xf32>
    "func.call"(%15, %16, %17) <{callee = @linalg_generic}> : (memref<?x?xf32>, memref<?x?xf32>, memref<?x?xf32>) -> ()
    %18 = "func.call"() <{callee = @rtclock}> : () -> f64
    "scf.for"(%2, %4, %3) ({
    ^bb0(%arg0: index):
      "func.call"(%15, %16, %17) <{callee = @linalg_generic}> : (memref<?x?xf32>, memref<?x?xf32>, memref<?x?xf32>) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    %19 = "func.call"() <{callee = @rtclock}> : () -> f64
    %20 = "arith.subf"(%19, %18) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
    "vector.print"(%20) <{punctuation = #vector.punctuation<newline>}> : (f64) -> ()
    "memref.dealloc"(%12) : (memref<1024x1024xf32>) -> ()
    "memref.dealloc"(%13) : (memref<1024x1024xf32>) -> ()
    "memref.dealloc"(%14) : (memref<1024x1024xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> f64, sym_name = "rtclock", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (memref<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) {llvm.emit_c_interface} : () -> ()
}) : () -> ()

