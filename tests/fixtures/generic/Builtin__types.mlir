"builtin.module"() ({
  "func.func"() <{function_type = () -> memref<?x?xf32, strided<[?, ?], offset: ?>>, sym_name = "f1", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = () -> memref<?x?xf32, strided<[42, 1], offset: 10>>, sym_name = "f2", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = () -> memref<?x?xf32, strided<[?, 1], offset: 10>>, sym_name = "f3", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = () -> memref<?x?xf32, strided<[?, 1], offset: ?>>, sym_name = "f4", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = () -> memref<?x?xf32, strided<[42, 1]>>, sym_name = "f5", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = () -> memref<?x?xf32, strided<[42, 1]>>, sym_name = "f6", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = () -> memref<f32, strided<[]>>, sym_name = "f7", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = () -> memref<f32, strided<[], offset: ?>>, sym_name = "f8", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = () -> memref<?xf32, strided<[-1], offset: ?>>, sym_name = "f9", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = () -> memref<f32, strided<[], offset: -1>>, sym_name = "f10", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

