"builtin.module"() ({
  "func.func"() <{function_type = (memref<5xi8>) -> memref<5xi8>, sym_name = "collapse_shape_identity_fold"}> ({
  ^bb0(%arg0: memref<5xi8> loc("<stdin>":3:8)):
    %0 = "memref.collapse_shape"(%arg0) <{reassociation = [[0]]}> : (memref<5xi8>) -> memref<5xi8> loc("<stdin>":4:10)
    "func.return"(%0) : (memref<5xi8>) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
