"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "vector_loop"}> ({
    %0 = "arith.constant"() <{value = 128 : index}> : () -> index loc("<stdin>":3:10)
    "acc.kernel_environment"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0>}> ({
      %1 = "acc.par_width"(%0) <{par_dim = #acc.par_dim<thread_x>}> : (index) -> index loc("<stdin>":5:12)
      "acc.compute_region"(%1) <{operandSegmentSizes = array<i32: 1, 0, 0>, origin = "acc.parallel"}> ({
      ^bb0(%arg0: index loc("<stdin>":7:12)):
        %2 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":8:14)
        %3 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":9:14)
        %4 = "arith.constant"() <{value = 128 : index}> : () -> index loc("<stdin>":10:14)
        "scf.parallel"(%2, %4, %3) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>}> ({
        ^bb0(%arg1: index loc("<stdin>":12:14)):
          "scf.reduce"() : () -> () loc("<stdin>":13:11)
        }) {acc.par_dims = #acc<par_dims[thread_x]>} : (index, index, index) -> () loc("<stdin>":11:9)
        "acc.yield"() : () -> () loc("<stdin>":15:9)
      }) : (index) -> () loc("<stdin>":6:7)
    }) : () -> () loc("<stdin>":4:5)
    "func.return"() : () -> () loc("<stdin>":18:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
