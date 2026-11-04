"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32>) -> (), sym_name = "rectangular"}> ({
  ^bb0(%arg3: memref<?x?xf32>):
    %4 = "arith.constant"() <{value = 2 : index}> : () -> index
    %5 = "arith.constant"() <{value = 44 : index}> : () -> index
    %6 = "arith.constant"() <{value = 1 : index}> : () -> index
    "scf.for"(%4, %5, %6) ({
    ^bb0(%arg4: index):
      "scf.for"(%6, %5, %4) ({
      ^bb0(%arg5: index):
        %7 = "memref.load"(%arg3, %arg4, %arg5) : (memref<?x?xf32>, index, index) -> f32
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?xf32>) -> (), sym_name = "triangular"}> ({
  ^bb0(%arg0: memref<?x?xf32>):
    %0 = "arith.constant"() <{value = 2 : index}> : () -> index
    %1 = "arith.constant"() <{value = 44 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    "scf.for"(%0, %1, %2) ({
    ^bb0(%arg1: index):
      "scf.for"(%2, %arg1, %0) ({
      ^bb0(%arg2: index):
        %3 = "memref.load"(%arg0, %arg1, %arg2) : (memref<?x?xf32>, index, index) -> f32
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

