"builtin.module"() ({
  "memref.global"() <{alignment = 16 : i64, constant, initial_value = dense<[1, 2, 3, 4]> : tensor<4xi32>, sym_name = "__constant_4xi32", sym_visibility = "private", type = memref<4xi32>}> : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (i32) -> i32, sym_name = "main"}> ({
  ^bb0(%arg0: i32 loc("<stdin>":4:8)):
    %0 = "tensor.empty"() : () -> tensor<10xbf16> loc("<stdin>":5:10)
    %1 = "memref.get_global"() <{name = @__constant_4xi32}> : () -> memref<4xi32> loc("<stdin>":6:10)
    "func.return"(%arg0) : (i32) -> () loc("<stdin>":7:5)
  }) : () -> () loc("<stdin>":3:3)
}) : () -> () loc("<stdin>":1:1)
