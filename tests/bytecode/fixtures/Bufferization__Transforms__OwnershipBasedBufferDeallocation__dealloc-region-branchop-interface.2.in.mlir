"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> memref<?x?xf32>, sym_name = "nested_region_control_flow_div"}> ({
  ^bb0(%arg0: index loc("<stdin>":4:8), %arg1: index loc("<stdin>":4:22)):
    %0 = "arith.cmpi"(%arg0, %arg1) <{predicate = 0 : i64}> : (index, index) -> i1 loc("<stdin>":5:10)
    %1 = "memref.alloc"(%arg0, %arg0) <{operandSegmentSizes = array<i32: 2, 0>}> : (index, index) -> memref<?x?xf32> loc("<stdin>":6:10)
    %2 = "scf.if"(%0) ({
      "scf.yield"(%1) : (memref<?x?xf32>) -> () loc("<stdin>":8:7)
    }, {
      %3 = "memref.alloc"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 2, 0>}> : (index, index) -> memref<?x?xf32> loc("<stdin>":10:12)
      "scf.yield"(%3) : (memref<?x?xf32>) -> () loc("<stdin>":11:7)
    }) : (i1) -> memref<?x?xf32> loc("<stdin>":7:10)
    "func.return"(%2) : (memref<?x?xf32>) -> () loc("<stdin>":13:5)
  }) : () -> () loc("<stdin>":3:3)
}) : () -> () loc("<stdin>":2:1)
