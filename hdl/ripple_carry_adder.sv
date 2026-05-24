module ripple_carry_adder (a , b , c_in , sum , c_out ) ;

parameter N = 8;

input wire [N -1:0] a , b ;
input wire c_in ;
output logic [N -1:0] sum ;
output wire c_out ;

wire [ N :0] carries ;
assign carries [0] = c_in ;
assign c_out = carries [ N ];
generate
    genvar i ;
    for ( i = 0; i < N ; i ++) begin : ripple_carry
        full_adder ADDER (
        .a ( a [ i ]) ,
        .b ( b [ i ]) ,
        .c_in ( carries [ i ]) ,
        .sum ( sum [ i ]) ,
        .c_out ( carries [ i + 1])
        ) ;
    end
endgenerate

endmodule
// to instantiate
// ripple_carry_adder #(. N (32) ) ADDER_RCA_32 ( /* port list */ ) ;