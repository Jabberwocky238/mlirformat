"builtin.module"() ({
  "func.func"() <{function_type = (index) -> (index, index, index), sym_name = "delinearize_static_basis"}> ({
  ^bb0(%arg0: index loc("<stdin>":3:8)):
    %0:3 = "affine.delinearize_index"(%arg0) <{static_basis = array<i64: 16, 224, 224>}> : (index) -> (index, index, index) loc("<stdin>":4:12)
    "func.return"(%0#0, %0#1, %0#2) : (index, index, index) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
