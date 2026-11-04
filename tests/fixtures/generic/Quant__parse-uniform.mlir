"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> !quant.uniform<i8<-8:7>:f32, 9.987200e-01:127>, sym_name = "parse"}> ({
    %0 = "foo"() : () -> !quant.uniform<i8<-8:7>:f32, 9.987200e-01:127>
    "func.return"(%0) : (!quant.uniform<i8<-8:7>:f32, 9.987200e-01:127>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> !quant.uniform<i8<-8:7>:f32, 9.987200e-01:127>, sym_name = "parse"}> ({
    %0 = "foo"() : () -> !quant.uniform<i8<-8:7>:f32, 9.987200e-01:127>
    "func.return"(%0) : (!quant.uniform<i8<-8:7>:f32, 9.987200e-01:127>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> !quant.uniform<u8:f32, 9.987200e-01>, sym_name = "parse"}> ({
    %0 = "foo"() : () -> !quant.uniform<u8:f32, 9.987200e-01>
    "func.return"(%0) : (!quant.uniform<u8:f32, 9.987200e-01>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> !quant.uniform<u8:f32, 2.000000e-02>, sym_name = "parse"}> ({
    %0 = "foo"() : () -> !quant.uniform<u8:f32, 2.000000e-02>
    "func.return"(%0) : (!quant.uniform<u8:f32, 2.000000e-02>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> !quant.uniform<u8:f32, 2.000000e+02>, sym_name = "parse"}> ({
    %0 = "foo"() : () -> !quant.uniform<u8:f32, 2.000000e+02>
    "func.return"(%0) : (!quant.uniform<u8:f32, 2.000000e+02>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> !quant.uniform<i16:f32, 2.000000e+02>, sym_name = "parse"}> ({
    %0 = "foo"() : () -> !quant.uniform<i16:f32, 2.000000e+02>
    "func.return"(%0) : (!quant.uniform<i16:f32, 2.000000e+02>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> !quant.uniform<u16:f32, 2.000000e+02>, sym_name = "parse"}> ({
    %0 = "foo"() : () -> !quant.uniform<u16:f32, 2.000000e+02>
    "func.return"(%0) : (!quant.uniform<u16:f32, 2.000000e+02>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> !quant.uniform<i32:f32, 2.000000e+02>, sym_name = "parse"}> ({
    %0 = "foo"() : () -> !quant.uniform<i32:f32, 2.000000e+02>
    "func.return"(%0) : (!quant.uniform<i32:f32, 2.000000e+02>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> !quant.uniform<u32:f32, 2.000000e+02>, sym_name = "parse"}> ({
    %0 = "foo"() : () -> !quant.uniform<u32:f32, 2.000000e+02>
    "func.return"(%0) : (!quant.uniform<u32:f32, 2.000000e+02>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> !quant.uniform<u8:f32, 2.000000e+02>, sym_name = "parse"}> ({
    %0 = "foo"() : () -> !quant.uniform<u8:f32, 2.000000e+02>
    "func.return"(%0) : (!quant.uniform<u8:f32, 2.000000e+02>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> !quant.uniform<u8:f32, 0x41646ABBA0000000:128>, sym_name = "parse"}> ({
    %0 = "foo"() : () -> !quant.uniform<u8:f32, 0x41646ABBA0000000:128>
    "func.return"(%0) : (!quant.uniform<u8:f32, 0x41646ABBA0000000:128>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> !quant.uniform<u8:f16, 2.000000e+02>, sym_name = "parse"}> ({
    %0 = "foo"() : () -> !quant.uniform<u8:f16, 2.000000e+02>
    "func.return"(%0) : (!quant.uniform<u8:f16, 2.000000e+02>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> !quant.uniform<u8:f64, 2.000000e+02>, sym_name = "parse"}> ({
    %0 = "foo"() : () -> !quant.uniform<u8:f64, 2.000000e+02>
    "func.return"(%0) : (!quant.uniform<u8:f64, 2.000000e+02>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> !quant.uniform<u8:bf16, 2.000000e+02>, sym_name = "parse"}> ({
    %0 = "foo"() : () -> !quant.uniform<u8:bf16, 2.000000e+02>
    "func.return"(%0) : (!quant.uniform<u8:bf16, 2.000000e+02>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> !quant.uniform<u8:f32:1, {2.000000e+02:-120,9.987200e-01:127}>, sym_name = "parse"}> ({
    %0 = "foo"() : () -> !quant.uniform<u8:f32:1, {2.000000e+02:-120,9.987200e-01:127}>
    "func.return"(%0) : (!quant.uniform<u8:f32:1, {2.000000e+02:-120,9.987200e-01:127}>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> !quant.uniform<i8:f32:1, {2.000000e+02,9.987200e-01}>, sym_name = "parse"}> ({
    %0 = "foo"() : () -> !quant.uniform<i8:f32:1, {2.000000e+02,9.987200e-01}>
    "func.return"(%0) : (!quant.uniform<i8:f32:1, {2.000000e+02,9.987200e-01}>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> !quant.uniform<i8:f32:1, {2.000000e+02,9.987200e-01:120}>, sym_name = "parse"}> ({
    %0 = "foo"() : () -> !quant.uniform<i8:f32:1, {2.000000e+02,9.987200e-01:120}>
    "func.return"(%0) : (!quant.uniform<i8:f32:1, {2.000000e+02,9.987200e-01:120}>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> !quant.uniform<u8:f32:{0:1, 1:2}, {{2.000000e+00:120, 3.000000e+00:127}, {4.000000e+00, 5.000000e+00}}>, sym_name = "parse"}> ({
    %0 = "foo"() : () -> !quant.uniform<u8:f32:{0:1, 1:2}, {{2.000000e+00:120, 3.000000e+00:127}, {4.000000e+00, 5.000000e+00}}>
    "func.return"(%0) : (!quant.uniform<u8:f32:{0:1, 1:2}, {{2.000000e+00:120, 3.000000e+00:127}, {4.000000e+00, 5.000000e+00}}>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> !quant.uniform<u8:f32:{}, {{2.000000e+00:120, 3.000000e+00:127}, {4.000000e+00, 5.000000e+00}}>, sym_name = "parse"}> ({
    %0 = "foo"() : () -> !quant.uniform<u8:f32:{}, {{2.000000e+00:120, 3.000000e+00:127}, {4.000000e+00, 5.000000e+00}}>
    "func.return"(%0) : (!quant.uniform<u8:f32:{}, {{2.000000e+00:120, 3.000000e+00:127}, {4.000000e+00, 5.000000e+00}}>) -> ()
  }) : () -> ()
}) : () -> ()

