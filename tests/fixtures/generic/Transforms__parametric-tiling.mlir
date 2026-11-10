"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32>) -> (), sym_name = "rectangular"}> ({
  ^bb0(%arg9: memref<?x?xf32>):
    %8 = "arith.constant"() <{value = 2 : index}> : () -> index
    %9 = "arith.constant"() <{value = 44 : index}> : () -> index
    %10 = "arith.constant"() <{value = 1 : index}> : () -> index
    "scf.for"(%8, %9, %10) ({
    ^bb0(%arg10: index):
      "scf.for"(%10, %9, %8) ({
      ^bb0(%arg11: index):
        %11 = "memref.load"(%arg9, %arg10, %arg11) : (memref<?x?xf32>, index, index) -> f32
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?xf32>) -> (), sym_name = "triangular"}> ({
  ^bb0(%arg6: memref<?x?xf32>):
    %4 = "arith.constant"() <{value = 2 : index}> : () -> index
    %5 = "arith.constant"() <{value = 44 : index}> : () -> index
    %6 = "arith.constant"() <{value = 1 : index}> : () -> index
    "scf.for"(%4, %5, %6) ({
    ^bb0(%arg7: index):
      "scf.for"(%6, %arg7, %4) ({
      ^bb0(%arg8: index):
        %7 = "memref.load"(%arg6, %arg7, %arg8) : (memref<?x?xf32>, index, index) -> f32
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1024xf32>, index, index, index) -> f32, sym_name = "loop_with_iter_args"}> ({
  ^bb0(%arg0: memref<1024xf32>, %arg1: index, %arg2: index, %arg3: index):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "scf.for"(%arg1, %arg2, %arg3, %0) ({
    ^bb0(%arg4: index, %arg5: f32):
      %2 = "memref.load"(%arg0, %arg4) : (memref<1024xf32>, index) -> f32
      %3 = "arith.addf"(%arg5, %2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "scf.yield"(%3) : (f32) -> ()
    }) : (index, index, index, f32) -> f32
    "func.return"(%1) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

