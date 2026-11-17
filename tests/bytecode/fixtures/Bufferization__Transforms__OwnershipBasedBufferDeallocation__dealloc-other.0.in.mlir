"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?xf16>) -> memref<?x?x?xf16>, sym_name = "no_interface_no_operands", sym_visibility = "private"}> ({
  ^bb0(%arg0: tensor<?x?x?xf16> loc("<stdin>":3:8)):
    %0 = "bufferization.to_buffer"(%arg0) : (tensor<?x?x?xf16>) -> memref<?x?x?xf16> loc("<stdin>":4:10)
    "func.return"(%0) : (memref<?x?x?xf16>) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
