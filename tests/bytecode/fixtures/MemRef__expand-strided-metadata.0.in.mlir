"builtin.module"() ({
  "func.func"() <{function_type = (memref<5x4xf32, strided<[4, 1], offset: 2>>) -> (memref<f32>, index, index, index, index, index), sym_name = "extract_strided_metadata_constants"}> ({
  ^bb0(%arg0: memref<5x4xf32, strided<[4, 1], offset: 2>> loc("<stdin>":3:8)):
    %0:6 = "memref.extract_strided_metadata"(%arg0) : (memref<5x4xf32, strided<[4, 1], offset: 2>>) -> (memref<f32>, index, index, index, index, index) loc("<stdin>":4:12)
    "func.return"(%0#0, %0#1, %0#2, %0#3, %0#4, %0#5) : (memref<f32>, index, index, index, index, index) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
