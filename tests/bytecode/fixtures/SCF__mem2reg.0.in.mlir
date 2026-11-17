"builtin.module"() ({
  "func.func"() <{function_type = (i1) -> i32, sym_name = "if_load_only"}> ({
  ^bb0(%arg0: i1 loc("<stdin>":3:8)):
    %0 = "arith.constant"() <{value = 5 : i32}> : () -> i32 loc("<stdin>":4:10)
    %1 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<i32> loc("<stdin>":5:10)
    "memref.store"(%0, %1) : (i32, memref<i32>) -> () loc("<stdin>":6:5)
    %2 = "scf.if"(%arg0) ({
      %3 = "memref.load"(%1) : (memref<i32>) -> i32 loc("<stdin>":8:12)
      "scf.yield"(%3) : (i32) -> () loc("<stdin>":9:7)
    }, {
      "scf.yield"(%0) : (i32) -> () loc("<stdin>":11:7)
    }) : (i1) -> i32 loc("<stdin>":7:10)
    "func.return"(%2) : (i32) -> () loc("<stdin>":13:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
