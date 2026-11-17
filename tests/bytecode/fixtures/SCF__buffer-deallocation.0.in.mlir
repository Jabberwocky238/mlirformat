"builtin.module"() ({
  "func.func"() <{function_type = (index) -> (), sym_name = "parallel_insert_slice"}> ({
  ^bb0(%arg0: index loc("<stdin>":3:8)):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":4:10)
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2xf32> loc("<stdin>":5:10)
    "scf.forall"(%arg0) <{operandSegmentSizes = array<i32: 0, 1, 0, 0>, staticLowerBound = array<i64: 0>, staticStep = array<i64: 1>, staticUpperBound = array<i64: -9223372036854775808>}> ({
    ^bb0(%arg1: index loc("<stdin>":7:10)):
      %2 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2xf32> loc("<stdin>":8:12)
      %3 = "memref.load"(%1, %0) : (memref<2xf32>, index) -> f32 loc("<stdin>":9:12)
      "linalg.fill"(%3, %2) <{operandSegmentSizes = array<i32: 1, 1>}> ({
      ^bb0(%arg2: f32 loc("<stdin>":11:12), %arg3: f32 loc("<stdin>":11:24)):
        "linalg.yield"(%arg2) : (f32) -> () loc("<stdin>":12:9)
      }) : (f32, memref<2xf32>) -> () loc("<stdin>":10:7)
      "scf.forall.in_parallel"() ({
      ^bb0:
      }) : () -> () loc("<stdin>":14:7)
    }) : (index) -> () loc("<stdin>":6:5)
    "func.return"() : () -> () loc("<stdin>":18:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
