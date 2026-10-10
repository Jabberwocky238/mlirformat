"builtin.module"() ({
  "func.func"() <{function_type = () -> (index, index), sym_name = "add"}> ({
    %220 = "index.constant"() <{value = 1 : index}> : () -> index
    %221 = "index.constant"() <{value = 2100 : index}> : () -> index
    %222 = "index.constant"() <{value = 3000000001 : index}> : () -> index
    %223 = "index.constant"() <{value = 4000002100 : index}> : () -> index
    %224 = "index.add"(%220, %221) : (index, index) -> index
    %225 = "index.add"(%222, %223) : (index, index) -> index
    "func.return"(%224, %225) : (index, index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (index, index), sym_name = "add_overflow"}> ({
    %216 = "index.constant"() <{value = 2000000000 : index}> : () -> index
    %217 = "index.constant"() <{value = 8000000000000000000 : index}> : () -> index
    %218 = "index.add"(%216, %216) : (index, index) -> index
    %219 = "index.add"(%217, %217) : (index, index) -> index
    "func.return"(%218, %219) : (index, index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> index, sym_name = "add_fold_constants"}> ({
  ^bb0(%arg14: index):
    %212 = "index.constant"() <{value = 1 : index}> : () -> index
    %213 = "index.constant"() <{value = 2 : index}> : () -> index
    %214 = "index.add"(%arg14, %212) : (index, index) -> index
    %215 = "index.add"(%214, %213) : (index, index) -> index
    "func.return"(%215) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> index, sym_name = "sub"}> ({
    %209 = "index.constant"() <{value = -2000000000 : index}> : () -> index
    %210 = "index.constant"() <{value = 3000000000 : index}> : () -> index
    %211 = "index.sub"(%209, %210) : (index, index) -> index
    "func.return"(%211) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> index, sym_name = "mul"}> ({
    %206 = "index.constant"() <{value = 8000000002000000000 : index}> : () -> index
    %207 = "index.constant"() <{value = 2 : index}> : () -> index
    %208 = "index.mul"(%206, %207) : (index, index) -> index
    "func.return"(%208) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> index, sym_name = "mul_fold_constants"}> ({
  ^bb0(%arg13: index):
    %202 = "index.constant"() <{value = 2 : index}> : () -> index
    %203 = "index.constant"() <{value = 3 : index}> : () -> index
    %204 = "index.mul"(%arg13, %202) : (index, index) -> index
    %205 = "index.mul"(%204, %203) : (index, index) -> index
    "func.return"(%205) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> index, sym_name = "divs"}> ({
    %199 = "index.constant"() <{value = -2 : index}> : () -> index
    %200 = "index.constant"() <{value = 8589934592 : index}> : () -> index
    %201 = "index.divs"(%200, %199) : (index, index) -> index
    "func.return"(%201) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (index, index), sym_name = "divs_nofold"}> ({
    %194 = "index.constant"() <{value = 0 : index}> : () -> index
    %195 = "index.constant"() <{value = 4294967296 : index}> : () -> index
    %196 = "index.constant"() <{value = 2 : index}> : () -> index
    %197 = "index.divs"(%196, %194) : (index, index) -> index
    %198 = "index.divs"(%195, %196) : (index, index) -> index
    "func.return"(%197, %198) : (index, index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> index, sym_name = "divu"}> ({
    %191 = "index.constant"() <{value = -2 : index}> : () -> index
    %192 = "index.constant"() <{value = 8589934592 : index}> : () -> index
    %193 = "index.divu"(%192, %191) : (index, index) -> index
    "func.return"(%193) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (index, index), sym_name = "divu_nofold"}> ({
    %186 = "index.constant"() <{value = 0 : index}> : () -> index
    %187 = "index.constant"() <{value = 4294967296 : index}> : () -> index
    %188 = "index.constant"() <{value = 2 : index}> : () -> index
    %189 = "index.divu"(%188, %186) : (index, index) -> index
    %190 = "index.divu"(%187, %188) : (index, index) -> index
    "func.return"(%189, %190) : (index, index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (index, index, index), sym_name = "ceildivs"}> ({
    %180 = "index.constant"() <{value = 0 : index}> : () -> index
    %181 = "index.constant"() <{value = 2 : index}> : () -> index
    %182 = "index.constant"() <{value = 5 : index}> : () -> index
    %183 = "index.ceildivs"(%180, %182) : (index, index) -> index
    %184 = "index.ceildivs"(%181, %182) : (index, index) -> index
    %185 = "index.ceildivs"(%182, %181) : (index, index) -> index
    "func.return"(%183, %184, %185) : (index, index, index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> index, sym_name = "ceildivs_neg"}> ({
    %177 = "index.constant"() <{value = -5 : index}> : () -> index
    %178 = "index.constant"() <{value = 2 : index}> : () -> index
    %179 = "index.ceildivs"(%177, %178) : (index, index) -> index
    "func.return"(%179) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (index, index), sym_name = "ceildivs_edge"}> ({
    %172 = "index.constant"() <{value = -1 : index}> : () -> index
    %173 = "index.constant"() <{value = -2147483648 : index}> : () -> index
    %174 = "index.constant"() <{value = 2147483647 : index}> : () -> index
    %175 = "index.ceildivs"(%173, %172) : (index, index) -> index
    %176 = "index.ceildivs"(%174, %172) : (index, index) -> index
    "func.return"(%175, %176) : (index, index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> index, sym_name = "ceildivu"}> ({
    %169 = "index.constant"() <{value = 8589934593 : index}> : () -> index
    %170 = "index.constant"() <{value = 2 : index}> : () -> index
    %171 = "index.ceildivu"(%169, %170) : (index, index) -> index
    "func.return"(%171) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> index, sym_name = "floordivs"}> ({
    %166 = "index.constant"() <{value = -5 : index}> : () -> index
    %167 = "index.constant"() <{value = 2 : index}> : () -> index
    %168 = "index.floordivs"(%166, %167) : (index, index) -> index
    "func.return"(%168) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (index, index), sym_name = "floordivs_edge"}> ({
    %160 = "index.constant"() <{value = -2147483648 : index}> : () -> index
    %161 = "index.constant"() <{value = 2147483647 : index}> : () -> index
    %162 = "index.constant"() <{value = -1 : index}> : () -> index
    %163 = "index.constant"() <{value = 1 : index}> : () -> index
    %164 = "index.floordivs"(%160, %163) : (index, index) -> index
    %165 = "index.floordivs"(%161, %162) : (index, index) -> index
    "func.return"(%164, %165) : (index, index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> index, sym_name = "floordivs_nofold"}> ({
    %157 = "index.constant"() <{value = 4294967296 : index}> : () -> index
    %158 = "index.constant"() <{value = 2 : index}> : () -> index
    %159 = "index.floordivs"(%157, %158) : (index, index) -> index
    "func.return"(%159) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> index, sym_name = "rems_zerodiv_nofold"}> ({
    %154 = "index.constant"() <{value = 2 : index}> : () -> index
    %155 = "index.constant"() <{value = 0 : index}> : () -> index
    %156 = "index.rems"(%154, %155) : (index, index) -> index
    "func.return"(%156) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> index, sym_name = "remu_zerodiv_nofold"}> ({
    %151 = "index.constant"() <{value = 2 : index}> : () -> index
    %152 = "index.constant"() <{value = 0 : index}> : () -> index
    %153 = "index.remu"(%151, %152) : (index, index) -> index
    "func.return"(%153) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> index, sym_name = "rems"}> ({
    %148 = "index.constant"() <{value = -5 : index}> : () -> index
    %149 = "index.constant"() <{value = 2 : index}> : () -> index
    %150 = "index.rems"(%148, %149) : (index, index) -> index
    "func.return"(%150) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> index, sym_name = "rems_nofold"}> ({
    %145 = "index.constant"() <{value = 2 : index}> : () -> index
    %146 = "index.constant"() <{value = 4294967297 : index}> : () -> index
    %147 = "index.rems"(%145, %146) : (index, index) -> index
    "func.return"(%147) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> index, sym_name = "remu"}> ({
    %142 = "index.constant"() <{value = 2 : index}> : () -> index
    %143 = "index.constant"() <{value = -1 : index}> : () -> index
    %144 = "index.remu"(%142, %143) : (index, index) -> index
    "func.return"(%144) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> index, sym_name = "remu_nofold"}> ({
    %139 = "index.constant"() <{value = 2 : index}> : () -> index
    %140 = "index.constant"() <{value = 4294967297 : index}> : () -> index
    %141 = "index.remu"(%139, %140) : (index, index) -> index
    "func.return"(%141) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> index, sym_name = "maxs"}> ({
    %136 = "index.constant"() <{value = -4 : index}> : () -> index
    %137 = "index.constant"() <{value = 2 : index}> : () -> index
    %138 = "index.maxs"(%136, %137) : (index, index) -> index
    "func.return"(%138) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> index, sym_name = "maxs_nofold"}> ({
    %133 = "index.constant"() <{value = 1 : index}> : () -> index
    %134 = "index.constant"() <{value = 4294967296 : index}> : () -> index
    %135 = "index.maxs"(%133, %134) : (index, index) -> index
    "func.return"(%135) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> index, sym_name = "maxs_edge"}> ({
    %130 = "index.constant"() <{value = 1 : index}> : () -> index
    %131 = "index.constant"() <{value = 4294967297 : index}> : () -> index
    %132 = "index.maxs"(%130, %131) : (index, index) -> index
    "func.return"(%132) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> index, sym_name = "maxs_fold_constants"}> ({
  ^bb0(%arg12: index):
    %126 = "index.constant"() <{value = -2 : index}> : () -> index
    %127 = "index.constant"() <{value = 3 : index}> : () -> index
    %128 = "index.maxs"(%arg12, %126) : (index, index) -> index
    %129 = "index.maxs"(%128, %127) : (index, index) -> index
    "func.return"(%129) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> index, sym_name = "maxu"}> ({
    %123 = "index.constant"() <{value = -1 : index}> : () -> index
    %124 = "index.constant"() <{value = 1 : index}> : () -> index
    %125 = "index.maxu"(%123, %124) : (index, index) -> index
    "func.return"(%125) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> index, sym_name = "maxu_fold_constants"}> ({
  ^bb0(%arg11: index):
    %119 = "index.constant"() <{value = 2 : index}> : () -> index
    %120 = "index.constant"() <{value = 3 : index}> : () -> index
    %121 = "index.maxu"(%arg11, %119) : (index, index) -> index
    %122 = "index.maxu"(%121, %120) : (index, index) -> index
    "func.return"(%122) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> index, sym_name = "mins"}> ({
    %116 = "index.constant"() <{value = -4 : index}> : () -> index
    %117 = "index.constant"() <{value = 2 : index}> : () -> index
    %118 = "index.mins"(%116, %117) : (index, index) -> index
    "func.return"(%118) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> index, sym_name = "mins_nofold"}> ({
    %113 = "index.constant"() <{value = 1 : index}> : () -> index
    %114 = "index.constant"() <{value = 4294967296 : index}> : () -> index
    %115 = "index.mins"(%113, %114) : (index, index) -> index
    "func.return"(%115) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> index, sym_name = "mins_nofold_2"}> ({
    %110 = "index.constant"() <{value = 2147483647 : index}> : () -> index
    %111 = "index.constant"() <{value = 2147483648 : index}> : () -> index
    %112 = "index.mins"(%110, %111) : (index, index) -> index
    "func.return"(%112) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> index, sym_name = "mins_fold_constants"}> ({
  ^bb0(%arg10: index):
    %106 = "index.constant"() <{value = -2 : index}> : () -> index
    %107 = "index.constant"() <{value = 3 : index}> : () -> index
    %108 = "index.mins"(%arg10, %106) : (index, index) -> index
    %109 = "index.mins"(%108, %107) : (index, index) -> index
    "func.return"(%109) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> index, sym_name = "minu"}> ({
    %103 = "index.constant"() <{value = -1 : index}> : () -> index
    %104 = "index.constant"() <{value = 1 : index}> : () -> index
    %105 = "index.minu"(%103, %104) : (index, index) -> index
    "func.return"(%105) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> index, sym_name = "minu_fold_constants"}> ({
  ^bb0(%arg9: index):
    %99 = "index.constant"() <{value = 2 : index}> : () -> index
    %100 = "index.constant"() <{value = 3 : index}> : () -> index
    %101 = "index.minu"(%arg9, %99) : (index, index) -> index
    %102 = "index.minu"(%101, %100) : (index, index) -> index
    "func.return"(%102) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> index, sym_name = "shl"}> ({
    %96 = "index.constant"() <{value = 128 : index}> : () -> index
    %97 = "index.constant"() <{value = 2 : index}> : () -> index
    %98 = "index.shl"(%96, %97) : (index, index) -> index
    "func.return"(%98) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> index, sym_name = "shl_32"}> ({
    %93 = "index.constant"() <{value = 1 : index}> : () -> index
    %94 = "index.constant"() <{value = 32 : index}> : () -> index
    %95 = "index.shl"(%93, %94) : (index, index) -> index
    "func.return"(%95) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> index, sym_name = "shl_edge"}> ({
    %90 = "index.constant"() <{value = 4000000000 : index}> : () -> index
    %91 = "index.constant"() <{value = 31 : index}> : () -> index
    %92 = "index.shl"(%90, %91) : (index, index) -> index
    "func.return"(%92) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> index, sym_name = "shrs"}> ({
    %87 = "index.constant"() <{value = 128 : index}> : () -> index
    %88 = "index.constant"() <{value = 2 : index}> : () -> index
    %89 = "index.shrs"(%87, %88) : (index, index) -> index
    "func.return"(%89) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> index, sym_name = "shrs_32"}> ({
    %84 = "index.constant"() <{value = 4000000000000 : index}> : () -> index
    %85 = "index.constant"() <{value = 32 : index}> : () -> index
    %86 = "index.shrs"(%84, %85) : (index, index) -> index
    "func.return"(%86) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> index, sym_name = "shrs_nofold"}> ({
    %81 = "index.constant"() <{value = 4294967296 : index}> : () -> index
    %82 = "index.constant"() <{value = 1 : index}> : () -> index
    %83 = "index.shrs"(%81, %82) : (index, index) -> index
    "func.return"(%83) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> index, sym_name = "shrs_edge"}> ({
    %78 = "index.constant"() <{value = 1099511627776 : index}> : () -> index
    %79 = "index.constant"() <{value = 3 : index}> : () -> index
    %80 = "index.shrs"(%78, %79) : (index, index) -> index
    "func.return"(%80) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> index, sym_name = "shru"}> ({
    %75 = "index.constant"() <{value = 128 : index}> : () -> index
    %76 = "index.constant"() <{value = 2 : index}> : () -> index
    %77 = "index.shru"(%75, %76) : (index, index) -> index
    "func.return"(%77) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> index, sym_name = "shru_32"}> ({
    %72 = "index.constant"() <{value = 4000000000000 : index}> : () -> index
    %73 = "index.constant"() <{value = 32 : index}> : () -> index
    %74 = "index.shru"(%72, %73) : (index, index) -> index
    "func.return"(%74) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> index, sym_name = "shru_nofold"}> ({
    %69 = "index.constant"() <{value = 4294967296 : index}> : () -> index
    %70 = "index.constant"() <{value = 1 : index}> : () -> index
    %71 = "index.shru"(%69, %70) : (index, index) -> index
    "func.return"(%71) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> index, sym_name = "shru_edge"}> ({
    %66 = "index.constant"() <{value = 1099511627776 : index}> : () -> index
    %67 = "index.constant"() <{value = 3 : index}> : () -> index
    %68 = "index.shru"(%66, %67) : (index, index) -> index
    "func.return"(%68) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> index, sym_name = "and"}> ({
    %63 = "index.constant"() <{value = 5 : index}> : () -> index
    %64 = "index.constant"() <{value = 1 : index}> : () -> index
    %65 = "index.and"(%63, %64) : (index, index) -> index
    "func.return"(%65) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> index, sym_name = "and_fold_constants"}> ({
  ^bb0(%arg8: index):
    %59 = "index.constant"() <{value = 5 : index}> : () -> index
    %60 = "index.constant"() <{value = 1 : index}> : () -> index
    %61 = "index.and"(%arg8, %59) : (index, index) -> index
    %62 = "index.and"(%61, %60) : (index, index) -> index
    "func.return"(%62) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> index, sym_name = "or"}> ({
    %56 = "index.constant"() <{value = 5 : index}> : () -> index
    %57 = "index.constant"() <{value = 2 : index}> : () -> index
    %58 = "index.or"(%56, %57) : (index, index) -> index
    "func.return"(%58) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> index, sym_name = "or_fold_constants"}> ({
  ^bb0(%arg7: index):
    %52 = "index.constant"() <{value = 5 : index}> : () -> index
    %53 = "index.constant"() <{value = 1 : index}> : () -> index
    %54 = "index.or"(%arg7, %52) : (index, index) -> index
    %55 = "index.or"(%54, %53) : (index, index) -> index
    "func.return"(%55) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> index, sym_name = "xor"}> ({
    %49 = "index.constant"() <{value = 5 : index}> : () -> index
    %50 = "index.constant"() <{value = 1 : index}> : () -> index
    %51 = "index.xor"(%49, %50) : (index, index) -> index
    "func.return"(%51) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> index, sym_name = "xor_fold_constants"}> ({
  ^bb0(%arg6: index):
    %45 = "index.constant"() <{value = 5 : index}> : () -> index
    %46 = "index.constant"() <{value = 1 : index}> : () -> index
    %47 = "index.xor"(%arg6, %45) : (index, index) -> index
    %48 = "index.xor"(%47, %46) : (index, index) -> index
    "func.return"(%48) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> (i1, i1, i1, i1, i1, i1), sym_name = "cmp"}> ({
  ^bb0(%arg5: index):
    %33 = "index.constant"() <{value = 0 : index}> : () -> index
    %34 = "index.constant"() <{value = -1 : index}> : () -> index
    %35 = "index.constant"() <{value = -2 : index}> : () -> index
    %36 = "index.constant"() <{value = 4 : index}> : () -> index
    %37 = "index.cmp"(%33, %34) <{pred = #index<cmp_predicate slt>}> : (index, index) -> i1
    %38 = "index.cmp"(%34, %33) <{pred = #index<cmp_predicate ugt>}> : (index, index) -> i1
    %39 = "index.cmp"(%36, %33) <{pred = #index<cmp_predicate ne>}> : (index, index) -> i1
    %40 = "index.cmp"(%34, %33) <{pred = #index<cmp_predicate sgt>}> : (index, index) -> i1
    %41 = "index.sub"(%33, %arg5) : (index, index) -> index
    %42 = "index.cmp"(%41, %33) <{pred = #index<cmp_predicate sgt>}> : (index, index) -> i1
    %43 = "index.sub"(%33, %arg5) : (index, index) -> index
    %44 = "index.cmp"(%33, %43) <{pred = #index<cmp_predicate sgt>}> : (index, index) -> i1
    "func.return"(%37, %38, %39, %40, %42, %44) : (i1, i1, i1, i1, i1, i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1), sym_name = "cmp_same_args"}> ({
  ^bb0(%arg4: index):
    %23 = "index.cmp"(%arg4, %arg4) <{pred = #index<cmp_predicate eq>}> : (index, index) -> i1
    %24 = "index.cmp"(%arg4, %arg4) <{pred = #index<cmp_predicate sge>}> : (index, index) -> i1
    %25 = "index.cmp"(%arg4, %arg4) <{pred = #index<cmp_predicate sle>}> : (index, index) -> i1
    %26 = "index.cmp"(%arg4, %arg4) <{pred = #index<cmp_predicate uge>}> : (index, index) -> i1
    %27 = "index.cmp"(%arg4, %arg4) <{pred = #index<cmp_predicate ule>}> : (index, index) -> i1
    %28 = "index.cmp"(%arg4, %arg4) <{pred = #index<cmp_predicate ne>}> : (index, index) -> i1
    %29 = "index.cmp"(%arg4, %arg4) <{pred = #index<cmp_predicate sgt>}> : (index, index) -> i1
    %30 = "index.cmp"(%arg4, %arg4) <{pred = #index<cmp_predicate slt>}> : (index, index) -> i1
    %31 = "index.cmp"(%arg4, %arg4) <{pred = #index<cmp_predicate ugt>}> : (index, index) -> i1
    %32 = "index.cmp"(%arg4, %arg4) <{pred = #index<cmp_predicate ult>}> : (index, index) -> i1
    "func.return"(%23, %24, %25, %26, %27, %28, %29, %30, %31, %32) : (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> i1, sym_name = "cmp_nofold"}> ({
    %20 = "index.constant"() <{value = 1 : index}> : () -> index
    %21 = "index.constant"() <{value = 4294967296 : index}> : () -> index
    %22 = "index.cmp"(%20, %21) <{pred = #index<cmp_predicate slt>}> : (index, index) -> i1
    "func.return"(%22) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> i1, sym_name = "cmp_edge"}> ({
    %17 = "index.constant"() <{value = 1 : index}> : () -> index
    %18 = "index.constant"() <{value = 4294967298 : index}> : () -> index
    %19 = "index.cmp"(%17, %18) <{pred = #index<cmp_predicate slt>}> : (index, index) -> i1
    "func.return"(%19) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> (i1, i1), sym_name = "cmp_maxs"}> ({
  ^bb0(%arg3: index):
    %12 = "index.constant"() <{value = 0 : index}> : () -> index
    %13 = "index.constant"() <{value = 1 : index}> : () -> index
    %14 = "index.maxs"(%arg3, %13) : (index, index) -> index
    %15 = "index.cmp"(%14, %12) <{pred = #index<cmp_predicate sgt>}> : (index, index) -> i1
    %16 = "index.cmp"(%14, %12) <{pred = #index<cmp_predicate eq>}> : (index, index) -> i1
    "func.return"(%15, %16) : (i1, i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> (index, index), sym_name = "mul_identity"}> ({
  ^bb0(%arg2: index):
    %8 = "index.constant"() <{value = 0 : index}> : () -> index
    %9 = "index.constant"() <{value = 1 : index}> : () -> index
    %10 = "index.mul"(%arg2, %8) : (index, index) -> index
    %11 = "index.mul"(%arg2, %9) : (index, index) -> index
    "func.return"(%10, %11) : (index, index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> index, sym_name = "add_identity"}> ({
  ^bb0(%arg1: index):
    %6 = "index.constant"() <{value = 0 : index}> : () -> index
    %7 = "index.add"(%arg1, %6) : (index, index) -> index
    "func.return"(%7) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> index, sym_name = "sub_identity"}> ({
  ^bb0(%arg0: index):
    %4 = "index.constant"() <{value = 0 : index}> : () -> index
    %5 = "index.sub"(%arg0, %4) : (index, index) -> index
    "func.return"(%5) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> index, sym_name = "castu_to_index"}> ({
    %2 = "arith.constant"() <{value = 8000000000000 : i48}> : () -> i48
    %3 = "index.castu"(%2) : (i48) -> index
    "func.return"(%3) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> index, sym_name = "casts_to_index"}> ({
    %0 = "arith.constant"() <{value = -1000 : i48}> : () -> i48
    %1 = "index.casts"(%0) : (i48) -> index
    "func.return"(%1) : (index) -> ()
  }) : () -> ()
}) : () -> ()

