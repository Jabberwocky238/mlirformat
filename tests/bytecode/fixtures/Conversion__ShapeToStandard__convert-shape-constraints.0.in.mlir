"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xindex>, tensor<?xindex>) -> !shape.witness, sym_name = "cstr_broadcastable"}> ({
  ^bb0(%arg3: tensor<?xindex> loc("<stdin>":3:8), %arg4: tensor<?xindex> loc("<stdin>":3:32)):
    %2 = "shape.cstr_broadcastable"(%arg3, %arg4) : (tensor<?xindex>, tensor<?xindex>) -> !shape.witness loc("<stdin>":4:10)
    "func.return"(%2) : (!shape.witness) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (tensor<?xindex>, tensor<?xindex>) -> !shape.witness, sym_name = "cstr_eq"}> ({
  ^bb0(%arg1: tensor<?xindex> loc("<stdin>":8:8), %arg2: tensor<?xindex> loc("<stdin>":8:32)):
    %1 = "shape.cstr_eq"(%arg1, %arg2) : (tensor<?xindex>, tensor<?xindex>) -> !shape.witness loc("<stdin>":9:10)
    "func.return"(%1) : (!shape.witness) -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":7:3)
  "func.func"() <{function_type = (i1) -> !shape.witness, sym_name = "cstr_require"}> ({
  ^bb0(%arg0: i1 loc("<stdin>":13:8)):
    %0 = "shape.cstr_require"(%arg0) <{msg = "msg"}> : (i1) -> !shape.witness loc("<stdin>":14:10)
    "func.return"(%0) : (!shape.witness) -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":12:3)
}) : () -> () loc("<stdin>":1:1)
