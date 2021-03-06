module memory_controller_output(
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
                            start <= 1'b0;
                            if(req) begin
                                cen <= 1'b1;
                            end
                            if(cen) begin
                                start <= 1'b1;
                                addr <= addr + 10'b1;
                            end
                        end
            2'b01   :   begin
                            cen <= 1'b1;
                            start <= 1'b1;
                            if(cen) addr <= addr + 10'b1;
                        end
            2'b10   :   begin
                            cen <= 1'b1;
                            start <= 1'b1;
                            if(cen) addr <= addr + 10'b1;
                        end
            2'b11   :   begin   
                            start <= 1'b1;
                            cen <= 1'b0;
                            if(cen) addr <= addr + 10'b1;
                        end
        endcase
    end
end

endmodule