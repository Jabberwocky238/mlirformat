"builtin.module"() ({
  "func.func"() <{function_type = (memref<40xi32>, index) -> (), sym_name = "transfer_read_2d"}> ({
  ^bb0(%arg7: memref<40xi32> loc("<stdin>":6:8), %arg8: index loc("<stdin>":6:31)):
    %25 = "arith.constant"() <{value = -42 : i32}> : () -> i32 loc("<stdin>":7:11)
    %26 = "vector.transfer_read"(%arg7, %arg8, %25) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = affine_map<(d0) -> (d0)>}> : (memref<40xi32>, index, i32) -> vector<40xi32> loc("<stdin>":8:11)
    "vector.print"(%26) <{punctuation = #vector.punctuation<newline>}> : (vector<40xi32>) -> () loc("<stdin>":9:5)
    "func.return"() : () -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":5:3)
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":13:10)
    %1 = "arith.constant"() <{value = 20 : i32}> : () -> i32 loc("<stdin>":14:10)
    %2 = "arith.constant"() <{value = 10 : i32}> : () -> i32 loc("<stdin>":15:10)
    %3 = "arith.constant"() <{value = -10 : i32}> : () -> i32 loc("<stdin>":16:10)
    %4 = "arith.constant"() <{value = 2147483647 : i32}> : () -> i32 loc("<stdin>":17:10)
    %5 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<40xi32> loc("<stdin>":18:10)
    "affine.for"() <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = affine_map<() -> (40)>}> ({
    ^bb0(%arg6: index loc("<stdin>":20:10)):
      %23 = "arith.index_cast"(%arg6) : (index) -> i32 loc("<stdin>":21:13)
      %24 = "arith.subi"(%23, %1) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":22:13)
      "memref.store"(%24, %5, %arg6) : (i32, memref<40xi32>, index) -> () loc("<stdin>":23:7)
      "affine.yield"() : () -> () loc("<stdin>":24:7)
    }) : () -> () loc("<stdin>":19:5)
    "func.call"(%5, %0) <{callee = @transfer_read_2d}> : (memref<40xi32>, index) -> () loc("<stdin>":26:5)
    "affine.for"() <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = affine_map<() -> (40)>}> ({
    ^bb0(%arg5: index loc("<stdin>":28:10)):
      %20 = "arith.index_cast"(%arg5) : (index) -> i32 loc("<stdin>":29:13)
      %21 = "arith.subi"(%20, %1) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":30:13)
      %22 = "arith.ceildivsi"(%21, %2) : (i32, i32) -> i32 loc("<stdin>":31:13)
      "memref.store"(%22, %5, %arg5) : (i32, memref<40xi32>, index) -> () loc("<stdin>":32:7)
      "affine.yield"() : () -> () loc("<stdin>":33:7)
    }) : () -> () loc("<stdin>":27:5)
    "func.call"(%5, %0) <{callee = @transfer_read_2d}> : (memref<40xi32>, index) -> () loc("<stdin>":35:5)
    "affine.for"() <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = affine_map<() -> (40)>}> ({
    ^bb0(%arg4: index loc("<stdin>":37:10)):
      %17 = "arith.index_cast"(%arg4) : (index) -> i32 loc("<stdin>":38:13)
      %18 = "arith.subi"(%17, %1) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":39:13)
      %19 = "arith.floordivsi"(%18, %2) : (i32, i32) -> i32 loc("<stdin>":40:13)
      "memref.store"(%19, %5, %arg4) : (i32, memref<40xi32>, index) -> () loc("<stdin>":41:7)
      "affine.yield"() : () -> () loc("<stdin>":42:7)
    }) : () -> () loc("<stdin>":36:5)
    "func.call"(%5, %0) <{callee = @transfer_read_2d}> : (memref<40xi32>, index) -> () loc("<stdin>":44:5)
    "affine.for"() <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = affine_map<() -> (40)>}> ({
    ^bb0(%arg3: index loc("<stdin>":46:10)):
      %14 = "arith.index_cast"(%arg3) : (index) -> i32 loc("<stdin>":47:13)
      %15 = "arith.subi"(%14, %1) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":48:13)
      %16 = "arith.ceildivsi"(%15, %3) : (i32, i32) -> i32 loc("<stdin>":49:13)
      "memref.store"(%16, %5, %arg3) : (i32, memref<40xi32>, index) -> () loc("<stdin>":50:7)
      "affine.yield"() : () -> () loc("<stdin>":51:7)
    }) : () -> () loc("<stdin>":45:5)
    "func.call"(%5, %0) <{callee = @transfer_read_2d}> : (memref<40xi32>, index) -> () loc("<stdin>":53:5)
    "affine.for"() <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = affine_map<() -> (40)>}> ({
    ^bb0(%arg2: index loc("<stdin>":55:10)):
      %11 = "arith.index_cast"(%arg2) : (index) -> i32 loc("<stdin>":56:13)
      %12 = "arith.subi"(%11, %1) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":57:13)
      %13 = "arith.floordivsi"(%12, %3) : (i32, i32) -> i32 loc("<stdin>":58:13)
      "memref.store"(%13, %5, %arg2) : (i32, memref<40xi32>, index) -> () loc("<stdin>":59:7)
      "affine.yield"() : () -> () loc("<stdin>":60:7)
    }) : () -> () loc("<stdin>":54:5)
    "func.call"(%5, %0) <{callee = @transfer_read_2d}> : (memref<40xi32>, index) -> () loc("<stdin>":62:5)
    "affine.for"() <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = affine_map<() -> (40)>}> ({
    ^bb0(%arg1: index loc("<stdin>":64:10)):
      %9 = "arith.index_cast"(%arg1) : (index) -> i32 loc("<stdin>":65:12)
      %10 = "arith.ceildivui"(%9, %2) : (i32, i32) -> i32 loc("<stdin>":66:13)
      "memref.store"(%10, %5, %arg1) : (i32, memref<40xi32>, index) -> () loc("<stdin>":67:7)
      "affine.yield"() : () -> () loc("<stdin>":68:7)
    }) : () -> () loc("<stdin>":63:5)
    "func.call"(%5, %0) <{callee = @transfer_read_2d}> : (memref<40xi32>, index) -> () loc("<stdin>":70:5)
    "affine.for"() <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = affine_map<() -> (40)>}> ({
    ^bb0(%arg0: index loc("<stdin>":72:10)):
      %6 = "arith.index_cast"(%arg0) : (index) -> i32 loc("<stdin>":73:12)
      %7 = "arith.subi"(%6, %1) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":74:12)
      %8 = "arith.ceildivui"(%7, %4) : (i32, i32) -> i32 loc("<stdin>":75:12)
      "memref.store"(%8, %5, %arg0) : (i32, memref<40xi32>, index) -> () loc("<stdin>":76:7)
      "affine.yield"() : () -> () loc("<stdin>":77:7)
    }) : () -> () loc("<stdin>":71:5)
    "func.call"(%5, %0) <{callee = @transfer_read_2d}> : (memref<40xi32>, index) -> () loc("<stdin>":79:5)
    "memref.dealloc"(%5) : (memref<40xi32>) -> () loc("<stdin>":80:5)
    "func.return"() : () -> () loc("<stdin>":81:5)
  }) : () -> () loc("<stdin>":12:3)
}) : () -> () loc("<stdin>":4:1)
