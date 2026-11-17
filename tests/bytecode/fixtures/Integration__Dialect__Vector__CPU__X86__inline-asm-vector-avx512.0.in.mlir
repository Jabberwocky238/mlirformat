"builtin.module"() ({
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = !llvm.array<16 x i32>, linkage = #llvm.linkage<private>, sym_name = "const16", unnamed_addr = 0 : i64, value = dense<[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]> : tensor<16xi32>, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 ()>, linkage = #llvm.linkage<external>, sym_name = "entry", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 0 : index}> : () -> i64 loc("<stdin>":5:10)
    %1 = "llvm.mlir.addressof"() <{global_name = @const16}> : () -> !llvm.ptr loc("<stdin>":6:10)
    %2 = "llvm.getelementptr"(%1, %0, %0) <{elem_type = !llvm.array<16 x i32>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: -2147483648, -2147483648>}> : (!llvm.ptr, i64, i64) -> !llvm.ptr loc("<stdin>":7:10)
    %3 = "llvm.inline_asm"(%2) <{asm_dialect = 1 : i64, asm_string = "vmovdqu32 $0, $1", constraints = "=x,*m", operand_attrs = [{elementtype = vector<16xi32>}], tail_call_kind = #llvm.tailcallkind<none>}> : (!llvm.ptr) -> vector<16xi32> loc("<stdin>":8:10)
    %4 = "vector.extract"(%3) <{static_position = array<i64: 0>}> : (vector<16xi32>) -> i32 loc("<stdin>":9:10)
    "vector.print"(%4) <{punctuation = #vector.punctuation<newline>}> : (i32) -> () loc("<stdin>":10:5)
    %5 = "vector.extract"(%3) <{static_position = array<i64: 9>}> : (vector<16xi32>) -> i32 loc("<stdin>":11:10)
    "vector.print"(%5) <{punctuation = #vector.punctuation<newline>}> : (i32) -> () loc("<stdin>":12:5)
    %6 = "arith.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":13:10)
    "llvm.return"(%6) : (i32) -> () loc("<stdin>":14:5)
  }) : () -> () loc("<stdin>":4:3)
}) : () -> () loc("<stdin>":1:1)
