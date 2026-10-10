#set = affine_set<() : (0 == 0)>
#set1 = affine_set<(d0) : (d0 == 0)>
#set2 = affine_set<(d0) : (d0 >= 0)>
#set3 = affine_set<(d0, d1) : (d0 >= 0, d1 >= 0)>
#set4 = affine_set<(d0, d1) : (d0 == 0, d1 >= 0)>
#set5 = affine_set<(d0, d1)[s0, s1] : (d0 * 2 + s0 >= 0, d1 * 2 + s1 >= 0, d0 >= 0, d1 >= 0, s0 == 0, s1 == 0)>
#set6 = affine_set<(d0, d1)[s0, s1] : (-d0 + s0 >= 0, -d1 + s1 >= 0, d0 >= 0, d1 >= 0)>
#set7 = affine_set<(d0) : (d0 - 1 == 0)>
#set8 = affine_set<(d0)[s0, s1] : (d0 >= 0, -d0 + s0 >= 0, s0 - 5 == 0, -d0 + s1 + 1 >= 0)>
#set9 = affine_set<(d0, d1)[s0] : (d0 >= 0, -d0 + s0 >= 0, d1 >= 0, d0 - d1 >= 0)>
#set10 = affine_set<(d0, d1)[s0, s1] : (-(d0 + d1 + s0 + s1) == 0, d0 + d1 - (s0 + s1) == 0)>
#set11 = affine_set<(d0, d1)[s0, s1] : (-(d0 + d1 + s0 + s1) >= 0, d0 + d1 - (s0 + s1) >= 0)>
#set12 = affine_set<(d0, d1, d2, d3) : ((d0 + d1) mod 2 - (d2 + d3) floordiv 2 == 0, d0 mod 2 + d1 mod 2 - (d2 + d3 + d2) >= 0)>
#set13 = affine_set<(d0) : (-d0 >= 0)>
#set14 = affine_set<(d0) : (d0 >= 0, -d0 + 10 >= 0)>
#set15 = affine_set<(d0, d1)[s0, s1] : (d0 >= 0, -d0 + s0 >= 0, d1 >= 0, -d1 + s1 >= 0)>
#set16 = affine_set<(d0)[s0] : (d0 >= 0, -d0 + s0 >= 0, -d0 + s0 floordiv 2 >= 0)>
#set17 = affine_set<(d0, d1, d2, d3, d4) : (-d0 >= 0, -d1 >= 0, -d2 >= 0, -d3 >= 0, -d4 >= 0)>
module {
  "testset0"() {set = #set} : () -> ()
  "testset1"() {set = #set1} : () -> ()
  "testset2"() {set = #set2} : () -> ()
  "testset3"() {set = #set3} : () -> ()
  "testset4"() {set = #set4} : () -> ()
  "testset5"() {set = #set5} : () -> ()
  "testset6"() {set = #set6} : () -> ()
  "testset7"() {set = #set7} : () -> ()
  "testset8"() {set = #set8} : () -> ()
  "testset9"() {set = #set9} : () -> ()
  "testset10"() {set = #set10} : () -> ()
  "testset11"() {set = #set11} : () -> ()
  "testset12"() {set = #set12} : () -> ()
  "testset13"() {set = #set13} : () -> ()
  "testset14"() {set = #set14} : () -> ()
  "testset15"() {set = #set15} : () -> ()
  "testset16"() {set = #set16} : () -> ()
  "testset17"() {set = #set17} : () -> ()
}

