"builtin.module"() ({
  "func.func"() <{function_type = (vector<f32>) -> (), sym_name = "extract_element_0d"}> ({
  ^bb0(%arg13: vector<f32> loc("<stdin>":3:8)):
    %37 = "vector.extract"(%arg13) <{static_position = array<i64>}> : (vector<f32>) -> f32 loc("<stdin>":4:11)
    "vector.print"(%37) <{punctuation = #vector.punctuation<newline>}> : (f32) -> () loc("<stdin>":5:5)
    "func.return"() : () -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (f32, vector<f32>) -> vector<f32>, sym_name = "insert_element_0d"}> ({
  ^bb0(%arg11: f32 loc("<stdin>":9:8), %arg12: vector<f32> loc("<stdin>":9:21)):
    %36 = "vector.insert"(%arg11, %arg12) <{static_position = array<i64>}> : (f32, vector<f32>) -> vector<f32> loc("<stdin>":10:11)
    "func.return"(%36) : (vector<f32>) -> () loc("<stdin>":11:5)
  }) : () -> () loc("<stdin>":8:3)
  "func.func"() <{function_type = (vector<f32>) -> (), sym_name = "print_vector_0d"}> ({
  ^bb0(%arg10: vector<f32> loc("<stdin>":14:8)):
    "vector.print"(%arg10) <{punctuation = #vector.punctuation<newline>}> : (vector<f32>) -> () loc("<stdin>":15:5)
    "func.return"() : () -> () loc("<stdin>":16:5)
  }) : () -> () loc("<stdin>":13:3)
  "func.func"() <{function_type = (f32) -> (), sym_name = "broadcast_0d"}> ({
  ^bb0(%arg9: f32 loc("<stdin>":19:8)):
    %30 = "vector.broadcast"(%arg9) : (f32) -> vector<f32> loc("<stdin>":20:11)
    "vector.print"(%30) <{punctuation = #vector.punctuation<newline>}> : (vector<f32>) -> () loc("<stdin>":21:5)
    %31 = "vector.broadcast"(%30) : (vector<f32>) -> vector<f32> loc("<stdin>":22:11)
    "vector.print"(%31) <{punctuation = #vector.punctuation<newline>}> : (vector<f32>) -> () loc("<stdin>":23:5)
    %32 = "vector.broadcast"(%30) : (vector<f32>) -> vector<1xf32> loc("<stdin>":24:11)
    "vector.print"(%32) <{punctuation = #vector.punctuation<newline>}> : (vector<1xf32>) -> () loc("<stdin>":25:5)
    %33 = "vector.broadcast"(%30) : (vector<f32>) -> vector<2xf32> loc("<stdin>":26:11)
    "vector.print"(%33) <{punctuation = #vector.punctuation<newline>}> : (vector<2xf32>) -> () loc("<stdin>":27:5)
    %34 = "vector.broadcast"(%30) : (vector<f32>) -> vector<2x1xf32> loc("<stdin>":28:11)
    "vector.print"(%34) <{punctuation = #vector.punctuation<newline>}> : (vector<2x1xf32>) -> () loc("<stdin>":29:5)
    %35 = "vector.broadcast"(%30) : (vector<f32>) -> vector<2x3xf32> loc("<stdin>":30:11)
    "vector.print"(%35) <{punctuation = #vector.punctuation<newline>}> : (vector<2x3xf32>) -> () loc("<stdin>":31:5)
    "func.return"() : () -> () loc("<stdin>":32:5)
  }) : () -> () loc("<stdin>":18:3)
  "func.func"() <{function_type = () -> (), sym_name = "bitcast_0d"}> ({
    %24 = "arith.constant"() <{value = 42 : i32}> : () -> i32 loc("<stdin>":35:11)
    %25 = "arith.constant"() <{value = dense<0> : vector<i32>}> : () -> vector<i32> loc("<stdin>":36:11)
    %26 = "vector.insert"(%24, %25) <{static_position = array<i64>}> : (i32, vector<i32>) -> vector<i32> loc("<stdin>":37:11)
    %27 = "vector.bitcast"(%26) : (vector<i32>) -> vector<f32> loc("<stdin>":38:11)
    %28 = "vector.extract"(%27) <{static_position = array<i64>}> : (vector<f32>) -> f32 loc("<stdin>":39:11)
    %29 = "arith.bitcast"(%28) : (f32) -> i32 loc("<stdin>":40:11)
    "vector.print"(%29) <{punctuation = #vector.punctuation<newline>}> : (i32) -> () loc("<stdin>":41:5)
    "func.return"() : () -> () loc("<stdin>":42:5)
  }) : () -> () loc("<stdin>":34:3)
  "func.func"() <{function_type = () -> (), sym_name = "constant_mask_0d"}> ({
    %22 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 0>}> : () -> vector<i1> loc("<stdin>":45:11)
    "vector.print"(%22) <{punctuation = #vector.punctuation<newline>}> : (vector<i1>) -> () loc("<stdin>":46:5)
    %23 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 1>}> : () -> vector<i1> loc("<stdin>":47:11)
    "vector.print"(%23) <{punctuation = #vector.punctuation<newline>}> : (vector<i1>) -> () loc("<stdin>":48:5)
    "func.return"() : () -> () loc("<stdin>":49:5)
  }) : () -> () loc("<stdin>":44:3)
  "func.func"() <{function_type = (vector<i32>, vector<i32>) -> (), sym_name = "arith_cmpi_0d"}> ({
  ^bb0(%arg7: vector<i32> loc("<stdin>":52:8), %arg8: vector<i32> loc("<stdin>":52:28)):
    %19 = "arith.cmpi"(%arg7, %arg8) <{predicate = 6 : i64}> : (vector<i32>, vector<i32>) -> vector<i1> loc("<stdin>":53:11)
    "vector.print"(%19) <{punctuation = #vector.punctuation<newline>}> : (vector<i1>) -> () loc("<stdin>":54:5)
    %20 = "arith.cmpi"(%arg7, %arg8) <{predicate = 8 : i64}> : (vector<i32>, vector<i32>) -> vector<i1> loc("<stdin>":55:11)
    "vector.print"(%20) <{punctuation = #vector.punctuation<newline>}> : (vector<i1>) -> () loc("<stdin>":56:5)
    %21 = "arith.cmpi"(%arg7, %arg8) <{predicate = 0 : i64}> : (vector<i32>, vector<i32>) -> vector<i1> loc("<stdin>":57:11)
    "vector.print"(%21) <{punctuation = #vector.punctuation<newline>}> : (vector<i1>) -> () loc("<stdin>":58:5)
    "func.return"() : () -> () loc("<stdin>":59:5)
  }) : () -> () loc("<stdin>":51:3)
  "func.func"() <{function_type = (index, index) -> (), sym_name = "create_mask_0d"}> ({
  ^bb0(%arg5: index loc("<stdin>":62:8), %arg6: index loc("<stdin>":62:22)):
    %17 = "vector.create_mask"(%arg5) : (index) -> vector<i1> loc("<stdin>":63:11)
    "vector.print"(%17) <{punctuation = #vector.punctuation<newline>}> : (vector<i1>) -> () loc("<stdin>":64:5)
    %18 = "vector.create_mask"(%arg6) : (index) -> vector<i1> loc("<stdin>":65:11)
    "vector.print"(%18) <{punctuation = #vector.punctuation<newline>}> : (vector<i1>) -> () loc("<stdin>":66:5)
    "func.return"() : () -> () loc("<stdin>":67:5)
  }) : () -> () loc("<stdin>":61:3)
  "func.func"() <{function_type = (vector<f32>) -> (), sym_name = "reduce_add"}> ({
  ^bb0(%arg4: vector<f32> loc("<stdin>":70:8)):
    %16 = "vector.reduction"(%arg4) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<f32>) -> f32 loc("<stdin>":71:11)
    "vector.print"(%16) <{punctuation = #vector.punctuation<newline>}> : (f32) -> () loc("<stdin>":72:5)
    "func.return"() : () -> () loc("<stdin>":73:5)
  }) : () -> () loc("<stdin>":69:3)
  "func.func"() <{function_type = (vector<f32>) -> (), sym_name = "fma_0d"}> ({
  ^bb0(%arg3: vector<f32> loc("<stdin>":76:8)):
    %15 = "vector.fma"(%arg3, %arg3, %arg3) : (vector<f32>, vector<f32>, vector<f32>) -> vector<f32> loc("<stdin>":77:11)
    "vector.print"(%15) <{punctuation = #vector.punctuation<newline>}> : (vector<f32>) -> () loc("<stdin>":78:5)
    "func.return"() : () -> () loc("<stdin>":79:5)
  }) : () -> () loc("<stdin>":75:3)
  "func.func"() <{function_type = (vector<i32>) -> (), sym_name = "transpose_0d"}> ({
  ^bb0(%arg2: vector<i32> loc("<stdin>":82:8)):
    %14 = "vector.transpose"(%arg2) <{permutation = array<i64>}> : (vector<i32>) -> vector<i32> loc("<stdin>":83:11)
    "vector.print"(%14) <{punctuation = #vector.punctuation<newline>}> : (vector<i32>) -> () loc("<stdin>":84:5)
    "func.return"() : () -> () loc("<stdin>":85:5)
  }) : () -> () loc("<stdin>":81:3)
  "func.func"() <{function_type = (vector<i32>, vector<i32>) -> (), sym_name = "shuffle_0d"}> ({
  ^bb0(%arg0: vector<i32> loc("<stdin>":88:8), %arg1: vector<i32> loc("<stdin>":88:28)):
    %13 = "vector.shuffle"(%arg0, %arg1) <{mask = array<i64: 0, 1, 0>}> : (vector<i32>, vector<i32>) -> vector<3xi32> loc("<stdin>":89:11)
    "vector.print"(%13) <{punctuation = #vector.punctuation<newline>}> : (vector<3xi32>) -> () loc("<stdin>":90:5)
    "func.return"() : () -> () loc("<stdin>":91:5)
  }) : () -> () loc("<stdin>":87:3)
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = 4.200000e+01 : f32}> : () -> f32 loc("<stdin>":94:10)
    %1 = "arith.constant"() <{value = dense<0.000000e+00> : vector<f32>}> : () -> vector<f32> loc("<stdin>":95:10)
    %2 = "func.call"(%0, %1) <{callee = @insert_element_0d}> : (f32, vector<f32>) -> vector<f32> loc("<stdin>":96:10)
    "func.call"(%2) <{callee = @extract_element_0d}> : (vector<f32>) -> () loc("<stdin>":97:5)
    %3 = "arith.constant"() <{value = dense<4.200000e+01> : vector<f32>}> : () -> vector<f32> loc("<stdin>":98:10)
    "func.call"(%3) <{callee = @print_vector_0d}> : (vector<f32>) -> () loc("<stdin>":99:5)
    %4 = "arith.constant"() <{value = 4.200000e+01 : f32}> : () -> f32 loc("<stdin>":100:10)
    "func.call"(%4) <{callee = @broadcast_0d}> : (f32) -> () loc("<stdin>":101:5)
    "func.call"() <{callee = @bitcast_0d}> : () -> () loc("<stdin>":102:5)
    "func.call"() <{callee = @constant_mask_0d}> : () -> () loc("<stdin>":103:5)
    %5 = "arith.constant"() <{value = dense<42> : vector<i32>}> : () -> vector<i32> loc("<stdin>":104:10)
    %6 = "arith.constant"() <{value = dense<4242> : vector<i32>}> : () -> vector<i32> loc("<stdin>":105:10)
    "func.call"(%5, %6) <{callee = @arith_cmpi_0d}> : (vector<i32>, vector<i32>) -> () loc("<stdin>":106:5)
    %7 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":107:10)
    %8 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":108:10)
    "func.call"(%7, %8) <{callee = @create_mask_0d}> : (index, index) -> () loc("<stdin>":109:5)
    %9 = "arith.constant"() <{value = dense<5.000000e+00> : vector<f32>}> : () -> vector<f32> loc("<stdin>":110:10)
    "func.call"(%9) <{callee = @reduce_add}> : (vector<f32>) -> () loc("<stdin>":111:5)
    %10 = "arith.constant"() <{value = dense<4.000000e+00> : vector<f32>}> : () -> vector<f32> loc("<stdin>":112:11)
    "func.call"(%10) <{callee = @fma_0d}> : (vector<f32>) -> () loc("<stdin>":113:5)
    %11 = "arith.constant"() <{value = dense<42> : vector<i32>}> : () -> vector<i32> loc("<stdin>":114:11)
    %12 = "arith.constant"() <{value = dense<43> : vector<i32>}> : () -> vector<i32> loc("<stdin>":115:11)
    "func.call"(%11) <{callee = @transpose_0d}> : (vector<i32>) -> () loc("<stdin>":116:5)
    "func.call"(%11, %12) <{callee = @shuffle_0d}> : (vector<i32>, vector<i32>) -> () loc("<stdin>":117:5)
    "func.return"() : () -> () loc("<stdin>":118:5)
  }) : () -> () loc("<stdin>":93:3)
}) : () -> () loc("<stdin>":1:1)
