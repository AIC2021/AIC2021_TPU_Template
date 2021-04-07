//============================================================================//
// AIC2021 Project1 - TPU Design                                              //
// file: top.v                                                                //
// description: Top module complete your TPU design here                      //
// authors: kaikai (deekai9139@gmail.com)                                     //
//          suhan  (jjs93126@gmail.com)                                       //
//============================================================================//

`include "define.v"
`include "global_buffer.v"

module top(clk, rst, start, m, n,  k, done);

  input clk;
  input rst;
  input start;
  input [3:0] m, k, n;
  output reg done;

  reg                   wr_en_a,
                        wr_en_b,
                        wr_en_out;
  reg  [`DATA_SIZE-1:0] index_a,
                        index_b,
                        index_out;
  reg  [`WORD_SIZE-1:0] data_in_a,
                        data_in_b,
                        data_in_o;
  wire [`WORD_SIZE-1:0] data_out_a,
                        data_out_b,
                        data_out_o;

//----------------------------------------------------------------------------//
// TPU module declaration                                                     //
//----------------------------------------------------------------------------//
  //****TPU tpu1(); add your design here*****//

//----------------------------------------------------------------------------//
// Global buffers declaration                                                 //
//----------------------------------------------------------------------------//
  global_buffer GBUFF_A(.clk     (clk       ),
                        .rst     (rst       ),
                        .wr_en   (wr_en_a   ),
                        .index   (index_a   ),
                        .data_in (data_in_a ),
                        .data_out(data_out_a));

  global_buffer GBUFF_B(.clk     (clk       ),
                        .rst     (rst       ),
                        .wr_en   (wr_en_b   ),
                        .index   (index_b   ),
                        .data_in (data_in_b ),
                        .data_out(data_out_b));

  global_buffer GBUFF_OUT(.clk     (clk      ),
                          .rst     (rst      ),
                          .wr_en   (wr_en_out),
                          .index   (index_out),
                          .data_in (data_in_o),
                          .data_out(data_out_o));

endmodule
