"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<16xi8> (vector<16xf16>)>, linkage = #llvm.linkage<external>, sym_name = "truncf_f16_to_bf8", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: vector<16xf16> loc("<stdin>":3:8)):
    %0 = "xevm.truncf"(%arg0) <{dst_etype = #xevm<dst_etype dst_etype = bf8>, src_etype = #xevm<src_etype src_etype = f16>}> : (vector<16xf16>) -> vector<16xi8> loc("<stdin>":4:10)
    "llvm.return"(%0) : (vector<16xi8>) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
