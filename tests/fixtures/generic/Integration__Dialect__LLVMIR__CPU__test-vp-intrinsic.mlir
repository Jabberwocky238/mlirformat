"builtin.module"() ({
  "memref.global"() <{initial_value = dense<[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19]> : tensor<20xi32>, sym_name = "gv_i32", sym_visibility = "private", type = memref<20xi32>}> : () -> ()
  "func.func"() <{function_type = () -> i32, sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 10 : index}> : () -> index
    %2 = "memref.get_global"() <{name = @gv_i32}> : () -> memref<20xi32>
    %3 = "vector.load"(%2, %0) : (memref<20xi32>, index) -> vector<8xi32>
    %4 = "vector.load"(%2, %1) : (memref<20xi32>, index) -> vector<8xi32>
    %5 = "arith.constant"() <{value = dense<[true, false, true, false, true, false, true, false]> : vector<8xi1>}> : () -> vector<8xi1>
    %6 = "arith.constant"() <{value = 4 : i32}> : () -> i32
    %7 = "llvm.intr.vp.add"(%3, %4, %5, %6) : (vector<8xi32>, vector<8xi32>, vector<8xi1>, i32) -> vector<8xi32>
    "vector.print"(%7) <{punctuation = #vector.punctuation<newline>}> : (vector<8xi32>) -> ()
    %8 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    "func.return"(%8) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

