module memory_controller(
    input clk,rst,req,
    output reg cen,start,
    output reg [9:0]addr
    );

always @(posedge clk, posedge rst) begin
    if(rst) begin
        addr <= 10'd0;
        cen <= 1'b0;
        start <= 1'b0;
    end
    else begin
        case(addr[1:0])
            2'b00   :   begin
                            if(req) cen <= 1'b1;
                            if(cen) begin
                                start <= 1'b1;
                                addr <= addr + 10'b1;
                            end
                        end
            2'b01   :   begin
                            start <= 1'b0;
                            if(cen) addr <= addr + 10'b1;
                        end
            2'b10   :   begin
                            start <= 1'b0;
                            if(cen) addr <= addr + 10'b1;
                        end
            2'b11   :   begin   
                            start <= 1'b0;
                            if(cen) addr <= addr + 10'b1;
                        end
        endcase
    end
end

endmodule