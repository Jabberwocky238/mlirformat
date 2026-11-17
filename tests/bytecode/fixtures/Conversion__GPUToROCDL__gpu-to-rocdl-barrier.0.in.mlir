"builtin.module"() ({
  "gpu.module"() <{sym_name = "test_module"}> ({
    "func.func"() <{function_type = () -> (), sym_name = "barrier_default"}> ({
      "gpu.barrier"() <{scope = #gpu.barrier_scope<workgroup>}> : () -> () loc("<stdin>":4:7)
      "func.return"() : () -> () loc("<stdin>":5:7)
    }) : () -> () loc("<stdin>":3:5)
    "func.func"() <{function_type = () -> (), sym_name = "barrier_no_fence"}> ({
      "gpu.barrier"() <{address_spaces = [], scope = #gpu.barrier_scope<workgroup>}> : () -> () loc("<stdin>":8:7)
      "func.return"() : () -> () loc("<stdin>":9:7)
    }) : () -> () loc("<stdin>":7:5)
    "func.func"() <{function_type = () -> (), sym_name = "barrier_workgroup_only"}> ({
      "gpu.barrier"() <{address_spaces = [#gpu.address_space<workgroup>], scope = #gpu.barrier_scope<workgroup>}> : () -> () loc("<stdin>":12:7)
      "func.return"() : () -> () loc("<stdin>":13:7)
    }) : () -> () loc("<stdin>":11:5)
    "func.func"() <{function_type = () -> (), sym_name = "barrier_global_only"}> ({
      "gpu.barrier"() <{address_spaces = [#gpu.address_space<global>], scope = #gpu.barrier_scope<workgroup>}> : () -> () loc("<stdin>":16:7)
      "func.return"() : () -> () loc("<stdin>":17:7)
    }) : () -> () loc("<stdin>":15:5)
    "func.func"() <{function_type = () -> (), sym_name = "barrier_both"}> ({
      "gpu.barrier"() <{address_spaces = [#gpu.address_space<global>, #gpu.address_space<workgroup>], scope = #gpu.barrier_scope<workgroup>}> : () -> () loc("<stdin>":20:7)
      "func.return"() : () -> () loc("<stdin>":21:7)
    }) : () -> () loc("<stdin>":19:5)
    "func.func"() <{function_type = () -> (), sym_name = "barrier_private_only"}> ({
      "gpu.barrier"() <{address_spaces = [#gpu.address_space<private>], scope = #gpu.barrier_scope<workgroup>}> : () -> () loc("<stdin>":24:7)
      "func.return"() : () -> () loc("<stdin>":25:7)
    }) : () -> () loc("<stdin>":23:5)
    "func.func"() <{function_type = () -> (), sym_name = "barrier_constant_only"}> ({
      "gpu.barrier"() <{address_spaces = [#gpu.address_space<constant>], scope = #gpu.barrier_scope<workgroup>}> : () -> () loc("<stdin>":28:7)
      "func.return"() : () -> () loc("<stdin>":29:7)
    }) : () -> () loc("<stdin>":27:5)
    "func.func"() <{function_type = () -> (), sym_name = "barrier_subgroup_scope"}> ({
      "gpu.barrier"() <{scope = #gpu.barrier_scope<subgroup>}> : () -> () loc("<stdin>":32:7)
      "func.return"() : () -> () loc("<stdin>":33:7)
    }) : () -> () loc("<stdin>":31:5)
    "func.func"() <{function_type = () -> (), sym_name = "barrier_subgroup_scope_no_fence"}> ({
      "gpu.barrier"() <{address_spaces = [], scope = #gpu.barrier_scope<subgroup>}> : () -> () loc("<stdin>":36:7)
      "func.return"() : () -> () loc("<stdin>":37:7)
    }) : () -> () loc("<stdin>":35:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
