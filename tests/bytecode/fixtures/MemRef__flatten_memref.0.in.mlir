"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x8xf32, strided<[8, 1], offset: 100>>) -> f32, sym_name = "load_scalar_from_memref"}> ({
  ^bb0(%arg0: memref<4x8xf32, strided<[8, 1], offset: 100>> loc("<stdin>":3:8)):
    %0 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":4:10)
    %1 = "arith.constant"() <{value = 2 : index}> : () -> index loc("<stdin>":5:10)
    %2 = "memref.load"(%arg0, %0, %1) : (memref<4x8xf32, strided<[8, 1], offset: 100>>, index, index) -> f32 loc("<stdin>":6:10)
    "func.return"(%2) : (f32) -> () loc("<stdin>":7:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
