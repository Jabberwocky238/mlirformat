"builtin.module"() ({
  %0 = "arith.addi"(%1, %2) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
  %1 = "arith.constant"() <{value = 0 : index}> : () -> index
  %2 = "arith.constant"() <{value = 1 : index}> : () -> index
}) : () -> ()

