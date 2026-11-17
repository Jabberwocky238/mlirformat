"builtin.module"() ({
  "gpu.module"() <{sym_name = "test_module"}> ({
    "func.func"() <{function_type = () -> index, sym_name = "subgroup_id"}> ({
      %2 = "gpu.subgroup_id"() : () -> index loc("<stdin>":4:12)
      "func.return"(%2) : (index) -> () loc("<stdin>":5:7)
    }) : () -> () loc("<stdin>":3:5)
    "func.func"() <{function_type = () -> index, sym_name = "subgroup_id_with_upper_bound"}> ({
      %1 = "gpu.subgroup_id"() <{upper_bound = 4 : index}> : () -> index loc("<stdin>":8:12)
      "func.return"(%1) : (index) -> () loc("<stdin>":9:7)
    }) : () -> () loc("<stdin>":7:5)
    "func.func"() <{function_type = () -> index, sym_name = "subgroup_id_with_workgroup_sizes"}> ({
      %0 = "gpu.subgroup_id"() <{upper_bound = 4 : index}> : () -> index loc("<stdin>":12:12)
      "func.return"(%0) : (index) -> () loc("<stdin>":13:7)
    }) {gpu.known_block_size = array<i32: 64, 4, 1>} : () -> () loc("<stdin>":11:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
