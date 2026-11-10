"builtin.module"() ({
  "func.func"() <{function_type = (i64, i64) -> i64, sym_name = "test_addi"}> ({
  ^bb0(%arg333: i64, %arg334: i64):
    %249 = "arith.addi"(%arg333, %arg334) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64
    "func.return"(%249) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xi64>, tensor<8x8xi64>) -> tensor<8x8xi64>, sym_name = "test_addi_tensor"}> ({
  ^bb0(%arg331: tensor<8x8xi64>, %arg332: tensor<8x8xi64>):
    %248 = "arith.addi"(%arg331, %arg332) <{overflowFlags = #arith.overflow<none>}> : (tensor<8x8xi64>, tensor<8x8xi64>) -> tensor<8x8xi64>
    "func.return"(%248) : (tensor<8x8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xi64>, vector<8xi64>) -> vector<8xi64>, sym_name = "test_addi_vector"}> ({
  ^bb0(%arg329: vector<8xi64>, %arg330: vector<8xi64>):
    %247 = "arith.addi"(%arg329, %arg330) <{overflowFlags = #arith.overflow<none>}> : (vector<8xi64>, vector<8xi64>) -> vector<8xi64>
    "func.return"(%247) : (vector<8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xi64>, vector<[8]xi64>) -> vector<[8]xi64>, sym_name = "test_addi_scalable_vector"}> ({
  ^bb0(%arg327: vector<[8]xi64>, %arg328: vector<[8]xi64>):
    %246 = "arith.addi"(%arg327, %arg328) <{overflowFlags = #arith.overflow<none>}> : (vector<[8]xi64>, vector<[8]xi64>) -> vector<[8]xi64>
    "func.return"(%246) : (vector<[8]xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64, i64) -> i64, sym_name = "test_addui_extended"}> ({
  ^bb0(%arg325: i64, %arg326: i64):
    %245:2 = "arith.addui_extended"(%arg325, %arg326) : (i64, i64) -> (i64, i1)
    "func.return"(%245#0) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xi64>, tensor<8x8xi64>) -> tensor<8x8xi64>, sym_name = "test_addui_extended_tensor"}> ({
  ^bb0(%arg323: tensor<8x8xi64>, %arg324: tensor<8x8xi64>):
    %244:2 = "arith.addui_extended"(%arg323, %arg324) : (tensor<8x8xi64>, tensor<8x8xi64>) -> (tensor<8x8xi64>, tensor<8x8xi1>)
    "func.return"(%244#0) : (tensor<8x8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xi64>, vector<8xi64>) -> vector<8xi64>, sym_name = "test_addui_extended_vector"}> ({
  ^bb0(%arg321: vector<8xi64>, %arg322: vector<8xi64>):
    %243:2 = "arith.addui_extended"(%arg321, %arg322) : (vector<8xi64>, vector<8xi64>) -> (vector<8xi64>, vector<8xi1>)
    "func.return"(%243#0) : (vector<8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xi64>, vector<[8]xi64>) -> vector<[8]xi64>, sym_name = "test_addui_extended_scalable_vector"}> ({
  ^bb0(%arg319: vector<[8]xi64>, %arg320: vector<[8]xi64>):
    %242:2 = "arith.addui_extended"(%arg319, %arg320) : (vector<[8]xi64>, vector<[8]xi64>) -> (vector<[8]xi64>, vector<[8]xi1>)
    "func.return"(%242#0) : (vector<[8]xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64, i64) -> i64, sym_name = "test_subui_extended"}> ({
  ^bb0(%arg317: i64, %arg318: i64):
    %241:2 = "arith.subui_extended"(%arg317, %arg318) : (i64, i64) -> (i64, i1)
    "func.return"(%241#0) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xi64>, tensor<8x8xi64>) -> tensor<8x8xi64>, sym_name = "test_subui_extended_tensor"}> ({
  ^bb0(%arg315: tensor<8x8xi64>, %arg316: tensor<8x8xi64>):
    %240:2 = "arith.subui_extended"(%arg315, %arg316) : (tensor<8x8xi64>, tensor<8x8xi64>) -> (tensor<8x8xi64>, tensor<8x8xi1>)
    "func.return"(%240#0) : (tensor<8x8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xi64>, vector<8xi64>) -> vector<8xi64>, sym_name = "test_subui_extended_vector"}> ({
  ^bb0(%arg313: vector<8xi64>, %arg314: vector<8xi64>):
    %239:2 = "arith.subui_extended"(%arg313, %arg314) : (vector<8xi64>, vector<8xi64>) -> (vector<8xi64>, vector<8xi1>)
    "func.return"(%239#0) : (vector<8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xi64>, vector<[8]xi64>) -> vector<[8]xi64>, sym_name = "test_subui_extended_scalable_vector"}> ({
  ^bb0(%arg311: vector<[8]xi64>, %arg312: vector<[8]xi64>):
    %238:2 = "arith.subui_extended"(%arg311, %arg312) : (vector<[8]xi64>, vector<[8]xi64>) -> (vector<[8]xi64>, vector<[8]xi1>)
    "func.return"(%238#0) : (vector<[8]xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64, i64) -> i64, sym_name = "test_subi"}> ({
  ^bb0(%arg309: i64, %arg310: i64):
    %237 = "arith.subi"(%arg309, %arg310) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64
    "func.return"(%237) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xi64>, tensor<8x8xi64>) -> tensor<8x8xi64>, sym_name = "test_subi_tensor"}> ({
  ^bb0(%arg307: tensor<8x8xi64>, %arg308: tensor<8x8xi64>):
    %236 = "arith.subi"(%arg307, %arg308) <{overflowFlags = #arith.overflow<none>}> : (tensor<8x8xi64>, tensor<8x8xi64>) -> tensor<8x8xi64>
    "func.return"(%236) : (tensor<8x8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xi64>, vector<8xi64>) -> vector<8xi64>, sym_name = "test_subi_vector"}> ({
  ^bb0(%arg305: vector<8xi64>, %arg306: vector<8xi64>):
    %235 = "arith.subi"(%arg305, %arg306) <{overflowFlags = #arith.overflow<none>}> : (vector<8xi64>, vector<8xi64>) -> vector<8xi64>
    "func.return"(%235) : (vector<8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xi64>, vector<[8]xi64>) -> vector<[8]xi64>, sym_name = "test_subi_scalable_vector"}> ({
  ^bb0(%arg303: vector<[8]xi64>, %arg304: vector<[8]xi64>):
    %234 = "arith.subi"(%arg303, %arg304) <{overflowFlags = #arith.overflow<none>}> : (vector<[8]xi64>, vector<[8]xi64>) -> vector<[8]xi64>
    "func.return"(%234) : (vector<[8]xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64, i64) -> i64, sym_name = "test_muli"}> ({
  ^bb0(%arg301: i64, %arg302: i64):
    %233 = "arith.muli"(%arg301, %arg302) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64
    "func.return"(%233) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xi64>, tensor<8x8xi64>) -> tensor<8x8xi64>, sym_name = "test_muli_tensor"}> ({
  ^bb0(%arg299: tensor<8x8xi64>, %arg300: tensor<8x8xi64>):
    %232 = "arith.muli"(%arg299, %arg300) <{overflowFlags = #arith.overflow<none>}> : (tensor<8x8xi64>, tensor<8x8xi64>) -> tensor<8x8xi64>
    "func.return"(%232) : (tensor<8x8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xi64>, vector<8xi64>) -> vector<8xi64>, sym_name = "test_muli_vector"}> ({
  ^bb0(%arg297: vector<8xi64>, %arg298: vector<8xi64>):
    %231 = "arith.muli"(%arg297, %arg298) <{overflowFlags = #arith.overflow<none>}> : (vector<8xi64>, vector<8xi64>) -> vector<8xi64>
    "func.return"(%231) : (vector<8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xi64>, vector<[8]xi64>) -> vector<[8]xi64>, sym_name = "test_muli_scalable_vector"}> ({
  ^bb0(%arg295: vector<[8]xi64>, %arg296: vector<[8]xi64>):
    %230 = "arith.muli"(%arg295, %arg296) <{overflowFlags = #arith.overflow<none>}> : (vector<[8]xi64>, vector<[8]xi64>) -> vector<[8]xi64>
    "func.return"(%230) : (vector<[8]xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32) -> i32, sym_name = "test_mulsi_extended"}> ({
  ^bb0(%arg293: i32, %arg294: i32):
    %229:2 = "arith.mulsi_extended"(%arg293, %arg294) : (i32, i32) -> (i32, i32)
    "func.return"(%229#1) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xi64>, tensor<8x8xi64>) -> tensor<8x8xi64>, sym_name = "test_mulsi_extended_tensor"}> ({
  ^bb0(%arg291: tensor<8x8xi64>, %arg292: tensor<8x8xi64>):
    %228:2 = "arith.mulsi_extended"(%arg291, %arg292) : (tensor<8x8xi64>, tensor<8x8xi64>) -> (tensor<8x8xi64>, tensor<8x8xi64>)
    "func.return"(%228#1) : (tensor<8x8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xi64>, vector<8xi64>) -> vector<8xi64>, sym_name = "test_mulsi_extended_vector"}> ({
  ^bb0(%arg289: vector<8xi64>, %arg290: vector<8xi64>):
    %227:2 = "arith.mulsi_extended"(%arg289, %arg290) : (vector<8xi64>, vector<8xi64>) -> (vector<8xi64>, vector<8xi64>)
    "func.return"(%227#0) : (vector<8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xi64>, vector<[8]xi64>) -> vector<[8]xi64>, sym_name = "test_mulsi_extended_scalable_vector"}> ({
  ^bb0(%arg287: vector<[8]xi64>, %arg288: vector<[8]xi64>):
    %226:2 = "arith.mulsi_extended"(%arg287, %arg288) : (vector<[8]xi64>, vector<[8]xi64>) -> (vector<[8]xi64>, vector<[8]xi64>)
    "func.return"(%226#1) : (vector<[8]xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32) -> i32, sym_name = "test_mului_extended"}> ({
  ^bb0(%arg285: i32, %arg286: i32):
    %225:2 = "arith.mului_extended"(%arg285, %arg286) : (i32, i32) -> (i32, i32)
    "func.return"(%225#1) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xi64>, tensor<8x8xi64>) -> tensor<8x8xi64>, sym_name = "test_mului_extended_tensor"}> ({
  ^bb0(%arg283: tensor<8x8xi64>, %arg284: tensor<8x8xi64>):
    %224:2 = "arith.mului_extended"(%arg283, %arg284) : (tensor<8x8xi64>, tensor<8x8xi64>) -> (tensor<8x8xi64>, tensor<8x8xi64>)
    "func.return"(%224#1) : (tensor<8x8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xi64>, vector<8xi64>) -> vector<8xi64>, sym_name = "test_mului_extended_vector"}> ({
  ^bb0(%arg281: vector<8xi64>, %arg282: vector<8xi64>):
    %223:2 = "arith.mului_extended"(%arg281, %arg282) : (vector<8xi64>, vector<8xi64>) -> (vector<8xi64>, vector<8xi64>)
    "func.return"(%223#0) : (vector<8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xi64>, vector<[8]xi64>) -> vector<[8]xi64>, sym_name = "test_mului_extended_scalable_vector"}> ({
  ^bb0(%arg279: vector<[8]xi64>, %arg280: vector<[8]xi64>):
    %222:2 = "arith.mului_extended"(%arg279, %arg280) : (vector<[8]xi64>, vector<[8]xi64>) -> (vector<[8]xi64>, vector<[8]xi64>)
    "func.return"(%222#1) : (vector<[8]xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64, i64) -> i64, sym_name = "test_divui"}> ({
  ^bb0(%arg277: i64, %arg278: i64):
    %221 = "arith.divui"(%arg277, %arg278) : (i64, i64) -> i64
    "func.return"(%221) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64, i64) -> i64, sym_name = "test_divui_exact"}> ({
  ^bb0(%arg275: i64, %arg276: i64):
    %220 = "arith.divui"(%arg275, %arg276) <{isExact}> : (i64, i64) -> i64
    "func.return"(%220) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xi64>, tensor<8x8xi64>) -> tensor<8x8xi64>, sym_name = "test_divui_tensor"}> ({
  ^bb0(%arg273: tensor<8x8xi64>, %arg274: tensor<8x8xi64>):
    %219 = "arith.divui"(%arg273, %arg274) : (tensor<8x8xi64>, tensor<8x8xi64>) -> tensor<8x8xi64>
    "func.return"(%219) : (tensor<8x8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xi64>, vector<8xi64>) -> vector<8xi64>, sym_name = "test_divui_vector"}> ({
  ^bb0(%arg271: vector<8xi64>, %arg272: vector<8xi64>):
    %218 = "arith.divui"(%arg271, %arg272) : (vector<8xi64>, vector<8xi64>) -> vector<8xi64>
    "func.return"(%218) : (vector<8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xi64>, vector<[8]xi64>) -> vector<[8]xi64>, sym_name = "test_divui_scalable_vector"}> ({
  ^bb0(%arg269: vector<[8]xi64>, %arg270: vector<[8]xi64>):
    %217 = "arith.divui"(%arg269, %arg270) : (vector<[8]xi64>, vector<[8]xi64>) -> vector<[8]xi64>
    "func.return"(%217) : (vector<[8]xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64, i64) -> i64, sym_name = "test_divsi"}> ({
  ^bb0(%arg267: i64, %arg268: i64):
    %216 = "arith.divsi"(%arg267, %arg268) : (i64, i64) -> i64
    "func.return"(%216) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64, i64) -> i64, sym_name = "test_divsi_exact"}> ({
  ^bb0(%arg265: i64, %arg266: i64):
    %215 = "arith.divsi"(%arg265, %arg266) <{isExact}> : (i64, i64) -> i64
    "func.return"(%215) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xi64>, tensor<8x8xi64>) -> tensor<8x8xi64>, sym_name = "test_divsi_tensor"}> ({
  ^bb0(%arg263: tensor<8x8xi64>, %arg264: tensor<8x8xi64>):
    %214 = "arith.divsi"(%arg263, %arg264) : (tensor<8x8xi64>, tensor<8x8xi64>) -> tensor<8x8xi64>
    "func.return"(%214) : (tensor<8x8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xi64>, vector<8xi64>) -> vector<8xi64>, sym_name = "test_divsi_vector"}> ({
  ^bb0(%arg261: vector<8xi64>, %arg262: vector<8xi64>):
    %213 = "arith.divsi"(%arg261, %arg262) : (vector<8xi64>, vector<8xi64>) -> vector<8xi64>
    "func.return"(%213) : (vector<8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xi64>, vector<[8]xi64>) -> vector<[8]xi64>, sym_name = "test_divsi_scalable_vector"}> ({
  ^bb0(%arg259: vector<[8]xi64>, %arg260: vector<[8]xi64>):
    %212 = "arith.divsi"(%arg259, %arg260) : (vector<[8]xi64>, vector<[8]xi64>) -> vector<[8]xi64>
    "func.return"(%212) : (vector<[8]xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64, i64) -> i64, sym_name = "test_remui"}> ({
  ^bb0(%arg257: i64, %arg258: i64):
    %211 = "arith.remui"(%arg257, %arg258) : (i64, i64) -> i64
    "func.return"(%211) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xi64>, tensor<8x8xi64>) -> tensor<8x8xi64>, sym_name = "test_remui_tensor"}> ({
  ^bb0(%arg255: tensor<8x8xi64>, %arg256: tensor<8x8xi64>):
    %210 = "arith.remui"(%arg255, %arg256) : (tensor<8x8xi64>, tensor<8x8xi64>) -> tensor<8x8xi64>
    "func.return"(%210) : (tensor<8x8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xi64>, vector<8xi64>) -> vector<8xi64>, sym_name = "test_remui_vector"}> ({
  ^bb0(%arg253: vector<8xi64>, %arg254: vector<8xi64>):
    %209 = "arith.remui"(%arg253, %arg254) : (vector<8xi64>, vector<8xi64>) -> vector<8xi64>
    "func.return"(%209) : (vector<8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xi64>, vector<[8]xi64>) -> vector<[8]xi64>, sym_name = "test_remui_scalable_vector"}> ({
  ^bb0(%arg251: vector<[8]xi64>, %arg252: vector<[8]xi64>):
    %208 = "arith.remui"(%arg251, %arg252) : (vector<[8]xi64>, vector<[8]xi64>) -> vector<[8]xi64>
    "func.return"(%208) : (vector<[8]xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64, i64) -> i64, sym_name = "test_remsi"}> ({
  ^bb0(%arg249: i64, %arg250: i64):
    %207 = "arith.remsi"(%arg249, %arg250) : (i64, i64) -> i64
    "func.return"(%207) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xi64>, tensor<8x8xi64>) -> tensor<8x8xi64>, sym_name = "test_remsi_tensor"}> ({
  ^bb0(%arg247: tensor<8x8xi64>, %arg248: tensor<8x8xi64>):
    %206 = "arith.remsi"(%arg247, %arg248) : (tensor<8x8xi64>, tensor<8x8xi64>) -> tensor<8x8xi64>
    "func.return"(%206) : (tensor<8x8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xi64>, vector<8xi64>) -> vector<8xi64>, sym_name = "test_remsi_vector"}> ({
  ^bb0(%arg245: vector<8xi64>, %arg246: vector<8xi64>):
    %205 = "arith.remsi"(%arg245, %arg246) : (vector<8xi64>, vector<8xi64>) -> vector<8xi64>
    "func.return"(%205) : (vector<8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xi64>, vector<[8]xi64>) -> vector<[8]xi64>, sym_name = "test_remsi_scalable_vector"}> ({
  ^bb0(%arg243: vector<[8]xi64>, %arg244: vector<[8]xi64>):
    %204 = "arith.remsi"(%arg243, %arg244) : (vector<[8]xi64>, vector<[8]xi64>) -> vector<[8]xi64>
    "func.return"(%204) : (vector<[8]xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64, i64) -> i64, sym_name = "test_andi"}> ({
  ^bb0(%arg241: i64, %arg242: i64):
    %203 = "arith.andi"(%arg241, %arg242) : (i64, i64) -> i64
    "func.return"(%203) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xi64>, tensor<8x8xi64>) -> tensor<8x8xi64>, sym_name = "test_andi_tensor"}> ({
  ^bb0(%arg239: tensor<8x8xi64>, %arg240: tensor<8x8xi64>):
    %202 = "arith.andi"(%arg239, %arg240) : (tensor<8x8xi64>, tensor<8x8xi64>) -> tensor<8x8xi64>
    "func.return"(%202) : (tensor<8x8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xi64>, vector<8xi64>) -> vector<8xi64>, sym_name = "test_andi_vector"}> ({
  ^bb0(%arg237: vector<8xi64>, %arg238: vector<8xi64>):
    %201 = "arith.andi"(%arg237, %arg238) : (vector<8xi64>, vector<8xi64>) -> vector<8xi64>
    "func.return"(%201) : (vector<8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xi64>, vector<[8]xi64>) -> vector<[8]xi64>, sym_name = "test_andi_scalable_vector"}> ({
  ^bb0(%arg235: vector<[8]xi64>, %arg236: vector<[8]xi64>):
    %200 = "arith.andi"(%arg235, %arg236) : (vector<[8]xi64>, vector<[8]xi64>) -> vector<[8]xi64>
    "func.return"(%200) : (vector<[8]xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64, i64) -> i64, sym_name = "test_ori"}> ({
  ^bb0(%arg233: i64, %arg234: i64):
    %199 = "arith.ori"(%arg233, %arg234) : (i64, i64) -> i64
    "func.return"(%199) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xi64>, tensor<8x8xi64>) -> tensor<8x8xi64>, sym_name = "test_ori_tensor"}> ({
  ^bb0(%arg231: tensor<8x8xi64>, %arg232: tensor<8x8xi64>):
    %198 = "arith.ori"(%arg231, %arg232) : (tensor<8x8xi64>, tensor<8x8xi64>) -> tensor<8x8xi64>
    "func.return"(%198) : (tensor<8x8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xi64>, vector<8xi64>) -> vector<8xi64>, sym_name = "test_ori_vector"}> ({
  ^bb0(%arg229: vector<8xi64>, %arg230: vector<8xi64>):
    %197 = "arith.ori"(%arg229, %arg230) : (vector<8xi64>, vector<8xi64>) -> vector<8xi64>
    "func.return"(%197) : (vector<8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xi64>, vector<[8]xi64>) -> vector<[8]xi64>, sym_name = "test_ori_scalable_vector"}> ({
  ^bb0(%arg227: vector<[8]xi64>, %arg228: vector<[8]xi64>):
    %196 = "arith.ori"(%arg227, %arg228) : (vector<[8]xi64>, vector<[8]xi64>) -> vector<[8]xi64>
    "func.return"(%196) : (vector<[8]xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64, i64) -> i64, sym_name = "test_xori"}> ({
  ^bb0(%arg225: i64, %arg226: i64):
    %195 = "arith.xori"(%arg225, %arg226) : (i64, i64) -> i64
    "func.return"(%195) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xi64>, tensor<8x8xi64>) -> tensor<8x8xi64>, sym_name = "test_xori_tensor"}> ({
  ^bb0(%arg223: tensor<8x8xi64>, %arg224: tensor<8x8xi64>):
    %194 = "arith.xori"(%arg223, %arg224) : (tensor<8x8xi64>, tensor<8x8xi64>) -> tensor<8x8xi64>
    "func.return"(%194) : (tensor<8x8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xi64>, vector<8xi64>) -> vector<8xi64>, sym_name = "test_xori_vector"}> ({
  ^bb0(%arg221: vector<8xi64>, %arg222: vector<8xi64>):
    %193 = "arith.xori"(%arg221, %arg222) : (vector<8xi64>, vector<8xi64>) -> vector<8xi64>
    "func.return"(%193) : (vector<8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xi64>, vector<[8]xi64>) -> vector<[8]xi64>, sym_name = "test_xori_scalable_vector"}> ({
  ^bb0(%arg219: vector<[8]xi64>, %arg220: vector<[8]xi64>):
    %192 = "arith.xori"(%arg219, %arg220) : (vector<[8]xi64>, vector<[8]xi64>) -> vector<[8]xi64>
    "func.return"(%192) : (vector<[8]xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64, i64) -> i64, sym_name = "test_ceildivsi"}> ({
  ^bb0(%arg217: i64, %arg218: i64):
    %191 = "arith.ceildivsi"(%arg217, %arg218) : (i64, i64) -> i64
    "func.return"(%191) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xi64>, tensor<8x8xi64>) -> tensor<8x8xi64>, sym_name = "test_ceildivsi_tensor"}> ({
  ^bb0(%arg215: tensor<8x8xi64>, %arg216: tensor<8x8xi64>):
    %190 = "arith.ceildivsi"(%arg215, %arg216) : (tensor<8x8xi64>, tensor<8x8xi64>) -> tensor<8x8xi64>
    "func.return"(%190) : (tensor<8x8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xi64>, vector<8xi64>) -> vector<8xi64>, sym_name = "test_ceildivsi_vector"}> ({
  ^bb0(%arg213: vector<8xi64>, %arg214: vector<8xi64>):
    %189 = "arith.ceildivsi"(%arg213, %arg214) : (vector<8xi64>, vector<8xi64>) -> vector<8xi64>
    "func.return"(%189) : (vector<8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xi64>, vector<[8]xi64>) -> vector<[8]xi64>, sym_name = "test_ceildivsi_scalable_vector"}> ({
  ^bb0(%arg211: vector<[8]xi64>, %arg212: vector<[8]xi64>):
    %188 = "arith.ceildivsi"(%arg211, %arg212) : (vector<[8]xi64>, vector<[8]xi64>) -> vector<[8]xi64>
    "func.return"(%188) : (vector<[8]xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64, i64) -> i64, sym_name = "test_floordivsi"}> ({
  ^bb0(%arg209: i64, %arg210: i64):
    %187 = "arith.floordivsi"(%arg209, %arg210) : (i64, i64) -> i64
    "func.return"(%187) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xi64>, tensor<8x8xi64>) -> tensor<8x8xi64>, sym_name = "test_floordivsi_tensor"}> ({
  ^bb0(%arg207: tensor<8x8xi64>, %arg208: tensor<8x8xi64>):
    %186 = "arith.floordivsi"(%arg207, %arg208) : (tensor<8x8xi64>, tensor<8x8xi64>) -> tensor<8x8xi64>
    "func.return"(%186) : (tensor<8x8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xi64>, vector<8xi64>) -> vector<8xi64>, sym_name = "test_floordivsi_vector"}> ({
  ^bb0(%arg205: vector<8xi64>, %arg206: vector<8xi64>):
    %185 = "arith.floordivsi"(%arg205, %arg206) : (vector<8xi64>, vector<8xi64>) -> vector<8xi64>
    "func.return"(%185) : (vector<8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xi64>, vector<[8]xi64>) -> vector<[8]xi64>, sym_name = "test_floordivsi_scalable_vector"}> ({
  ^bb0(%arg203: vector<[8]xi64>, %arg204: vector<[8]xi64>):
    %184 = "arith.floordivsi"(%arg203, %arg204) : (vector<[8]xi64>, vector<[8]xi64>) -> vector<[8]xi64>
    "func.return"(%184) : (vector<[8]xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64, i64) -> i64, sym_name = "test_shli"}> ({
  ^bb0(%arg201: i64, %arg202: i64):
    %183 = "arith.shli"(%arg201, %arg202) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64
    "func.return"(%183) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xi64>, tensor<8x8xi64>) -> tensor<8x8xi64>, sym_name = "test_shli_tensor"}> ({
  ^bb0(%arg199: tensor<8x8xi64>, %arg200: tensor<8x8xi64>):
    %182 = "arith.shli"(%arg199, %arg200) <{overflowFlags = #arith.overflow<none>}> : (tensor<8x8xi64>, tensor<8x8xi64>) -> tensor<8x8xi64>
    "func.return"(%182) : (tensor<8x8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xi64>, vector<8xi64>) -> vector<8xi64>, sym_name = "test_shli_vector"}> ({
  ^bb0(%arg197: vector<8xi64>, %arg198: vector<8xi64>):
    %181 = "arith.shli"(%arg197, %arg198) <{overflowFlags = #arith.overflow<none>}> : (vector<8xi64>, vector<8xi64>) -> vector<8xi64>
    "func.return"(%181) : (vector<8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xi64>, vector<[8]xi64>) -> vector<[8]xi64>, sym_name = "test_shli_scalable_vector"}> ({
  ^bb0(%arg195: vector<[8]xi64>, %arg196: vector<[8]xi64>):
    %180 = "arith.shli"(%arg195, %arg196) <{overflowFlags = #arith.overflow<none>}> : (vector<[8]xi64>, vector<[8]xi64>) -> vector<[8]xi64>
    "func.return"(%180) : (vector<[8]xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64, i64) -> i64, sym_name = "test_shrui"}> ({
  ^bb0(%arg193: i64, %arg194: i64):
    %179 = "arith.shrui"(%arg193, %arg194) : (i64, i64) -> i64
    "func.return"(%179) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64, i64) -> i64, sym_name = "test_shrui_exact"}> ({
  ^bb0(%arg191: i64, %arg192: i64):
    %178 = "arith.shrui"(%arg191, %arg192) <{isExact}> : (i64, i64) -> i64
    "func.return"(%178) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xi64>, tensor<8x8xi64>) -> tensor<8x8xi64>, sym_name = "test_shrui_tensor"}> ({
  ^bb0(%arg189: tensor<8x8xi64>, %arg190: tensor<8x8xi64>):
    %177 = "arith.shrui"(%arg189, %arg190) : (tensor<8x8xi64>, tensor<8x8xi64>) -> tensor<8x8xi64>
    "func.return"(%177) : (tensor<8x8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xi64>, vector<8xi64>) -> vector<8xi64>, sym_name = "test_shrui_vector"}> ({
  ^bb0(%arg187: vector<8xi64>, %arg188: vector<8xi64>):
    %176 = "arith.shrui"(%arg187, %arg188) : (vector<8xi64>, vector<8xi64>) -> vector<8xi64>
    "func.return"(%176) : (vector<8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xi64>, vector<[8]xi64>) -> vector<[8]xi64>, sym_name = "test_shrui_scalable_vector"}> ({
  ^bb0(%arg185: vector<[8]xi64>, %arg186: vector<[8]xi64>):
    %175 = "arith.shrui"(%arg185, %arg186) : (vector<[8]xi64>, vector<[8]xi64>) -> vector<[8]xi64>
    "func.return"(%175) : (vector<[8]xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64, i64) -> i64, sym_name = "test_shrsi"}> ({
  ^bb0(%arg183: i64, %arg184: i64):
    %174 = "arith.shrsi"(%arg183, %arg184) : (i64, i64) -> i64
    "func.return"(%174) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64, i64) -> i64, sym_name = "test_shrsi_exact"}> ({
  ^bb0(%arg181: i64, %arg182: i64):
    %173 = "arith.shrsi"(%arg181, %arg182) <{isExact}> : (i64, i64) -> i64
    "func.return"(%173) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xi64>, tensor<8x8xi64>) -> tensor<8x8xi64>, sym_name = "test_shrsi_tensor"}> ({
  ^bb0(%arg179: tensor<8x8xi64>, %arg180: tensor<8x8xi64>):
    %172 = "arith.shrsi"(%arg179, %arg180) : (tensor<8x8xi64>, tensor<8x8xi64>) -> tensor<8x8xi64>
    "func.return"(%172) : (tensor<8x8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xi64>, vector<8xi64>) -> vector<8xi64>, sym_name = "test_shrsi_vector"}> ({
  ^bb0(%arg177: vector<8xi64>, %arg178: vector<8xi64>):
    %171 = "arith.shrsi"(%arg177, %arg178) : (vector<8xi64>, vector<8xi64>) -> vector<8xi64>
    "func.return"(%171) : (vector<8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xi64>, vector<[8]xi64>) -> vector<[8]xi64>, sym_name = "test_shrsi_scalable_vector"}> ({
  ^bb0(%arg175: vector<[8]xi64>, %arg176: vector<[8]xi64>):
    %170 = "arith.shrsi"(%arg175, %arg176) : (vector<[8]xi64>, vector<[8]xi64>) -> vector<[8]xi64>
    "func.return"(%170) : (vector<[8]xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f64) -> f64, sym_name = "test_negf"}> ({
  ^bb0(%arg174: f64):
    %169 = "arith.negf"(%arg174) <{fastmath = #arith.fastmath<none>}> : (f64) -> f64
    "func.return"(%169) : (f64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xf64>) -> tensor<8x8xf64>, sym_name = "test_negf_tensor"}> ({
  ^bb0(%arg173: tensor<8x8xf64>):
    %168 = "arith.negf"(%arg173) <{fastmath = #arith.fastmath<none>}> : (tensor<8x8xf64>) -> tensor<8x8xf64>
    "func.return"(%168) : (tensor<8x8xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xf64>) -> vector<8xf64>, sym_name = "test_negf_vector"}> ({
  ^bb0(%arg172: vector<8xf64>):
    %167 = "arith.negf"(%arg172) <{fastmath = #arith.fastmath<none>}> : (vector<8xf64>) -> vector<8xf64>
    "func.return"(%167) : (vector<8xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xf64>) -> vector<[8]xf64>, sym_name = "test_negf_scalable_vector"}> ({
  ^bb0(%arg171: vector<[8]xf64>):
    %166 = "arith.negf"(%arg171) <{fastmath = #arith.fastmath<none>}> : (vector<[8]xf64>) -> vector<[8]xf64>
    "func.return"(%166) : (vector<[8]xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32) -> f32, sym_name = "test_flush_denormals"}> ({
  ^bb0(%arg170: f32):
    %165 = "arith.flush_denormals"(%arg170) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    "func.return"(%165) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xf32>) -> tensor<8x8xf32>, sym_name = "test_flush_denormals_tensor"}> ({
  ^bb0(%arg169: tensor<8x8xf32>):
    %164 = "arith.flush_denormals"(%arg169) <{fastmath = #arith.fastmath<none>}> : (tensor<8x8xf32>) -> tensor<8x8xf32>
    "func.return"(%164) : (tensor<8x8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xf32>) -> vector<8xf32>, sym_name = "test_flush_denormals_vector"}> ({
  ^bb0(%arg168: vector<8xf32>):
    %163 = "arith.flush_denormals"(%arg168) <{fastmath = #arith.fastmath<none>}> : (vector<8xf32>) -> vector<8xf32>
    "func.return"(%163) : (vector<8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xf32>) -> vector<[8]xf32>, sym_name = "test_flush_denormals_scalable_vector"}> ({
  ^bb0(%arg167: vector<[8]xf32>):
    %162 = "arith.flush_denormals"(%arg167) <{fastmath = #arith.fastmath<none>}> : (vector<[8]xf32>) -> vector<[8]xf32>
    "func.return"(%162) : (vector<[8]xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (bf16) -> bf16, sym_name = "test_flush_denormals_bf16"}> ({
  ^bb0(%arg166: bf16):
    %161 = "arith.flush_denormals"(%arg166) <{fastmath = #arith.fastmath<none>}> : (bf16) -> bf16
    "func.return"(%161) : (bf16) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f64, f64) -> f64, sym_name = "test_addf"}> ({
  ^bb0(%arg164: f64, %arg165: f64):
    %160 = "arith.addf"(%arg164, %arg165) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
    "func.return"(%160) : (f64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xf64>, tensor<8x8xf64>) -> tensor<8x8xf64>, sym_name = "test_addf_tensor"}> ({
  ^bb0(%arg162: tensor<8x8xf64>, %arg163: tensor<8x8xf64>):
    %159 = "arith.addf"(%arg162, %arg163) <{fastmath = #arith.fastmath<none>}> : (tensor<8x8xf64>, tensor<8x8xf64>) -> tensor<8x8xf64>
    "func.return"(%159) : (tensor<8x8xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xf64>, vector<8xf64>) -> vector<8xf64>, sym_name = "test_addf_vector"}> ({
  ^bb0(%arg160: vector<8xf64>, %arg161: vector<8xf64>):
    %158 = "arith.addf"(%arg160, %arg161) <{fastmath = #arith.fastmath<none>}> : (vector<8xf64>, vector<8xf64>) -> vector<8xf64>
    "func.return"(%158) : (vector<8xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xf64>, vector<[8]xf64>) -> vector<[8]xf64>, sym_name = "test_addf_scalable_vector"}> ({
  ^bb0(%arg158: vector<[8]xf64>, %arg159: vector<[8]xf64>):
    %157 = "arith.addf"(%arg158, %arg159) <{fastmath = #arith.fastmath<none>}> : (vector<[8]xf64>, vector<[8]xf64>) -> vector<[8]xf64>
    "func.return"(%157) : (vector<[8]xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f64, f64) -> f64, sym_name = "test_subf"}> ({
  ^bb0(%arg156: f64, %arg157: f64):
    %156 = "arith.subf"(%arg156, %arg157) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
    "func.return"(%156) : (f64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xf64>, tensor<8x8xf64>) -> tensor<8x8xf64>, sym_name = "test_subf_tensor"}> ({
  ^bb0(%arg154: tensor<8x8xf64>, %arg155: tensor<8x8xf64>):
    %155 = "arith.subf"(%arg154, %arg155) <{fastmath = #arith.fastmath<none>}> : (tensor<8x8xf64>, tensor<8x8xf64>) -> tensor<8x8xf64>
    "func.return"(%155) : (tensor<8x8xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xf64>, vector<8xf64>) -> vector<8xf64>, sym_name = "test_subf_vector"}> ({
  ^bb0(%arg152: vector<8xf64>, %arg153: vector<8xf64>):
    %154 = "arith.subf"(%arg152, %arg153) <{fastmath = #arith.fastmath<none>}> : (vector<8xf64>, vector<8xf64>) -> vector<8xf64>
    "func.return"(%154) : (vector<8xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xf64>, vector<[8]xf64>) -> vector<[8]xf64>, sym_name = "test_subf_scalable_vector"}> ({
  ^bb0(%arg150: vector<[8]xf64>, %arg151: vector<[8]xf64>):
    %153 = "arith.subf"(%arg150, %arg151) <{fastmath = #arith.fastmath<none>}> : (vector<[8]xf64>, vector<[8]xf64>) -> vector<[8]xf64>
    "func.return"(%153) : (vector<[8]xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f64, f64) -> f64, sym_name = "test_mulf"}> ({
  ^bb0(%arg148: f64, %arg149: f64):
    %152 = "arith.mulf"(%arg148, %arg149) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
    "func.return"(%152) : (f64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xf64>, tensor<8x8xf64>) -> tensor<8x8xf64>, sym_name = "test_mulf_tensor"}> ({
  ^bb0(%arg146: tensor<8x8xf64>, %arg147: tensor<8x8xf64>):
    %151 = "arith.mulf"(%arg146, %arg147) <{fastmath = #arith.fastmath<none>}> : (tensor<8x8xf64>, tensor<8x8xf64>) -> tensor<8x8xf64>
    "func.return"(%151) : (tensor<8x8xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xf64>, vector<8xf64>) -> vector<8xf64>, sym_name = "test_mulf_vector"}> ({
  ^bb0(%arg144: vector<8xf64>, %arg145: vector<8xf64>):
    %150 = "arith.mulf"(%arg144, %arg145) <{fastmath = #arith.fastmath<none>}> : (vector<8xf64>, vector<8xf64>) -> vector<8xf64>
    "func.return"(%150) : (vector<8xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xf64>, vector<[8]xf64>) -> vector<[8]xf64>, sym_name = "test_mulf_scalable_vector"}> ({
  ^bb0(%arg142: vector<[8]xf64>, %arg143: vector<[8]xf64>):
    %149 = "arith.mulf"(%arg142, %arg143) <{fastmath = #arith.fastmath<none>}> : (vector<[8]xf64>, vector<[8]xf64>) -> vector<[8]xf64>
    "func.return"(%149) : (vector<[8]xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f64, f64) -> f64, sym_name = "test_divf"}> ({
  ^bb0(%arg140: f64, %arg141: f64):
    %148 = "arith.divf"(%arg140, %arg141) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
    "func.return"(%148) : (f64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xf64>, tensor<8x8xf64>) -> tensor<8x8xf64>, sym_name = "test_divf_tensor"}> ({
  ^bb0(%arg138: tensor<8x8xf64>, %arg139: tensor<8x8xf64>):
    %147 = "arith.divf"(%arg138, %arg139) <{fastmath = #arith.fastmath<none>}> : (tensor<8x8xf64>, tensor<8x8xf64>) -> tensor<8x8xf64>
    "func.return"(%147) : (tensor<8x8xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xf64>, vector<8xf64>) -> vector<8xf64>, sym_name = "test_divf_vector"}> ({
  ^bb0(%arg136: vector<8xf64>, %arg137: vector<8xf64>):
    %146 = "arith.divf"(%arg136, %arg137) <{fastmath = #arith.fastmath<none>}> : (vector<8xf64>, vector<8xf64>) -> vector<8xf64>
    "func.return"(%146) : (vector<8xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xf64>, vector<[8]xf64>) -> vector<[8]xf64>, sym_name = "test_divf_scalable_vector"}> ({
  ^bb0(%arg134: vector<[8]xf64>, %arg135: vector<[8]xf64>):
    %145 = "arith.divf"(%arg134, %arg135) <{fastmath = #arith.fastmath<none>}> : (vector<[8]xf64>, vector<[8]xf64>) -> vector<[8]xf64>
    "func.return"(%145) : (vector<[8]xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f64, f64) -> f64, sym_name = "test_remf"}> ({
  ^bb0(%arg132: f64, %arg133: f64):
    %144 = "arith.remf"(%arg132, %arg133) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
    "func.return"(%144) : (f64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xf64>, tensor<8x8xf64>) -> tensor<8x8xf64>, sym_name = "test_remf_tensor"}> ({
  ^bb0(%arg130: tensor<8x8xf64>, %arg131: tensor<8x8xf64>):
    %143 = "arith.remf"(%arg130, %arg131) <{fastmath = #arith.fastmath<none>}> : (tensor<8x8xf64>, tensor<8x8xf64>) -> tensor<8x8xf64>
    "func.return"(%143) : (tensor<8x8xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xf64>, vector<8xf64>) -> vector<8xf64>, sym_name = "test_remf_vector"}> ({
  ^bb0(%arg128: vector<8xf64>, %arg129: vector<8xf64>):
    %142 = "arith.remf"(%arg128, %arg129) <{fastmath = #arith.fastmath<none>}> : (vector<8xf64>, vector<8xf64>) -> vector<8xf64>
    "func.return"(%142) : (vector<8xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xf64>, vector<[8]xf64>) -> vector<[8]xf64>, sym_name = "test_remf_scalable_vector"}> ({
  ^bb0(%arg126: vector<[8]xf64>, %arg127: vector<[8]xf64>):
    %141 = "arith.remf"(%arg126, %arg127) <{fastmath = #arith.fastmath<none>}> : (vector<[8]xf64>, vector<[8]xf64>) -> vector<[8]xf64>
    "func.return"(%141) : (vector<[8]xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> i64, sym_name = "test_extui"}> ({
  ^bb0(%arg125: i32):
    %140 = "arith.extui"(%arg125) : (i32) -> i64
    "func.return"(%140) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xi32>) -> tensor<8x8xi64>, sym_name = "test_extui_tensor"}> ({
  ^bb0(%arg124: tensor<8x8xi32>):
    %139 = "arith.extui"(%arg124) : (tensor<8x8xi32>) -> tensor<8x8xi64>
    "func.return"(%139) : (tensor<8x8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xi32>) -> vector<8xi64>, sym_name = "test_extui_vector"}> ({
  ^bb0(%arg123: vector<8xi32>):
    %138 = "arith.extui"(%arg123) : (vector<8xi32>) -> vector<8xi64>
    "func.return"(%138) : (vector<8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xi32>) -> vector<[8]xi64>, sym_name = "test_extui_scalable_vector"}> ({
  ^bb0(%arg122: vector<[8]xi32>):
    %137 = "arith.extui"(%arg122) : (vector<[8]xi32>) -> vector<[8]xi64>
    "func.return"(%137) : (vector<[8]xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> i64, sym_name = "test_extui_nneg"}> ({
  ^bb0(%arg121: i32):
    %136 = "arith.extui"(%arg121) <{nonNeg}> : (i32) -> i64
    "func.return"(%136) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xi32>) -> vector<8xi64>, sym_name = "test_extui_nneg_vector"}> ({
  ^bb0(%arg120: vector<8xi32>):
    %135 = "arith.extui"(%arg120) <{nonNeg}> : (vector<8xi32>) -> vector<8xi64>
    "func.return"(%135) : (vector<8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> i64, sym_name = "test_extsi"}> ({
  ^bb0(%arg119: i32):
    %134 = "arith.extsi"(%arg119) : (i32) -> i64
    "func.return"(%134) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xi32>) -> tensor<8x8xi64>, sym_name = "test_extsi_tensor"}> ({
  ^bb0(%arg118: tensor<8x8xi32>):
    %133 = "arith.extsi"(%arg118) : (tensor<8x8xi32>) -> tensor<8x8xi64>
    "func.return"(%133) : (tensor<8x8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xi32>) -> vector<8xi64>, sym_name = "test_extsi_vector"}> ({
  ^bb0(%arg117: vector<8xi32>):
    %132 = "arith.extsi"(%arg117) : (vector<8xi32>) -> vector<8xi64>
    "func.return"(%132) : (vector<8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xi32>) -> vector<[8]xi64>, sym_name = "test_extsi_scalable_vector"}> ({
  ^bb0(%arg116: vector<[8]xi32>):
    %131 = "arith.extsi"(%arg116) : (vector<[8]xi32>) -> vector<[8]xi64>
    "func.return"(%131) : (vector<[8]xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32) -> f64, sym_name = "test_extf"}> ({
  ^bb0(%arg115: f32):
    %130 = "arith.extf"(%arg115) : (f32) -> f64
    "func.return"(%130) : (f64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xf32>) -> tensor<8x8xf64>, sym_name = "test_extf_tensor"}> ({
  ^bb0(%arg114: tensor<8x8xf32>):
    %129 = "arith.extf"(%arg114) : (tensor<8x8xf32>) -> tensor<8x8xf64>
    "func.return"(%129) : (tensor<8x8xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xf32, "foo">) -> tensor<8x8xf64, "foo">, sym_name = "test_extf_tensor_encoding"}> ({
  ^bb0(%arg113: tensor<8x8xf32, "foo">):
    %128 = "arith.extf"(%arg113) : (tensor<8x8xf32, "foo">) -> tensor<8x8xf64, "foo">
    "func.return"(%128) : (tensor<8x8xf64, "foo">) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xf32>) -> vector<8xf64>, sym_name = "test_extf_vector"}> ({
  ^bb0(%arg112: vector<8xf32>):
    %127 = "arith.extf"(%arg112) : (vector<8xf32>) -> vector<8xf64>
    "func.return"(%127) : (vector<8xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xf32>) -> vector<[8]xf64>, sym_name = "test_extf_scalable_vector"}> ({
  ^bb0(%arg111: vector<[8]xf32>):
    %126 = "arith.extf"(%arg111) : (vector<[8]xf32>) -> vector<[8]xf64>
    "func.return"(%126) : (vector<[8]xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> i16, sym_name = "test_trunci"}> ({
  ^bb0(%arg110: i32):
    %125 = "arith.trunci"(%arg110) <{overflowFlags = #arith.overflow<none>}> : (i32) -> i16
    "func.return"(%125) : (i16) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xi32>) -> tensor<8x8xi16>, sym_name = "test_trunci_tensor"}> ({
  ^bb0(%arg109: tensor<8x8xi32>):
    %124 = "arith.trunci"(%arg109) <{overflowFlags = #arith.overflow<none>}> : (tensor<8x8xi32>) -> tensor<8x8xi16>
    "func.return"(%124) : (tensor<8x8xi16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xi32>) -> vector<8xi16>, sym_name = "test_trunci_vector"}> ({
  ^bb0(%arg108: vector<8xi32>):
    %123 = "arith.trunci"(%arg108) <{overflowFlags = #arith.overflow<none>}> : (vector<8xi32>) -> vector<8xi16>
    "func.return"(%123) : (vector<8xi16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xi32>) -> vector<[8]xi16>, sym_name = "test_trunci_scalable_vector"}> ({
  ^bb0(%arg107: vector<[8]xi32>):
    %122 = "arith.trunci"(%arg107) <{overflowFlags = #arith.overflow<none>}> : (vector<[8]xi32>) -> vector<[8]xi16>
    "func.return"(%122) : (vector<[8]xi16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32) -> bf16, sym_name = "test_truncf"}> ({
  ^bb0(%arg106: f32):
    %121 = "arith.truncf"(%arg106) : (f32) -> bf16
    "func.return"(%121) : (bf16) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xf32>) -> tensor<8x8xbf16>, sym_name = "test_truncf_tensor"}> ({
  ^bb0(%arg105: tensor<8x8xf32>):
    %120 = "arith.truncf"(%arg105) : (tensor<8x8xf32>) -> tensor<8x8xbf16>
    "func.return"(%120) : (tensor<8x8xbf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xf32>) -> vector<8xbf16>, sym_name = "test_truncf_vector"}> ({
  ^bb0(%arg104: vector<8xf32>):
    %119 = "arith.truncf"(%arg104) : (vector<8xf32>) -> vector<8xbf16>
    "func.return"(%119) : (vector<8xbf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xf32>) -> vector<[8]xbf16>, sym_name = "test_truncf_scalable_vector"}> ({
  ^bb0(%arg103: vector<[8]xf32>):
    %118 = "arith.truncf"(%arg103) : (vector<[8]xf32>) -> vector<[8]xbf16>
    "func.return"(%118) : (vector<[8]xbf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f64) -> (f32, f32, f32, f32, f32), sym_name = "test_truncf_rounding_mode"}> ({
  ^bb0(%arg102: f64):
    %113 = "arith.truncf"(%arg102) <{roundingmode = 0 : i32}> : (f64) -> f32
    %114 = "arith.truncf"(%arg102) <{roundingmode = 1 : i32}> : (f64) -> f32
    %115 = "arith.truncf"(%arg102) <{roundingmode = 2 : i32}> : (f64) -> f32
    %116 = "arith.truncf"(%arg102) <{roundingmode = 3 : i32}> : (f64) -> f32
    %117 = "arith.truncf"(%arg102) <{roundingmode = 4 : i32}> : (f64) -> f32
    "func.return"(%113, %114, %115, %116, %117) : (f32, f32, f32, f32, f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f16) -> bf16, sym_name = "test_convertf"}> ({
  ^bb0(%arg101: f16):
    %112 = "arith.convertf"(%arg101) : (f16) -> bf16
    "func.return"(%112) : (bf16) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xf16>) -> vector<8xbf16>, sym_name = "test_convertf_vector"}> ({
  ^bb0(%arg100: vector<8xf16>):
    %111 = "arith.convertf"(%arg100) : (vector<8xf16>) -> vector<8xbf16>
    "func.return"(%111) : (vector<8xbf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xbf16>) -> vector<[8]xf16>, sym_name = "test_convertf_scalable_vector"}> ({
  ^bb0(%arg99: vector<[8]xbf16>):
    %110 = "arith.convertf"(%arg99) : (vector<[8]xbf16>) -> vector<[8]xf16>
    "func.return"(%110) : (vector<[8]xf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xf16>) -> tensor<8x8xbf16>, sym_name = "test_convertf_tensor"}> ({
  ^bb0(%arg98: tensor<8x8xf16>):
    %109 = "arith.convertf"(%arg98) : (tensor<8x8xf16>) -> tensor<8x8xbf16>
    "func.return"(%109) : (tensor<8x8xbf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (bf16) -> f16, sym_name = "test_convertf_rounding_mode"}> ({
  ^bb0(%arg97: bf16):
    %108 = "arith.convertf"(%arg97) <{roundingmode = 0 : i32}> : (bf16) -> f16
    "func.return"(%108) : (f16) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> f32, sym_name = "test_uitofp"}> ({
  ^bb0(%arg96: i32):
    %107 = "arith.uitofp"(%arg96) : (i32) -> f32
    "func.return"(%107) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xi32>) -> tensor<8x8xf32>, sym_name = "test_uitofp_tensor"}> ({
  ^bb0(%arg95: tensor<8x8xi32>):
    %106 = "arith.uitofp"(%arg95) : (tensor<8x8xi32>) -> tensor<8x8xf32>
    "func.return"(%106) : (tensor<8x8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xi32>) -> vector<8xf32>, sym_name = "test_uitofp_vector"}> ({
  ^bb0(%arg94: vector<8xi32>):
    %105 = "arith.uitofp"(%arg94) : (vector<8xi32>) -> vector<8xf32>
    "func.return"(%105) : (vector<8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xi32>) -> vector<[8]xf32>, sym_name = "test_uitofp_scalable_vector"}> ({
  ^bb0(%arg93: vector<[8]xi32>):
    %104 = "arith.uitofp"(%arg93) : (vector<[8]xi32>) -> vector<[8]xf32>
    "func.return"(%104) : (vector<[8]xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> f32, sym_name = "test_uitofp_nneg"}> ({
  ^bb0(%arg92: i32):
    %103 = "arith.uitofp"(%arg92) <{nonNeg}> : (i32) -> f32
    "func.return"(%103) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xi32>) -> vector<8xf32>, sym_name = "test_uitofp_nneg_vector"}> ({
  ^bb0(%arg91: vector<8xi32>):
    %102 = "arith.uitofp"(%arg91) <{nonNeg}> : (vector<8xi32>) -> vector<8xf32>
    "func.return"(%102) : (vector<8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i16) -> f64, sym_name = "test_sitofp"}> ({
  ^bb0(%arg90: i16):
    %101 = "arith.sitofp"(%arg90) : (i16) -> f64
    "func.return"(%101) : (f64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xi16>) -> tensor<8x8xf64>, sym_name = "test_sitofp_tensor"}> ({
  ^bb0(%arg89: tensor<8x8xi16>):
    %100 = "arith.sitofp"(%arg89) : (tensor<8x8xi16>) -> tensor<8x8xf64>
    "func.return"(%100) : (tensor<8x8xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xi16>) -> vector<8xf64>, sym_name = "test_sitofp_vector"}> ({
  ^bb0(%arg88: vector<8xi16>):
    %99 = "arith.sitofp"(%arg88) : (vector<8xi16>) -> vector<8xf64>
    "func.return"(%99) : (vector<8xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xi16>) -> vector<[8]xf64>, sym_name = "test_sitofp_scalable_vector"}> ({
  ^bb0(%arg87: vector<[8]xi16>):
    %98 = "arith.sitofp"(%arg87) : (vector<[8]xi16>) -> vector<[8]xf64>
    "func.return"(%98) : (vector<[8]xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (bf16) -> i8, sym_name = "test_fptoui"}> ({
  ^bb0(%arg86: bf16):
    %97 = "arith.fptoui"(%arg86) : (bf16) -> i8
    "func.return"(%97) : (i8) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xbf16>) -> tensor<8x8xi8>, sym_name = "test_fptoui_tensor"}> ({
  ^bb0(%arg85: tensor<8x8xbf16>):
    %96 = "arith.fptoui"(%arg85) : (tensor<8x8xbf16>) -> tensor<8x8xi8>
    "func.return"(%96) : (tensor<8x8xi8>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xbf16>) -> vector<8xi8>, sym_name = "test_fptoui_vector"}> ({
  ^bb0(%arg84: vector<8xbf16>):
    %95 = "arith.fptoui"(%arg84) : (vector<8xbf16>) -> vector<8xi8>
    "func.return"(%95) : (vector<8xi8>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xbf16>) -> vector<[8]xi8>, sym_name = "test_fptoui_scalable_vector"}> ({
  ^bb0(%arg83: vector<[8]xbf16>):
    %94 = "arith.fptoui"(%arg83) : (vector<[8]xbf16>) -> vector<[8]xi8>
    "func.return"(%94) : (vector<[8]xi8>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f64) -> i64, sym_name = "test_fptosi"}> ({
  ^bb0(%arg82: f64):
    %93 = "arith.fptosi"(%arg82) : (f64) -> i64
    "func.return"(%93) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xf64>) -> tensor<8x8xi64>, sym_name = "test_fptosi_tensor"}> ({
  ^bb0(%arg81: tensor<8x8xf64>):
    %92 = "arith.fptosi"(%arg81) : (tensor<8x8xf64>) -> tensor<8x8xi64>
    "func.return"(%92) : (tensor<8x8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xf64>) -> vector<8xi64>, sym_name = "test_fptosi_vector"}> ({
  ^bb0(%arg80: vector<8xf64>):
    %91 = "arith.fptosi"(%arg80) : (vector<8xf64>) -> vector<8xi64>
    "func.return"(%91) : (vector<8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xf64>) -> vector<[8]xi64>, sym_name = "test_fptosi_scalable_vector"}> ({
  ^bb0(%arg79: vector<[8]xf64>):
    %90 = "arith.fptosi"(%arg79) : (vector<[8]xf64>) -> vector<[8]xi64>
    "func.return"(%90) : (vector<[8]xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> index, sym_name = "test_index_cast0"}> ({
  ^bb0(%arg78: i32):
    %89 = "arith.index_cast"(%arg78) : (i32) -> index
    "func.return"(%89) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xi32>) -> tensor<8x8xindex>, sym_name = "test_index_cast_tensor0"}> ({
  ^bb0(%arg77: tensor<8x8xi32>):
    %88 = "arith.index_cast"(%arg77) : (tensor<8x8xi32>) -> tensor<8x8xindex>
    "func.return"(%88) : (tensor<8x8xindex>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xi32>) -> vector<8xindex>, sym_name = "test_index_cast_vector0"}> ({
  ^bb0(%arg76: vector<8xi32>):
    %87 = "arith.index_cast"(%arg76) : (vector<8xi32>) -> vector<8xindex>
    "func.return"(%87) : (vector<8xindex>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xi32>) -> vector<[8]xindex>, sym_name = "test_index_cast_scalable_vector0"}> ({
  ^bb0(%arg75: vector<[8]xi32>):
    %86 = "arith.index_cast"(%arg75) : (vector<[8]xi32>) -> vector<[8]xindex>
    "func.return"(%86) : (vector<[8]xindex>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> i64, sym_name = "test_index_cast1"}> ({
  ^bb0(%arg74: index):
    %85 = "arith.index_cast"(%arg74) : (index) -> i64
    "func.return"(%85) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xindex>) -> tensor<8x8xi64>, sym_name = "test_index_cast_tensor1"}> ({
  ^bb0(%arg73: tensor<8x8xindex>):
    %84 = "arith.index_cast"(%arg73) : (tensor<8x8xindex>) -> tensor<8x8xi64>
    "func.return"(%84) : (tensor<8x8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xindex>) -> vector<8xi64>, sym_name = "test_index_cast_vector1"}> ({
  ^bb0(%arg72: vector<8xindex>):
    %83 = "arith.index_cast"(%arg72) : (vector<8xindex>) -> vector<8xi64>
    "func.return"(%83) : (vector<8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xindex>) -> vector<[8]xi64>, sym_name = "test_index_cast_scalable_vector1"}> ({
  ^bb0(%arg71: vector<[8]xindex>):
    %82 = "arith.index_cast"(%arg71) : (vector<[8]xindex>) -> vector<[8]xi64>
    "func.return"(%82) : (vector<[8]xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> index, sym_name = "test_index_castui0"}> ({
  ^bb0(%arg70: i32):
    %81 = "arith.index_castui"(%arg70) : (i32) -> index
    "func.return"(%81) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xi32>) -> tensor<8x8xindex>, sym_name = "test_index_castui_tensor0"}> ({
  ^bb0(%arg69: tensor<8x8xi32>):
    %80 = "arith.index_castui"(%arg69) : (tensor<8x8xi32>) -> tensor<8x8xindex>
    "func.return"(%80) : (tensor<8x8xindex>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xi32>) -> vector<8xindex>, sym_name = "test_index_castui_vector0"}> ({
  ^bb0(%arg68: vector<8xi32>):
    %79 = "arith.index_castui"(%arg68) : (vector<8xi32>) -> vector<8xindex>
    "func.return"(%79) : (vector<8xindex>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xi32>) -> vector<[8]xindex>, sym_name = "test_index_castui_scalable_vector0"}> ({
  ^bb0(%arg67: vector<[8]xi32>):
    %78 = "arith.index_castui"(%arg67) : (vector<[8]xi32>) -> vector<[8]xindex>
    "func.return"(%78) : (vector<[8]xindex>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> i64, sym_name = "test_indexui_cast1"}> ({
  ^bb0(%arg66: index):
    %77 = "arith.index_castui"(%arg66) : (index) -> i64
    "func.return"(%77) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xindex>) -> tensor<8x8xi64>, sym_name = "test_index_castui_tensor1"}> ({
  ^bb0(%arg65: tensor<8x8xindex>):
    %76 = "arith.index_castui"(%arg65) : (tensor<8x8xindex>) -> tensor<8x8xi64>
    "func.return"(%76) : (tensor<8x8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xindex>) -> vector<8xi64>, sym_name = "test_index_castui_vector1"}> ({
  ^bb0(%arg64: vector<8xindex>):
    %75 = "arith.index_castui"(%arg64) : (vector<8xindex>) -> vector<8xi64>
    "func.return"(%75) : (vector<8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xindex>) -> vector<[8]xi64>, sym_name = "test_index_castui_scalable_vector1"}> ({
  ^bb0(%arg63: vector<[8]xindex>):
    %74 = "arith.index_castui"(%arg63) : (vector<[8]xindex>) -> vector<[8]xi64>
    "func.return"(%74) : (vector<[8]xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> index, sym_name = "test_index_castui_nneg"}> ({
  ^bb0(%arg62: i32):
    %73 = "arith.index_castui"(%arg62) <{nonNeg}> : (i32) -> index
    "func.return"(%73) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xi32>) -> vector<8xindex>, sym_name = "test_index_castui_nneg_vector"}> ({
  ^bb0(%arg61: vector<8xi32>):
    %72 = "arith.index_castui"(%arg61) <{nonNeg}> : (vector<8xi32>) -> vector<8xindex>
    "func.return"(%72) : (vector<8xindex>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64) -> f64, sym_name = "test_bitcast0"}> ({
  ^bb0(%arg60: i64):
    %71 = "arith.bitcast"(%arg60) : (i64) -> f64
    "func.return"(%71) : (f64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xi64>) -> tensor<8x8xf64>, sym_name = "test_bitcast_tensor0"}> ({
  ^bb0(%arg59: tensor<8x8xi64>):
    %70 = "arith.bitcast"(%arg59) : (tensor<8x8xi64>) -> tensor<8x8xf64>
    "func.return"(%70) : (tensor<8x8xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xi64>) -> vector<8xf64>, sym_name = "test_bitcast_vector0"}> ({
  ^bb0(%arg58: vector<8xi64>):
    %69 = "arith.bitcast"(%arg58) : (vector<8xi64>) -> vector<8xf64>
    "func.return"(%69) : (vector<8xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xi64>) -> vector<[8]xf64>, sym_name = "test_bitcast_scalable_vector0"}> ({
  ^bb0(%arg57: vector<[8]xi64>):
    %68 = "arith.bitcast"(%arg57) : (vector<[8]xi64>) -> vector<[8]xf64>
    "func.return"(%68) : (vector<[8]xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32) -> i32, sym_name = "test_bitcast1"}> ({
  ^bb0(%arg56: f32):
    %67 = "arith.bitcast"(%arg56) : (f32) -> i32
    "func.return"(%67) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xf32>) -> tensor<8x8xi32>, sym_name = "test_bitcast_tensor1"}> ({
  ^bb0(%arg55: tensor<8x8xf32>):
    %66 = "arith.bitcast"(%arg55) : (tensor<8x8xf32>) -> tensor<8x8xi32>
    "func.return"(%66) : (tensor<8x8xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xf32>) -> vector<8xi32>, sym_name = "test_bitcast_vector1"}> ({
  ^bb0(%arg54: vector<8xf32>):
    %65 = "arith.bitcast"(%arg54) : (vector<8xf32>) -> vector<8xi32>
    "func.return"(%65) : (vector<8xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xf32>) -> vector<[8]xi32>, sym_name = "test_bitcast_scalable_vector1"}> ({
  ^bb0(%arg53: vector<[8]xf32>):
    %64 = "arith.bitcast"(%arg53) : (vector<[8]xf32>) -> vector<[8]xi32>
    "func.return"(%64) : (vector<[8]xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64, i64) -> i1, sym_name = "test_cmpi"}> ({
  ^bb0(%arg51: i64, %arg52: i64):
    %63 = "arith.cmpi"(%arg51, %arg52) <{predicate = 1 : i64}> : (i64, i64) -> i1
    "func.return"(%63) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xi64>, tensor<8x8xi64>) -> tensor<8x8xi1>, sym_name = "test_cmpi_tensor"}> ({
  ^bb0(%arg49: tensor<8x8xi64>, %arg50: tensor<8x8xi64>):
    %62 = "arith.cmpi"(%arg49, %arg50) <{predicate = 2 : i64}> : (tensor<8x8xi64>, tensor<8x8xi64>) -> tensor<8x8xi1>
    "func.return"(%62) : (tensor<8x8xi1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xi64, "foo">, tensor<8x8xi64, "foo">) -> tensor<8x8xi1, "foo">, sym_name = "test_cmpi_tensor_encoding"}> ({
  ^bb0(%arg47: tensor<8x8xi64, "foo">, %arg48: tensor<8x8xi64, "foo">):
    %61 = "arith.cmpi"(%arg47, %arg48) <{predicate = 2 : i64}> : (tensor<8x8xi64, "foo">, tensor<8x8xi64, "foo">) -> tensor<8x8xi1, "foo">
    "func.return"(%61) : (tensor<8x8xi1, "foo">) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xi64>, vector<8xi64>) -> vector<8xi1>, sym_name = "test_cmpi_vector"}> ({
  ^bb0(%arg45: vector<8xi64>, %arg46: vector<8xi64>):
    %60 = "arith.cmpi"(%arg45, %arg46) <{predicate = 6 : i64}> : (vector<8xi64>, vector<8xi64>) -> vector<8xi1>
    "func.return"(%60) : (vector<8xi1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xi64>, vector<[8]xi64>) -> vector<[8]xi1>, sym_name = "test_cmpi_scalable_vector"}> ({
  ^bb0(%arg43: vector<[8]xi64>, %arg44: vector<[8]xi64>):
    %59 = "arith.cmpi"(%arg43, %arg44) <{predicate = 6 : i64}> : (vector<[8]xi64>, vector<[8]xi64>) -> vector<[8]xi1>
    "func.return"(%59) : (vector<[8]xi1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<i64>, vector<i64>) -> vector<i1>, sym_name = "test_cmpi_vector_0d"}> ({
  ^bb0(%arg41: vector<i64>, %arg42: vector<i64>):
    %58 = "arith.cmpi"(%arg41, %arg42) <{predicate = 6 : i64}> : (vector<i64>, vector<i64>) -> vector<i1>
    "func.return"(%58) : (vector<i1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f64, f64) -> i1, sym_name = "test_cmpf"}> ({
  ^bb0(%arg39: f64, %arg40: f64):
    %57 = "arith.cmpf"(%arg39, %arg40) <{fastmath = #arith.fastmath<none>, predicate = 1 : i64}> : (f64, f64) -> i1
    "func.return"(%57) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xf64>, tensor<8x8xf64>) -> tensor<8x8xi1>, sym_name = "test_cmpf_tensor"}> ({
  ^bb0(%arg37: tensor<8x8xf64>, %arg38: tensor<8x8xf64>):
    %56 = "arith.cmpf"(%arg37, %arg38) <{fastmath = #arith.fastmath<none>, predicate = 4 : i64}> : (tensor<8x8xf64>, tensor<8x8xf64>) -> tensor<8x8xi1>
    "func.return"(%56) : (tensor<8x8xi1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xf64>, vector<8xf64>) -> vector<8xi1>, sym_name = "test_cmpf_vector"}> ({
  ^bb0(%arg35: vector<8xf64>, %arg36: vector<8xf64>):
    %55 = "arith.cmpf"(%arg35, %arg36) <{fastmath = #arith.fastmath<none>, predicate = 11 : i64}> : (vector<8xf64>, vector<8xf64>) -> vector<8xi1>
    "func.return"(%55) : (vector<8xi1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xf64>, vector<[8]xf64>) -> vector<[8]xi1>, sym_name = "test_cmpf_scalable_vector"}> ({
  ^bb0(%arg33: vector<[8]xf64>, %arg34: vector<[8]xf64>):
    %54 = "arith.cmpf"(%arg33, %arg34) <{fastmath = #arith.fastmath<none>, predicate = 11 : i64}> : (vector<[8]xf64>, vector<[8]xf64>) -> vector<[8]xi1>
    "func.return"(%54) : (vector<[8]xi1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> i64, sym_name = "test_index_cast"}> ({
  ^bb0(%arg32: index):
    %53 = "arith.index_cast"(%arg32) : (index) -> i64
    "func.return"(%53) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<index>) -> tensor<i64>, sym_name = "test_index_cast_tensor"}> ({
  ^bb0(%arg31: tensor<index>):
    %52 = "arith.index_cast"(%arg31) : (tensor<index>) -> tensor<i64>
    "func.return"(%52) : (tensor<i64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<i64>) -> tensor<index>, sym_name = "test_index_cast_tensor_reverse"}> ({
  ^bb0(%arg30: tensor<i64>):
    %51 = "arith.index_cast"(%arg30) : (tensor<i64>) -> tensor<index>
    "func.return"(%51) : (tensor<index>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32) -> i32, sym_name = "bitcast"}> ({
  ^bb0(%arg29: f32):
    %50 = "arith.bitcast"(%arg29) : (f32) -> i32
    "func.return"(%50) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_constant"}> ({
    %39 = "arith.constant"() <{value = 42 : i32}> : () -> i32
    %40 = "arith.constant"() <{value = 42 : i32}> : () -> i32
    %41 = "arith.constant"() <{value = 43 : index}> {crazy = "func.foo"} : () -> index
    %42 = "arith.constant"() <{value = 4.300000e+01 : bf16}> : () -> bf16
    %43 = "arith.constant"() <{value = dense<0> : vector<4xi32>}> : () -> vector<4xi32>
    %44 = "arith.constant"() <{value = dense<0> : tensor<42xi32>}> : () -> tensor<42xi32>
    %45 = "arith.constant"() <{value = dense<0> : vector<42xi32>}> : () -> vector<42xi32>
    %46 = "arith.constant"() <{value = true}> : () -> i1
    %47 = "arith.constant"() <{value = false}> : () -> i1
    %48 = "arith.constant"() <{value = -1 : i128}> : () -> i128
    %49 = "arith.constant"() <{value = 85070591730234615865843651857942052864 : i128}> : () -> i128
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xf32>, vector<4xf32>, vector<[4]xf32>, vector<[4]xf32>, f32, f32, i32, i32) -> (), sym_name = "maximum"}> ({
  ^bb0(%arg21: vector<4xf32>, %arg22: vector<4xf32>, %arg23: vector<[4]xf32>, %arg24: vector<[4]xf32>, %arg25: f32, %arg26: f32, %arg27: i32, %arg28: i32):
    %31 = "arith.maximumf"(%arg21, %arg22) <{fastmath = #arith.fastmath<none>}> : (vector<4xf32>, vector<4xf32>) -> vector<4xf32>
    %32 = "arith.maximumf"(%arg23, %arg24) <{fastmath = #arith.fastmath<none>}> : (vector<[4]xf32>, vector<[4]xf32>) -> vector<[4]xf32>
    %33 = "arith.maximumf"(%arg25, %arg26) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    %34 = "arith.maxnumf"(%arg21, %arg22) <{fastmath = #arith.fastmath<none>}> : (vector<4xf32>, vector<4xf32>) -> vector<4xf32>
    %35 = "arith.maxnumf"(%arg23, %arg24) <{fastmath = #arith.fastmath<none>}> : (vector<[4]xf32>, vector<[4]xf32>) -> vector<[4]xf32>
    %36 = "arith.maxnumf"(%arg25, %arg26) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    %37 = "arith.maxsi"(%arg27, %arg28) : (i32, i32) -> i32
    %38 = "arith.maxui"(%arg27, %arg28) : (i32, i32) -> i32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xf32>, vector<4xf32>, vector<[4]xf32>, vector<[4]xf32>, f32, f32, i32, i32) -> (), sym_name = "minimum"}> ({
  ^bb0(%arg13: vector<4xf32>, %arg14: vector<4xf32>, %arg15: vector<[4]xf32>, %arg16: vector<[4]xf32>, %arg17: f32, %arg18: f32, %arg19: i32, %arg20: i32):
    %23 = "arith.minimumf"(%arg13, %arg14) <{fastmath = #arith.fastmath<none>}> : (vector<4xf32>, vector<4xf32>) -> vector<4xf32>
    %24 = "arith.minimumf"(%arg15, %arg16) <{fastmath = #arith.fastmath<none>}> : (vector<[4]xf32>, vector<[4]xf32>) -> vector<[4]xf32>
    %25 = "arith.minimumf"(%arg17, %arg18) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    %26 = "arith.minnumf"(%arg13, %arg14) <{fastmath = #arith.fastmath<none>}> : (vector<4xf32>, vector<4xf32>) -> vector<4xf32>
    %27 = "arith.minnumf"(%arg15, %arg16) <{fastmath = #arith.fastmath<none>}> : (vector<[4]xf32>, vector<[4]xf32>) -> vector<[4]xf32>
    %28 = "arith.minnumf"(%arg17, %arg18) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    %29 = "arith.minsi"(%arg19, %arg20) : (i32, i32) -> i32
    %30 = "arith.minui"(%arg19, %arg20) : (i32, i32) -> i32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, f32, i32) -> (), sym_name = "fastmath"}> ({
  ^bb0(%arg10: f32, %arg11: f32, %arg12: i32):
    %12 = "arith.addf"(%arg10, %arg11) <{fastmath = #arith.fastmath<fast>}> : (f32, f32) -> f32
    %13 = "arith.subf"(%arg10, %arg11) <{fastmath = #arith.fastmath<fast>}> : (f32, f32) -> f32
    %14 = "arith.mulf"(%arg10, %arg11) <{fastmath = #arith.fastmath<fast>}> : (f32, f32) -> f32
    %15 = "arith.divf"(%arg10, %arg11) <{fastmath = #arith.fastmath<fast>}> : (f32, f32) -> f32
    %16 = "arith.remf"(%arg10, %arg11) <{fastmath = #arith.fastmath<fast>}> : (f32, f32) -> f32
    %17 = "arith.negf"(%arg10) <{fastmath = #arith.fastmath<fast>}> : (f32) -> f32
    %18 = "arith.flush_denormals"(%arg10) <{fastmath = #arith.fastmath<fast>}> : (f32) -> f32
    %19 = "arith.addf"(%arg10, %arg11) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    %20 = "arith.addf"(%arg10, %arg11) <{fastmath = #arith.fastmath<nnan,ninf>}> : (f32, f32) -> f32
    %21 = "arith.mulf"(%arg10, %arg11) <{fastmath = #arith.fastmath<fast>}> : (f32, f32) -> f32
    %22 = "arith.cmpf"(%arg10, %arg11) <{fastmath = #arith.fastmath<fast>, predicate = 1 : i64}> : (f32, f32) -> i1
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, f32) -> (), sym_name = "roundingmode"}> ({
  ^bb0(%arg8: f32, %arg9: f32):
    %7 = "arith.addf"(%arg8, %arg9) <{fastmath = #arith.fastmath<none>, roundingmode = 0 : i32}> : (f32, f32) -> f32
    %8 = "arith.subf"(%arg8, %arg9) <{fastmath = #arith.fastmath<none>, roundingmode = 1 : i32}> : (f32, f32) -> f32
    %9 = "arith.mulf"(%arg8, %arg9) <{fastmath = #arith.fastmath<none>, roundingmode = 2 : i32}> : (f32, f32) -> f32
    %10 = "arith.divf"(%arg8, %arg9) <{fastmath = #arith.fastmath<none>, roundingmode = 3 : i32}> : (f32, f32) -> f32
    %11 = "arith.addf"(%arg8, %arg9) <{fastmath = #arith.fastmath<fast>, roundingmode = 0 : i32}> : (f32, f32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8xi1>, tensor<8xi32>, tensor<8xi32>) -> tensor<8xi32>, sym_name = "select_tensor"}> ({
  ^bb0(%arg5: tensor<8xi1>, %arg6: tensor<8xi32>, %arg7: tensor<8xi32>):
    %6 = "arith.select"(%arg5, %arg6, %arg7) : (tensor<8xi1>, tensor<8xi32>, tensor<8xi32>) -> tensor<8xi32>
    "func.return"(%6) : (tensor<8xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8xi1, "foo">, tensor<8xi32, "foo">, tensor<8xi32, "foo">) -> tensor<8xi32, "foo">, sym_name = "select_tensor_encoding"}> ({
  ^bb0(%arg2: tensor<8xi1, "foo">, %arg3: tensor<8xi32, "foo">, %arg4: tensor<8xi32, "foo">):
    %5 = "arith.select"(%arg2, %arg3, %arg4) : (tensor<8xi1, "foo">, tensor<8xi32, "foo">, tensor<8xi32, "foo">) -> tensor<8xi32, "foo">
    "func.return"(%5) : (tensor<8xi32, "foo">) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64, i64) -> (), sym_name = "intflags_func"}> ({
  ^bb0(%arg0: i64, %arg1: i64):
    %0 = "arith.addi"(%arg0, %arg1) <{overflowFlags = #arith.overflow<nsw>}> : (i64, i64) -> i64
    %1 = "arith.subi"(%arg0, %arg1) <{overflowFlags = #arith.overflow<nuw>}> : (i64, i64) -> i64
    %2 = "arith.muli"(%arg0, %arg1) <{overflowFlags = #arith.overflow<nsw, nuw>}> : (i64, i64) -> i64
    %3 = "arith.shli"(%arg0, %arg1) <{overflowFlags = #arith.overflow<nsw, nuw>}> : (i64, i64) -> i64
    %4 = "arith.trunci"(%arg0) <{overflowFlags = #arith.overflow<nsw, nuw>}> : (i64) -> i32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

