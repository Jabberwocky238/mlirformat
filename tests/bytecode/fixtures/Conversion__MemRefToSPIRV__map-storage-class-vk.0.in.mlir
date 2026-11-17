"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_vk_specific_memory_spaces"}> ({
    %0 = "dialect.memref_producer"() : () -> memref<4xi32, 8> loc("<stdin>":3:10)
    %1 = "dialect.memref_producer"() : () -> memref<4xi32, 9> loc("<stdin>":4:10)
    %2 = "dialect.memref_producer"() : () -> memref<4xi32, 10> loc("<stdin>":5:10)
    %3 = "dialect.memref_producer"() : () -> memref<4xi32, 11> loc("<stdin>":6:10)
    %4 = "dialect.memref_producer"() : () -> memref<4xi32, 12> loc("<stdin>":7:10)
    "func.return"() : () -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
