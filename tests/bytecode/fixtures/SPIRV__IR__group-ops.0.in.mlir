"builtin.module"() ({
  "func.func"() <{function_type = (i1) -> vector<4xi32>, sym_name = "subgroup_ballot"}> ({
  ^bb0(%arg0: i1 loc("<stdin>":3:8)):
    %0 = "spirv.KHR.SubgroupBallot"(%arg0) : (i1) -> vector<4xi32> loc("<stdin>":4:10)
    "func.return"(%0) : (vector<4xi32>) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
