"builtin.module"() ({
  "gpu.module"() <{sym_name = "extf_e2m1_bf16", targets = [#xevm.target<chip = "cri">]}> ({
    "gpu.func"() <{function_type = (vector<16xf4E2M1FN>) -> (), kernel}> ({
    ^bb0(%arg0: vector<16xf4E2M1FN> loc("<stdin>":4:10)):
      %0 = "arith.extf"(%arg0) : (vector<16xf4E2M1FN>) -> vector<16xbf16> loc("<stdin>":5:12)
      "gpu.return"() : () -> () loc("<stdin>":6:7)
    }) {sym_name = "extf_e2m1_bf16"} : () -> () loc("<stdin>":3:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
