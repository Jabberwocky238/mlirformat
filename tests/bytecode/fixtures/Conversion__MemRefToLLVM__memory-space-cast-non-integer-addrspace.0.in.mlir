"builtin.module"() ({
  "func.func"() <{function_type = (memref<128xi32, 3>) -> (), sym_name = "memory_space_cast_non_integer_addrspace"}> ({
  ^bb0(%arg0: memref<128xi32, 3> loc("<stdin>":3:8)):
    %0 = "memref.memory_space_cast"(%arg0) : (memref<128xi32, 3>) -> memref<128xi32, #gpu.address_space<workgroup>> loc("<stdin>":4:10)
    "func.return"() : () -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
