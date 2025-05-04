module rv32i_tb;
    logic clk;
    logic reset_n;

    // Dut instantiation
    rv32i DUT(
        .clk,
        .reset_n
    );

    // Clock generator 
    initial clk = 0;
    always #5 clk = ~clk;

    // signal geneartion here
    initial begin 
        reset_n = 0;
        repeat(2) @(negedge clk);
        reset_n = 1; // dropping reset after two clk cycles
    end

    // initializing the instruction memory after every reset
    always @(posedge reset_n) begin
        $readmemh("/home/it/Documents/cx-204/labs/riscv/single-cycle/tb/machine.hex", DUT.data_path_inst.imem_inst.imem);
    end // wait 

    initial begin 
        repeat(1000) @(posedge clk);
        for(int i = 0; i<32; i = i+1) begin 
            $display("reg_file[%02d] = %03d", i, DUT.data_path_inst.reg_file_inst.reg_file[i]);
        end
    end




endmodule