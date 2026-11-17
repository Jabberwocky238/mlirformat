"builtin.module"() ({
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "bool_constant_scalar"}> ({
    %11 = "spirv.Constant"() <{value = true}> : () -> i1 loc("<stdin>":3:11)
    %12 = "spirv.Constant"() <{value = false}> : () -> i1 loc("<stdin>":4:11)
    "spirv.Return"() : () -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "bool_constant_vector"}> ({
    %9 = "spirv.Constant"() <{value = dense<[true, false]> : vector<2xi1>}> : () -> vector<2xi1> loc("<stdin>":8:10)
    %10 = "spirv.Constant"() <{value = dense<false> : vector<3xi1>}> : () -> vector<3xi1> loc("<stdin>":9:11)
    "spirv.Return"() : () -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":7:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "integer_constant_scalar"}> ({
    %6 = "spirv.Constant"() <{value = 0 : i8}> : () -> i8 loc("<stdin>":13:10)
    %7 = "spirv.Constant"() <{value = -5 : si64}> : () -> si64 loc("<stdin>":14:10)
    %8 = "spirv.Constant"() <{value = 10 : ui16}> : () -> ui16 loc("<stdin>":15:10)
    "spirv.Return"() : () -> () loc("<stdin>":16:5)
  }) : () -> () loc("<stdin>":12:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "integer_constant_vector"}> ({
    %3 = "spirv.Constant"() <{value = dense<[2, 3]> : vector<2xi32>}> : () -> vector<2xi32> loc("<stdin>":19:10)
    %4 = "spirv.Constant"() <{value = dense<-4> : vector<2xsi32>}> : () -> vector<2xsi32> loc("<stdin>":20:10)
    %5 = "spirv.Constant"() <{value = dense<[2, 3, 4]> : vector<3xui32>}> : () -> vector<3xui32> loc("<stdin>":21:10)
    "spirv.Return"() : () -> () loc("<stdin>":22:5)
  }) : () -> () loc("<stdin>":18:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "float_constant_scalar"}> ({
    %1 = "spirv.Constant"() <{value = 5.000000e+00 : f16}> : () -> f16 loc("<stdin>":25:10)
    %2 = "spirv.Constant"() <{value = 5.000000e+00 : f64}> : () -> f64 loc("<stdin>":26:10)
    "spirv.Return"() : () -> () loc("<stdin>":27:5)
  }) : () -> () loc("<stdin>":24:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "float_constant_vector"}> ({
    %0 = "spirv.Constant"() <{value = dense<[2.000000e+00, 3.000000e+00]> : vector<2xf32>}> : () -> vector<2xf32> loc("<stdin>":30:10)
    "spirv.Return"() : () -> () loc("<stdin>":31:5)
  }) : () -> () loc("<stdin>":29:3)
}) : () -> () loc("<stdin>":1:1)
