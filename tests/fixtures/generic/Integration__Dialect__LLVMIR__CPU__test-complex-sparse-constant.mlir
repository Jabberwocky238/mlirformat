"builtin.module"() ({
  "memref.global"() <{alignment = 128 : i64, constant, initial_value = sparse<[[1], [28], [31]], [(1.000000e+00,0.000000e+00), (2.000000e+00,0.000000e+00), (3.000000e+00,0.000000e+00)]> : tensor<32xcomplex<f32>>, sym_name = "__constant_32xcomplex<f32>_0", sym_visibility = "private", type = memref<32xcomplex<f32>>}> : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "entry", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "memref.get_global"() <{name = @"__constant_32xcomplex<f32>_0"}> : () -> memref<32xcomplex<f32>>
    "llvm.return"() : () -> ()
  }) : () -> ()
}) {llvm.data_layout = ""} : () -> ()

