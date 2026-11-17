"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xf32>) -> (), sym_name = "dealloc_with_user_free"}> ({
  ^bb0(%arg0: memref<?xf32> loc("<stdin>":3:8)):
    "memref.dealloc"(%arg0) : (memref<?xf32>) -> () loc("<stdin>":4:5)
    "func.return"() : () -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (!llvm.ptr) -> (), sym_name = "free", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":7:3)
}) : () -> () loc("<stdin>":1:1)
