"builtin.module"() ({
  %0 = "arith.addi"(%1, %2) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":2:8)
  %1 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":3:8)
  %2 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":4:8)
}) : () -> () loc("<stdin>":1:1)
