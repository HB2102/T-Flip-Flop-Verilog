module TFF(
    input t,rst,clk,
    output reg q,qbar
);

    always @(posedge clk)
    begin
    
    if (rst == 1 && t == 1) 
    begin
        q = 0;
        qbar = 1;
    end

    else if (rst == 1 && t == 0)
    begin
        q = 0;
        qbar = 1;
    end

    else if (rst == 0 && t == 0)
    begin
        q = q;
        qbar = ~q;
    end

    else if (rst == 0 && t == 1)
    begin 
        q = ~q;
        qbar = ~q;
    end
    
    end
    
    
    
endmodule




module tb_TFF();
    reg t,rst,clk;
    wire q,qbar;

    TFF tk_flip_flop(t,rst,clk,q,qbar);

    
    initial begin
        clk=0;
        forever #10 clk = ~clk;  
    end 


    initial begin
        rst = 1;
        t = 1;
        #100;

        rst = 0;
        t = 0;
        #100;

        t = 1;
        #100;

        t = 0;
        #100;

        t = 1;
        #100;
     
    end
    
endmodule

