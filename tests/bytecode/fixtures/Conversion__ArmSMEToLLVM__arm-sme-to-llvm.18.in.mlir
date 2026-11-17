"builtin.module"() ({
  "func.func"() <{function_type = (index, vector<[16]xi1>, memref<?x?xi8>) -> (), sym_name = "arm_sme_store_tile_slice_hor_i8"}> ({
  ^bb0(%arg0: index loc("<stdin>":4:8), %arg1: vector<[16]xi1> loc("<stdin>":4:22), %arg2: memref<?x?xi8> loc("<stdin>":4:46)):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":5:10)
    %1 = "arm_sme.get_tile"() : () -> vector<[16]x[16]xi8> loc("<stdin>":6:10)
    "arm_sme.store_tile_slice"(%1, %arg0, %arg1, %arg2, %0) <{layout = #arm_sme.layout<horizontal>}> : (vector<[16]x[16]xi8>, index, vector<[16]xi1>, memref<?x?xi8>, index) -> () loc("<stdin>":7:5)
    "func.return"() : () -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":3:3)
}) : () -> () loc("<stdin>":2:1)
