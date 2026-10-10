"builtin.module"() ({
  "func.func"() <{function_type = (i64, i64) -> i64, sym_name = "test_addi"}> ({
  ^bb0(%arg307: i64, %arg308: i64):
    %223 = "arith.addi"(%arg307, %arg308) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64
    "func.return"(%223) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xi64>, tensor<8x8xi64>) -> tensor<8x8xi64>, sym_name = "test_addi_tensor"}> ({
  ^bb0(%arg305: tensor<8x8xi64>, %arg306: tensor<8x8xi64>):
    %222 = "arith.addi"(%arg305, %arg306) <{overflowFlags = #arith.overflow<none>}> : (tensor<8x8xi64>, tensor<8x8xi64>) -> tensor<8x8xi64>
    "func.return"(%222) : (tensor<8x8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xi64>, vector<8xi64>) -> vector<8xi64>, sym_name = "test_addi_vector"}> ({
  ^bb0(%arg303: vector<8xi64>, %arg304: vector<8xi64>):
    %221 = "arith.addi"(%arg303, %arg304) <{overflowFlags = #arith.overflow<none>}> : (vector<8xi64>, vector<8xi64>) -> vector<8xi64>
    "func.return"(%221) : (vector<8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xi64>, vector<[8]xi64>) -> vector<[8]xi64>, sym_name = "test_addi_scalable_vector"}> ({
  ^bb0(%arg301: vector<[8]xi64>, %arg302: vector<[8]xi64>):
    %220 = "arith.addi"(%arg301, %arg302) <{overflowFlags = #arith.overflow<none>}> : (vector<[8]xi64>, vector<[8]xi64>) -> vector<[8]xi64>
    "func.return"(%220) : (vector<[8]xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64, i64) -> i64, sym_name = "test_addui_extended"}> ({
  ^bb0(%arg299: i64, %arg300: i64):
    %219:2 = "arith.addui_extended"(%arg299, %arg300) : (i64, i64) -> (i64, i1)
    "func.return"(%219#0) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xi64>, tensor<8x8xi64>) -> tensor<8x8xi64>, sym_name = "test_addui_extended_tensor"}> ({
  ^bb0(%arg297: tensor<8x8xi64>, %arg298: tensor<8x8xi64>):
    %218:2 = "arith.addui_extended"(%arg297, %arg298) : (tensor<8x8xi64>, tensor<8x8xi64>) -> (tensor<8x8xi64>, tensor<8x8xi1>)
    "func.return"(%218#0) : (tensor<8x8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xi64>, vector<8xi64>) -> vector<8xi64>, sym_name = "test_addui_extended_vector"}> ({
  ^bb0(%arg295: vector<8xi64>, %arg296: vector<8xi64>):
    %217:2 = "arith.addui_extended"(%arg295, %arg296) : (vector<8xi64>, vector<8xi64>) -> (vector<8xi64>, vector<8xi1>)
    "func.return"(%217#0) : (vector<8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xi64>, vector<[8]xi64>) -> vector<[8]xi64>, sym_name = "test_addui_extended_scalable_vector"}> ({
  ^bb0(%arg293: vector<[8]xi64>, %arg294: vector<[8]xi64>):
    %216:2 = "arith.addui_extended"(%arg293, %arg294) : (vector<[8]xi64>, vector<[8]xi64>) -> (vector<[8]xi64>, vector<[8]xi1>)
    "func.return"(%216#0) : (vector<[8]xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64, i64) -> i64, sym_name = "test_subi"}> ({
  ^bb0(%arg291: i64, %arg292: i64):
    %215 = "arith.subi"(%arg291, %arg292) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64
    "func.return"(%215) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xi64>, tensor<8x8xi64>) -> tensor<8x8xi64>, sym_name = "test_subi_tensor"}> ({
  ^bb0(%arg289: tensor<8x8xi64>, %arg290: tensor<8x8xi64>):
    %214 = "arith.subi"(%arg289, %arg290) <{overflowFlags = #arith.overflow<none>}> : (tensor<8x8xi64>, tensor<8x8xi64>) -> tensor<8x8xi64>
    "func.return"(%214) : (tensor<8x8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xi64>, vector<8xi64>) -> vector<8xi64>, sym_name = "test_subi_vector"}> ({
  ^bb0(%arg287: vector<8xi64>, %arg288: vector<8xi64>):
    %213 = "arith.subi"(%arg287, %arg288) <{overflowFlags = #arith.overflow<none>}> : (vector<8xi64>, vector<8xi64>) -> vector<8xi64>
    "func.return"(%213) : (vector<8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xi64>, vector<[8]xi64>) -> vector<[8]xi64>, sym_name = "test_subi_scalable_vector"}> ({
  ^bb0(%arg285: vector<[8]xi64>, %arg286: vector<[8]xi64>):
    %212 = "arith.subi"(%arg285, %arg286) <{overflowFlags = #arith.overflow<none>}> : (vector<[8]xi64>, vector<[8]xi64>) -> vector<[8]xi64>
    "func.return"(%212) : (vector<[8]xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64, i64) -> i64, sym_name = "test_muli"}> ({
  ^bb0(%arg283: i64, %arg284: i64):
    %211 = "arith.muli"(%arg283, %arg284) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64
    "func.return"(%211) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xi64>, tensor<8x8xi64>) -> tensor<8x8xi64>, sym_name = "test_muli_tensor"}> ({
  ^bb0(%arg281: tensor<8x8xi64>, %arg282: tensor<8x8xi64>):
    %210 = "arith.muli"(%arg281, %arg282) <{overflowFlags = #arith.overflow<none>}> : (tensor<8x8xi64>, tensor<8x8xi64>) -> tensor<8x8xi64>
    "func.return"(%210) : (tensor<8x8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xi64>, vector<8xi64>) -> vector<8xi64>, sym_name = "test_muli_vector"}> ({
  ^bb0(%arg279: vector<8xi64>, %arg280: vector<8xi64>):
    %209 = "arith.muli"(%arg279, %arg280) <{overflowFlags = #arith.overflow<none>}> : (vector<8xi64>, vector<8xi64>) -> vector<8xi64>
    "func.return"(%209) : (vector<8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xi64>, vector<[8]xi64>) -> vector<[8]xi64>, sym_name = "test_muli_scalable_vector"}> ({
  ^bb0(%arg277: vector<[8]xi64>, %arg278: vector<[8]xi64>):
    %208 = "arith.muli"(%arg277, %arg278) <{overflowFlags = #arith.overflow<none>}> : (vector<[8]xi64>, vector<[8]xi64>) -> vector<[8]xi64>
    "func.return"(%208) : (vector<[8]xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32) -> i32, sym_name = "test_mulsi_extended"}> ({
  ^bb0(%arg275: i32, %arg276: i32):
    %207:2 = "arith.mulsi_extended"(%arg275, %arg276) : (i32, i32) -> (i32, i32)
    "func.return"(%207#1) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xi64>, tensor<8x8xi64>) -> tensor<8x8xi64>, sym_name = "test_mulsi_extended_tensor"}> ({
  ^bb0(%arg273: tensor<8x8xi64>, %arg274: tensor<8x8xi64>):
    %206:2 = "arith.mulsi_extended"(%arg273, %arg274) : (tensor<8x8xi64>, tensor<8x8xi64>) -> (tensor<8x8xi64>, tensor<8x8xi64>)
    "func.return"(%206#1) : (tensor<8x8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xi64>, vector<8xi64>) -> vector<8xi64>, sym_name = "test_mulsi_extended_vector"}> ({
  ^bb0(%arg271: vector<8xi64>, %arg272: vector<8xi64>):
    %205:2 = "arith.mulsi_extended"(%arg271, %arg272) : (vector<8xi64>, vector<8xi64>) -> (vector<8xi64>, vector<8xi64>)
    "func.return"(%205#0) : (vector<8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xi64>, vector<[8]xi64>) -> vector<[8]xi64>, sym_name = "test_mulsi_extended_scalable_vector"}> ({
  ^bb0(%arg269: vector<[8]xi64>, %arg270: vector<[8]xi64>):
    %204:2 = "arith.mulsi_extended"(%arg269, %arg270) : (vector<[8]xi64>, vector<[8]xi64>) -> (vector<[8]xi64>, vector<[8]xi64>)
    "func.return"(%204#1) : (vector<[8]xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32) -> i32, sym_name = "test_mului_extended"}> ({
  ^bb0(%arg267: i32, %arg268: i32):
    %203:2 = "arith.mului_extended"(%arg267, %arg268) : (i32, i32) -> (i32, i32)
    "func.return"(%203#1) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xi64>, tensor<8x8xi64>) -> tensor<8x8xi64>, sym_name = "test_mului_extended_tensor"}> ({
  ^bb0(%arg265: tensor<8x8xi64>, %arg266: tensor<8x8xi64>):
    %202:2 = "arith.mului_extended"(%arg265, %arg266) : (tensor<8x8xi64>, tensor<8x8xi64>) -> (tensor<8x8xi64>, tensor<8x8xi64>)
    "func.return"(%202#1) : (tensor<8x8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xi64>, vector<8xi64>) -> vector<8xi64>, sym_name = "test_mului_extended_vector"}> ({
  ^bb0(%arg263: vector<8xi64>, %arg264: vector<8xi64>):
    %201:2 = "arith.mului_extended"(%arg263, %arg264) : (vector<8xi64>, vector<8xi64>) -> (vector<8xi64>, vector<8xi64>)
    "func.return"(%201#0) : (vector<8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xi64>, vector<[8]xi64>) -> vector<[8]xi64>, sym_name = "test_mului_extended_scalable_vector"}> ({
  ^bb0(%arg261: vector<[8]xi64>, %arg262: vector<[8]xi64>):
    %200:2 = "arith.mului_extended"(%arg261, %arg262) : (vector<[8]xi64>, vector<[8]xi64>) -> (vector<[8]xi64>, vector<[8]xi64>)
    "func.return"(%200#1) : (vector<[8]xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64, i64) -> i64, sym_name = "test_divui"}> ({
  ^bb0(%arg259: i64, %arg260: i64):
    %199 = "arith.divui"(%arg259, %arg260) : (i64, i64) -> i64
    "func.return"(%199) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64, i64) -> i64, sym_name = "test_divui_exact"}> ({
  ^bb0(%arg257: i64, %arg258: i64):
    %198 = "arith.divui"(%arg257, %arg258) <{isExact}> : (i64, i64) -> i64
    "func.return"(%198) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xi64>, tensor<8x8xi64>) -> tensor<8x8xi64>, sym_name = "test_divui_tensor"}> ({
  ^bb0(%arg255: tensor<8x8xi64>, %arg256: tensor<8x8xi64>):
    %197 = "arith.divui"(%arg255, %arg256) : (tensor<8x8xi64>, tensor<8x8xi64>) -> tensor<8x8xi64>
    "func.return"(%197) : (tensor<8x8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xi64>, vector<8xi64>) -> vector<8xi64>, sym_name = "test_divui_vector"}> ({
  ^bb0(%arg253: vector<8xi64>, %arg254: vector<8xi64>):
    %196 = "arith.divui"(%arg253, %arg254) : (vector<8xi64>, vector<8xi64>) -> vector<8xi64>
    "func.return"(%196) : (vector<8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xi64>, vector<[8]xi64>) -> vector<[8]xi64>, sym_name = "test_divui_scalable_vector"}> ({
  ^bb0(%arg251: vector<[8]xi64>, %arg252: vector<[8]xi64>):
    %195 = "arith.divui"(%arg251, %arg252) : (vector<[8]xi64>, vector<[8]xi64>) -> vector<[8]xi64>
    "func.return"(%195) : (vector<[8]xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64, i64) -> i64, sym_name = "test_divsi"}> ({
  ^bb0(%arg249: i64, %arg250: i64):
    %194 = "arith.divsi"(%arg249, %arg250) : (i64, i64) -> i64
    "func.return"(%194) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64, i64) -> i64, sym_name = "test_divsi_exact"}> ({
  ^bb0(%arg247: i64, %arg248: i64):
    %193 = "arith.divsi"(%arg247, %arg248) <{isExact}> : (i64, i64) -> i64
    "func.return"(%193) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xi64>, tensor<8x8xi64>) -> tensor<8x8xi64>, sym_name = "test_divsi_tensor"}> ({
  ^bb0(%arg245: tensor<8x8xi64>, %arg246: tensor<8x8xi64>):
    %192 = "arith.divsi"(%arg245, %arg246) : (tensor<8x8xi64>, tensor<8x8xi64>) -> tensor<8x8xi64>
    "func.return"(%192) : (tensor<8x8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xi64>, vector<8xi64>) -> vector<8xi64>, sym_name = "test_divsi_vector"}> ({
  ^bb0(%arg243: vector<8xi64>, %arg244: vector<8xi64>):
    %191 = "arith.divsi"(%arg243, %arg244) : (vector<8xi64>, vector<8xi64>) -> vector<8xi64>
    "func.return"(%191) : (vector<8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xi64>, vector<[8]xi64>) -> vector<[8]xi64>, sym_name = "test_divsi_scalable_vector"}> ({
  ^bb0(%arg241: vector<[8]xi64>, %arg242: vector<[8]xi64>):
    %190 = "arith.divsi"(%arg241, %arg242) : (vector<[8]xi64>, vector<[8]xi64>) -> vector<[8]xi64>
    "func.return"(%190) : (vector<[8]xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64, i64) -> i64, sym_name = "test_remui"}> ({
  ^bb0(%arg239: i64, %arg240: i64):
    %189 = "arith.remui"(%arg239, %arg240) : (i64, i64) -> i64
    "func.return"(%189) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xi64>, tensor<8x8xi64>) -> tensor<8x8xi64>, sym_name = "test_remui_tensor"}> ({
  ^bb0(%arg237: tensor<8x8xi64>, %arg238: tensor<8x8xi64>):
    %188 = "arith.remui"(%arg237, %arg238) : (tensor<8x8xi64>, tensor<8x8xi64>) -> tensor<8x8xi64>
    "func.return"(%188) : (tensor<8x8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xi64>, vector<8xi64>) -> vector<8xi64>, sym_name = "test_remui_vector"}> ({
  ^bb0(%arg235: vector<8xi64>, %arg236: vector<8xi64>):
    %187 = "arith.remui"(%arg235, %arg236) : (vector<8xi64>, vector<8xi64>) -> vector<8xi64>
    "func.return"(%187) : (vector<8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xi64>, vector<[8]xi64>) -> vector<[8]xi64>, sym_name = "test_remui_scalable_vector"}> ({
  ^bb0(%arg233: vector<[8]xi64>, %arg234: vector<[8]xi64>):
    %186 = "arith.remui"(%arg233, %arg234) : (vector<[8]xi64>, vector<[8]xi64>) -> vector<[8]xi64>
    "func.return"(%186) : (vector<[8]xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64, i64) -> i64, sym_name = "test_remsi"}> ({
  ^bb0(%arg231: i64, %arg232: i64):
    %185 = "arith.remsi"(%arg231, %arg232) : (i64, i64) -> i64
    "func.return"(%185) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xi64>, tensor<8x8xi64>) -> tensor<8x8xi64>, sym_name = "test_remsi_tensor"}> ({
  ^bb0(%arg229: tensor<8x8xi64>, %arg230: tensor<8x8xi64>):
    %184 = "arith.remsi"(%arg229, %arg230) : (tensor<8x8xi64>, tensor<8x8xi64>) -> tensor<8x8xi64>
    "func.return"(%184) : (tensor<8x8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xi64>, vector<8xi64>) -> vector<8xi64>, sym_name = "test_remsi_vector"}> ({
  ^bb0(%arg227: vector<8xi64>, %arg228: vector<8xi64>):
    %183 = "arith.remsi"(%arg227, %arg228) : (vector<8xi64>, vector<8xi64>) -> vector<8xi64>
    "func.return"(%183) : (vector<8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xi64>, vector<[8]xi64>) -> vector<[8]xi64>, sym_name = "test_remsi_scalable_vector"}> ({
  ^bb0(%arg225: vector<[8]xi64>, %arg226: vector<[8]xi64>):
    %182 = "arith.remsi"(%arg225, %arg226) : (vector<[8]xi64>, vector<[8]xi64>) -> vector<[8]xi64>
    "func.return"(%182) : (vector<[8]xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64, i64) -> i64, sym_name = "test_andi"}> ({
  ^bb0(%arg223: i64, %arg224: i64):
    %181 = "arith.andi"(%arg223, %arg224) : (i64, i64) -> i64
    "func.return"(%181) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xi64>, tensor<8x8xi64>) -> tensor<8x8xi64>, sym_name = "test_andi_tensor"}> ({
  ^bb0(%arg221: tensor<8x8xi64>, %arg222: tensor<8x8xi64>):
    %180 = "arith.andi"(%arg221, %arg222) : (tensor<8x8xi64>, tensor<8x8xi64>) -> tensor<8x8xi64>
    "func.return"(%180) : (tensor<8x8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xi64>, vector<8xi64>) -> vector<8xi64>, sym_name = "test_andi_vector"}> ({
  ^bb0(%arg219: vector<8xi64>, %arg220: vector<8xi64>):
    %179 = "arith.andi"(%arg219, %arg220) : (vector<8xi64>, vector<8xi64>) -> vector<8xi64>
    "func.return"(%179) : (vector<8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xi64>, vector<[8]xi64>) -> vector<[8]xi64>, sym_name = "test_andi_scalable_vector"}> ({
  ^bb0(%arg217: vector<[8]xi64>, %arg218: vector<[8]xi64>):
    %178 = "arith.andi"(%arg217, %arg218) : (vector<[8]xi64>, vector<[8]xi64>) -> vector<[8]xi64>
    "func.return"(%178) : (vector<[8]xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64, i64) -> i64, sym_name = "test_ori"}> ({
  ^bb0(%arg215: i64, %arg216: i64):
    %177 = "arith.ori"(%arg215, %arg216) : (i64, i64) -> i64
    "func.return"(%177) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xi64>, tensor<8x8xi64>) -> tensor<8x8xi64>, sym_name = "test_ori_tensor"}> ({
  ^bb0(%arg213: tensor<8x8xi64>, %arg214: tensor<8x8xi64>):
    %176 = "arith.ori"(%arg213, %arg214) : (tensor<8x8xi64>, tensor<8x8xi64>) -> tensor<8x8xi64>
    "func.return"(%176) : (tensor<8x8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xi64>, vector<8xi64>) -> vector<8xi64>, sym_name = "test_ori_vector"}> ({
  ^bb0(%arg211: vector<8xi64>, %arg212: vector<8xi64>):
    %175 = "arith.ori"(%arg211, %arg212) : (vector<8xi64>, vector<8xi64>) -> vector<8xi64>
    "func.return"(%175) : (vector<8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xi64>, vector<[8]xi64>) -> vector<[8]xi64>, sym_name = "test_ori_scalable_vector"}> ({
  ^bb0(%arg209: vector<[8]xi64>, %arg210: vector<[8]xi64>):
    %174 = "arith.ori"(%arg209, %arg210) : (vector<[8]xi64>, vector<[8]xi64>) -> vector<[8]xi64>
    "func.return"(%174) : (vector<[8]xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64, i64) -> i64, sym_name = "test_xori"}> ({
  ^bb0(%arg207: i64, %arg208: i64):
    %173 = "arith.xori"(%arg207, %arg208) : (i64, i64) -> i64
    "func.return"(%173) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xi64>, tensor<8x8xi64>) -> tensor<8x8xi64>, sym_name = "test_xori_tensor"}> ({
  ^bb0(%arg205: tensor<8x8xi64>, %arg206: tensor<8x8xi64>):
    %172 = "arith.xori"(%arg205, %arg206) : (tensor<8x8xi64>, tensor<8x8xi64>) -> tensor<8x8xi64>
    "func.return"(%172) : (tensor<8x8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xi64>, vector<8xi64>) -> vector<8xi64>, sym_name = "test_xori_vector"}> ({
  ^bb0(%arg203: vector<8xi64>, %arg204: vector<8xi64>):
    %171 = "arith.xori"(%arg203, %arg204) : (vector<8xi64>, vector<8xi64>) -> vector<8xi64>
    "func.return"(%171) : (vector<8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xi64>, vector<[8]xi64>) -> vector<[8]xi64>, sym_name = "test_xori_scalable_vector"}> ({
  ^bb0(%arg201: vector<[8]xi64>, %arg202: vector<[8]xi64>):
    %170 = "arith.xori"(%arg201, %arg202) : (vector<[8]xi64>, vector<[8]xi64>) -> vector<[8]xi64>
    "func.return"(%170) : (vector<[8]xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64, i64) -> i64, sym_name = "test_ceildivsi"}> ({
  ^bb0(%arg199: i64, %arg200: i64):
    %169 = "arith.ceildivsi"(%arg199, %arg200) : (i64, i64) -> i64
    "func.return"(%169) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xi64>, tensor<8x8xi64>) -> tensor<8x8xi64>, sym_name = "test_ceildivsi_tensor"}> ({
  ^bb0(%arg197: tensor<8x8xi64>, %arg198: tensor<8x8xi64>):
    %168 = "arith.ceildivsi"(%arg197, %arg198) : (tensor<8x8xi64>, tensor<8x8xi64>) -> tensor<8x8xi64>
    "func.return"(%168) : (tensor<8x8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xi64>, vector<8xi64>) -> vector<8xi64>, sym_name = "test_ceildivsi_vector"}> ({
  ^bb0(%arg195: vector<8xi64>, %arg196: vector<8xi64>):
    %167 = "arith.ceildivsi"(%arg195, %arg196) : (vector<8xi64>, vector<8xi64>) -> vector<8xi64>
    "func.return"(%167) : (vector<8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xi64>, vector<[8]xi64>) -> vector<[8]xi64>, sym_name = "test_ceildivsi_scalable_vector"}> ({
  ^bb0(%arg193: vector<[8]xi64>, %arg194: vector<[8]xi64>):
    %166 = "arith.ceildivsi"(%arg193, %arg194) : (vector<[8]xi64>, vector<[8]xi64>) -> vector<[8]xi64>
    "func.return"(%166) : (vector<[8]xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64, i64) -> i64, sym_name = "test_floordivsi"}> ({
  ^bb0(%arg191: i64, %arg192: i64):
    %165 = "arith.floordivsi"(%arg191, %arg192) : (i64, i64) -> i64
    "func.return"(%165) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xi64>, tensor<8x8xi64>) -> tensor<8x8xi64>, sym_name = "test_floordivsi_tensor"}> ({
  ^bb0(%arg189: tensor<8x8xi64>, %arg190: tensor<8x8xi64>):
    %164 = "arith.floordivsi"(%arg189, %arg190) : (tensor<8x8xi64>, tensor<8x8xi64>) -> tensor<8x8xi64>
    "func.return"(%164) : (tensor<8x8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xi64>, vector<8xi64>) -> vector<8xi64>, sym_name = "test_floordivsi_vector"}> ({
  ^bb0(%arg187: vector<8xi64>, %arg188: vector<8xi64>):
    %163 = "arith.floordivsi"(%arg187, %arg188) : (vector<8xi64>, vector<8xi64>) -> vector<8xi64>
    "func.return"(%163) : (vector<8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xi64>, vector<[8]xi64>) -> vector<[8]xi64>, sym_name = "test_floordivsi_scalable_vector"}> ({
  ^bb0(%arg185: vector<[8]xi64>, %arg186: vector<[8]xi64>):
    %162 = "arith.floordivsi"(%arg185, %arg186) : (vector<[8]xi64>, vector<[8]xi64>) -> vector<[8]xi64>
    "func.return"(%162) : (vector<[8]xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64, i64) -> i64, sym_name = "test_shli"}> ({
  ^bb0(%arg183: i64, %arg184: i64):
    %161 = "arith.shli"(%arg183, %arg184) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64
    "func.return"(%161) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xi64>, tensor<8x8xi64>) -> tensor<8x8xi64>, sym_name = "test_shli_tensor"}> ({
  ^bb0(%arg181: tensor<8x8xi64>, %arg182: tensor<8x8xi64>):
    %160 = "arith.shli"(%arg181, %arg182) <{overflowFlags = #arith.overflow<none>}> : (tensor<8x8xi64>, tensor<8x8xi64>) -> tensor<8x8xi64>
    "func.return"(%160) : (tensor<8x8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xi64>, vector<8xi64>) -> vector<8xi64>, sym_name = "test_shli_vector"}> ({
  ^bb0(%arg179: vector<8xi64>, %arg180: vector<8xi64>):
    %159 = "arith.shli"(%arg179, %arg180) <{overflowFlags = #arith.overflow<none>}> : (vector<8xi64>, vector<8xi64>) -> vector<8xi64>
    "func.return"(%159) : (vector<8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xi64>, vector<[8]xi64>) -> vector<[8]xi64>, sym_name = "test_shli_scalable_vector"}> ({
  ^bb0(%arg177: vector<[8]xi64>, %arg178: vector<[8]xi64>):
    %158 = "arith.shli"(%arg177, %arg178) <{overflowFlags = #arith.overflow<none>}> : (vector<[8]xi64>, vector<[8]xi64>) -> vector<[8]xi64>
    "func.return"(%158) : (vector<[8]xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64, i64) -> i64, sym_name = "test_shrui"}> ({
  ^bb0(%arg175: i64, %arg176: i64):
    %157 = "arith.shrui"(%arg175, %arg176) : (i64, i64) -> i64
    "func.return"(%157) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64, i64) -> i64, sym_name = "test_shrui_exact"}> ({
  ^bb0(%arg173: i64, %arg174: i64):
    %156 = "arith.shrui"(%arg173, %arg174) <{isExact}> : (i64, i64) -> i64
    "func.return"(%156) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xi64>, tensor<8x8xi64>) -> tensor<8x8xi64>, sym_name = "test_shrui_tensor"}> ({
  ^bb0(%arg171: tensor<8x8xi64>, %arg172: tensor<8x8xi64>):
    %155 = "arith.shrui"(%arg171, %arg172) : (tensor<8x8xi64>, tensor<8x8xi64>) -> tensor<8x8xi64>
    "func.return"(%155) : (tensor<8x8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xi64>, vector<8xi64>) -> vector<8xi64>, sym_name = "test_shrui_vector"}> ({
  ^bb0(%arg169: vector<8xi64>, %arg170: vector<8xi64>):
    %154 = "arith.shrui"(%arg169, %arg170) : (vector<8xi64>, vector<8xi64>) -> vector<8xi64>
    "func.return"(%154) : (vector<8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xi64>, vector<[8]xi64>) -> vector<[8]xi64>, sym_name = "test_shrui_scalable_vector"}> ({
  ^bb0(%arg167: vector<[8]xi64>, %arg168: vector<[8]xi64>):
    %153 = "arith.shrui"(%arg167, %arg168) : (vector<[8]xi64>, vector<[8]xi64>) -> vector<[8]xi64>
    "func.return"(%153) : (vector<[8]xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64, i64) -> i64, sym_name = "test_shrsi"}> ({
  ^bb0(%arg165: i64, %arg166: i64):
    %152 = "arith.shrsi"(%arg165, %arg166) : (i64, i64) -> i64
    "func.return"(%152) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64, i64) -> i64, sym_name = "test_shrsi_exact"}> ({
  ^bb0(%arg163: i64, %arg164: i64):
    %151 = "arith.shrsi"(%arg163, %arg164) <{isExact}> : (i64, i64) -> i64
    "func.return"(%151) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xi64>, tensor<8x8xi64>) -> tensor<8x8xi64>, sym_name = "test_shrsi_tensor"}> ({
  ^bb0(%arg161: tensor<8x8xi64>, %arg162: tensor<8x8xi64>):
    %150 = "arith.shrsi"(%arg161, %arg162) : (tensor<8x8xi64>, tensor<8x8xi64>) -> tensor<8x8xi64>
    "func.return"(%150) : (tensor<8x8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xi64>, vector<8xi64>) -> vector<8xi64>, sym_name = "test_shrsi_vector"}> ({
  ^bb0(%arg159: vector<8xi64>, %arg160: vector<8xi64>):
    %149 = "arith.shrsi"(%arg159, %arg160) : (vector<8xi64>, vector<8xi64>) -> vector<8xi64>
    "func.return"(%149) : (vector<8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xi64>, vector<[8]xi64>) -> vector<[8]xi64>, sym_name = "test_shrsi_scalable_vector"}> ({
  ^bb0(%arg157: vector<[8]xi64>, %arg158: vector<[8]xi64>):
    %148 = "arith.shrsi"(%arg157, %arg158) : (vector<[8]xi64>, vector<[8]xi64>) -> vector<[8]xi64>
    "func.return"(%148) : (vector<[8]xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f64) -> f64, sym_name = "test_negf"}> ({
  ^bb0(%arg156: f64):
    %147 = "arith.negf"(%arg156) <{fastmath = #arith.fastmath<none>}> : (f64) -> f64
    "func.return"(%147) : (f64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xf64>) -> tensor<8x8xf64>, sym_name = "test_negf_tensor"}> ({
  ^bb0(%arg155: tensor<8x8xf64>):
    %146 = "arith.negf"(%arg155) <{fastmath = #arith.fastmath<none>}> : (tensor<8x8xf64>) -> tensor<8x8xf64>
    "func.return"(%146) : (tensor<8x8xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xf64>) -> vector<8xf64>, sym_name = "test_negf_vector"}> ({
  ^bb0(%arg154: vector<8xf64>):
    %145 = "arith.negf"(%arg154) <{fastmath = #arith.fastmath<none>}> : (vector<8xf64>) -> vector<8xf64>
    "func.return"(%145) : (vector<8xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xf64>) -> vector<[8]xf64>, sym_name = "test_negf_scalable_vector"}> ({
  ^bb0(%arg153: vector<[8]xf64>):
    %144 = "arith.negf"(%arg153) <{fastmath = #arith.fastmath<none>}> : (vector<[8]xf64>) -> vector<[8]xf64>
    "func.return"(%144) : (vector<[8]xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f64, f64) -> f64, sym_name = "test_addf"}> ({
  ^bb0(%arg151: f64, %arg152: f64):
    %143 = "arith.addf"(%arg151, %arg152) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
    "func.return"(%143) : (f64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xf64>, tensor<8x8xf64>) -> tensor<8x8xf64>, sym_name = "test_addf_tensor"}> ({
  ^bb0(%arg149: tensor<8x8xf64>, %arg150: tensor<8x8xf64>):
    %142 = "arith.addf"(%arg149, %arg150) <{fastmath = #arith.fastmath<none>}> : (tensor<8x8xf64>, tensor<8x8xf64>) -> tensor<8x8xf64>
    "func.return"(%142) : (tensor<8x8xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xf64>, vector<8xf64>) -> vector<8xf64>, sym_name = "test_addf_vector"}> ({
  ^bb0(%arg147: vector<8xf64>, %arg148: vector<8xf64>):
    %141 = "arith.addf"(%arg147, %arg148) <{fastmath = #arith.fastmath<none>}> : (vector<8xf64>, vector<8xf64>) -> vector<8xf64>
    "func.return"(%141) : (vector<8xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xf64>, vector<[8]xf64>) -> vector<[8]xf64>, sym_name = "test_addf_scalable_vector"}> ({
  ^bb0(%arg145: vector<[8]xf64>, %arg146: vector<[8]xf64>):
    %140 = "arith.addf"(%arg145, %arg146) <{fastmath = #arith.fastmath<none>}> : (vector<[8]xf64>, vector<[8]xf64>) -> vector<[8]xf64>
    "func.return"(%140) : (vector<[8]xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f64, f64) -> f64, sym_name = "test_subf"}> ({
  ^bb0(%arg143: f64, %arg144: f64):
    %139 = "arith.subf"(%arg143, %arg144) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
    "func.return"(%139) : (f64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xf64>, tensor<8x8xf64>) -> tensor<8x8xf64>, sym_name = "test_subf_tensor"}> ({
  ^bb0(%arg141: tensor<8x8xf64>, %arg142: tensor<8x8xf64>):
    %138 = "arith.subf"(%arg141, %arg142) <{fastmath = #arith.fastmath<none>}> : (tensor<8x8xf64>, tensor<8x8xf64>) -> tensor<8x8xf64>
    "func.return"(%138) : (tensor<8x8xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xf64>, vector<8xf64>) -> vector<8xf64>, sym_name = "test_subf_vector"}> ({
  ^bb0(%arg139: vector<8xf64>, %arg140: vector<8xf64>):
    %137 = "arith.subf"(%arg139, %arg140) <{fastmath = #arith.fastmath<none>}> : (vector<8xf64>, vector<8xf64>) -> vector<8xf64>
    "func.return"(%137) : (vector<8xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xf64>, vector<[8]xf64>) -> vector<[8]xf64>, sym_name = "test_subf_scalable_vector"}> ({
  ^bb0(%arg137: vector<[8]xf64>, %arg138: vector<[8]xf64>):
    %136 = "arith.subf"(%arg137, %arg138) <{fastmath = #arith.fastmath<none>}> : (vector<[8]xf64>, vector<[8]xf64>) -> vector<[8]xf64>
    "func.return"(%136) : (vector<[8]xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f64, f64) -> f64, sym_name = "test_mulf"}> ({
  ^bb0(%arg135: f64, %arg136: f64):
    %135 = "arith.mulf"(%arg135, %arg136) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
    "func.return"(%135) : (f64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xf64>, tensor<8x8xf64>) -> tensor<8x8xf64>, sym_name = "test_mulf_tensor"}> ({
  ^bb0(%arg133: tensor<8x8xf64>, %arg134: tensor<8x8xf64>):
    %134 = "arith.mulf"(%arg133, %arg134) <{fastmath = #arith.fastmath<none>}> : (tensor<8x8xf64>, tensor<8x8xf64>) -> tensor<8x8xf64>
    "func.return"(%134) : (tensor<8x8xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xf64>, vector<8xf64>) -> vector<8xf64>, sym_name = "test_mulf_vector"}> ({
  ^bb0(%arg131: vector<8xf64>, %arg132: vector<8xf64>):
    %133 = "arith.mulf"(%arg131, %arg132) <{fastmath = #arith.fastmath<none>}> : (vector<8xf64>, vector<8xf64>) -> vector<8xf64>
    "func.return"(%133) : (vector<8xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xf64>, vector<[8]xf64>) -> vector<[8]xf64>, sym_name = "test_mulf_scalable_vector"}> ({
  ^bb0(%arg129: vector<[8]xf64>, %arg130: vector<[8]xf64>):
    %132 = "arith.mulf"(%arg129, %arg130) <{fastmath = #arith.fastmath<none>}> : (vector<[8]xf64>, vector<[8]xf64>) -> vector<[8]xf64>
    "func.return"(%132) : (vector<[8]xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f64, f64) -> f64, sym_name = "test_divf"}> ({
  ^bb0(%arg127: f64, %arg128: f64):
    %131 = "arith.divf"(%arg127, %arg128) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
    "func.return"(%131) : (f64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xf64>, tensor<8x8xf64>) -> tensor<8x8xf64>, sym_name = "test_divf_tensor"}> ({
  ^bb0(%arg125: tensor<8x8xf64>, %arg126: tensor<8x8xf64>):
    %130 = "arith.divf"(%arg125, %arg126) <{fastmath = #arith.fastmath<none>}> : (tensor<8x8xf64>, tensor<8x8xf64>) -> tensor<8x8xf64>
    "func.return"(%130) : (tensor<8x8xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xf64>, vector<8xf64>) -> vector<8xf64>, sym_name = "test_divf_vector"}> ({
  ^bb0(%arg123: vector<8xf64>, %arg124: vector<8xf64>):
    %129 = "arith.divf"(%arg123, %arg124) <{fastmath = #arith.fastmath<none>}> : (vector<8xf64>, vector<8xf64>) -> vector<8xf64>
    "func.return"(%129) : (vector<8xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xf64>, vector<[8]xf64>) -> vector<[8]xf64>, sym_name = "test_divf_scalable_vector"}> ({
  ^bb0(%arg121: vector<[8]xf64>, %arg122: vector<[8]xf64>):
    %128 = "arith.divf"(%arg121, %arg122) <{fastmath = #arith.fastmath<none>}> : (vector<[8]xf64>, vector<[8]xf64>) -> vector<[8]xf64>
    "func.return"(%128) : (vector<[8]xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f64, f64) -> f64, sym_name = "test_remf"}> ({
  ^bb0(%arg119: f64, %arg120: f64):
    %127 = "arith.remf"(%arg119, %arg120) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
    "func.return"(%127) : (f64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xf64>, tensor<8x8xf64>) -> tensor<8x8xf64>, sym_name = "test_remf_tensor"}> ({
  ^bb0(%arg117: tensor<8x8xf64>, %arg118: tensor<8x8xf64>):
    %126 = "arith.remf"(%arg117, %arg118) <{fastmath = #arith.fastmath<none>}> : (tensor<8x8xf64>, tensor<8x8xf64>) -> tensor<8x8xf64>
    "func.return"(%126) : (tensor<8x8xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xf64>, vector<8xf64>) -> vector<8xf64>, sym_name = "test_remf_vector"}> ({
  ^bb0(%arg115: vector<8xf64>, %arg116: vector<8xf64>):
    %125 = "arith.remf"(%arg115, %arg116) <{fastmath = #arith.fastmath<none>}> : (vector<8xf64>, vector<8xf64>) -> vector<8xf64>
    "func.return"(%125) : (vector<8xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xf64>, vector<[8]xf64>) -> vector<[8]xf64>, sym_name = "test_remf_scalable_vector"}> ({
  ^bb0(%arg113: vector<[8]xf64>, %arg114: vector<[8]xf64>):
    %124 = "arith.remf"(%arg113, %arg114) <{fastmath = #arith.fastmath<none>}> : (vector<[8]xf64>, vector<[8]xf64>) -> vector<[8]xf64>
    "func.return"(%124) : (vector<[8]xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> i64, sym_name = "test_extui"}> ({
  ^bb0(%arg112: i32):
    %123 = "arith.extui"(%arg112) : (i32) -> i64
    "func.return"(%123) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xi32>) -> tensor<8x8xi64>, sym_name = "test_extui_tensor"}> ({
  ^bb0(%arg111: tensor<8x8xi32>):
    %122 = "arith.extui"(%arg111) : (tensor<8x8xi32>) -> tensor<8x8xi64>
    "func.return"(%122) : (tensor<8x8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xi32>) -> vector<8xi64>, sym_name = "test_extui_vector"}> ({
  ^bb0(%arg110: vector<8xi32>):
    %121 = "arith.extui"(%arg110) : (vector<8xi32>) -> vector<8xi64>
    "func.return"(%121) : (vector<8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xi32>) -> vector<[8]xi64>, sym_name = "test_extui_scalable_vector"}> ({
  ^bb0(%arg109: vector<[8]xi32>):
    %120 = "arith.extui"(%arg109) : (vector<[8]xi32>) -> vector<[8]xi64>
    "func.return"(%120) : (vector<[8]xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> i64, sym_name = "test_extsi"}> ({
  ^bb0(%arg108: i32):
    %119 = "arith.extsi"(%arg108) : (i32) -> i64
    "func.return"(%119) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xi32>) -> tensor<8x8xi64>, sym_name = "test_extsi_tensor"}> ({
  ^bb0(%arg107: tensor<8x8xi32>):
    %118 = "arith.extsi"(%arg107) : (tensor<8x8xi32>) -> tensor<8x8xi64>
    "func.return"(%118) : (tensor<8x8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xi32>) -> vector<8xi64>, sym_name = "test_extsi_vector"}> ({
  ^bb0(%arg106: vector<8xi32>):
    %117 = "arith.extsi"(%arg106) : (vector<8xi32>) -> vector<8xi64>
    "func.return"(%117) : (vector<8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xi32>) -> vector<[8]xi64>, sym_name = "test_extsi_scalable_vector"}> ({
  ^bb0(%arg105: vector<[8]xi32>):
    %116 = "arith.extsi"(%arg105) : (vector<[8]xi32>) -> vector<[8]xi64>
    "func.return"(%116) : (vector<[8]xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32) -> f64, sym_name = "test_extf"}> ({
  ^bb0(%arg104: f32):
    %115 = "arith.extf"(%arg104) : (f32) -> f64
    "func.return"(%115) : (f64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xf32>) -> tensor<8x8xf64>, sym_name = "test_extf_tensor"}> ({
  ^bb0(%arg103: tensor<8x8xf32>):
    %114 = "arith.extf"(%arg103) : (tensor<8x8xf32>) -> tensor<8x8xf64>
    "func.return"(%114) : (tensor<8x8xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xf32, "foo">) -> tensor<8x8xf64, "foo">, sym_name = "test_extf_tensor_encoding"}> ({
  ^bb0(%arg102: tensor<8x8xf32, "foo">):
    %113 = "arith.extf"(%arg102) : (tensor<8x8xf32, "foo">) -> tensor<8x8xf64, "foo">
    "func.return"(%113) : (tensor<8x8xf64, "foo">) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xf32>) -> vector<8xf64>, sym_name = "test_extf_vector"}> ({
  ^bb0(%arg101: vector<8xf32>):
    %112 = "arith.extf"(%arg101) : (vector<8xf32>) -> vector<8xf64>
    "func.return"(%112) : (vector<8xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xf32>) -> vector<[8]xf64>, sym_name = "test_extf_scalable_vector"}> ({
  ^bb0(%arg100: vector<[8]xf32>):
    %111 = "arith.extf"(%arg100) : (vector<[8]xf32>) -> vector<[8]xf64>
    "func.return"(%111) : (vector<[8]xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> i16, sym_name = "test_trunci"}> ({
  ^bb0(%arg99: i32):
    %110 = "arith.trunci"(%arg99) <{overflowFlags = #arith.overflow<none>}> : (i32) -> i16
    "func.return"(%110) : (i16) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xi32>) -> tensor<8x8xi16>, sym_name = "test_trunci_tensor"}> ({
  ^bb0(%arg98: tensor<8x8xi32>):
    %109 = "arith.trunci"(%arg98) <{overflowFlags = #arith.overflow<none>}> : (tensor<8x8xi32>) -> tensor<8x8xi16>
    "func.return"(%109) : (tensor<8x8xi16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xi32>) -> vector<8xi16>, sym_name = "test_trunci_vector"}> ({
  ^bb0(%arg97: vector<8xi32>):
    %108 = "arith.trunci"(%arg97) <{overflowFlags = #arith.overflow<none>}> : (vector<8xi32>) -> vector<8xi16>
    "func.return"(%108) : (vector<8xi16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xi32>) -> vector<[8]xi16>, sym_name = "test_trunci_scalable_vector"}> ({
  ^bb0(%arg96: vector<[8]xi32>):
    %107 = "arith.trunci"(%arg96) <{overflowFlags = #arith.overflow<none>}> : (vector<[8]xi32>) -> vector<[8]xi16>
    "func.return"(%107) : (vector<[8]xi16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32) -> bf16, sym_name = "test_truncf"}> ({
  ^bb0(%arg95: f32):
    %106 = "arith.truncf"(%arg95) : (f32) -> bf16
    "func.return"(%106) : (bf16) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xf32>) -> tensor<8x8xbf16>, sym_name = "test_truncf_tensor"}> ({
  ^bb0(%arg94: tensor<8x8xf32>):
    %105 = "arith.truncf"(%arg94) : (tensor<8x8xf32>) -> tensor<8x8xbf16>
    "func.return"(%105) : (tensor<8x8xbf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xf32>) -> vector<8xbf16>, sym_name = "test_truncf_vector"}> ({
  ^bb0(%arg93: vector<8xf32>):
    %104 = "arith.truncf"(%arg93) : (vector<8xf32>) -> vector<8xbf16>
    "func.return"(%104) : (vector<8xbf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xf32>) -> vector<[8]xbf16>, sym_name = "test_truncf_scalable_vector"}> ({
  ^bb0(%arg92: vector<[8]xf32>):
    %103 = "arith.truncf"(%arg92) : (vector<[8]xf32>) -> vector<[8]xbf16>
    "func.return"(%103) : (vector<[8]xbf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f64) -> (f32, f32, f32, f32, f32), sym_name = "test_truncf_rounding_mode"}> ({
  ^bb0(%arg91: f64):
    %98 = "arith.truncf"(%arg91) <{roundingmode = 0 : i32}> : (f64) -> f32
    %99 = "arith.truncf"(%arg91) <{roundingmode = 1 : i32}> : (f64) -> f32
    %100 = "arith.truncf"(%arg91) <{roundingmode = 2 : i32}> : (f64) -> f32
    %101 = "arith.truncf"(%arg91) <{roundingmode = 3 : i32}> : (f64) -> f32
    %102 = "arith.truncf"(%arg91) <{roundingmode = 4 : i32}> : (f64) -> f32
    "func.return"(%98, %99, %100, %101, %102) : (f32, f32, f32, f32, f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> f32, sym_name = "test_uitofp"}> ({
  ^bb0(%arg90: i32):
    %97 = "arith.uitofp"(%arg90) : (i32) -> f32
    "func.return"(%97) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xi32>) -> tensor<8x8xf32>, sym_name = "test_uitofp_tensor"}> ({
  ^bb0(%arg89: tensor<8x8xi32>):
    %96 = "arith.uitofp"(%arg89) : (tensor<8x8xi32>) -> tensor<8x8xf32>
    "func.return"(%96) : (tensor<8x8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xi32>) -> vector<8xf32>, sym_name = "test_uitofp_vector"}> ({
  ^bb0(%arg88: vector<8xi32>):
    %95 = "arith.uitofp"(%arg88) : (vector<8xi32>) -> vector<8xf32>
    "func.return"(%95) : (vector<8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xi32>) -> vector<[8]xf32>, sym_name = "test_uitofp_scalable_vector"}> ({
  ^bb0(%arg87: vector<[8]xi32>):
    %94 = "arith.uitofp"(%arg87) : (vector<[8]xi32>) -> vector<[8]xf32>
    "func.return"(%94) : (vector<[8]xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i16) -> f64, sym_name = "test_sitofp"}> ({
  ^bb0(%arg86: i16):
    %93 = "arith.sitofp"(%arg86) : (i16) -> f64
    "func.return"(%93) : (f64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xi16>) -> tensor<8x8xf64>, sym_name = "test_sitofp_tensor"}> ({
  ^bb0(%arg85: tensor<8x8xi16>):
    %92 = "arith.sitofp"(%arg85) : (tensor<8x8xi16>) -> tensor<8x8xf64>
    "func.return"(%92) : (tensor<8x8xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xi16>) -> vector<8xf64>, sym_name = "test_sitofp_vector"}> ({
  ^bb0(%arg84: vector<8xi16>):
    %91 = "arith.sitofp"(%arg84) : (vector<8xi16>) -> vector<8xf64>
    "func.return"(%91) : (vector<8xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xi16>) -> vector<[8]xf64>, sym_name = "test_sitofp_scalable_vector"}> ({
  ^bb0(%arg83: vector<[8]xi16>):
    %90 = "arith.sitofp"(%arg83) : (vector<[8]xi16>) -> vector<[8]xf64>
    "func.return"(%90) : (vector<[8]xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (bf16) -> i8, sym_name = "test_fptoui"}> ({
  ^bb0(%arg82: bf16):
    %89 = "arith.fptoui"(%arg82) : (bf16) -> i8
    "func.return"(%89) : (i8) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xbf16>) -> tensor<8x8xi8>, sym_name = "test_fptoui_tensor"}> ({
  ^bb0(%arg81: tensor<8x8xbf16>):
    %88 = "arith.fptoui"(%arg81) : (tensor<8x8xbf16>) -> tensor<8x8xi8>
    "func.return"(%88) : (tensor<8x8xi8>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xbf16>) -> vector<8xi8>, sym_name = "test_fptoui_vector"}> ({
  ^bb0(%arg80: vector<8xbf16>):
    %87 = "arith.fptoui"(%arg80) : (vector<8xbf16>) -> vector<8xi8>
    "func.return"(%87) : (vector<8xi8>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xbf16>) -> vector<[8]xi8>, sym_name = "test_fptoui_scalable_vector"}> ({
  ^bb0(%arg79: vector<[8]xbf16>):
    %86 = "arith.fptoui"(%arg79) : (vector<[8]xbf16>) -> vector<[8]xi8>
    "func.return"(%86) : (vector<[8]xi8>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f64) -> i64, sym_name = "test_fptosi"}> ({
  ^bb0(%arg78: f64):
    %85 = "arith.fptosi"(%arg78) : (f64) -> i64
    "func.return"(%85) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xf64>) -> tensor<8x8xi64>, sym_name = "test_fptosi_tensor"}> ({
  ^bb0(%arg77: tensor<8x8xf64>):
    %84 = "arith.fptosi"(%arg77) : (tensor<8x8xf64>) -> tensor<8x8xi64>
    "func.return"(%84) : (tensor<8x8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xf64>) -> vector<8xi64>, sym_name = "test_fptosi_vector"}> ({
  ^bb0(%arg76: vector<8xf64>):
    %83 = "arith.fptosi"(%arg76) : (vector<8xf64>) -> vector<8xi64>
    "func.return"(%83) : (vector<8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xf64>) -> vector<[8]xi64>, sym_name = "test_fptosi_scalable_vector"}> ({
  ^bb0(%arg75: vector<[8]xf64>):
    %82 = "arith.fptosi"(%arg75) : (vector<[8]xf64>) -> vector<[8]xi64>
    "func.return"(%82) : (vector<[8]xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> index, sym_name = "test_index_cast0"}> ({
  ^bb0(%arg74: i32):
    %81 = "arith.index_cast"(%arg74) : (i32) -> index
    "func.return"(%81) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xi32>) -> tensor<8x8xindex>, sym_name = "test_index_cast_tensor0"}> ({
  ^bb0(%arg73: tensor<8x8xi32>):
    %80 = "arith.index_cast"(%arg73) : (tensor<8x8xi32>) -> tensor<8x8xindex>
    "func.return"(%80) : (tensor<8x8xindex>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xi32>) -> vector<8xindex>, sym_name = "test_index_cast_vector0"}> ({
  ^bb0(%arg72: vector<8xi32>):
    %79 = "arith.index_cast"(%arg72) : (vector<8xi32>) -> vector<8xindex>
    "func.return"(%79) : (vector<8xindex>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xi32>) -> vector<[8]xindex>, sym_name = "test_index_cast_scalable_vector0"}> ({
  ^bb0(%arg71: vector<[8]xi32>):
    %78 = "arith.index_cast"(%arg71) : (vector<[8]xi32>) -> vector<[8]xindex>
    "func.return"(%78) : (vector<[8]xindex>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> i64, sym_name = "test_index_cast1"}> ({
  ^bb0(%arg70: index):
    %77 = "arith.index_cast"(%arg70) : (index) -> i64
    "func.return"(%77) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xindex>) -> tensor<8x8xi64>, sym_name = "test_index_cast_tensor1"}> ({
  ^bb0(%arg69: tensor<8x8xindex>):
    %76 = "arith.index_cast"(%arg69) : (tensor<8x8xindex>) -> tensor<8x8xi64>
    "func.return"(%76) : (tensor<8x8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xindex>) -> vector<8xi64>, sym_name = "test_index_cast_vector1"}> ({
  ^bb0(%arg68: vector<8xindex>):
    %75 = "arith.index_cast"(%arg68) : (vector<8xindex>) -> vector<8xi64>
    "func.return"(%75) : (vector<8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xindex>) -> vector<[8]xi64>, sym_name = "test_index_cast_scalable_vector1"}> ({
  ^bb0(%arg67: vector<[8]xindex>):
    %74 = "arith.index_cast"(%arg67) : (vector<[8]xindex>) -> vector<[8]xi64>
    "func.return"(%74) : (vector<[8]xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> index, sym_name = "test_index_castui0"}> ({
  ^bb0(%arg66: i32):
    %73 = "arith.index_castui"(%arg66) : (i32) -> index
    "func.return"(%73) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xi32>) -> tensor<8x8xindex>, sym_name = "test_index_castui_tensor0"}> ({
  ^bb0(%arg65: tensor<8x8xi32>):
    %72 = "arith.index_castui"(%arg65) : (tensor<8x8xi32>) -> tensor<8x8xindex>
    "func.return"(%72) : (tensor<8x8xindex>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xi32>) -> vector<8xindex>, sym_name = "test_index_castui_vector0"}> ({
  ^bb0(%arg64: vector<8xi32>):
    %71 = "arith.index_castui"(%arg64) : (vector<8xi32>) -> vector<8xindex>
    "func.return"(%71) : (vector<8xindex>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xi32>) -> vector<[8]xindex>, sym_name = "test_index_castui_scalable_vector0"}> ({
  ^bb0(%arg63: vector<[8]xi32>):
    %70 = "arith.index_castui"(%arg63) : (vector<[8]xi32>) -> vector<[8]xindex>
    "func.return"(%70) : (vector<[8]xindex>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> i64, sym_name = "test_indexui_cast1"}> ({
  ^bb0(%arg62: index):
    %69 = "arith.index_castui"(%arg62) : (index) -> i64
    "func.return"(%69) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xindex>) -> tensor<8x8xi64>, sym_name = "test_index_castui_tensor1"}> ({
  ^bb0(%arg61: tensor<8x8xindex>):
    %68 = "arith.index_castui"(%arg61) : (tensor<8x8xindex>) -> tensor<8x8xi64>
    "func.return"(%68) : (tensor<8x8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xindex>) -> vector<8xi64>, sym_name = "test_index_castui_vector1"}> ({
  ^bb0(%arg60: vector<8xindex>):
    %67 = "arith.index_castui"(%arg60) : (vector<8xindex>) -> vector<8xi64>
    "func.return"(%67) : (vector<8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xindex>) -> vector<[8]xi64>, sym_name = "test_index_castui_scalable_vector1"}> ({
  ^bb0(%arg59: vector<[8]xindex>):
    %66 = "arith.index_castui"(%arg59) : (vector<[8]xindex>) -> vector<[8]xi64>
    "func.return"(%66) : (vector<[8]xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64) -> f64, sym_name = "test_bitcast0"}> ({
  ^bb0(%arg58: i64):
    %65 = "arith.bitcast"(%arg58) : (i64) -> f64
    "func.return"(%65) : (f64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xi64>) -> tensor<8x8xf64>, sym_name = "test_bitcast_tensor0"}> ({
  ^bb0(%arg57: tensor<8x8xi64>):
    %64 = "arith.bitcast"(%arg57) : (tensor<8x8xi64>) -> tensor<8x8xf64>
    "func.return"(%64) : (tensor<8x8xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xi64>) -> vector<8xf64>, sym_name = "test_bitcast_vector0"}> ({
  ^bb0(%arg56: vector<8xi64>):
    %63 = "arith.bitcast"(%arg56) : (vector<8xi64>) -> vector<8xf64>
    "func.return"(%63) : (vector<8xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xi64>) -> vector<[8]xf64>, sym_name = "test_bitcast_scalable_vector0"}> ({
  ^bb0(%arg55: vector<[8]xi64>):
    %62 = "arith.bitcast"(%arg55) : (vector<[8]xi64>) -> vector<[8]xf64>
    "func.return"(%62) : (vector<[8]xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32) -> i32, sym_name = "test_bitcast1"}> ({
  ^bb0(%arg54: f32):
    %61 = "arith.bitcast"(%arg54) : (f32) -> i32
    "func.return"(%61) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xf32>) -> tensor<8x8xi32>, sym_name = "test_bitcast_tensor1"}> ({
  ^bb0(%arg53: tensor<8x8xf32>):
    %60 = "arith.bitcast"(%arg53) : (tensor<8x8xf32>) -> tensor<8x8xi32>
    "func.return"(%60) : (tensor<8x8xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xf32>) -> vector<8xi32>, sym_name = "test_bitcast_vector1"}> ({
  ^bb0(%arg52: vector<8xf32>):
    %59 = "arith.bitcast"(%arg52) : (vector<8xf32>) -> vector<8xi32>
    "func.return"(%59) : (vector<8xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xf32>) -> vector<[8]xi32>, sym_name = "test_bitcast_scalable_vector1"}> ({
  ^bb0(%arg51: vector<[8]xf32>):
    %58 = "arith.bitcast"(%arg51) : (vector<[8]xf32>) -> vector<[8]xi32>
    "func.return"(%58) : (vector<[8]xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64, i64) -> i1, sym_name = "test_cmpi"}> ({
  ^bb0(%arg49: i64, %arg50: i64):
    %57 = "arith.cmpi"(%arg49, %arg50) <{predicate = 1 : i64}> : (i64, i64) -> i1
    "func.return"(%57) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xi64>, tensor<8x8xi64>) -> tensor<8x8xi1>, sym_name = "test_cmpi_tensor"}> ({
  ^bb0(%arg47: tensor<8x8xi64>, %arg48: tensor<8x8xi64>):
    %56 = "arith.cmpi"(%arg47, %arg48) <{predicate = 2 : i64}> : (tensor<8x8xi64>, tensor<8x8xi64>) -> tensor<8x8xi1>
    "func.return"(%56) : (tensor<8x8xi1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xi64, "foo">, tensor<8x8xi64, "foo">) -> tensor<8x8xi1, "foo">, sym_name = "test_cmpi_tensor_encoding"}> ({
  ^bb0(%arg45: tensor<8x8xi64, "foo">, %arg46: tensor<8x8xi64, "foo">):
    %55 = "arith.cmpi"(%arg45, %arg46) <{predicate = 2 : i64}> : (tensor<8x8xi64, "foo">, tensor<8x8xi64, "foo">) -> tensor<8x8xi1, "foo">
    "func.return"(%55) : (tensor<8x8xi1, "foo">) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xi64>, vector<8xi64>) -> vector<8xi1>, sym_name = "test_cmpi_vector"}> ({
  ^bb0(%arg43: vector<8xi64>, %arg44: vector<8xi64>):
    %54 = "arith.cmpi"(%arg43, %arg44) <{predicate = 6 : i64}> : (vector<8xi64>, vector<8xi64>) -> vector<8xi1>
    "func.return"(%54) : (vector<8xi1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xi64>, vector<[8]xi64>) -> vector<[8]xi1>, sym_name = "test_cmpi_scalable_vector"}> ({
  ^bb0(%arg41: vector<[8]xi64>, %arg42: vector<[8]xi64>):
    %53 = "arith.cmpi"(%arg41, %arg42) <{predicate = 6 : i64}> : (vector<[8]xi64>, vector<[8]xi64>) -> vector<[8]xi1>
    "func.return"(%53) : (vector<[8]xi1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<i64>, vector<i64>) -> vector<i1>, sym_name = "test_cmpi_vector_0d"}> ({
  ^bb0(%arg39: vector<i64>, %arg40: vector<i64>):
    %52 = "arith.cmpi"(%arg39, %arg40) <{predicate = 6 : i64}> : (vector<i64>, vector<i64>) -> vector<i1>
    "func.return"(%52) : (vector<i1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f64, f64) -> i1, sym_name = "test_cmpf"}> ({
  ^bb0(%arg37: f64, %arg38: f64):
    %51 = "arith.cmpf"(%arg37, %arg38) <{fastmath = #arith.fastmath<none>, predicate = 1 : i64}> : (f64, f64) -> i1
    "func.return"(%51) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xf64>, tensor<8x8xf64>) -> tensor<8x8xi1>, sym_name = "test_cmpf_tensor"}> ({
  ^bb0(%arg35: tensor<8x8xf64>, %arg36: tensor<8x8xf64>):
    %50 = "arith.cmpf"(%arg35, %arg36) <{fastmath = #arith.fastmath<none>, predicate = 4 : i64}> : (tensor<8x8xf64>, tensor<8x8xf64>) -> tensor<8x8xi1>
    "func.return"(%50) : (tensor<8x8xi1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xf64>, vector<8xf64>) -> vector<8xi1>, sym_name = "test_cmpf_vector"}> ({
  ^bb0(%arg33: vector<8xf64>, %arg34: vector<8xf64>):
    %49 = "arith.cmpf"(%arg33, %arg34) <{fastmath = #arith.fastmath<none>, predicate = 11 : i64}> : (vector<8xf64>, vector<8xf64>) -> vector<8xi1>
    "func.return"(%49) : (vector<8xi1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xf64>, vector<[8]xf64>) -> vector<[8]xi1>, sym_name = "test_cmpf_scalable_vector"}> ({
  ^bb0(%arg31: vector<[8]xf64>, %arg32: vector<[8]xf64>):
    %48 = "arith.cmpf"(%arg31, %arg32) <{fastmath = #arith.fastmath<none>, predicate = 11 : i64}> : (vector<[8]xf64>, vector<[8]xf64>) -> vector<[8]xi1>
    "func.return"(%48) : (vector<[8]xi1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> i64, sym_name = "test_index_cast"}> ({
  ^bb0(%arg30: index):
    %47 = "arith.index_cast"(%arg30) : (index) -> i64
    "func.return"(%47) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<index>) -> tensor<i64>, sym_name = "test_index_cast_tensor"}> ({
  ^bb0(%arg29: tensor<index>):
    %46 = "arith.index_cast"(%arg29) : (tensor<index>) -> tensor<i64>
    "func.return"(%46) : (tensor<i64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<i64>) -> tensor<index>, sym_name = "test_index_cast_tensor_reverse"}> ({
  ^bb0(%arg28: tensor<i64>):
    %45 = "arith.index_cast"(%arg28) : (tensor<i64>) -> tensor<index>
    "func.return"(%45) : (tensor<index>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32) -> i32, sym_name = "bitcast"}> ({
  ^bb0(%arg27: f32):
    %44 = "arith.bitcast"(%arg27) : (f32) -> i32
    "func.return"(%44) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_constant"}> ({
    %33 = "arith.constant"() <{value = 42 : i32}> : () -> i32
    %34 = "arith.constant"() <{value = 42 : i32}> : () -> i32
    %35 = "arith.constant"() <{value = 43 : index}> {crazy = "func.foo"} : () -> index
    %36 = "arith.constant"() <{value = 4.300000e+01 : bf16}> : () -> bf16
    %37 = "arith.constant"() <{value = dense<0> : vector<4xi32>}> : () -> vector<4xi32>
    %38 = "arith.constant"() <{value = dense<0> : tensor<42xi32>}> : () -> tensor<42xi32>
    %39 = "arith.constant"() <{value = dense<0> : vector<42xi32>}> : () -> vector<42xi32>
    %40 = "arith.constant"() <{value = true}> : () -> i1
    %41 = "arith.constant"() <{value = false}> : () -> i1
    %42 = "arith.constant"() <{value = -1 : i128}> : () -> i128
    %43 = "arith.constant"() <{value = 85070591730234615865843651857942052864 : i128}> : () -> i128
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xf32>, vector<4xf32>, vector<[4]xf32>, vector<[4]xf32>, f32, f32, i32, i32) -> (), sym_name = "maximum"}> ({
  ^bb0(%arg19: vector<4xf32>, %arg20: vector<4xf32>, %arg21: vector<[4]xf32>, %arg22: vector<[4]xf32>, %arg23: f32, %arg24: f32, %arg25: i32, %arg26: i32):
    %25 = "arith.maximumf"(%arg19, %arg20) <{fastmath = #arith.fastmath<none>}> : (vector<4xf32>, vector<4xf32>) -> vector<4xf32>
    %26 = "arith.maximumf"(%arg21, %arg22) <{fastmath = #arith.fastmath<none>}> : (vector<[4]xf32>, vector<[4]xf32>) -> vector<[4]xf32>
    %27 = "arith.maximumf"(%arg23, %arg24) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    %28 = "arith.maxnumf"(%arg19, %arg20) <{fastmath = #arith.fastmath<none>}> : (vector<4xf32>, vector<4xf32>) -> vector<4xf32>
    %29 = "arith.maxnumf"(%arg21, %arg22) <{fastmath = #arith.fastmath<none>}> : (vector<[4]xf32>, vector<[4]xf32>) -> vector<[4]xf32>
    %30 = "arith.maxnumf"(%arg23, %arg24) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    %31 = "arith.maxsi"(%arg25, %arg26) : (i32, i32) -> i32
    %32 = "arith.maxui"(%arg25, %arg26) : (i32, i32) -> i32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xf32>, vector<4xf32>, vector<[4]xf32>, vector<[4]xf32>, f32, f32, i32, i32) -> (), sym_name = "minimum"}> ({
  ^bb0(%arg11: vector<4xf32>, %arg12: vector<4xf32>, %arg13: vector<[4]xf32>, %arg14: vector<[4]xf32>, %arg15: f32, %arg16: f32, %arg17: i32, %arg18: i32):
    %17 = "arith.minimumf"(%arg11, %arg12) <{fastmath = #arith.fastmath<none>}> : (vector<4xf32>, vector<4xf32>) -> vector<4xf32>
    %18 = "arith.minimumf"(%arg13, %arg14) <{fastmath = #arith.fastmath<none>}> : (vector<[4]xf32>, vector<[4]xf32>) -> vector<[4]xf32>
    %19 = "arith.minimumf"(%arg15, %arg16) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    %20 = "arith.minnumf"(%arg11, %arg12) <{fastmath = #arith.fastmath<none>}> : (vector<4xf32>, vector<4xf32>) -> vector<4xf32>
    %21 = "arith.minnumf"(%arg13, %arg14) <{fastmath = #arith.fastmath<none>}> : (vector<[4]xf32>, vector<[4]xf32>) -> vector<[4]xf32>
    %22 = "arith.minnumf"(%arg15, %arg16) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    %23 = "arith.minsi"(%arg17, %arg18) : (i32, i32) -> i32
    %24 = "arith.minui"(%arg17, %arg18) : (i32, i32) -> i32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, f32, i32) -> (), sym_name = "fastmath"}> ({
  ^bb0(%arg8: f32, %arg9: f32, %arg10: i32):
    %7 = "arith.addf"(%arg8, %arg9) <{fastmath = #arith.fastmath<fast>}> : (f32, f32) -> f32
    %8 = "arith.subf"(%arg8, %arg9) <{fastmath = #arith.fastmath<fast>}> : (f32, f32) -> f32
    %9 = "arith.mulf"(%arg8, %arg9) <{fastmath = #arith.fastmath<fast>}> : (f32, f32) -> f32
    %10 = "arith.divf"(%arg8, %arg9) <{fastmath = #arith.fastmath<fast>}> : (f32, f32) -> f32
    %11 = "arith.remf"(%arg8, %arg9) <{fastmath = #arith.fastmath<fast>}> : (f32, f32) -> f32
    %12 = "arith.negf"(%arg8) <{fastmath = #arith.fastmath<fast>}> : (f32) -> f32
    %13 = "arith.addf"(%arg8, %arg9) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    %14 = "arith.addf"(%arg8, %arg9) <{fastmath = #arith.fastmath<nnan,ninf>}> : (f32, f32) -> f32
    %15 = "arith.mulf"(%arg8, %arg9) <{fastmath = #arith.fastmath<fast>}> : (f32, f32) -> f32
    %16 = "arith.cmpf"(%arg8, %arg9) <{fastmath = #arith.fastmath<fast>, predicate = 1 : i64}> : (f32, f32) -> i1
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

