module counter #(
    parameter WIDTH = 8
)(
    // interface signals
    input logic             clk,        // clock
    input logic             rst,        // reset
    input logic             en,         // counter enable
    output logic [WIDTH-1:0] count     // count output
);

always_ff @ (posedge clk) //change (sensitivity list) to (posedge clk, posedge rst) for asynch design, (posedge clk) for synchronous
    //Original code
    //if (rst) count <= {WIDTH{1'b0}};
    //else     count <= count + {{WIDTH-1{1'b0}}, en};
    
    // --- where en is the counter enable
    if (en)
        if (rst) count <= {WIDTH{1'b0}};
        else     count <= count + {{WIDTH-1{1'b0}}, en};

    // --- where en controls counting up or down

    // //when en = 1, increases count
    // if (en)
    //     if (rst) count <= {WIDTH{1'b0}};
    //     else     count <= count + {{WIDTH-1{1'b0}}, 1'b1};
    // //when en = !1, decreases count
    // else
    //     if (rst) count <= {WIDTH{1'b1}};
    //     else     count <= count - {{WIDTH-1{1'b0}}, 1'b1};

endmodule
