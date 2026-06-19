module program_loader(
    input clk,
    input rst,
    input start,
    input demo_select,    
    output reg [3:0] load_addr,
    output reg [7:0] load_data,
    output reg load_we,
    output reg done
);
reg [3:0] count;
always @(posedge clk or posedge rst)
begin
    if(rst)
    begin
        count     <= 4'd0;
        load_addr <= 4'd0;
        load_data <= 8'd0;
        load_we   <= 1'b0;
        done      <= 1'b0;
    end
   else if(start && !done)
    begin
        load_we   <= 1'b1;
        load_addr <= count;
    if(demo_select == 1'b0)
        begin
            case(count)
                4'd0: load_data <= 8'h10; 
                4'd1: load_data <= 8'h2C; 
                4'd2: load_data <= 8'h10; 
                4'd3: load_data <= 8'h2D; 
                4'd4: load_data <= 8'h3C; 
                4'd5: load_data <= 8'h4D; 
                4'd6: load_data <= 8'hB0; 
                4'd7: load_data <= 8'h70; 
                4'd8: load_data <= 8'h80; 
                default: load_data <= 8'h00; 
         endcase
        end
        else
        begin
            case(count)
                4'd0: load_data <= 8'h10; 
                4'd1: load_data <= 8'h2C; 
                4'd2: load_data <= 8'h10; 
                4'd3: load_data <= 8'h2D; 
                4'd4: load_data <= 8'h3C; 
                4'd5: load_data <= 8'h4D; 
                4'd6: load_data <= 8'h50; 
                4'd7: load_data <= 8'h70; 
                4'd8: load_data <= 8'h60; 
                4'd9: load_data <= 8'h70; 
                4'd10: load_data <= 8'h80; 
                default: load_data <= 8'h00; 
         endcase
        end
        if(count == 4'd15)
        begin
            done    <= 1'b1;
            load_we <= 1'b0;
        end
        else
        begin
            count <= count + 1'b1;
        end
    end
   else
    begin
        load_we <= 1'b0;
		  end
		  end
endmodule
