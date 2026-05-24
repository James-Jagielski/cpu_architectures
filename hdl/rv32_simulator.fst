$date
	Sun May 24 16:41:38 2026
$end
$version
	Icarus Verilog
$end
$timescale
	1ps
$end
$scope module rv32_simulator $end
$scope module CORE $end
$var wire 1 ! addr_ready $end
$var wire 1 " clk $end
$var wire 1 # data_valid $end
$var wire 1 $ ena $end
$var wire 5 % mem_exception [4:0] $end
$var wire 1 & rst $end
$var wire 1 ' zero $end
$var wire 32 ( reg_data2 [31:0] $end
$var wire 32 ) reg_data1 [31:0] $end
$var wire 32 * reg_B [31:0] $end
$var wire 32 + reg_A [31:0] $end
$var wire 1 , overflow $end
$var wire 32 - mem_rd_data [31:0] $end
$var wire 32 . mem_data [31:0] $end
$var wire 1 / equal $end
$var wire 32 0 alu_result [31:0] $end
$var wire 32 1 alu_last [31:0] $end
$var wire 32 2 PC_old [31:0] $end
$var wire 32 3 PC [31:0] $end
$var wire 32 4 IR [31:0] $end
$var parameter 4 5 ALU_DEFAULT $end
$var parameter 32 6 PC_START_ADDRESS $end
$var reg 1 7 ALU_ena $end
$var reg 1 8 IR_write $end
$var reg 1 9 PC_ena $end
$var reg 32 : PC_next [31:0] $end
$var reg 1 ; addr_valid $end
$var reg 4 < alu_control [3:0] $end
$var reg 2 = alu_src_a [1:0] $end
$var reg 2 > alu_src_b [1:0] $end
$var reg 1 ? branch_taken $end
$var reg 1 @ data_ready $end
$var reg 32 A extended_immediate [31:0] $end
$var reg 3 B funct3 [2:0] $end
$var reg 7 C funct7 [6:0] $end
$var reg 12 D imm12_stype [11:0] $end
$var reg 1 E instruction_done $end
$var reg 32 F instructions_completed [31:0] $end
$var reg 2 G mem_access [1:0] $end
$var reg 32 H mem_addr [31:0] $end
$var reg 1 I mem_data_ena $end
$var reg 1 J mem_src $end
$var reg 1 K mem_unsign $end
$var reg 32 L mem_wr_data [31:0] $end
$var reg 1 M mem_wr_ena $end
$var reg 7 N op [6:0] $end
$var reg 4 O pending_state [3:0] $end
$var reg 5 P rd [4:0] $end
$var reg 1 Q reg_write $end
$var reg 32 R result [31:0] $end
$var reg 2 S result_src [1:0] $end
$var reg 32 T rfile_wr_data [31:0] $end
$var reg 4 U ri_alu_control [3:0] $end
$var reg 5 V rs1 [4:0] $end
$var reg 5 W rs2 [4:0] $end
$var reg 1 X rtype $end
$var reg 32 Y src_a [31:0] $end
$var reg 32 Z src_b [31:0] $end
$var reg 4 [ state [3:0] $end
$scope module ALU $end
$var wire 32 \ a [31:0] $end
$var wire 32 ] b [31:0] $end
$var wire 4 ^ control [3:0] $end
$var wire 32 _ zeroed_shift [31:0] $end
$var wire 32 ` unzeroed_shift [31:0] $end
$var wire 32 a result [31:0] $end
$var wire 1 / equal $end
$var wire 32 b boolean_result [31:0] $end
$var wire 32 c boolean_or_shift_result [31:0] $end
$var wire 32 d alu_result [31:0] $end
$var wire 1 e alu_c_out $end
$var wire 32 f adder_or_comparator_result [31:0] $end
$var wire 32 g a_sr_b [31:0] $end
$var wire 32 h a_sll_b [31:0] $end
$var wire 32 i a_and_xor_b [31:0] $end
$var parameter 32 j N $end
$var reg 32 k a_and_b [31:0] $end
$var reg 32 l a_or_b [31:0] $end
$var reg 1 m a_slt_b $end
$var reg 1 n a_sltu_b $end
$var reg 32 o a_xor_b [31:0] $end
$var reg 32 p alu_b [31:0] $end
$var reg 1 q alu_c_in $end
$var reg 32 r b_inverted [31:0] $end
$var reg 32 s less_than [31:0] $end
$var reg 1 , overflow $end
$var reg 1 t overflow_possible $end
$var reg 1 u same_signs $end
$var reg 1 v shamt_too_big $end
$var reg 1 ' zero $end
$scope module ADDER $end
$var wire 32 w a [31:0] $end
$var wire 32 x b [31:0] $end
$var wire 1 q c_in $end
$var wire 32 y sum [31:0] $end
$var wire 33 z carries [32:0] $end
$var wire 1 e c_out $end
$var parameter 32 { N $end
$scope begin ripple_carry[0] $end
$var parameter 2 | i $end
$scope module ADDER $end
$var wire 1 } a $end
$var wire 1 ~ b $end
$var wire 1 !" c_in $end
$var reg 1 "" c_out $end
$var reg 1 #" sum $end
$scope begin adder_gates $end
$upscope $end
$upscope $end
$upscope $end
$scope begin ripple_carry[1] $end
$var parameter 2 $" i $end
$scope module ADDER $end
$var wire 1 %" a $end
$var wire 1 &" b $end
$var wire 1 '" c_in $end
$var reg 1 (" c_out $end
$var reg 1 )" sum $end
$scope begin adder_gates $end
$upscope $end
$upscope $end
$upscope $end
$scope begin ripple_carry[2] $end
$var parameter 3 *" i $end
$scope module ADDER $end
$var wire 1 +" a $end
$var wire 1 ," b $end
$var wire 1 -" c_in $end
$var reg 1 ." c_out $end
$var reg 1 /" sum $end
$scope begin adder_gates $end
$upscope $end
$upscope $end
$upscope $end
$scope begin ripple_carry[3] $end
$var parameter 3 0" i $end
$scope module ADDER $end
$var wire 1 1" a $end
$var wire 1 2" b $end
$var wire 1 3" c_in $end
$var reg 1 4" c_out $end
$var reg 1 5" sum $end
$scope begin adder_gates $end
$upscope $end
$upscope $end
$upscope $end
$scope begin ripple_carry[4] $end
$var parameter 4 6" i $end
$scope module ADDER $end
$var wire 1 7" a $end
$var wire 1 8" b $end
$var wire 1 9" c_in $end
$var reg 1 :" c_out $end
$var reg 1 ;" sum $end
$scope begin adder_gates $end
$upscope $end
$upscope $end
$upscope $end
$scope begin ripple_carry[5] $end
$var parameter 4 <" i $end
$scope module ADDER $end
$var wire 1 =" a $end
$var wire 1 >" b $end
$var wire 1 ?" c_in $end
$var reg 1 @" c_out $end
$var reg 1 A" sum $end
$scope begin adder_gates $end
$upscope $end
$upscope $end
$upscope $end
$scope begin ripple_carry[6] $end
$var parameter 4 B" i $end
$scope module ADDER $end
$var wire 1 C" a $end
$var wire 1 D" b $end
$var wire 1 E" c_in $end
$var reg 1 F" c_out $end
$var reg 1 G" sum $end
$scope begin adder_gates $end
$upscope $end
$upscope $end
$upscope $end
$scope begin ripple_carry[7] $end
$var parameter 4 H" i $end
$scope module ADDER $end
$var wire 1 I" a $end
$var wire 1 J" b $end
$var wire 1 K" c_in $end
$var reg 1 L" c_out $end
$var reg 1 M" sum $end
$scope begin adder_gates $end
$upscope $end
$upscope $end
$upscope $end
$scope begin ripple_carry[8] $end
$var parameter 5 N" i $end
$scope module ADDER $end
$var wire 1 O" a $end
$var wire 1 P" b $end
$var wire 1 Q" c_in $end
$var reg 1 R" c_out $end
$var reg 1 S" sum $end
$scope begin adder_gates $end
$upscope $end
$upscope $end
$upscope $end
$scope begin ripple_carry[9] $end
$var parameter 5 T" i $end
$scope module ADDER $end
$var wire 1 U" a $end
$var wire 1 V" b $end
$var wire 1 W" c_in $end
$var reg 1 X" c_out $end
$var reg 1 Y" sum $end
$scope begin adder_gates $end
$upscope $end
$upscope $end
$upscope $end
$scope begin ripple_carry[10] $end
$var parameter 5 Z" i $end
$scope module ADDER $end
$var wire 1 [" a $end
$var wire 1 \" b $end
$var wire 1 ]" c_in $end
$var reg 1 ^" c_out $end
$var reg 1 _" sum $end
$scope begin adder_gates $end
$upscope $end
$upscope $end
$upscope $end
$scope begin ripple_carry[11] $end
$var parameter 5 `" i $end
$scope module ADDER $end
$var wire 1 a" a $end
$var wire 1 b" b $end
$var wire 1 c" c_in $end
$var reg 1 d" c_out $end
$var reg 1 e" sum $end
$scope begin adder_gates $end
$upscope $end
$upscope $end
$upscope $end
$scope begin ripple_carry[12] $end
$var parameter 5 f" i $end
$scope module ADDER $end
$var wire 1 g" a $end
$var wire 1 h" b $end
$var wire 1 i" c_in $end
$var reg 1 j" c_out $end
$var reg 1 k" sum $end
$scope begin adder_gates $end
$upscope $end
$upscope $end
$upscope $end
$scope begin ripple_carry[13] $end
$var parameter 5 l" i $end
$scope module ADDER $end
$var wire 1 m" a $end
$var wire 1 n" b $end
$var wire 1 o" c_in $end
$var reg 1 p" c_out $end
$var reg 1 q" sum $end
$scope begin adder_gates $end
$upscope $end
$upscope $end
$upscope $end
$scope begin ripple_carry[14] $end
$var parameter 5 r" i $end
$scope module ADDER $end
$var wire 1 s" a $end
$var wire 1 t" b $end
$var wire 1 u" c_in $end
$var reg 1 v" c_out $end
$var reg 1 w" sum $end
$scope begin adder_gates $end
$upscope $end
$upscope $end
$upscope $end
$scope begin ripple_carry[15] $end
$var parameter 5 x" i $end
$scope module ADDER $end
$var wire 1 y" a $end
$var wire 1 z" b $end
$var wire 1 {" c_in $end
$var reg 1 |" c_out $end
$var reg 1 }" sum $end
$scope begin adder_gates $end
$upscope $end
$upscope $end
$upscope $end
$scope begin ripple_carry[16] $end
$var parameter 6 ~" i $end
$scope module ADDER $end
$var wire 1 !# a $end
$var wire 1 "# b $end
$var wire 1 ## c_in $end
$var reg 1 $# c_out $end
$var reg 1 %# sum $end
$scope begin adder_gates $end
$upscope $end
$upscope $end
$upscope $end
$scope begin ripple_carry[17] $end
$var parameter 6 &# i $end
$scope module ADDER $end
$var wire 1 '# a $end
$var wire 1 (# b $end
$var wire 1 )# c_in $end
$var reg 1 *# c_out $end
$var reg 1 +# sum $end
$scope begin adder_gates $end
$upscope $end
$upscope $end
$upscope $end
$scope begin ripple_carry[18] $end
$var parameter 6 ,# i $end
$scope module ADDER $end
$var wire 1 -# a $end
$var wire 1 .# b $end
$var wire 1 /# c_in $end
$var reg 1 0# c_out $end
$var reg 1 1# sum $end
$scope begin adder_gates $end
$upscope $end
$upscope $end
$upscope $end
$scope begin ripple_carry[19] $end
$var parameter 6 2# i $end
$scope module ADDER $end
$var wire 1 3# a $end
$var wire 1 4# b $end
$var wire 1 5# c_in $end
$var reg 1 6# c_out $end
$var reg 1 7# sum $end
$scope begin adder_gates $end
$upscope $end
$upscope $end
$upscope $end
$scope begin ripple_carry[20] $end
$var parameter 6 8# i $end
$scope module ADDER $end
$var wire 1 9# a $end
$var wire 1 :# b $end
$var wire 1 ;# c_in $end
$var reg 1 <# c_out $end
$var reg 1 =# sum $end
$scope begin adder_gates $end
$upscope $end
$upscope $end
$upscope $end
$scope begin ripple_carry[21] $end
$var parameter 6 ># i $end
$scope module ADDER $end
$var wire 1 ?# a $end
$var wire 1 @# b $end
$var wire 1 A# c_in $end
$var reg 1 B# c_out $end
$var reg 1 C# sum $end
$scope begin adder_gates $end
$upscope $end
$upscope $end
$upscope $end
$scope begin ripple_carry[22] $end
$var parameter 6 D# i $end
$scope module ADDER $end
$var wire 1 E# a $end
$var wire 1 F# b $end
$var wire 1 G# c_in $end
$var reg 1 H# c_out $end
$var reg 1 I# sum $end
$scope begin adder_gates $end
$upscope $end
$upscope $end
$upscope $end
$scope begin ripple_carry[23] $end
$var parameter 6 J# i $end
$scope module ADDER $end
$var wire 1 K# a $end
$var wire 1 L# b $end
$var wire 1 M# c_in $end
$var reg 1 N# c_out $end
$var reg 1 O# sum $end
$scope begin adder_gates $end
$upscope $end
$upscope $end
$upscope $end
$scope begin ripple_carry[24] $end
$var parameter 6 P# i $end
$scope module ADDER $end
$var wire 1 Q# a $end
$var wire 1 R# b $end
$var wire 1 S# c_in $end
$var reg 1 T# c_out $end
$var reg 1 U# sum $end
$scope begin adder_gates $end
$upscope $end
$upscope $end
$upscope $end
$scope begin ripple_carry[25] $end
$var parameter 6 V# i $end
$scope module ADDER $end
$var wire 1 W# a $end
$var wire 1 X# b $end
$var wire 1 Y# c_in $end
$var reg 1 Z# c_out $end
$var reg 1 [# sum $end
$scope begin adder_gates $end
$upscope $end
$upscope $end
$upscope $end
$scope begin ripple_carry[26] $end
$var parameter 6 \# i $end
$scope module ADDER $end
$var wire 1 ]# a $end
$var wire 1 ^# b $end
$var wire 1 _# c_in $end
$var reg 1 `# c_out $end
$var reg 1 a# sum $end
$scope begin adder_gates $end
$upscope $end
$upscope $end
$upscope $end
$scope begin ripple_carry[27] $end
$var parameter 6 b# i $end
$scope module ADDER $end
$var wire 1 c# a $end
$var wire 1 d# b $end
$var wire 1 e# c_in $end
$var reg 1 f# c_out $end
$var reg 1 g# sum $end
$scope begin adder_gates $end
$upscope $end
$upscope $end
$upscope $end
$scope begin ripple_carry[28] $end
$var parameter 6 h# i $end
$scope module ADDER $end
$var wire 1 i# a $end
$var wire 1 j# b $end
$var wire 1 k# c_in $end
$var reg 1 l# c_out $end
$var reg 1 m# sum $end
$scope begin adder_gates $end
$upscope $end
$upscope $end
$upscope $end
$scope begin ripple_carry[29] $end
$var parameter 6 n# i $end
$scope module ADDER $end
$var wire 1 o# a $end
$var wire 1 p# b $end
$var wire 1 q# c_in $end
$var reg 1 r# c_out $end
$var reg 1 s# sum $end
$scope begin adder_gates $end
$upscope $end
$upscope $end
$upscope $end
$scope begin ripple_carry[30] $end
$var parameter 6 t# i $end
$scope module ADDER $end
$var wire 1 u# a $end
$var wire 1 v# b $end
$var wire 1 w# c_in $end
$var reg 1 x# c_out $end
$var reg 1 y# sum $end
$scope begin adder_gates $end
$upscope $end
$upscope $end
$upscope $end
$scope begin ripple_carry[31] $end
$var parameter 6 z# i $end
$scope module ADDER $end
$var wire 1 {# a $end
$var wire 1 |# b $end
$var wire 1 }# c_in $end
$var reg 1 ~# c_out $end
$var reg 1 !$ sum $end
$scope begin adder_gates $end
$upscope $end
$upscope $end
$upscope $end
$upscope $end
$scope module ADDER_OR_LT_MUX $end
$var wire 32 "$ in0 [31:0] $end
$var wire 32 #$ in1 [31:0] $end
$var wire 1 $$ s $end
$var parameter 32 %$ N $end
$var reg 32 &$ out [31:0] $end
$upscope $end
$scope module BOOLEAN_MUX0 $end
$var wire 32 '$ in0 [31:0] $end
$var wire 32 ($ in1 [31:0] $end
$var wire 1 )$ s $end
$var parameter 32 *$ N $end
$var reg 32 +$ out [31:0] $end
$upscope $end
$scope module BOOLEAN_MUX1 $end
$var wire 32 ,$ in0 [31:0] $end
$var wire 32 -$ in1 [31:0] $end
$var wire 1 .$ s $end
$var parameter 32 /$ N $end
$var reg 32 0$ out [31:0] $end
$upscope $end
$scope module BOOLEAN_OR_SHIFT_MUX $end
$var wire 32 1$ in0 [31:0] $end
$var wire 1 2$ s $end
$var wire 32 3$ in1 [31:0] $end
$var parameter 32 4$ N $end
$var reg 32 5$ out [31:0] $end
$upscope $end
$scope module EQUAL $end
$var wire 32 6$ a [31:0] $end
$var wire 32 7$ b [31:0] $end
$var parameter 32 8$ N $end
$var reg 1 / out $end
$upscope $end
$scope module RESULT_MUX $end
$var wire 32 9$ in0 [31:0] $end
$var wire 32 :$ in1 [31:0] $end
$var wire 1 ;$ s $end
$var parameter 32 <$ N $end
$var reg 32 =$ out [31:0] $end
$upscope $end
$scope module SHIFTER_MUX $end
$var wire 1 >$ s $end
$var wire 32 ?$ in1 [31:0] $end
$var wire 32 @$ in0 [31:0] $end
$var parameter 32 A$ N $end
$var reg 32 B$ out [31:0] $end
$upscope $end
$scope module SHIFT_LEFT $end
$var wire 32 C$ in [31:0] $end
$var wire 5 D$ shamt [4:0] $end
$var wire 32 E$ out [31:0] $end
$var parameter 32 F$ N $end
$scope module SHIFT_MUX $end
$var wire 32 G$ in0 [31:0] $end
$var wire 32 H$ in1 [31:0] $end
$var wire 32 I$ in10 [31:0] $end
$var wire 32 J$ in11 [31:0] $end
$var wire 32 K$ in12 [31:0] $end
$var wire 32 L$ in13 [31:0] $end
$var wire 32 M$ in14 [31:0] $end
$var wire 32 N$ in15 [31:0] $end
$var wire 32 O$ in16 [31:0] $end
$var wire 32 P$ in17 [31:0] $end
$var wire 32 Q$ in18 [31:0] $end
$var wire 32 R$ in19 [31:0] $end
$var wire 32 S$ in2 [31:0] $end
$var wire 32 T$ in20 [31:0] $end
$var wire 32 U$ in21 [31:0] $end
$var wire 32 V$ in22 [31:0] $end
$var wire 32 W$ in23 [31:0] $end
$var wire 32 X$ in24 [31:0] $end
$var wire 32 Y$ in25 [31:0] $end
$var wire 32 Z$ in26 [31:0] $end
$var wire 32 [$ in27 [31:0] $end
$var wire 32 \$ in28 [31:0] $end
$var wire 32 ]$ in29 [31:0] $end
$var wire 32 ^$ in3 [31:0] $end
$var wire 32 _$ in30 [31:0] $end
$var wire 32 `$ in31 [31:0] $end
$var wire 32 a$ in4 [31:0] $end
$var wire 32 b$ in5 [31:0] $end
$var wire 32 c$ in6 [31:0] $end
$var wire 32 d$ in7 [31:0] $end
$var wire 32 e$ in8 [31:0] $end
$var wire 32 f$ in9 [31:0] $end
$var wire 5 g$ s [4:0] $end
$var wire 32 h$ out [31:0] $end
$var wire 32 i$ mux1_out [31:0] $end
$var wire 32 j$ mux0_out [31:0] $end
$var parameter 32 k$ N $end
$scope module MUX0 $end
$var wire 32 l$ in0 [31:0] $end
$var wire 32 m$ in1 [31:0] $end
$var wire 32 n$ in10 [31:0] $end
$var wire 32 o$ in11 [31:0] $end
$var wire 32 p$ in12 [31:0] $end
$var wire 32 q$ in13 [31:0] $end
$var wire 32 r$ in14 [31:0] $end
$var wire 32 s$ in15 [31:0] $end
$var wire 32 t$ in2 [31:0] $end
$var wire 32 u$ in3 [31:0] $end
$var wire 32 v$ in4 [31:0] $end
$var wire 32 w$ in5 [31:0] $end
$var wire 32 x$ in6 [31:0] $end
$var wire 32 y$ in7 [31:0] $end
$var wire 32 z$ in8 [31:0] $end
$var wire 32 {$ in9 [31:0] $end
$var wire 4 |$ s [3:0] $end
$var wire 32 }$ out [31:0] $end
$var wire 32 ~$ mux1_out [31:0] $end
$var wire 32 !% mux0_out [31:0] $end
$var parameter 32 "% N $end
$scope module MUX0 $end
$var wire 32 #% in0 [31:0] $end
$var wire 32 $% in1 [31:0] $end
$var wire 32 %% in2 [31:0] $end
$var wire 32 &% in3 [31:0] $end
$var wire 32 '% in4 [31:0] $end
$var wire 32 (% in5 [31:0] $end
$var wire 32 )% in6 [31:0] $end
$var wire 32 *% in7 [31:0] $end
$var wire 3 +% s [2:0] $end
$var wire 32 ,% out [31:0] $end
$var wire 32 -% mux1_out [31:0] $end
$var wire 32 .% mux0_out [31:0] $end
$var parameter 32 /% N $end
$scope module MUX0 $end
$var wire 32 0% in0 [31:0] $end
$var wire 32 1% in1 [31:0] $end
$var wire 32 2% in2 [31:0] $end
$var wire 32 3% in3 [31:0] $end
$var wire 2 4% s [1:0] $end
$var wire 32 5% out [31:0] $end
$var wire 32 6% mux1_out [31:0] $end
$var wire 32 7% mux0_out [31:0] $end
$var parameter 32 8% N $end
$scope module MUX0 $end
$var wire 32 9% in0 [31:0] $end
$var wire 32 :% in1 [31:0] $end
$var wire 1 ;% s $end
$var parameter 32 <% N $end
$var reg 32 =% out [31:0] $end
$upscope $end
$scope module MUX1 $end
$var wire 32 >% in0 [31:0] $end
$var wire 32 ?% in1 [31:0] $end
$var wire 1 @% s $end
$var parameter 32 A% N $end
$var reg 32 B% out [31:0] $end
$upscope $end
$scope module MUX2 $end
$var wire 32 C% in0 [31:0] $end
$var wire 32 D% in1 [31:0] $end
$var wire 1 E% s $end
$var parameter 32 F% N $end
$var reg 32 G% out [31:0] $end
$upscope $end
$upscope $end
$scope module MUX1 $end
$var wire 32 H% in0 [31:0] $end
$var wire 32 I% in1 [31:0] $end
$var wire 32 J% in2 [31:0] $end
$var wire 32 K% in3 [31:0] $end
$var wire 2 L% s [1:0] $end
$var wire 32 M% out [31:0] $end
$var wire 32 N% mux1_out [31:0] $end
$var wire 32 O% mux0_out [31:0] $end
$var parameter 32 P% N $end
$scope module MUX0 $end
$var wire 32 Q% in0 [31:0] $end
$var wire 32 R% in1 [31:0] $end
$var wire 1 S% s $end
$var parameter 32 T% N $end
$var reg 32 U% out [31:0] $end
$upscope $end
$scope module MUX1 $end
$var wire 32 V% in0 [31:0] $end
$var wire 32 W% in1 [31:0] $end
$var wire 1 X% s $end
$var parameter 32 Y% N $end
$var reg 32 Z% out [31:0] $end
$upscope $end
$scope module MUX2 $end
$var wire 32 [% in0 [31:0] $end
$var wire 32 \% in1 [31:0] $end
$var wire 1 ]% s $end
$var parameter 32 ^% N $end
$var reg 32 _% out [31:0] $end
$upscope $end
$upscope $end
$scope module MUX2 $end
$var wire 32 `% in0 [31:0] $end
$var wire 32 a% in1 [31:0] $end
$var wire 1 b% s $end
$var parameter 32 c% N $end
$var reg 32 d% out [31:0] $end
$upscope $end
$upscope $end
$scope module MUX1 $end
$var wire 32 e% in0 [31:0] $end
$var wire 32 f% in1 [31:0] $end
$var wire 32 g% in2 [31:0] $end
$var wire 32 h% in3 [31:0] $end
$var wire 32 i% in4 [31:0] $end
$var wire 32 j% in5 [31:0] $end
$var wire 32 k% in6 [31:0] $end
$var wire 32 l% in7 [31:0] $end
$var wire 3 m% s [2:0] $end
$var wire 32 n% out [31:0] $end
$var wire 32 o% mux1_out [31:0] $end
$var wire 32 p% mux0_out [31:0] $end
$var parameter 32 q% N $end
$scope module MUX0 $end
$var wire 32 r% in0 [31:0] $end
$var wire 32 s% in1 [31:0] $end
$var wire 32 t% in2 [31:0] $end
$var wire 32 u% in3 [31:0] $end
$var wire 2 v% s [1:0] $end
$var wire 32 w% out [31:0] $end
$var wire 32 x% mux1_out [31:0] $end
$var wire 32 y% mux0_out [31:0] $end
$var parameter 32 z% N $end
$scope module MUX0 $end
$var wire 32 {% in0 [31:0] $end
$var wire 32 |% in1 [31:0] $end
$var wire 1 }% s $end
$var parameter 32 ~% N $end
$var reg 32 !& out [31:0] $end
$upscope $end
$scope module MUX1 $end
$var wire 32 "& in0 [31:0] $end
$var wire 32 #& in1 [31:0] $end
$var wire 1 $& s $end
$var parameter 32 %& N $end
$var reg 32 && out [31:0] $end
$upscope $end
$scope module MUX2 $end
$var wire 32 '& in0 [31:0] $end
$var wire 32 (& in1 [31:0] $end
$var wire 1 )& s $end
$var parameter 32 *& N $end
$var reg 32 +& out [31:0] $end
$upscope $end
$upscope $end
$scope module MUX1 $end
$var wire 32 ,& in0 [31:0] $end
$var wire 32 -& in1 [31:0] $end
$var wire 32 .& in2 [31:0] $end
$var wire 32 /& in3 [31:0] $end
$var wire 2 0& s [1:0] $end
$var wire 32 1& out [31:0] $end
$var wire 32 2& mux1_out [31:0] $end
$var wire 32 3& mux0_out [31:0] $end
$var parameter 32 4& N $end
$scope module MUX0 $end
$var wire 32 5& in0 [31:0] $end
$var wire 32 6& in1 [31:0] $end
$var wire 1 7& s $end
$var parameter 32 8& N $end
$var reg 32 9& out [31:0] $end
$upscope $end
$scope module MUX1 $end
$var wire 32 :& in0 [31:0] $end
$var wire 32 ;& in1 [31:0] $end
$var wire 1 <& s $end
$var parameter 32 =& N $end
$var reg 32 >& out [31:0] $end
$upscope $end
$scope module MUX2 $end
$var wire 32 ?& in0 [31:0] $end
$var wire 32 @& in1 [31:0] $end
$var wire 1 A& s $end
$var parameter 32 B& N $end
$var reg 32 C& out [31:0] $end
$upscope $end
$upscope $end
$scope module MUX2 $end
$var wire 32 D& in0 [31:0] $end
$var wire 32 E& in1 [31:0] $end
$var wire 1 F& s $end
$var parameter 32 G& N $end
$var reg 32 H& out [31:0] $end
$upscope $end
$upscope $end
$scope module MUX2 $end
$var wire 32 I& in0 [31:0] $end
$var wire 32 J& in1 [31:0] $end
$var wire 1 K& s $end
$var parameter 32 L& N $end
$var reg 32 M& out [31:0] $end
$upscope $end
$upscope $end
$scope module MUX1 $end
$var wire 32 N& in0 [31:0] $end
$var wire 32 O& in1 [31:0] $end
$var wire 32 P& in10 [31:0] $end
$var wire 32 Q& in11 [31:0] $end
$var wire 32 R& in12 [31:0] $end
$var wire 32 S& in13 [31:0] $end
$var wire 32 T& in14 [31:0] $end
$var wire 32 U& in15 [31:0] $end
$var wire 32 V& in2 [31:0] $end
$var wire 32 W& in3 [31:0] $end
$var wire 32 X& in4 [31:0] $end
$var wire 32 Y& in5 [31:0] $end
$var wire 32 Z& in6 [31:0] $end
$var wire 32 [& in7 [31:0] $end
$var wire 32 \& in8 [31:0] $end
$var wire 32 ]& in9 [31:0] $end
$var wire 4 ^& s [3:0] $end
$var wire 32 _& out [31:0] $end
$var wire 32 `& mux1_out [31:0] $end
$var wire 32 a& mux0_out [31:0] $end
$var parameter 32 b& N $end
$scope module MUX0 $end
$var wire 32 c& in0 [31:0] $end
$var wire 32 d& in1 [31:0] $end
$var wire 32 e& in2 [31:0] $end
$var wire 32 f& in3 [31:0] $end
$var wire 32 g& in4 [31:0] $end
$var wire 32 h& in5 [31:0] $end
$var wire 32 i& in6 [31:0] $end
$var wire 32 j& in7 [31:0] $end
$var wire 3 k& s [2:0] $end
$var wire 32 l& out [31:0] $end
$var wire 32 m& mux1_out [31:0] $end
$var wire 32 n& mux0_out [31:0] $end
$var parameter 32 o& N $end
$scope module MUX0 $end
$var wire 32 p& in0 [31:0] $end
$var wire 32 q& in1 [31:0] $end
$var wire 32 r& in2 [31:0] $end
$var wire 32 s& in3 [31:0] $end
$var wire 2 t& s [1:0] $end
$var wire 32 u& out [31:0] $end
$var wire 32 v& mux1_out [31:0] $end
$var wire 32 w& mux0_out [31:0] $end
$var parameter 32 x& N $end
$scope module MUX0 $end
$var wire 32 y& in0 [31:0] $end
$var wire 32 z& in1 [31:0] $end
$var wire 1 {& s $end
$var parameter 32 |& N $end
$var reg 32 }& out [31:0] $end
$upscope $end
$scope module MUX1 $end
$var wire 32 ~& in0 [31:0] $end
$var wire 32 !' in1 [31:0] $end
$var wire 1 "' s $end
$var parameter 32 #' N $end
$var reg 32 $' out [31:0] $end
$upscope $end
$scope module MUX2 $end
$var wire 32 %' in0 [31:0] $end
$var wire 32 &' in1 [31:0] $end
$var wire 1 '' s $end
$var parameter 32 (' N $end
$var reg 32 )' out [31:0] $end
$upscope $end
$upscope $end
$scope module MUX1 $end
$var wire 32 *' in0 [31:0] $end
$var wire 32 +' in1 [31:0] $end
$var wire 32 ,' in2 [31:0] $end
$var wire 32 -' in3 [31:0] $end
$var wire 2 .' s [1:0] $end
$var wire 32 /' out [31:0] $end
$var wire 32 0' mux1_out [31:0] $end
$var wire 32 1' mux0_out [31:0] $end
$var parameter 32 2' N $end
$scope module MUX0 $end
$var wire 32 3' in0 [31:0] $end
$var wire 32 4' in1 [31:0] $end
$var wire 1 5' s $end
$var parameter 32 6' N $end
$var reg 32 7' out [31:0] $end
$upscope $end
$scope module MUX1 $end
$var wire 32 8' in0 [31:0] $end
$var wire 32 9' in1 [31:0] $end
$var wire 1 :' s $end
$var parameter 32 ;' N $end
$var reg 32 <' out [31:0] $end
$upscope $end
$scope module MUX2 $end
$var wire 32 =' in0 [31:0] $end
$var wire 32 >' in1 [31:0] $end
$var wire 1 ?' s $end
$var parameter 32 @' N $end
$var reg 32 A' out [31:0] $end
$upscope $end
$upscope $end
$scope module MUX2 $end
$var wire 32 B' in0 [31:0] $end
$var wire 32 C' in1 [31:0] $end
$var wire 1 D' s $end
$var parameter 32 E' N $end
$var reg 32 F' out [31:0] $end
$upscope $end
$upscope $end
$scope module MUX1 $end
$var wire 32 G' in0 [31:0] $end
$var wire 32 H' in1 [31:0] $end
$var wire 32 I' in2 [31:0] $end
$var wire 32 J' in3 [31:0] $end
$var wire 32 K' in4 [31:0] $end
$var wire 32 L' in5 [31:0] $end
$var wire 32 M' in6 [31:0] $end
$var wire 32 N' in7 [31:0] $end
$var wire 3 O' s [2:0] $end
$var wire 32 P' out [31:0] $end
$var wire 32 Q' mux1_out [31:0] $end
$var wire 32 R' mux0_out [31:0] $end
$var parameter 32 S' N $end
$scope module MUX0 $end
$var wire 32 T' in0 [31:0] $end
$var wire 32 U' in1 [31:0] $end
$var wire 32 V' in2 [31:0] $end
$var wire 32 W' in3 [31:0] $end
$var wire 2 X' s [1:0] $end
$var wire 32 Y' out [31:0] $end
$var wire 32 Z' mux1_out [31:0] $end
$var wire 32 [' mux0_out [31:0] $end
$var parameter 32 \' N $end
$scope module MUX0 $end
$var wire 32 ]' in0 [31:0] $end
$var wire 32 ^' in1 [31:0] $end
$var wire 1 _' s $end
$var parameter 32 `' N $end
$var reg 32 a' out [31:0] $end
$upscope $end
$scope module MUX1 $end
$var wire 32 b' in0 [31:0] $end
$var wire 32 c' in1 [31:0] $end
$var wire 1 d' s $end
$var parameter 32 e' N $end
$var reg 32 f' out [31:0] $end
$upscope $end
$scope module MUX2 $end
$var wire 32 g' in0 [31:0] $end
$var wire 32 h' in1 [31:0] $end
$var wire 1 i' s $end
$var parameter 32 j' N $end
$var reg 32 k' out [31:0] $end
$upscope $end
$upscope $end
$scope module MUX1 $end
$var wire 32 l' in0 [31:0] $end
$var wire 32 m' in1 [31:0] $end
$var wire 32 n' in2 [31:0] $end
$var wire 32 o' in3 [31:0] $end
$var wire 2 p' s [1:0] $end
$var wire 32 q' out [31:0] $end
$var wire 32 r' mux1_out [31:0] $end
$var wire 32 s' mux0_out [31:0] $end
$var parameter 32 t' N $end
$scope module MUX0 $end
$var wire 32 u' in0 [31:0] $end
$var wire 32 v' in1 [31:0] $end
$var wire 1 w' s $end
$var parameter 32 x' N $end
$var reg 32 y' out [31:0] $end
$upscope $end
$scope module MUX1 $end
$var wire 32 z' in0 [31:0] $end
$var wire 32 {' in1 [31:0] $end
$var wire 1 |' s $end
$var parameter 32 }' N $end
$var reg 32 ~' out [31:0] $end
$upscope $end
$scope module MUX2 $end
$var wire 32 !( in0 [31:0] $end
$var wire 32 "( in1 [31:0] $end
$var wire 1 #( s $end
$var parameter 32 $( N $end
$var reg 32 %( out [31:0] $end
$upscope $end
$upscope $end
$scope module MUX2 $end
$var wire 32 &( in0 [31:0] $end
$var wire 32 '( in1 [31:0] $end
$var wire 1 (( s $end
$var parameter 32 )( N $end
$var reg 32 *( out [31:0] $end
$upscope $end
$upscope $end
$scope module MUX2 $end
$var wire 32 +( in0 [31:0] $end
$var wire 32 ,( in1 [31:0] $end
$var wire 1 -( s $end
$var parameter 32 .( N $end
$var reg 32 /( out [31:0] $end
$upscope $end
$upscope $end
$scope module MUX2 $end
$var wire 32 0( in0 [31:0] $end
$var wire 32 1( in1 [31:0] $end
$var wire 1 2( s $end
$var parameter 32 3( N $end
$var reg 32 4( out [31:0] $end
$upscope $end
$upscope $end
$upscope $end
$scope module SHIFT_RIGHT $end
$var wire 1 5( arithmetic $end
$var wire 32 6( in [31:0] $end
$var wire 5 7( shamt [4:0] $end
$var wire 32 8( out [31:0] $end
$var parameter 32 9( N $end
$var reg 1 :( extend $end
$scope module SHIFT_MUX $end
$var wire 32 ;( in0 [31:0] $end
$var wire 32 <( in1 [31:0] $end
$var wire 32 =( in10 [31:0] $end
$var wire 32 >( in11 [31:0] $end
$var wire 32 ?( in12 [31:0] $end
$var wire 32 @( in13 [31:0] $end
$var wire 32 A( in14 [31:0] $end
$var wire 32 B( in15 [31:0] $end
$var wire 32 C( in16 [31:0] $end
$var wire 32 D( in17 [31:0] $end
$var wire 32 E( in18 [31:0] $end
$var wire 32 F( in19 [31:0] $end
$var wire 32 G( in2 [31:0] $end
$var wire 32 H( in20 [31:0] $end
$var wire 32 I( in21 [31:0] $end
$var wire 32 J( in22 [31:0] $end
$var wire 32 K( in23 [31:0] $end
$var wire 32 L( in24 [31:0] $end
$var wire 32 M( in25 [31:0] $end
$var wire 32 N( in26 [31:0] $end
$var wire 32 O( in27 [31:0] $end
$var wire 32 P( in28 [31:0] $end
$var wire 32 Q( in29 [31:0] $end
$var wire 32 R( in3 [31:0] $end
$var wire 32 S( in30 [31:0] $end
$var wire 32 T( in31 [31:0] $end
$var wire 32 U( in4 [31:0] $end
$var wire 32 V( in5 [31:0] $end
$var wire 32 W( in6 [31:0] $end
$var wire 32 X( in7 [31:0] $end
$var wire 32 Y( in8 [31:0] $end
$var wire 32 Z( in9 [31:0] $end
$var wire 5 [( s [4:0] $end
$var wire 32 \( out [31:0] $end
$var wire 32 ]( mux1_out [31:0] $end
$var wire 32 ^( mux0_out [31:0] $end
$var parameter 32 _( N $end
$scope module MUX0 $end
$var wire 32 `( in0 [31:0] $end
$var wire 32 a( in1 [31:0] $end
$var wire 32 b( in10 [31:0] $end
$var wire 32 c( in11 [31:0] $end
$var wire 32 d( in12 [31:0] $end
$var wire 32 e( in13 [31:0] $end
$var wire 32 f( in14 [31:0] $end
$var wire 32 g( in15 [31:0] $end
$var wire 32 h( in2 [31:0] $end
$var wire 32 i( in3 [31:0] $end
$var wire 32 j( in4 [31:0] $end
$var wire 32 k( in5 [31:0] $end
$var wire 32 l( in6 [31:0] $end
$var wire 32 m( in7 [31:0] $end
$var wire 32 n( in8 [31:0] $end
$var wire 32 o( in9 [31:0] $end
$var wire 4 p( s [3:0] $end
$var wire 32 q( out [31:0] $end
$var wire 32 r( mux1_out [31:0] $end
$var wire 32 s( mux0_out [31:0] $end
$var parameter 32 t( N $end
$scope module MUX0 $end
$var wire 32 u( in0 [31:0] $end
$var wire 32 v( in1 [31:0] $end
$var wire 32 w( in2 [31:0] $end
$var wire 32 x( in3 [31:0] $end
$var wire 32 y( in4 [31:0] $end
$var wire 32 z( in5 [31:0] $end
$var wire 32 {( in6 [31:0] $end
$var wire 32 |( in7 [31:0] $end
$var wire 3 }( s [2:0] $end
$var wire 32 ~( out [31:0] $end
$var wire 32 !) mux1_out [31:0] $end
$var wire 32 ") mux0_out [31:0] $end
$var parameter 32 #) N $end
$scope module MUX0 $end
$var wire 32 $) in0 [31:0] $end
$var wire 32 %) in1 [31:0] $end
$var wire 32 &) in2 [31:0] $end
$var wire 32 ') in3 [31:0] $end
$var wire 2 () s [1:0] $end
$var wire 32 )) out [31:0] $end
$var wire 32 *) mux1_out [31:0] $end
$var wire 32 +) mux0_out [31:0] $end
$var parameter 32 ,) N $end
$scope module MUX0 $end
$var wire 32 -) in0 [31:0] $end
$var wire 32 .) in1 [31:0] $end
$var wire 1 /) s $end
$var parameter 32 0) N $end
$var reg 32 1) out [31:0] $end
$upscope $end
$scope module MUX1 $end
$var wire 32 2) in0 [31:0] $end
$var wire 32 3) in1 [31:0] $end
$var wire 1 4) s $end
$var parameter 32 5) N $end
$var reg 32 6) out [31:0] $end
$upscope $end
$scope module MUX2 $end
$var wire 32 7) in0 [31:0] $end
$var wire 32 8) in1 [31:0] $end
$var wire 1 9) s $end
$var parameter 32 :) N $end
$var reg 32 ;) out [31:0] $end
$upscope $end
$upscope $end
$scope module MUX1 $end
$var wire 32 <) in0 [31:0] $end
$var wire 32 =) in1 [31:0] $end
$var wire 32 >) in2 [31:0] $end
$var wire 32 ?) in3 [31:0] $end
$var wire 2 @) s [1:0] $end
$var wire 32 A) out [31:0] $end
$var wire 32 B) mux1_out [31:0] $end
$var wire 32 C) mux0_out [31:0] $end
$var parameter 32 D) N $end
$scope module MUX0 $end
$var wire 32 E) in0 [31:0] $end
$var wire 32 F) in1 [31:0] $end
$var wire 1 G) s $end
$var parameter 32 H) N $end
$var reg 32 I) out [31:0] $end
$upscope $end
$scope module MUX1 $end
$var wire 32 J) in0 [31:0] $end
$var wire 32 K) in1 [31:0] $end
$var wire 1 L) s $end
$var parameter 32 M) N $end
$var reg 32 N) out [31:0] $end
$upscope $end
$scope module MUX2 $end
$var wire 32 O) in0 [31:0] $end
$var wire 32 P) in1 [31:0] $end
$var wire 1 Q) s $end
$var parameter 32 R) N $end
$var reg 32 S) out [31:0] $end
$upscope $end
$upscope $end
$scope module MUX2 $end
$var wire 32 T) in0 [31:0] $end
$var wire 32 U) in1 [31:0] $end
$var wire 1 V) s $end
$var parameter 32 W) N $end
$var reg 32 X) out [31:0] $end
$upscope $end
$upscope $end
$scope module MUX1 $end
$var wire 32 Y) in0 [31:0] $end
$var wire 32 Z) in1 [31:0] $end
$var wire 32 [) in2 [31:0] $end
$var wire 32 \) in3 [31:0] $end
$var wire 32 ]) in4 [31:0] $end
$var wire 32 ^) in5 [31:0] $end
$var wire 32 _) in6 [31:0] $end
$var wire 32 `) in7 [31:0] $end
$var wire 3 a) s [2:0] $end
$var wire 32 b) out [31:0] $end
$var wire 32 c) mux1_out [31:0] $end
$var wire 32 d) mux0_out [31:0] $end
$var parameter 32 e) N $end
$scope module MUX0 $end
$var wire 32 f) in0 [31:0] $end
$var wire 32 g) in1 [31:0] $end
$var wire 32 h) in2 [31:0] $end
$var wire 32 i) in3 [31:0] $end
$var wire 2 j) s [1:0] $end
$var wire 32 k) out [31:0] $end
$var wire 32 l) mux1_out [31:0] $end
$var wire 32 m) mux0_out [31:0] $end
$var parameter 32 n) N $end
$scope module MUX0 $end
$var wire 32 o) in0 [31:0] $end
$var wire 32 p) in1 [31:0] $end
$var wire 1 q) s $end
$var parameter 32 r) N $end
$var reg 32 s) out [31:0] $end
$upscope $end
$scope module MUX1 $end
$var wire 32 t) in0 [31:0] $end
$var wire 32 u) in1 [31:0] $end
$var wire 1 v) s $end
$var parameter 32 w) N $end
$var reg 32 x) out [31:0] $end
$upscope $end
$scope module MUX2 $end
$var wire 32 y) in0 [31:0] $end
$var wire 32 z) in1 [31:0] $end
$var wire 1 {) s $end
$var parameter 32 |) N $end
$var reg 32 }) out [31:0] $end
$upscope $end
$upscope $end
$scope module MUX1 $end
$var wire 32 ~) in0 [31:0] $end
$var wire 32 !* in1 [31:0] $end
$var wire 32 "* in2 [31:0] $end
$var wire 32 #* in3 [31:0] $end
$var wire 2 $* s [1:0] $end
$var wire 32 %* out [31:0] $end
$var wire 32 &* mux1_out [31:0] $end
$var wire 32 '* mux0_out [31:0] $end
$var parameter 32 (* N $end
$scope module MUX0 $end
$var wire 32 )* in0 [31:0] $end
$var wire 32 ** in1 [31:0] $end
$var wire 1 +* s $end
$var parameter 32 ,* N $end
$var reg 32 -* out [31:0] $end
$upscope $end
$scope module MUX1 $end
$var wire 32 .* in0 [31:0] $end
$var wire 32 /* in1 [31:0] $end
$var wire 1 0* s $end
$var parameter 32 1* N $end
$var reg 32 2* out [31:0] $end
$upscope $end
$scope module MUX2 $end
$var wire 32 3* in0 [31:0] $end
$var wire 32 4* in1 [31:0] $end
$var wire 1 5* s $end
$var parameter 32 6* N $end
$var reg 32 7* out [31:0] $end
$upscope $end
$upscope $end
$scope module MUX2 $end
$var wire 32 8* in0 [31:0] $end
$var wire 32 9* in1 [31:0] $end
$var wire 1 :* s $end
$var parameter 32 ;* N $end
$var reg 32 <* out [31:0] $end
$upscope $end
$upscope $end
$scope module MUX2 $end
$var wire 32 =* in0 [31:0] $end
$var wire 32 >* in1 [31:0] $end
$var wire 1 ?* s $end
$var parameter 32 @* N $end
$var reg 32 A* out [31:0] $end
$upscope $end
$upscope $end
$scope module MUX1 $end
$var wire 32 B* in0 [31:0] $end
$var wire 32 C* in1 [31:0] $end
$var wire 32 D* in10 [31:0] $end
$var wire 32 E* in11 [31:0] $end
$var wire 32 F* in12 [31:0] $end
$var wire 32 G* in13 [31:0] $end
$var wire 32 H* in14 [31:0] $end
$var wire 32 I* in15 [31:0] $end
$var wire 32 J* in2 [31:0] $end
$var wire 32 K* in3 [31:0] $end
$var wire 32 L* in4 [31:0] $end
$var wire 32 M* in5 [31:0] $end
$var wire 32 N* in6 [31:0] $end
$var wire 32 O* in7 [31:0] $end
$var wire 32 P* in8 [31:0] $end
$var wire 32 Q* in9 [31:0] $end
$var wire 4 R* s [3:0] $end
$var wire 32 S* out [31:0] $end
$var wire 32 T* mux1_out [31:0] $end
$var wire 32 U* mux0_out [31:0] $end
$var parameter 32 V* N $end
$scope module MUX0 $end
$var wire 32 W* in0 [31:0] $end
$var wire 32 X* in1 [31:0] $end
$var wire 32 Y* in2 [31:0] $end
$var wire 32 Z* in3 [31:0] $end
$var wire 32 [* in4 [31:0] $end
$var wire 32 \* in5 [31:0] $end
$var wire 32 ]* in6 [31:0] $end
$var wire 32 ^* in7 [31:0] $end
$var wire 3 _* s [2:0] $end
$var wire 32 `* out [31:0] $end
$var wire 32 a* mux1_out [31:0] $end
$var wire 32 b* mux0_out [31:0] $end
$var parameter 32 c* N $end
$scope module MUX0 $end
$var wire 32 d* in0 [31:0] $end
$var wire 32 e* in1 [31:0] $end
$var wire 32 f* in2 [31:0] $end
$var wire 32 g* in3 [31:0] $end
$var wire 2 h* s [1:0] $end
$var wire 32 i* out [31:0] $end
$var wire 32 j* mux1_out [31:0] $end
$var wire 32 k* mux0_out [31:0] $end
$var parameter 32 l* N $end
$scope module MUX0 $end
$var wire 32 m* in0 [31:0] $end
$var wire 32 n* in1 [31:0] $end
$var wire 1 o* s $end
$var parameter 32 p* N $end
$var reg 32 q* out [31:0] $end
$upscope $end
$scope module MUX1 $end
$var wire 32 r* in0 [31:0] $end
$var wire 32 s* in1 [31:0] $end
$var wire 1 t* s $end
$var parameter 32 u* N $end
$var reg 32 v* out [31:0] $end
$upscope $end
$scope module MUX2 $end
$var wire 32 w* in0 [31:0] $end
$var wire 32 x* in1 [31:0] $end
$var wire 1 y* s $end
$var parameter 32 z* N $end
$var reg 32 {* out [31:0] $end
$upscope $end
$upscope $end
$scope module MUX1 $end
$var wire 32 |* in0 [31:0] $end
$var wire 32 }* in1 [31:0] $end
$var wire 32 ~* in2 [31:0] $end
$var wire 32 !+ in3 [31:0] $end
$var wire 2 "+ s [1:0] $end
$var wire 32 #+ out [31:0] $end
$var wire 32 $+ mux1_out [31:0] $end
$var wire 32 %+ mux0_out [31:0] $end
$var parameter 32 &+ N $end
$scope module MUX0 $end
$var wire 32 '+ in0 [31:0] $end
$var wire 32 (+ in1 [31:0] $end
$var wire 1 )+ s $end
$var parameter 32 *+ N $end
$var reg 32 ++ out [31:0] $end
$upscope $end
$scope module MUX1 $end
$var wire 32 ,+ in0 [31:0] $end
$var wire 32 -+ in1 [31:0] $end
$var wire 1 .+ s $end
$var parameter 32 /+ N $end
$var reg 32 0+ out [31:0] $end
$upscope $end
$scope module MUX2 $end
$var wire 32 1+ in0 [31:0] $end
$var wire 32 2+ in1 [31:0] $end
$var wire 1 3+ s $end
$var parameter 32 4+ N $end
$var reg 32 5+ out [31:0] $end
$upscope $end
$upscope $end
$scope module MUX2 $end
$var wire 32 6+ in0 [31:0] $end
$var wire 32 7+ in1 [31:0] $end
$var wire 1 8+ s $end
$var parameter 32 9+ N $end
$var reg 32 :+ out [31:0] $end
$upscope $end
$upscope $end
$scope module MUX1 $end
$var wire 32 ;+ in0 [31:0] $end
$var wire 32 <+ in1 [31:0] $end
$var wire 32 =+ in2 [31:0] $end
$var wire 32 >+ in3 [31:0] $end
$var wire 32 ?+ in4 [31:0] $end
$var wire 32 @+ in5 [31:0] $end
$var wire 32 A+ in6 [31:0] $end
$var wire 32 B+ in7 [31:0] $end
$var wire 3 C+ s [2:0] $end
$var wire 32 D+ out [31:0] $end
$var wire 32 E+ mux1_out [31:0] $end
$var wire 32 F+ mux0_out [31:0] $end
$var parameter 32 G+ N $end
$scope module MUX0 $end
$var wire 32 H+ in0 [31:0] $end
$var wire 32 I+ in1 [31:0] $end
$var wire 32 J+ in2 [31:0] $end
$var wire 32 K+ in3 [31:0] $end
$var wire 2 L+ s [1:0] $end
$var wire 32 M+ out [31:0] $end
$var wire 32 N+ mux1_out [31:0] $end
$var wire 32 O+ mux0_out [31:0] $end
$var parameter 32 P+ N $end
$scope module MUX0 $end
$var wire 32 Q+ in0 [31:0] $end
$var wire 32 R+ in1 [31:0] $end
$var wire 1 S+ s $end
$var parameter 32 T+ N $end
$var reg 32 U+ out [31:0] $end
$upscope $end
$scope module MUX1 $end
$var wire 32 V+ in0 [31:0] $end
$var wire 32 W+ in1 [31:0] $end
$var wire 1 X+ s $end
$var parameter 32 Y+ N $end
$var reg 32 Z+ out [31:0] $end
$upscope $end
$scope module MUX2 $end
$var wire 32 [+ in0 [31:0] $end
$var wire 32 \+ in1 [31:0] $end
$var wire 1 ]+ s $end
$var parameter 32 ^+ N $end
$var reg 32 _+ out [31:0] $end
$upscope $end
$upscope $end
$scope module MUX1 $end
$var wire 32 `+ in0 [31:0] $end
$var wire 32 a+ in1 [31:0] $end
$var wire 32 b+ in2 [31:0] $end
$var wire 32 c+ in3 [31:0] $end
$var wire 2 d+ s [1:0] $end
$var wire 32 e+ out [31:0] $end
$var wire 32 f+ mux1_out [31:0] $end
$var wire 32 g+ mux0_out [31:0] $end
$var parameter 32 h+ N $end
$scope module MUX0 $end
$var wire 32 i+ in0 [31:0] $end
$var wire 32 j+ in1 [31:0] $end
$var wire 1 k+ s $end
$var parameter 32 l+ N $end
$var reg 32 m+ out [31:0] $end
$upscope $end
$scope module MUX1 $end
$var wire 32 n+ in0 [31:0] $end
$var wire 32 o+ in1 [31:0] $end
$var wire 1 p+ s $end
$var parameter 32 q+ N $end
$var reg 32 r+ out [31:0] $end
$upscope $end
$scope module MUX2 $end
$var wire 32 s+ in0 [31:0] $end
$var wire 32 t+ in1 [31:0] $end
$var wire 1 u+ s $end
$var parameter 32 v+ N $end
$var reg 32 w+ out [31:0] $end
$upscope $end
$upscope $end
$scope module MUX2 $end
$var wire 32 x+ in0 [31:0] $end
$var wire 32 y+ in1 [31:0] $end
$var wire 1 z+ s $end
$var parameter 32 {+ N $end
$var reg 32 |+ out [31:0] $end
$upscope $end
$upscope $end
$scope module MUX2 $end
$var wire 32 }+ in0 [31:0] $end
$var wire 32 ~+ in1 [31:0] $end
$var wire 1 !, s $end
$var parameter 32 ", N $end
$var reg 32 #, out [31:0] $end
$upscope $end
$upscope $end
$scope module MUX2 $end
$var wire 32 $, in0 [31:0] $end
$var wire 32 %, in1 [31:0] $end
$var wire 1 &, s $end
$var parameter 32 ', N $end
$var reg 32 (, out [31:0] $end
$upscope $end
$upscope $end
$upscope $end
$scope module ZERO_OUT_SHIFTER_MUX $end
$var wire 32 ), in0 [31:0] $end
$var wire 32 *, in1 [31:0] $end
$var wire 1 v s $end
$var parameter 32 +, N $end
$var reg 32 ,, out [31:0] $end
$upscope $end
$scope begin alu_muxing $end
$upscope $end
$scope begin basic_gates $end
$upscope $end
$upscope $end
$scope module ALU_REGISTER $end
$var wire 1 " clk $end
$var wire 32 -, d [31:0] $end
$var wire 1 ., ena $end
$var wire 1 & rst $end
$var parameter 32 /, N $end
$var parameter 32 0, RESET $end
$var reg 32 1, q [31:0] $end
$upscope $end
$scope module IR_REGISTER $end
$var wire 1 " clk $end
$var wire 1 8 ena $end
$var wire 1 & rst $end
$var wire 32 2, d [31:0] $end
$var parameter 32 3, N $end
$var parameter 32 4, RESET $end
$var reg 32 5, q [31:0] $end
$upscope $end
$scope module MEM_DATA_REGISTER $end
$var wire 1 " clk $end
$var wire 1 I ena $end
$var wire 1 & rst $end
$var wire 32 6, d [31:0] $end
$var parameter 32 7, N $end
$var parameter 32 8, RESET $end
$var reg 32 9, q [31:0] $end
$upscope $end
$scope module PC_OLD_REGISTER $end
$var wire 1 " clk $end
$var wire 1 8 ena $end
$var wire 1 & rst $end
$var wire 32 :, d [31:0] $end
$var parameter 32 ;, N $end
$var parameter 32 <, RESET $end
$var reg 32 =, q [31:0] $end
$upscope $end
$scope module PC_REGISTER $end
$var wire 1 " clk $end
$var wire 32 >, d [31:0] $end
$var wire 1 9 ena $end
$var wire 1 & rst $end
$var parameter 32 ?, N $end
$var parameter 32 @, RESET $end
$var reg 32 A, q [31:0] $end
$upscope $end
$scope module REGISTER_A $end
$var wire 1 " clk $end
$var wire 1 B, ena $end
$var wire 1 & rst $end
$var wire 32 C, d [31:0] $end
$var parameter 32 D, N $end
$var parameter 32 E, RESET $end
$var reg 32 F, q [31:0] $end
$upscope $end
$scope module REGISTER_B $end
$var wire 1 " clk $end
$var wire 1 G, ena $end
$var wire 1 & rst $end
$var wire 32 H, d [31:0] $end
$var parameter 32 I, N $end
$var parameter 32 J, RESET $end
$var reg 32 K, q [31:0] $end
$upscope $end
$scope module REGISTER_FILE $end
$var wire 1 " clk $end
$var wire 5 L, rd_addr0 [4:0] $end
$var wire 5 M, rd_addr1 [4:0] $end
$var wire 1 & rst $end
$var wire 5 N, wr_addr [4:0] $end
$var wire 32 O, wr_data [31:0] $end
$var wire 1 Q wr_ena $end
$var wire 32 P, x31 [31:0] $end
$var wire 32 Q, x30 [31:0] $end
$var wire 32 R, x29 [31:0] $end
$var wire 32 S, x28 [31:0] $end
$var wire 32 T, x27 [31:0] $end
$var wire 32 U, x26 [31:0] $end
$var wire 32 V, x25 [31:0] $end
$var wire 32 W, x24 [31:0] $end
$var wire 32 X, x23 [31:0] $end
$var wire 32 Y, x22 [31:0] $end
$var wire 32 Z, x21 [31:0] $end
$var wire 32 [, x20 [31:0] $end
$var wire 32 \, x19 [31:0] $end
$var wire 32 ], x18 [31:0] $end
$var wire 32 ^, x17 [31:0] $end
$var wire 32 _, x16 [31:0] $end
$var wire 32 `, x15 [31:0] $end
$var wire 32 a, x14 [31:0] $end
$var wire 32 b, x13 [31:0] $end
$var wire 32 c, x12 [31:0] $end
$var wire 32 d, x11 [31:0] $end
$var wire 32 e, x10 [31:0] $end
$var wire 32 f, x09 [31:0] $end
$var wire 32 g, x08 [31:0] $end
$var wire 32 h, x07 [31:0] $end
$var wire 32 i, x06 [31:0] $end
$var wire 32 j, x05 [31:0] $end
$var wire 32 k, x04 [31:0] $end
$var wire 32 l, x03 [31:0] $end
$var wire 32 m, x02 [31:0] $end
$var wire 32 n, x01 [31:0] $end
$var reg 32 o, a0 [31:0] $end
$var reg 32 p, a1 [31:0] $end
$var reg 32 q, a2 [31:0] $end
$var reg 32 r, a3 [31:0] $end
$var reg 32 s, a4 [31:0] $end
$var reg 32 t, a5 [31:0] $end
$var reg 32 u, a6 [31:0] $end
$var reg 32 v, a7 [31:0] $end
$var reg 32 w, fp [31:0] $end
$var reg 32 x, gp [31:0] $end
$var reg 32 y, ra [31:0] $end
$var reg 32 z, rd_data0 [31:0] $end
$var reg 32 {, rd_data1 [31:0] $end
$var reg 32 |, s0 [31:0] $end
$var reg 32 }, s1 [31:0] $end
$var reg 32 ~, s10 [31:0] $end
$var reg 32 !- s11 [31:0] $end
$var reg 32 "- s2 [31:0] $end
$var reg 32 #- s3 [31:0] $end
$var reg 32 $- s4 [31:0] $end
$var reg 32 %- s5 [31:0] $end
$var reg 32 &- s6 [31:0] $end
$var reg 32 '- s7 [31:0] $end
$var reg 32 (- s8 [31:0] $end
$var reg 32 )- s9 [31:0] $end
$var reg 32 *- sp [31:0] $end
$var reg 32 +- t0 [31:0] $end
$var reg 32 ,- t1 [31:0] $end
$var reg 32 -- t2 [31:0] $end
$var reg 32 .- t3 [31:0] $end
$var reg 32 /- t4 [31:0] $end
$var reg 32 0- t5 [31:0] $end
$var reg 32 1- t6 [31:0] $end
$var reg 32 2- tp [31:0] $end
$var reg 32 3- wr_enas [31:0] $end
$var reg 32 4- x00 [31:0] $end
$scope function print_state $end
$upscope $end
$scope module register_x1 $end
$var wire 1 " clk $end
$var wire 32 5- d [31:0] $end
$var wire 1 6- ena $end
$var wire 1 & rst $end
$var parameter 32 7- N $end
$var parameter 32 8- RESET $end
$var reg 32 9- q [31:0] $end
$upscope $end
$scope module register_x10 $end
$var wire 1 " clk $end
$var wire 32 :- d [31:0] $end
$var wire 1 ;- ena $end
$var wire 1 & rst $end
$var parameter 32 <- N $end
$var parameter 32 =- RESET $end
$var reg 32 >- q [31:0] $end
$upscope $end
$scope module register_x11 $end
$var wire 1 " clk $end
$var wire 32 ?- d [31:0] $end
$var wire 1 @- ena $end
$var wire 1 & rst $end
$var parameter 32 A- N $end
$var parameter 32 B- RESET $end
$var reg 32 C- q [31:0] $end
$upscope $end
$scope module register_x12 $end
$var wire 1 " clk $end
$var wire 32 D- d [31:0] $end
$var wire 1 E- ena $end
$var wire 1 & rst $end
$var parameter 32 F- N $end
$var parameter 32 G- RESET $end
$var reg 32 H- q [31:0] $end
$upscope $end
$scope module register_x13 $end
$var wire 1 " clk $end
$var wire 32 I- d [31:0] $end
$var wire 1 J- ena $end
$var wire 1 & rst $end
$var parameter 32 K- N $end
$var parameter 32 L- RESET $end
$var reg 32 M- q [31:0] $end
$upscope $end
$scope module register_x14 $end
$var wire 1 " clk $end
$var wire 32 N- d [31:0] $end
$var wire 1 O- ena $end
$var wire 1 & rst $end
$var parameter 32 P- N $end
$var parameter 32 Q- RESET $end
$var reg 32 R- q [31:0] $end
$upscope $end
$scope module register_x15 $end
$var wire 1 " clk $end
$var wire 32 S- d [31:0] $end
$var wire 1 T- ena $end
$var wire 1 & rst $end
$var parameter 32 U- N $end
$var parameter 32 V- RESET $end
$var reg 32 W- q [31:0] $end
$upscope $end
$scope module register_x16 $end
$var wire 1 " clk $end
$var wire 32 X- d [31:0] $end
$var wire 1 Y- ena $end
$var wire 1 & rst $end
$var parameter 32 Z- N $end
$var parameter 32 [- RESET $end
$var reg 32 \- q [31:0] $end
$upscope $end
$scope module register_x17 $end
$var wire 1 " clk $end
$var wire 32 ]- d [31:0] $end
$var wire 1 ^- ena $end
$var wire 1 & rst $end
$var parameter 32 _- N $end
$var parameter 32 `- RESET $end
$var reg 32 a- q [31:0] $end
$upscope $end
$scope module register_x18 $end
$var wire 1 " clk $end
$var wire 32 b- d [31:0] $end
$var wire 1 c- ena $end
$var wire 1 & rst $end
$var parameter 32 d- N $end
$var parameter 32 e- RESET $end
$var reg 32 f- q [31:0] $end
$upscope $end
$scope module register_x19 $end
$var wire 1 " clk $end
$var wire 32 g- d [31:0] $end
$var wire 1 h- ena $end
$var wire 1 & rst $end
$var parameter 32 i- N $end
$var parameter 32 j- RESET $end
$var reg 32 k- q [31:0] $end
$upscope $end
$scope module register_x2 $end
$var wire 1 " clk $end
$var wire 32 l- d [31:0] $end
$var wire 1 m- ena $end
$var wire 1 & rst $end
$var parameter 32 n- N $end
$var parameter 32 o- RESET $end
$var reg 32 p- q [31:0] $end
$upscope $end
$scope module register_x20 $end
$var wire 1 " clk $end
$var wire 32 q- d [31:0] $end
$var wire 1 r- ena $end
$var wire 1 & rst $end
$var parameter 32 s- N $end
$var parameter 32 t- RESET $end
$var reg 32 u- q [31:0] $end
$upscope $end
$scope module register_x21 $end
$var wire 1 " clk $end
$var wire 32 v- d [31:0] $end
$var wire 1 w- ena $end
$var wire 1 & rst $end
$var parameter 32 x- N $end
$var parameter 32 y- RESET $end
$var reg 32 z- q [31:0] $end
$upscope $end
$scope module register_x22 $end
$var wire 1 " clk $end
$var wire 32 {- d [31:0] $end
$var wire 1 |- ena $end
$var wire 1 & rst $end
$var parameter 32 }- N $end
$var parameter 32 ~- RESET $end
$var reg 32 !. q [31:0] $end
$upscope $end
$scope module register_x23 $end
$var wire 1 " clk $end
$var wire 32 ". d [31:0] $end
$var wire 1 #. ena $end
$var wire 1 & rst $end
$var parameter 32 $. N $end
$var parameter 32 %. RESET $end
$var reg 32 &. q [31:0] $end
$upscope $end
$scope module register_x24 $end
$var wire 1 " clk $end
$var wire 32 '. d [31:0] $end
$var wire 1 (. ena $end
$var wire 1 & rst $end
$var parameter 32 ). N $end
$var parameter 32 *. RESET $end
$var reg 32 +. q [31:0] $end
$upscope $end
$scope module register_x25 $end
$var wire 1 " clk $end
$var wire 32 ,. d [31:0] $end
$var wire 1 -. ena $end
$var wire 1 & rst $end
$var parameter 32 .. N $end
$var parameter 32 /. RESET $end
$var reg 32 0. q [31:0] $end
$upscope $end
$scope module register_x26 $end
$var wire 1 " clk $end
$var wire 32 1. d [31:0] $end
$var wire 1 2. ena $end
$var wire 1 & rst $end
$var parameter 32 3. N $end
$var parameter 32 4. RESET $end
$var reg 32 5. q [31:0] $end
$upscope $end
$scope module register_x27 $end
$var wire 1 " clk $end
$var wire 32 6. d [31:0] $end
$var wire 1 7. ena $end
$var wire 1 & rst $end
$var parameter 32 8. N $end
$var parameter 32 9. RESET $end
$var reg 32 :. q [31:0] $end
$upscope $end
$scope module register_x28 $end
$var wire 1 " clk $end
$var wire 32 ;. d [31:0] $end
$var wire 1 <. ena $end
$var wire 1 & rst $end
$var parameter 32 =. N $end
$var parameter 32 >. RESET $end
$var reg 32 ?. q [31:0] $end
$upscope $end
$scope module register_x29 $end
$var wire 1 " clk $end
$var wire 32 @. d [31:0] $end
$var wire 1 A. ena $end
$var wire 1 & rst $end
$var parameter 32 B. N $end
$var parameter 32 C. RESET $end
$var reg 32 D. q [31:0] $end
$upscope $end
$scope module register_x3 $end
$var wire 1 " clk $end
$var wire 32 E. d [31:0] $end
$var wire 1 F. ena $end
$var wire 1 & rst $end
$var parameter 32 G. N $end
$var parameter 32 H. RESET $end
$var reg 32 I. q [31:0] $end
$upscope $end
$scope module register_x30 $end
$var wire 1 " clk $end
$var wire 32 J. d [31:0] $end
$var wire 1 K. ena $end
$var wire 1 & rst $end
$var parameter 32 L. N $end
$var parameter 32 M. RESET $end
$var reg 32 N. q [31:0] $end
$upscope $end
$scope module register_x31 $end
$var wire 1 " clk $end
$var wire 32 O. d [31:0] $end
$var wire 1 P. ena $end
$var wire 1 & rst $end
$var parameter 32 Q. N $end
$var parameter 32 R. RESET $end
$var reg 32 S. q [31:0] $end
$upscope $end
$scope module register_x4 $end
$var wire 1 " clk $end
$var wire 32 T. d [31:0] $end
$var wire 1 U. ena $end
$var wire 1 & rst $end
$var parameter 32 V. N $end
$var parameter 32 W. RESET $end
$var reg 32 X. q [31:0] $end
$upscope $end
$scope module register_x5 $end
$var wire 1 " clk $end
$var wire 32 Y. d [31:0] $end
$var wire 1 Z. ena $end
$var wire 1 & rst $end
$var parameter 32 [. N $end
$var parameter 32 \. RESET $end
$var reg 32 ]. q [31:0] $end
$upscope $end
$scope module register_x6 $end
$var wire 1 " clk $end
$var wire 32 ^. d [31:0] $end
$var wire 1 _. ena $end
$var wire 1 & rst $end
$var parameter 32 `. N $end
$var parameter 32 a. RESET $end
$var reg 32 b. q [31:0] $end
$upscope $end
$scope module register_x7 $end
$var wire 1 " clk $end
$var wire 32 c. d [31:0] $end
$var wire 1 d. ena $end
$var wire 1 & rst $end
$var parameter 32 e. N $end
$var parameter 32 f. RESET $end
$var reg 32 g. q [31:0] $end
$upscope $end
$scope module register_x8 $end
$var wire 1 " clk $end
$var wire 32 h. d [31:0] $end
$var wire 1 i. ena $end
$var wire 1 & rst $end
$var parameter 32 j. N $end
$var parameter 32 k. RESET $end
$var reg 32 l. q [31:0] $end
$upscope $end
$scope module register_x9 $end
$var wire 1 " clk $end
$var wire 32 m. d [31:0] $end
$var wire 1 n. ena $end
$var wire 1 & rst $end
$var parameter 32 o. N $end
$var parameter 32 p. RESET $end
$var reg 32 q. q [31:0] $end
$upscope $end
$scope begin REGISTER_ALIASES $end
$upscope $end
$scope begin read_mux0 $end
$upscope $end
$scope begin read_mux1 $end
$upscope $end
$scope begin write_enable_decoder_shifter $end
$upscope $end
$upscope $end
$scope begin ALU_CONTROL_DECODING $end
$upscope $end
$scope begin ALU_MUX_A $end
$upscope $end
$scope begin ALU_MUX_B $end
$upscope $end
$scope begin MEM_ADDR_MUX $end
$upscope $end
$scope begin MULTICYCLE_FSM $end
$upscope $end
$scope begin PC_and_IR_control_unit $end
$upscope $end
$scope begin RESULT_ALIASES $end
$upscope $end
$scope begin RESULT_MUX $end
$upscope $end
$scope begin alu_control_unit $end
$upscope $end
$scope begin instruction_decoder $end
$upscope $end
$scope begin memory_control_unit $end
$upscope $end
$scope begin register_file_control_unit $end
$upscope $end
$scope task print_rfile $end
$upscope $end
$upscope $end
$upscope $end
$enddefinitions $end
$comment Show the parameter values. $end
$dumpall
b0 p.
b100000 o.
b0 k.
b100000 j.
b0 f.
b100000 e.
b0 a.
b100000 `.
b0 \.
b100000 [.
b0 W.
b100000 V.
b0 R.
b100000 Q.
b0 M.
b100000 L.
b0 H.
b100000 G.
b0 C.
b100000 B.
b0 >.
b100000 =.
b0 9.
b100000 8.
b0 4.
b100000 3.
b0 /.
b100000 ..
b0 *.
b100000 ).
b0 %.
b100000 $.
b0 ~-
b100000 }-
b0 y-
b100000 x-
b0 t-
b100000 s-
b0 o-
b100000 n-
b0 j-
b100000 i-
b0 e-
b100000 d-
b0 `-
b100000 _-
b0 [-
b100000 Z-
b0 V-
b100000 U-
b0 Q-
b100000 P-
b0 L-
b100000 K-
b0 G-
b100000 F-
b0 B-
b100000 A-
b0 =-
b100000 <-
b0 8-
b100000 7-
b0 J,
b100000 I,
b0 E,
b100000 D,
b0 @,
b100000 ?,
b0 <,
b100000 ;,
b0 8,
b100000 7,
b0 4,
b100000 3,
b0 0,
b100000 /,
b100000 +,
b100000 ',
b100000 ",
b100000 {+
b100000 v+
b100000 q+
b100000 l+
b100000 h+
b100000 ^+
b100000 Y+
b100000 T+
b100000 P+
b100000 G+
b100000 9+
b100000 4+
b100000 /+
b100000 *+
b100000 &+
b100000 z*
b100000 u*
b100000 p*
b100000 l*
b100000 c*
b100000 V*
b100000 @*
b100000 ;*
b100000 6*
b100000 1*
b100000 ,*
b100000 (*
b100000 |)
b100000 w)
b100000 r)
b100000 n)
b100000 e)
b100000 W)
b100000 R)
b100000 M)
b100000 H)
b100000 D)
b100000 :)
b100000 5)
b100000 0)
b100000 ,)
b100000 #)
b100000 t(
b100000 _(
b100000 9(
b100000 3(
b100000 .(
b100000 )(
b100000 $(
b100000 }'
b100000 x'
b100000 t'
b100000 j'
b100000 e'
b100000 `'
b100000 \'
b100000 S'
b100000 E'
b100000 @'
b100000 ;'
b100000 6'
b100000 2'
b100000 ('
b100000 #'
b100000 |&
b100000 x&
b100000 o&
b100000 b&
b100000 L&
b100000 G&
b100000 B&
b100000 =&
b100000 8&
b100000 4&
b100000 *&
b100000 %&
b100000 ~%
b100000 z%
b100000 q%
b100000 c%
b100000 ^%
b100000 Y%
b100000 T%
b100000 P%
b100000 F%
b100000 A%
b100000 <%
b100000 8%
b100000 /%
b100000 "%
b100000 k$
b100000 F$
b100000 A$
b100000 <$
b100000 8$
b100000 4$
b100000 /$
b100000 *$
b100000 %$
b11111 z#
b11110 t#
b11101 n#
b11100 h#
b11011 b#
b11010 \#
b11001 V#
b11000 P#
b10111 J#
b10110 D#
b10101 >#
b10100 8#
b10011 2#
b10010 ,#
b10001 &#
b10000 ~"
b1111 x"
b1110 r"
b1101 l"
b1100 f"
b1011 `"
b1010 Z"
b1001 T"
b1000 N"
b111 H"
b110 B"
b101 <"
b100 6"
b11 0"
b10 *"
b1 $"
b0 |
b100000 {
b100000 j
b0 6
b1000 5
$end
#0
$dumpvars
bx q.
0n.
bx m.
bx l.
0i.
bx h.
bx g.
0d.
bx c.
bx b.
0_.
bx ^.
bx ].
0Z.
bx Y.
bx X.
0U.
bx T.
bx S.
0P.
bx O.
bx N.
0K.
bx J.
bx I.
0F.
bx E.
bx D.
0A.
bx @.
bx ?.
0<.
bx ;.
bx :.
07.
bx 6.
bx 5.
02.
bx 1.
bx 0.
0-.
bx ,.
bx +.
0(.
bx '.
bx &.
0#.
bx ".
bx !.
0|-
bx {-
bx z-
0w-
bx v-
bx u-
0r-
bx q-
bx p-
0m-
bx l-
bx k-
0h-
bx g-
bx f-
0c-
bx b-
bx a-
0^-
bx ]-
bx \-
0Y-
bx X-
bx W-
0T-
bx S-
bx R-
0O-
bx N-
bx M-
0J-
bx I-
bx H-
0E-
bx D-
bx C-
0@-
bx ?-
bx >-
0;-
bx :-
bx 9-
06-
bx 5-
b0 4-
b0 3-
bx 2-
bx 1-
bx 0-
bx /-
bx .-
bx --
bx ,-
bx +-
bx *-
bx )-
bx (-
bx '-
bx &-
bx %-
bx $-
bx #-
bx "-
bx !-
bx ~,
bx },
bx |,
bx {,
bx z,
bx y,
bx x,
bx w,
bx v,
bx u,
bx t,
bx s,
bx r,
bx q,
bx p,
bx o,
bx n,
bx m,
bx l,
bx k,
bx j,
bx i,
bx h,
bx g,
bx f,
bx e,
bx d,
bx c,
bx b,
bx a,
bx `,
bx _,
bx ^,
bx ],
bx \,
bx [,
bx Z,
bx Y,
bx X,
bx W,
bx V,
bx U,
bx T,
bx S,
bx R,
bx Q,
bx P,
bx O,
bx N,
bx M,
bx L,
bx K,
bx H,
1G,
bx F,
bx C,
1B,
bx A,
bx >,
bx =,
bx :,
bx 9,
bx 6,
bx 5,
bx 2,
bx 1,
1.,
bx -,
bx ,,
b0 *,
bx ),
bx (,
x&,
b0xxxxxxxxxxxxxxxx %,
bx $,
b0xxxxxxxxxxxxxxxx #,
x!,
b0xxxxxxxx ~+
b0xxxxxxxxxxxxxxxx }+
b0xxxxxxxx |+
xz+
b0xxxx y+
b0xxxxxxxx x+
b0xxxx w+
xu+
b0xx t+
b0xxxx s+
b0xx r+
xp+
b0x o+
b0xx n+
b0xxxx m+
xk+
b0xxx j+
b0xxxx i+
b0xxxx g+
b0xx f+
b0xxxx e+
bx d+
b0x c+
b0xx b+
b0xxx a+
b0xxxx `+
b0xxxxxxxx _+
x]+
b0xxxxxx \+
b0xxxxxxxx [+
b0xxxxxx Z+
xX+
b0xxxxx W+
b0xxxxxx V+
b0xxxxxxxx U+
xS+
b0xxxxxxx R+
b0xxxxxxxx Q+
b0xxxxxxxx O+
b0xxxxxx N+
b0xxxxxxxx M+
bx L+
b0xxxxx K+
b0xxxxxx J+
b0xxxxxxx I+
b0xxxxxxxx H+
b0xxxxxxxx F+
b0xxxx E+
b0xxxxxxxx D+
bx C+
b0x B+
b0xx A+
b0xxx @+
b0xxxx ?+
b0xxxxx >+
b0xxxxxx =+
b0xxxxxxx <+
b0xxxxxxxx ;+
b0xxxxxxxxxxxxxxxx :+
x8+
b0xxxxxxxxxxxx 7+
b0xxxxxxxxxxxxxxxx 6+
b0xxxxxxxxxxxx 5+
x3+
b0xxxxxxxxxx 2+
b0xxxxxxxxxxxx 1+
b0xxxxxxxxxx 0+
x.+
b0xxxxxxxxx -+
b0xxxxxxxxxx ,+
b0xxxxxxxxxxxx ++
x)+
b0xxxxxxxxxxx (+
b0xxxxxxxxxxxx '+
b0xxxxxxxxxxxx %+
b0xxxxxxxxxx $+
b0xxxxxxxxxxxx #+
bx "+
b0xxxxxxxxx !+
b0xxxxxxxxxx ~*
b0xxxxxxxxxxx }*
b0xxxxxxxxxxxx |*
b0xxxxxxxxxxxxxxxx {*
xy*
b0xxxxxxxxxxxxxx x*
b0xxxxxxxxxxxxxxxx w*
b0xxxxxxxxxxxxxx v*
xt*
b0xxxxxxxxxxxxx s*
b0xxxxxxxxxxxxxx r*
b0xxxxxxxxxxxxxxxx q*
xo*
b0xxxxxxxxxxxxxxx n*
b0xxxxxxxxxxxxxxxx m*
b0xxxxxxxxxxxxxxxx k*
b0xxxxxxxxxxxxxx j*
b0xxxxxxxxxxxxxxxx i*
bx h*
b0xxxxxxxxxxxxx g*
b0xxxxxxxxxxxxxx f*
b0xxxxxxxxxxxxxxx e*
b0xxxxxxxxxxxxxxxx d*
b0xxxxxxxxxxxxxxxx b*
b0xxxxxxxxxxxx a*
b0xxxxxxxxxxxxxxxx `*
bx _*
b0xxxxxxxxx ^*
b0xxxxxxxxxx ]*
b0xxxxxxxxxxx \*
b0xxxxxxxxxxxx [*
b0xxxxxxxxxxxxx Z*
b0xxxxxxxxxxxxxx Y*
b0xxxxxxxxxxxxxxx X*
b0xxxxxxxxxxxxxxxx W*
b0xxxxxxxxxxxxxxxx U*
b0xxxxxxxx T*
b0xxxxxxxxxxxxxxxx S*
bx R*
b0xxxxxxx Q*
b0xxxxxxxx P*
b0xxxxxxxxx O*
b0xxxxxxxxxx N*
b0xxxxxxxxxxx M*
b0xxxxxxxxxxxx L*
b0xxxxxxxxxxxxx K*
b0xxxxxxxxxxxxxx J*
b0x I*
b0xx H*
b0xxx G*
b0xxxx F*
b0xxxxx E*
b0xxxxxx D*
b0xxxxxxxxxxxxxxx C*
b0xxxxxxxxxxxxxxxx B*
bx A*
x?*
b0xxxxxxxxxxxxxxxxxxxxxxxx >*
bx =*
b0xxxxxxxxxxxxxxxxxxxxxxxx <*
x:*
b0xxxxxxxxxxxxxxxxxxxx 9*
b0xxxxxxxxxxxxxxxxxxxxxxxx 8*
b0xxxxxxxxxxxxxxxxxxxx 7*
x5*
b0xxxxxxxxxxxxxxxxxx 4*
b0xxxxxxxxxxxxxxxxxxxx 3*
b0xxxxxxxxxxxxxxxxxx 2*
x0*
b0xxxxxxxxxxxxxxxxx /*
b0xxxxxxxxxxxxxxxxxx .*
b0xxxxxxxxxxxxxxxxxxxx -*
x+*
b0xxxxxxxxxxxxxxxxxxx **
b0xxxxxxxxxxxxxxxxxxxx )*
b0xxxxxxxxxxxxxxxxxxxx '*
b0xxxxxxxxxxxxxxxxxx &*
b0xxxxxxxxxxxxxxxxxxxx %*
bx $*
b0xxxxxxxxxxxxxxxxx #*
b0xxxxxxxxxxxxxxxxxx "*
b0xxxxxxxxxxxxxxxxxxx !*
b0xxxxxxxxxxxxxxxxxxxx ~)
b0xxxxxxxxxxxxxxxxxxxxxxxx })
x{)
b0xxxxxxxxxxxxxxxxxxxxxx z)
b0xxxxxxxxxxxxxxxxxxxxxxxx y)
b0xxxxxxxxxxxxxxxxxxxxxx x)
xv)
b0xxxxxxxxxxxxxxxxxxxxx u)
b0xxxxxxxxxxxxxxxxxxxxxx t)
b0xxxxxxxxxxxxxxxxxxxxxxxx s)
xq)
b0xxxxxxxxxxxxxxxxxxxxxxx p)
b0xxxxxxxxxxxxxxxxxxxxxxxx o)
b0xxxxxxxxxxxxxxxxxxxxxxxx m)
b0xxxxxxxxxxxxxxxxxxxxxx l)
b0xxxxxxxxxxxxxxxxxxxxxxxx k)
bx j)
b0xxxxxxxxxxxxxxxxxxxxx i)
b0xxxxxxxxxxxxxxxxxxxxxx h)
b0xxxxxxxxxxxxxxxxxxxxxxx g)
b0xxxxxxxxxxxxxxxxxxxxxxxx f)
b0xxxxxxxxxxxxxxxxxxxxxxxx d)
b0xxxxxxxxxxxxxxxxxxxx c)
b0xxxxxxxxxxxxxxxxxxxxxxxx b)
bx a)
b0xxxxxxxxxxxxxxxxx `)
b0xxxxxxxxxxxxxxxxxx _)
b0xxxxxxxxxxxxxxxxxxx ^)
b0xxxxxxxxxxxxxxxxxxxx ])
b0xxxxxxxxxxxxxxxxxxxxx \)
b0xxxxxxxxxxxxxxxxxxxxxx [)
b0xxxxxxxxxxxxxxxxxxxxxxx Z)
b0xxxxxxxxxxxxxxxxxxxxxxxx Y)
bx X)
xV)
b0xxxxxxxxxxxxxxxxxxxxxxxxxxxx U)
bx T)
b0xxxxxxxxxxxxxxxxxxxxxxxxxxxx S)
xQ)
b0xxxxxxxxxxxxxxxxxxxxxxxxxx P)
b0xxxxxxxxxxxxxxxxxxxxxxxxxxxx O)
b0xxxxxxxxxxxxxxxxxxxxxxxxxx N)
xL)
b0xxxxxxxxxxxxxxxxxxxxxxxxx K)
b0xxxxxxxxxxxxxxxxxxxxxxxxxx J)
b0xxxxxxxxxxxxxxxxxxxxxxxxxxxx I)
xG)
b0xxxxxxxxxxxxxxxxxxxxxxxxxxx F)
b0xxxxxxxxxxxxxxxxxxxxxxxxxxxx E)
b0xxxxxxxxxxxxxxxxxxxxxxxxxxxx C)
b0xxxxxxxxxxxxxxxxxxxxxxxxxx B)
b0xxxxxxxxxxxxxxxxxxxxxxxxxxxx A)
bx @)
b0xxxxxxxxxxxxxxxxxxxxxxxxx ?)
b0xxxxxxxxxxxxxxxxxxxxxxxxxx >)
b0xxxxxxxxxxxxxxxxxxxxxxxxxxx =)
b0xxxxxxxxxxxxxxxxxxxxxxxxxxxx <)
bx ;)
x9)
b0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx 8)
bx 7)
b0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx 6)
x4)
b0xxxxxxxxxxxxxxxxxxxxxxxxxxxxx 3)
b0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx 2)
bx 1)
x/)
b0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx .)
bx -)
bx +)
b0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx *)
bx ))
bx ()
b0xxxxxxxxxxxxxxxxxxxxxxxxxxxxx ')
b0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx &)
b0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx %)
bx $)
bx ")
b0xxxxxxxxxxxxxxxxxxxxxxxxxxxx !)
bx ~(
bx }(
b0xxxxxxxxxxxxxxxxxxxxxxxxx |(
b0xxxxxxxxxxxxxxxxxxxxxxxxxx {(
b0xxxxxxxxxxxxxxxxxxxxxxxxxxx z(
b0xxxxxxxxxxxxxxxxxxxxxxxxxxxx y(
b0xxxxxxxxxxxxxxxxxxxxxxxxxxxxx x(
b0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx w(
b0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx v(
bx u(
bx s(
b0xxxxxxxxxxxxxxxxxxxxxxxx r(
bx q(
bx p(
b0xxxxxxxxxxxxxxxxxxxxxxx o(
b0xxxxxxxxxxxxxxxxxxxxxxxx n(
b0xxxxxxxxxxxxxxxxxxxxxxxxx m(
b0xxxxxxxxxxxxxxxxxxxxxxxxxx l(
b0xxxxxxxxxxxxxxxxxxxxxxxxxxx k(
b0xxxxxxxxxxxxxxxxxxxxxxxxxxxx j(
b0xxxxxxxxxxxxxxxxxxxxxxxxxxxxx i(
b0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx h(
b0xxxxxxxxxxxxxxxxx g(
b0xxxxxxxxxxxxxxxxxx f(
b0xxxxxxxxxxxxxxxxxxx e(
b0xxxxxxxxxxxxxxxxxxxx d(
b0xxxxxxxxxxxxxxxxxxxxx c(
b0xxxxxxxxxxxxxxxxxxxxxx b(
b0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx a(
bx `(
bx ^(
b0xxxxxxxxxxxxxxxx ](
bx \(
bx [(
b0xxxxxxxxxxxxxxxxxxxxxxx Z(
b0xxxxxxxxxxxxxxxxxxxxxxxx Y(
b0xxxxxxxxxxxxxxxxxxxxxxxxx X(
b0xxxxxxxxxxxxxxxxxxxxxxxxxx W(
b0xxxxxxxxxxxxxxxxxxxxxxxxxxx V(
b0xxxxxxxxxxxxxxxxxxxxxxxxxxxx U(
b0x T(
b0xx S(
b0xxxxxxxxxxxxxxxxxxxxxxxxxxxxx R(
b0xxx Q(
b0xxxx P(
b0xxxxx O(
b0xxxxxx N(
b0xxxxxxx M(
b0xxxxxxxx L(
b0xxxxxxxxx K(
b0xxxxxxxxxx J(
b0xxxxxxxxxxx I(
b0xxxxxxxxxxxx H(
b0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx G(
b0xxxxxxxxxxxxx F(
b0xxxxxxxxxxxxxx E(
b0xxxxxxxxxxxxxxx D(
b0xxxxxxxxxxxxxxxx C(
b0xxxxxxxxxxxxxxxxx B(
b0xxxxxxxxxxxxxxxxxx A(
b0xxxxxxxxxxxxxxxxxxx @(
b0xxxxxxxxxxxxxxxxxxxx ?(
b0xxxxxxxxxxxxxxxxxxxxx >(
b0xxxxxxxxxxxxxxxxxxxxxx =(
b0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx <(
bx ;(
0:(
bx 8(
bx 7(
bx 6(
05(
bx 4(
x2(
bx0000000000000000 1(
bx 0(
bx0000000000000000 /(
x-(
bx000000000000000000000000 ,(
bx0000000000000000 +(
bx000000000000000000000000 *(
x((
bx0000000000000000000000000000 '(
bx000000000000000000000000 &(
bx0000000000000000000000000000 %(
x#(
bx000000000000000000000000000000 "(
bx0000000000000000000000000000 !(
bx000000000000000000000000000000 ~'
x|'
bx0000000000000000000000000000000 {'
bx000000000000000000000000000000 z'
bx0000000000000000000000000000 y'
xw'
bx00000000000000000000000000000 v'
bx0000000000000000000000000000 u'
bx0000000000000000000000000000 s'
bx000000000000000000000000000000 r'
bx0000000000000000000000000000 q'
bx p'
bx0000000000000000000000000000000 o'
bx000000000000000000000000000000 n'
bx00000000000000000000000000000 m'
bx0000000000000000000000000000 l'
bx000000000000000000000000 k'
xi'
bx00000000000000000000000000 h'
bx000000000000000000000000 g'
bx00000000000000000000000000 f'
xd'
bx000000000000000000000000000 c'
bx00000000000000000000000000 b'
bx000000000000000000000000 a'
x_'
bx0000000000000000000000000 ^'
bx000000000000000000000000 ]'
bx000000000000000000000000 ['
bx00000000000000000000000000 Z'
bx000000000000000000000000 Y'
bx X'
bx000000000000000000000000000 W'
bx00000000000000000000000000 V'
bx0000000000000000000000000 U'
bx000000000000000000000000 T'
bx000000000000000000000000 R'
bx0000000000000000000000000000 Q'
bx000000000000000000000000 P'
bx O'
bx0000000000000000000000000000000 N'
bx000000000000000000000000000000 M'
bx00000000000000000000000000000 L'
bx0000000000000000000000000000 K'
bx000000000000000000000000000 J'
bx00000000000000000000000000 I'
bx0000000000000000000000000 H'
bx000000000000000000000000 G'
bx0000000000000000 F'
xD'
bx00000000000000000000 C'
bx0000000000000000 B'
bx00000000000000000000 A'
x?'
bx0000000000000000000000 >'
bx00000000000000000000 ='
bx0000000000000000000000 <'
x:'
bx00000000000000000000000 9'
bx0000000000000000000000 8'
bx00000000000000000000 7'
x5'
bx000000000000000000000 4'
bx00000000000000000000 3'
bx00000000000000000000 1'
bx0000000000000000000000 0'
bx00000000000000000000 /'
bx .'
bx00000000000000000000000 -'
bx0000000000000000000000 ,'
bx000000000000000000000 +'
bx00000000000000000000 *'
bx0000000000000000 )'
x''
bx000000000000000000 &'
bx0000000000000000 %'
bx000000000000000000 $'
x"'
bx0000000000000000000 !'
bx000000000000000000 ~&
bx0000000000000000 }&
x{&
bx00000000000000000 z&
bx0000000000000000 y&
bx0000000000000000 w&
bx000000000000000000 v&
bx0000000000000000 u&
bx t&
bx0000000000000000000 s&
bx000000000000000000 r&
bx00000000000000000 q&
bx0000000000000000 p&
bx0000000000000000 n&
bx00000000000000000000 m&
bx0000000000000000 l&
bx k&
bx00000000000000000000000 j&
bx0000000000000000000000 i&
bx000000000000000000000 h&
bx00000000000000000000 g&
bx0000000000000000000 f&
bx000000000000000000 e&
bx00000000000000000 d&
bx0000000000000000 c&
bx0000000000000000 a&
bx000000000000000000000000 `&
bx0000000000000000 _&
bx ^&
bx0000000000000000000000000 ]&
bx000000000000000000000000 \&
bx00000000000000000000000 [&
bx0000000000000000000000 Z&
bx000000000000000000000 Y&
bx00000000000000000000 X&
bx0000000000000000000 W&
bx000000000000000000 V&
bx0000000000000000000000000000000 U&
bx000000000000000000000000000000 T&
bx00000000000000000000000000000 S&
bx0000000000000000000000000000 R&
bx000000000000000000000000000 Q&
bx00000000000000000000000000 P&
bx00000000000000000 O&
bx0000000000000000 N&
bx M&
xK&
bx00000000 J&
bx I&
bx00000000 H&
xF&
bx000000000000 E&
bx00000000 D&
bx000000000000 C&
xA&
bx00000000000000 @&
bx000000000000 ?&
bx00000000000000 >&
x<&
bx000000000000000 ;&
bx00000000000000 :&
bx000000000000 9&
x7&
bx0000000000000 6&
bx000000000000 5&
bx000000000000 3&
bx00000000000000 2&
bx000000000000 1&
bx 0&
bx000000000000000 /&
bx00000000000000 .&
bx0000000000000 -&
bx000000000000 ,&
bx00000000 +&
x)&
bx0000000000 (&
bx00000000 '&
bx0000000000 &&
x$&
bx00000000000 #&
bx0000000000 "&
bx00000000 !&
x}%
bx000000000 |%
bx00000000 {%
bx00000000 y%
bx0000000000 x%
bx00000000 w%
bx v%
bx00000000000 u%
bx0000000000 t%
bx000000000 s%
bx00000000 r%
bx00000000 p%
bx000000000000 o%
bx00000000 n%
bx m%
bx000000000000000 l%
bx00000000000000 k%
bx0000000000000 j%
bx000000000000 i%
bx00000000000 h%
bx0000000000 g%
bx000000000 f%
bx00000000 e%
bx d%
xb%
bx0000 a%
bx `%
bx0000 _%
x]%
bx000000 \%
bx0000 [%
bx000000 Z%
xX%
bx0000000 W%
bx000000 V%
bx0000 U%
xS%
bx00000 R%
bx0000 Q%
bx0000 O%
bx000000 N%
bx0000 M%
bx L%
bx0000000 K%
bx000000 J%
bx00000 I%
bx0000 H%
bx G%
xE%
bx00 D%
bx C%
bx00 B%
x@%
bx000 ?%
bx00 >%
bx =%
x;%
bx0 :%
bx 9%
bx 7%
bx00 6%
bx 5%
bx 4%
bx000 3%
bx00 2%
bx0 1%
bx 0%
bx .%
bx0000 -%
bx ,%
bx +%
bx0000000 *%
bx000000 )%
bx00000 (%
bx0000 '%
bx000 &%
bx00 %%
bx0 $%
bx #%
bx !%
bx00000000 ~$
bx }$
bx |$
bx000000000 {$
bx00000000 z$
bx0000000 y$
bx000000 x$
bx00000 w$
bx0000 v$
bx000 u$
bx00 t$
bx000000000000000 s$
bx00000000000000 r$
bx0000000000000 q$
bx000000000000 p$
bx00000000000 o$
bx0000000000 n$
bx0 m$
bx l$
bx j$
bx0000000000000000 i$
bx h$
bx g$
bx000000000 f$
bx00000000 e$
bx0000000 d$
bx000000 c$
bx00000 b$
bx0000 a$
bx0000000000000000000000000000000 `$
bx000000000000000000000000000000 _$
bx000 ^$
bx00000000000000000000000000000 ]$
bx0000000000000000000000000000 \$
bx000000000000000000000000000 [$
bx00000000000000000000000000 Z$
bx0000000000000000000000000 Y$
bx000000000000000000000000 X$
bx00000000000000000000000 W$
bx0000000000000000000000 V$
bx000000000000000000000 U$
bx00000000000000000000 T$
bx00 S$
bx0000000000000000000 R$
bx000000000000000000 Q$
bx00000000000000000 P$
bx0000000000000000 O$
bx000000000000000 N$
bx00000000000000 M$
bx0000000000000 L$
bx000000000000 K$
bx00000000000 J$
bx0000000000 I$
bx0 H$
bx G$
bx E$
bx D$
bx C$
bx B$
bx @$
bx ?$
0>$
bx =$
1;$
bx :$
bx 9$
bx 7$
bx 6$
bx 5$
bx 3$
02$
bx 1$
bx 0$
0.$
bx -$
bx ,$
bx +$
0)$
bx ($
bx '$
bx &$
0$$
b0x #$
bx "$
x!$
x~#
x}#
x|#
x{#
xy#
xx#
xw#
xv#
xu#
xs#
xr#
xq#
xp#
xo#
xm#
xl#
xk#
xj#
xi#
xg#
xf#
xe#
xd#
xc#
xa#
x`#
x_#
x^#
x]#
x[#
xZ#
xY#
xX#
xW#
xU#
xT#
xS#
xR#
xQ#
xO#
xN#
xM#
xL#
xK#
xI#
xH#
xG#
xF#
xE#
xC#
xB#
xA#
x@#
x?#
x=#
x<#
x;#
x:#
x9#
x7#
x6#
x5#
x4#
x3#
x1#
x0#
x/#
x.#
x-#
x+#
x*#
x)#
x(#
x'#
x%#
x$#
x##
x"#
x!#
x}"
x|"
x{"
xz"
xy"
xw"
xv"
xu"
xt"
xs"
xq"
xp"
xo"
xn"
xm"
xk"
xj"
xi"
xh"
xg"
xe"
xd"
xc"
xb"
xa"
x_"
x^"
x]"
x\"
x["
xY"
xX"
xW"
xV"
xU"
xS"
xR"
xQ"
xP"
xO"
xM"
xL"
xK"
xJ"
xI"
xG"
xF"
xE"
xD"
xC"
xA"
x@"
x?"
x>"
x="
x;"
x:"
x9"
x8"
x7"
x5"
x4"
x3"
x2"
x1"
x/"
x."
x-"
x,"
x+"
x)"
x("
x'"
x&"
x%"
x#"
x""
0!"
x~
x}
bx0 z
bx y
bx x
bx w
xv
xu
xt
b0x s
bx r
0q
bx p
bx o
xn
xm
bx l
bx k
bx i
bx h
bx g
bx f
xe
bx d
bx c
bx b
bx a
bx `
bx _
b1000 ^
bx ]
bx \
bx [
bx Z
bx Y
xX
bx W
bx V
bx U
bx T
b0 S
bx R
0Q
bx P
bx O
bx N
0M
bx L
0K
0J
0I
bx H
bx G
bx F
0E
bx D
bx C
bx B
b0 A
0@
0?
b0 >
b1 =
b1000 <
0;
bx :
09
x8
07
bx 4
bx 3
bx 2
bx 1
bx 0
x/
bx .
bx -
x,
bx +
bx *
bx )
bx (
x'
1&
b0 %
1$
z#
0"
z!
$end
#5000
b0 _
b0 3$
b0 ,,
0'
b100 T
b100 O,
b100 5-
b100 :-
b100 ?-
b100 D-
b100 I-
b100 N-
b100 S-
b100 X-
b100 ]-
b100 b-
b100 g-
b100 l-
b100 q-
b100 v-
b100 {-
b100 ".
b100 '.
b100 ,.
b100 1.
b100 6.
b100 ;.
b100 @.
b100 E.
b100 J.
b100 O.
b100 T.
b100 Y.
b100 ^.
b100 c.
b100 h.
b100 m.
b100 :
b100 >,
b0 `
b0 B$
b0 ),
0m
0,
0;%
0@%
0E%
0S%
0X%
0]%
0}%
0$&
0)&
07&
0<&
0A&
0{&
0"'
0''
05'
0:'
0?'
0_'
0d'
0i'
0w'
0|'
0#(
0/)
04)
09)
0G)
0L)
0Q)
0q)
0v)
0{)
0+*
00*
05*
0o*
0t*
0y*
0)+
0.+
03+
0S+
0X+
0]+
0k+
0p+
0u+
05"
0;"
0A"
0G"
0M"
0S"
0Y"
0_"
0e"
0k"
0q"
0w"
0}"
0%#
0+#
01#
07#
0=#
0C#
0I#
0O#
0U#
0[#
0a#
0g#
0m#
0s#
0y#
0!$
b100 R
b0 h
b0 @$
b0 E$
b0 h$
b0 4(
b0 g
b0 ?$
b0 8(
b0 \(
b0 (,
1/"
b100100000000001000010011 -
b100100000000001000010011 2,
b100100000000001000010011 6,
b0 4%
b0 L%
1b%
b0 v%
b0 0&
1F&
b0 t&
b0 .'
1D'
b0 X'
b0 p'
1((
b0 i$
b0 _&
b0 /(
b0 1(
b0 ()
b0 @)
1V)
b0 j)
b0 $*
1:*
b0 h*
b0 "+
18+
b0 L+
b0 d+
1z+
b0 ](
b0 S*
b0 #,
b0 %,
1n
0-"
03"
09"
0?"
0E"
0K"
0Q"
0W"
0]"
0c"
0i"
0o"
0u"
0{"
0##
0)#
0/#
05#
0;#
0A#
0G#
0M#
0S#
0Y#
0_#
0e#
0k#
0q#
0w#
0}#
0e
b100 0
b100 a
b100 =$
b100 -,
b0 ~$
b0 n%
b0 H&
b0 J&
b0 a&
b0 l&
b0 F'
b0 +(
b0 `&
b0 P'
b0 *(
b0 ,(
b0 j$
b0 }$
b0 M&
b0 0(
b0 r(
b0 b)
b0 <*
b0 >*
b0 U*
b0 `*
b0 :+
b0 }+
b0 T*
b0 D+
b0 |+
b0 ~+
b0 ^(
b0 q(
b0 A*
b0 $,
b100 f
b100 &$
b100 :$
b100 +%
b100 m%
0K&
b100 k&
b100 O'
0-(
b100 }(
b100 a)
0?*
b100 _*
b100 C+
0!,
0#"
b100 d
b100 y
b100 "$
0)"
0("
0."
04"
0:"
0@"
0F"
0L"
0R"
0X"
0^"
0d"
0j"
0p"
0v"
0|"
0$#
0*#
00#
06#
0<#
0B#
0H#
0N#
0T#
0Z#
0`#
0f#
0l#
0r#
0x#
0~#
0'"
b100 c
b100 5$
b100 9$
b0 -%
b0 M%
b0 _%
b0 a%
b0 p%
b0 w%
b0 +&
b0 D&
b0 o%
b0 1&
b0 C&
b0 E&
b0 n&
b0 u&
b0 )'
b0 B'
b0 m&
b0 /'
b0 A'
b0 C'
b0 R'
b0 Y'
b0 k'
b0 &(
b0 Q'
b0 q'
b0 %(
b0 '(
b0 !%
b0 ,%
b0 d%
b0 I&
b0 !)
b0 A)
b0 S)
b0 U)
b0 d)
b0 k)
b0 })
b0 8*
b0 c)
b0 %*
b0 7*
b0 9*
b0 b*
b0 i*
b0 {*
b0 6+
b0 a*
b0 #+
b0 5+
b0 7+
b0 F+
b0 M+
b0 _+
b0 x+
b0 E+
b0 e+
b0 w+
b0 y+
b0 s(
b0 ~(
b0 X)
b0 =*
b100 |$
b100 ^&
02(
b100 p(
b100 R*
0&,
0~
0&"
1,"
02"
08"
0>"
0D"
0J"
0P"
0V"
0\"
0b"
0h"
0n"
0t"
0z"
0"#
0(#
0.#
04#
0:#
0@#
0F#
0L#
0R#
0X#
0^#
0d#
0j#
0p#
0v#
0|#
b0 z
0""
b100 b
b100 0$
b100 1$
b0 i
b0 +$
b0 -$
b0 6%
b0 B%
b0 D%
b0 O%
b0 U%
b0 [%
b0 N%
b0 Z%
b0 \%
b0 y%
b0 !&
b0 '&
b0 x%
b0 &&
b0 (&
b0 3&
b0 9&
b0 ?&
b0 2&
b0 >&
b0 @&
b0 w&
b0 }&
b0 %'
b0 v&
b0 $'
b0 &'
b0 1'
b0 7'
b0 ='
b0 0'
b0 <'
b0 >'
b0 ['
b0 a'
b0 g'
b0 Z'
b0 f'
b0 h'
b0 s'
b0 y'
b0 !(
b0 r'
b0 ~'
b0 "(
b0 .%
b0 5%
b0 G%
b0 `%
b0 *)
b0 6)
b0 8)
b0 C)
b0 I)
b0 O)
b0 B)
b0 N)
b0 P)
b0 m)
b0 s)
b0 y)
b0 l)
b0 x)
b0 z)
b0 '*
b0 -*
b0 3*
b0 &*
b0 2*
b0 4*
b0 k*
b0 q*
b0 w*
b0 j*
b0 v*
b0 x*
b0 %+
b0 ++
b0 1+
b0 $+
b0 0+
b0 2+
b0 O+
b0 U+
b0 [+
b0 N+
b0 Z+
b0 \+
b0 g+
b0 m+
b0 s+
b0 f+
b0 r+
b0 t+
b0 ")
b0 ))
b0 ;)
b0 T)
b100 D$
b100 g$
b100 7(
b100 [(
b100 p
b100 x
0v
b1000 U
0}
0%"
0+"
01"
07"
0="
0C"
0I"
0O"
0U"
0["
0a"
0g"
0m"
0s"
0y"
0!#
0'#
0-#
03#
09#
0?#
0E#
0K#
0Q#
0W#
0]#
0c#
0i#
0o#
0u#
0{#
0/
b11111111111111111111111111111011 r
b100 o
b100 ($
b100 l
b100 ,$
b0 k
b0 '$
b0 H$
b0 m$
b0 $%
b0 1%
b0 :%
b0 S$
b0 t$
b0 %%
b0 2%
b0 >%
b0 ^$
b0 u$
b0 &%
b0 3%
b0 ?%
b0 a$
b0 v$
b0 '%
b0 H%
b0 Q%
b0 b$
b0 w$
b0 (%
b0 I%
b0 R%
b0 c$
b0 x$
b0 )%
b0 J%
b0 V%
b0 d$
b0 y$
b0 *%
b0 K%
b0 W%
b0 e$
b0 z$
b0 e%
b0 r%
b0 {%
b0 f$
b0 {$
b0 f%
b0 s%
b0 |%
b0 I$
b0 n$
b0 g%
b0 t%
b0 "&
b0 J$
b0 o$
b0 h%
b0 u%
b0 #&
b0 K$
b0 p$
b0 i%
b0 ,&
b0 5&
b0 L$
b0 q$
b0 j%
b0 -&
b0 6&
b0 M$
b0 r$
b0 k%
b0 .&
b0 :&
b0 N$
b0 s$
b0 l%
b0 /&
b0 ;&
b0 O$
b0 N&
b0 c&
b0 p&
b0 y&
b0 P$
b0 O&
b0 d&
b0 q&
b0 z&
b0 Q$
b0 V&
b0 e&
b0 r&
b0 ~&
b0 R$
b0 W&
b0 f&
b0 s&
b0 !'
b0 T$
b0 X&
b0 g&
b0 *'
b0 3'
b0 U$
b0 Y&
b0 h&
b0 +'
b0 4'
b0 V$
b0 Z&
b0 i&
b0 ,'
b0 8'
b0 W$
b0 [&
b0 j&
b0 -'
b0 9'
b0 X$
b0 \&
b0 G'
b0 T'
b0 ]'
b0 Y$
b0 ]&
b0 H'
b0 U'
b0 ^'
b0 Z$
b0 P&
b0 I'
b0 V'
b0 b'
b0 [$
b0 Q&
b0 J'
b0 W'
b0 c'
b0 \$
b0 R&
b0 K'
b0 l'
b0 u'
b0 ]$
b0 S&
b0 L'
b0 m'
b0 v'
b0 _$
b0 T&
b0 M'
b0 n'
b0 z'
b0 `$
b0 U&
b0 N'
b0 o'
b0 {'
b0 7%
b0 =%
b0 C%
b0 <(
b0 a(
b0 v(
b0 %)
b0 .)
b0 G(
b0 h(
b0 w(
b0 &)
b0 2)
b0 R(
b0 i(
b0 x(
b0 ')
b0 3)
b0 U(
b0 j(
b0 y(
b0 <)
b0 E)
b0 V(
b0 k(
b0 z(
b0 =)
b0 F)
b0 W(
b0 l(
b0 {(
b0 >)
b0 J)
b0 X(
b0 m(
b0 |(
b0 ?)
b0 K)
b0 Y(
b0 n(
b0 Y)
b0 f)
b0 o)
b0 Z(
b0 o(
b0 Z)
b0 g)
b0 p)
b0 =(
b0 b(
b0 [)
b0 h)
b0 t)
b0 >(
b0 c(
b0 \)
b0 i)
b0 u)
b0 ?(
b0 d(
b0 ])
b0 ~)
b0 )*
b0 @(
b0 e(
b0 ^)
b0 !*
b0 **
b0 A(
b0 f(
b0 _)
b0 "*
b0 .*
b0 B(
b0 g(
b0 `)
b0 #*
b0 /*
b0 C(
b0 B*
b0 W*
b0 d*
b0 m*
b0 D(
b0 C*
b0 X*
b0 e*
b0 n*
b0 E(
b0 J*
b0 Y*
b0 f*
b0 r*
b0 F(
b0 K*
b0 Z*
b0 g*
b0 s*
b0 H(
b0 L*
b0 [*
b0 |*
b0 '+
b0 I(
b0 M*
b0 \*
b0 }*
b0 (+
b0 J(
b0 N*
b0 ]*
b0 ~*
b0 ,+
b0 K(
b0 O*
b0 ^*
b0 !+
b0 -+
b0 L(
b0 P*
b0 ;+
b0 H+
b0 Q+
b0 M(
b0 Q*
b0 <+
b0 I+
b0 R+
b0 N(
b0 D*
b0 =+
b0 J+
b0 V+
b0 O(
b0 E*
b0 >+
b0 K+
b0 W+
b0 P(
b0 F*
b0 ?+
b0 `+
b0 i+
b0 Q(
b0 G*
b0 @+
b0 a+
b0 j+
b0 S(
b0 H*
b0 A+
b0 b+
b0 n+
b0 T(
b0 I*
b0 B+
b0 c+
b0 o+
b0 +)
b0 1)
b0 7)
b0 s
b0 #$
1t
1u
b10 >
b0 =
1@
b10 G
19
0?
b0 H
b0 )
b0 C,
b0 z,
b0 (
b0 H,
b0 {,
b0 v,
b0 u,
b0 t,
b0 s,
b0 r,
b0 q,
b0 p,
b0 o,
b0 1-
b0 0-
b0 /-
b0 .-
b0 --
b0 ,-
b0 +-
b0 !-
b0 ~,
b0 )-
b0 (-
b0 '-
b0 &-
b0 %-
b0 $-
b0 #-
b0 "-
b0 },
b0 |,
b0 w,
b0 2-
b0 x,
b0 *-
b0 y,
b0 L
b100 Z
b100 ]
b100 7$
b0 D
b0 C
b0 B
b0 W
b0 M,
b0 V
b0 L,
b0 P
b0 N,
b0 N
b0 Y
b0 \
b0 w
b0 6$
b0 C$
b0 G$
b0 l$
b0 #%
b0 0%
b0 9%
b0 6(
b0 ;(
b0 `(
b0 u(
b0 $)
b0 -)
b0 F
b1111 O
b0 [
b0 3
b0 :,
b0 A,
b0 n,
b0 9-
b0 m,
b0 p-
b0 l,
b0 I.
b0 k,
b0 X.
b0 j,
b0 ].
b0 i,
b0 b.
b0 h,
b0 g.
b0 g,
b0 l.
b0 f,
b0 q.
b0 e,
b0 >-
b0 d,
b0 C-
b0 c,
b0 H-
b0 b,
b0 M-
b0 a,
b0 R-
b0 `,
b0 W-
b0 _,
b0 \-
b0 ^,
b0 a-
b0 ],
b0 f-
b0 \,
b0 k-
b0 [,
b0 u-
b0 Z,
b0 z-
b0 Y,
b0 !.
b0 X,
b0 &.
b0 W,
b0 +.
b0 V,
b0 0.
b0 U,
b0 5.
b0 T,
b0 :.
b0 S,
b0 ?.
b0 R,
b0 D.
b0 Q,
b0 N.
b0 P,
b0 S.
b0 +
b0 F,
b0 *
b0 K,
b0 4
b0 5,
b0 2
b0 =,
b0 1
b0 1,
b0 .
b0 9,
1"
#10000
0"
#15000
1"
#20000
1;
0&
0"
#25000
b0 _
b0 3$
b0 ,,
b0 `
b0 B$
b0 ),
b0 T
b0 O,
b0 5-
b0 :-
b0 ?-
b0 D-
b0 I-
b0 N-
b0 S-
b0 X-
b0 ]-
b0 b-
b0 g-
b0 l-
b0 q-
b0 v-
b0 {-
b0 ".
b0 '.
b0 ,.
b0 1.
b0 6.
b0 ;.
b0 @.
b0 E.
b0 J.
b0 O.
b0 T.
b0 Y.
b0 ^.
b0 c.
b0 h.
b0 m.
b0 :
b0 >,
b0 h
b0 @$
b0 E$
b0 h$
b0 4(
0b%
0F&
0D'
0((
0V)
0:*
08+
0z+
1'
b0 R
b0 j$
b0 }$
b0 M&
b0 0(
b0 i$
b0 _&
b0 /(
b0 1(
b0 +%
b0 m%
b0 k&
b0 O'
b0 }(
b0 a)
b0 _*
b0 C+
b0 0
b0 a
b0 =$
b0 -,
05"
b0 c
b0 5$
b0 9$
b0 !%
b0 ,%
b0 d%
b0 I&
b0 ~$
b0 n%
b0 H&
b0 J&
b0 a&
b0 l&
b0 F'
b0 +(
b0 `&
b0 P'
b0 *(
b0 ,(
b0 |$
b0 ^&
b0 p(
b0 R*
0,"
b0 f
b0 &$
b0 :$
03"
b0 b
b0 0$
b0 1$
b0 -%
b0 M%
b0 _%
b0 a%
b0 p%
b0 w%
b0 +&
b0 D&
b0 o%
b0 1&
b0 C&
b0 E&
b0 n&
b0 u&
b0 )'
b0 B'
b0 m&
b0 /'
b0 A'
b0 C'
b0 R'
b0 Y'
b0 k'
b0 &(
b0 Q'
b0 q'
b0 %(
b0 '(
b0 D$
b0 g$
b0 7(
b0 [(
b0 p
b0 x
b11111111111111111111111111111111 r
b0 l
b0 ,$
b10010011 -
b10010011 2,
b10010011 6,
b0 d
b0 y
b0 "$
0/"
b0 z
0."
1?
b0 i
b0 +$
b0 -$
b0 6%
b0 B%
b0 D%
b0 O%
b0 U%
b0 [%
b0 N%
b0 Z%
b0 \%
b0 y%
b0 !&
b0 '&
b0 x%
b0 &&
b0 (&
b0 3&
b0 9&
b0 ?&
b0 2&
b0 >&
b0 @&
b0 w&
b0 }&
b0 %'
b0 v&
b0 $'
b0 &'
b0 1'
b0 7'
b0 ='
b0 0'
b0 <'
b0 >'
b0 ['
b0 a'
b0 g'
b0 Z'
b0 f'
b0 h'
b0 s'
b0 y'
b0 !(
b0 .%
b0 5%
b0 G%
b0 `%
b0 *)
b0 6)
b0 8)
b0 ")
b0 ))
b0 ;)
b0 T)
b0 Z
b0 ]
b0 7$
0+"
1/
b0 o
b0 ($
b0 k
b0 '$
b0 H$
b0 m$
b0 $%
b0 1%
b0 :%
b0 S$
b0 t$
b0 %%
b0 2%
b0 >%
b0 ^$
b0 u$
b0 &%
b0 3%
b0 ?%
b0 a$
b0 v$
b0 '%
b0 H%
b0 Q%
b0 b$
b0 w$
b0 (%
b0 I%
b0 R%
b0 c$
b0 x$
b0 )%
b0 J%
b0 V%
b0 d$
b0 y$
b0 *%
b0 K%
b0 W%
b0 e$
b0 z$
b0 e%
b0 r%
b0 {%
b0 f$
b0 {$
b0 f%
b0 s%
b0 |%
b0 I$
b0 n$
b0 g%
b0 t%
b0 "&
b0 J$
b0 o$
b0 h%
b0 u%
b0 #&
b0 K$
b0 p$
b0 i%
b0 ,&
b0 5&
b0 L$
b0 q$
b0 j%
b0 -&
b0 6&
b0 M$
b0 r$
b0 k%
b0 .&
b0 :&
b0 N$
b0 s$
b0 l%
b0 /&
b0 ;&
b0 O$
b0 N&
b0 c&
b0 p&
b0 y&
b0 P$
b0 O&
b0 d&
b0 q&
b0 z&
b0 Q$
b0 V&
b0 e&
b0 r&
b0 ~&
b0 R$
b0 W&
b0 f&
b0 s&
b0 !'
b0 T$
b0 X&
b0 g&
b0 *'
b0 3'
b0 U$
b0 Y&
b0 h&
b0 +'
b0 4'
b0 V$
b0 Z&
b0 i&
b0 ,'
b0 8'
b0 W$
b0 [&
b0 j&
b0 -'
b0 9'
b0 X$
b0 \&
b0 G'
b0 T'
b0 ]'
b0 Y$
b0 ]&
b0 H'
b0 U'
b0 ^'
b0 Z$
b0 P&
b0 I'
b0 V'
b0 b'
b0 [$
b0 Q&
b0 J'
b0 W'
b0 c'
b0 \$
b0 R&
b0 K'
b0 l'
b0 u'
b0 ]$
b0 S&
b0 L'
b0 m'
b0 v'
b0 7%
b0 =%
b0 C%
b0 <(
b0 a(
b0 v(
b0 %)
b0 .)
b0 G(
b0 h(
b0 w(
b0 &)
b0 2)
b0 +)
b0 1)
b0 7)
b0 >
b1 =
0@
0;
b0 G
09
b0 Y
b0 \
b0 w
b0 6$
b0 C$
b0 G$
b0 l$
b0 #%
b0 0%
b0 9%
b0 6(
b0 ;(
b0 `(
b0 u(
b0 $)
b0 -)
b100 H
b1110 [
b1 O
b100 3
b100 :,
b100 A,
b100 1
b100 1,
1"
#30000
0"
#35000
b0 1
b0 1,
1"
#40000
0"
#45000
1"
#50000
0"
#55000
1"
#60000
0"
#65000
1"
#70000
0"
#75000
1"
#80000
0"
#85000
1"
#90000
0"
#95000
1"
#100000
0"
#105000
1"
#110000
0"
#115000
1"
#120000
0"
#125000
1"
#130000
0"
#135000
1"
#140000
0"
#145000
1"
#150000
0"
#155000
1"
#160000
0"
#165000
1"
#170000
0"
#175000
1"
#180000
0"
#185000
1"
#190000
0"
#195000
1"
#200000
0"
#205000
1"
#210000
0"
#215000
1"
#220000
0"
#225000
1"
#230000
0"
#235000
1"
#240000
0"
#245000
1"
#250000
0"
#255000
1"
#260000
0"
#265000
1"
#270000
0"
#275000
1"
#280000
0"
#285000
1"
#290000
0"
#295000
1"
#300000
0"
#305000
1"
#310000
0"
#315000
1"
#320000
0"
#325000
1"
#330000
0"
#335000
1"
#340000
0"
#345000
1"
#350000
0"
#355000
1"
#360000
0"
#365000
1"
#370000
0"
#375000
1"
#380000
0"
#385000
1"
#390000
0"
#395000
1"
#400000
0"
#405000
1"
#410000
0"
#415000
1"
#420000
0"
#425000
1"
#430000
0"
#435000
1"
#440000
0"
#445000
1"
#450000
0"
#455000
1"
#460000
0"
#465000
1"
#470000
0"
#475000
1"
#480000
0"
#485000
1"
#490000
0"
#495000
1"
#500000
0"
#505000
1"
#510000
0"
#515000
1"
#520000
0"
#525000
1"
#530000
0"
#535000
1"
#540000
0"
#545000
1"
#550000
0"
#555000
1"
#560000
0"
#565000
1"
#570000
0"
#575000
1"
#580000
0"
#585000
1"
#590000
0"
#595000
1"
#600000
0"
#605000
1"
#610000
0"
#615000
1"
#620000
0"
#625000
1"
#630000
0"
#635000
1"
#640000
0"
#645000
1"
#650000
0"
#655000
1"
#660000
0"
#665000
1"
#670000
0"
#675000
1"
#680000
0"
#685000
1"
#690000
0"
#695000
1"
#700000
0"
#705000
1"
#710000
0"
#715000
1"
#720000
0"
#725000
1"
#730000
0"
#735000
1"
#740000
0"
#745000
1"
#750000
0"
#755000
1"
#760000
0"
#765000
1"
#770000
0"
#775000
1"
#780000
0"
#785000
1"
#790000
0"
#795000
1"
#800000
0"
#805000
1"
#810000
0"
#815000
1"
#820000
0"
#825000
1"
#830000
0"
#835000
1"
#840000
0"
#845000
1"
#850000
0"
#855000
1"
#860000
0"
#865000
1"
#870000
0"
#875000
1"
#880000
0"
#885000
1"
#890000
0"
#895000
1"
#900000
0"
#905000
1"
#910000
0"
#915000
1"
#920000
0"
#925000
1"
#930000
0"
#935000
1"
#940000
0"
#945000
1"
#950000
0"
#955000
1"
#960000
0"
#965000
1"
#970000
0"
#975000
1"
#980000
0"
#985000
1"
#990000
0"
#995000
1"
#1000000
0"
#1005000
1"
#1010000
0"
#1015000
1"
#1020000
0"
