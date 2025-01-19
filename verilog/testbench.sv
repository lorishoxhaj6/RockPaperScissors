// Code your testbench here
// or browse Examples
module tb();
  reg [1:0] PRIMO, SECONDO;
  reg INIZIA, clk;
  wire [1:0] MANCHE,PARTITA;
  
  // File descriptors.
  integer tbf, outf;
  
  MorraCinese game(PRIMO, SECONDO, INIZIA, clk, MANCHE, PARTITA);
  
  always #5 clk = ~clk;
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
    tbf = $fopen("testbench.script", "w");
    outf = $fopen("output_verilog.txt", "w");
    $fdisplay(tbf, "read_blif FSMD.blif");
    
    clk = 1'b0;
    #5
    INIZIA = 1'b1;
    PRIMO = 2'b00;
    SECONDO = 2'b00; 
    $fdisplay(tbf, "simulate %b %b %b %b %b", INIZIA, PRIMO[1], PRIMO[0], SECONDO[1], SECONDO[0]);
    #10
    $fdisplay(outf, "Outputs: %b %b %b %b", MANCHE[1], MANCHE[0], PARTITA[1], PARTITA[0]);
    INIZIA = 1'b0;
    PRIMO = 2'b01;
    SECONDO = 2'b10;//vince g2 0-1 
    $fdisplay(tbf, "simulate %b %b %b %b %b", INIZIA, PRIMO[1], PRIMO[0], SECONDO[1], SECONDO[0]);
    #10
    $fdisplay(outf, "Outputs: %b %b %b %b", MANCHE[1], MANCHE[0], PARTITA[1], PARTITA[0]);
    INIZIA = 1'b0;
    PRIMO = 2'b01;
    SECONDO = 2'b10; //manche non valida
    $fdisplay(tbf, "simulate %b %b %b %b %b", INIZIA, PRIMO[1], PRIMO[0], SECONDO[1], SECONDO[0]);
    #10
    $fdisplay(outf, "Outputs: %b %b %b %b", MANCHE[1], MANCHE[0], PARTITA[1], PARTITA[0]);
    INIZIA = 1'b0;
    PRIMO = 2'b01;
    SECONDO = 2'b01; //pareggio
    $fdisplay(tbf, "simulate %b %b %b %b %b", INIZIA, PRIMO[1], PRIMO[0], SECONDO[1], SECONDO[0]);
    #10
    $fdisplay(outf, "Outputs: %b %b %b %b", MANCHE[1], MANCHE[0], PARTITA[1], PARTITA[0]);
    INIZIA = 1'b0;
    PRIMO = 2'b11;
    SECONDO = 2'b01; //g2 vince 0-2
    $fdisplay(tbf, "simulate %b %b %b %b %b", INIZIA, PRIMO[1], PRIMO[0], SECONDO[1], SECONDO[0]);
    #10
    $fdisplay(outf, "Outputs: %b %b %b %b", MANCHE[1], MANCHE[0], PARTITA[1], PARTITA[0]);
    INIZIA = 1'b0;
    PRIMO = 2'b11;
    SECONDO = 2'b11; //pareggio
    $fdisplay(tbf, "simulate %b %b %b %b %b", INIZIA, PRIMO[1], PRIMO[0], SECONDO[1], SECONDO[0]);
    #10
    $fdisplay(outf, "Outputs: %b %b %b %b", MANCHE[1], MANCHE[0], PARTITA[1], PARTITA[0]);
    //deve finire 10
    //prima
    INIZIA = 1'b1;
   	PRIMO = 2'b00; //5 manche
    SECONDO = 2'b01; 
    $fdisplay(tbf, "simulate %b %b %b %b %b", INIZIA, PRIMO[1], PRIMO[0], SECONDO[1], SECONDO[0]);
    #10
    $fdisplay(outf, "Outputs: %b %b %b %b", MANCHE[1], MANCHE[0], PARTITA[1], PARTITA[0]);
    INIZIA = 1'b0;
    PRIMO = 2'b01; //vince g1 1-0
    SECONDO = 2'b11; 
    $fdisplay(tbf, "simulate %b %b %b %b %b", INIZIA, PRIMO[1], PRIMO[0], SECONDO[1], SECONDO[0]);
    #10
    $fdisplay(outf, "Outputs: %b %b %b %b", MANCHE[1], MANCHE[0], PARTITA[1], PARTITA[0]);
    INIZIA = 1'b0;
    PRIMO = 2'b10; //vince g1 2-0
    SECONDO = 2'b01; 
    $fdisplay(tbf, "simulate %b %b %b %b %b", INIZIA, PRIMO[1], PRIMO[0], SECONDO[1], SECONDO[0]);
    #10
    $fdisplay(outf, "Outputs: %b %b %b %b", MANCHE[1], MANCHE[0], PARTITA[1], PARTITA[0]);
    INIZIA = 1'b0;
    PRIMO = 2'b10; //manche non valida
    SECONDO = 2'b11; 
    $fdisplay(tbf, "simulate %b %b %b %b %b", INIZIA, PRIMO[1], PRIMO[0], SECONDO[1], SECONDO[0]);
    #10
    $fdisplay(outf, "Outputs: %b %b %b %b", MANCHE[1], MANCHE[0], PARTITA[1], PARTITA[0]);
    INIZIA = 1'b0;
    PRIMO = 2'b01; //vince g2 2-1
    SECONDO = 2'b10; 
    $fdisplay(tbf, "simulate %b %b %b %b %b", INIZIA, PRIMO[1], PRIMO[0], SECONDO[1], SECONDO[0]);
    #10
    $fdisplay(outf, "Outputs: %b %b %b %b", MANCHE[1], MANCHE[0], PARTITA[1], PARTITA[0]);
    INIZIA = 1'b0;
    PRIMO = 2'b11; //vince g2 2-2
    SECONDO = 2'b01; 
    $fdisplay(tbf, "simulate %b %b %b %b %b", INIZIA, PRIMO[1], PRIMO[0], SECONDO[1], SECONDO[0]);
    #10
    $fdisplay(outf, "Outputs: %b %b %b %b", MANCHE[1], MANCHE[0], PARTITA[1], PARTITA[0]);
    INIZIA = 1'b0;
    PRIMO = 2'b10;
    SECONDO = 2'b10; 
    $fdisplay(tbf, "simulate %b %b %b %b %b", INIZIA, PRIMO[1], PRIMO[0], SECONDO[1], SECONDO[0]);
    #10
    $fdisplay(outf, "Outputs: %b %b %b %b", MANCHE[1], MANCHE[0], PARTITA[1], PARTITA[0]);
    //seconda
    INIZIA = 1'b1;
    PRIMO = 2'b01;
    SECONDO = 2'b00; 
    $fdisplay(tbf, "simulate %b %b %b %b %b", INIZIA, PRIMO[1], PRIMO[0], SECONDO[1], SECONDO[0]);
    #10
    $fdisplay(outf, "Outputs: %b %b %b %b", MANCHE[1], MANCHE[0], PARTITA[1], PARTITA[0]);
    INIZIA = 1'b0;
    PRIMO = 2'b01;
    SECONDO = 2'b11; 
    $fdisplay(tbf, "simulate %b %b %b %b %b", INIZIA, PRIMO[1], PRIMO[0], SECONDO[1], SECONDO[0]);
    #10
    $fdisplay(outf, "Outputs: %b %b %b %b", MANCHE[1], MANCHE[0], PARTITA[1], PARTITA[0]);
    INIZIA = 1'b0;
    PRIMO = 2'b10;
    SECONDO = 2'b01; 
    $fdisplay(tbf, "simulate %b %b %b %b %b", INIZIA, PRIMO[1], PRIMO[0], SECONDO[1], SECONDO[0]);
    #10
    $fdisplay(outf, "Outputs: %b %b %b %b", MANCHE[1], MANCHE[0], PARTITA[1], PARTITA[0]);
    INIZIA = 1'b0;
    PRIMO = 2'b11;
    SECONDO = 2'b10; 
    $fdisplay(tbf, "simulate %b %b %b %b %b", INIZIA, PRIMO[1], PRIMO[0], SECONDO[1], SECONDO[0]);
    #10
    $fdisplay(outf, "Outputs: %b %b %b %b", MANCHE[1], MANCHE[0], PARTITA[1], PARTITA[0]);
    INIZIA = 1'b0;
    PRIMO = 2'b10;
    SECONDO = 2'b11; 
    $fdisplay(tbf, "simulate %b %b %b %b %b",INIZIA, PRIMO[1], PRIMO[0], SECONDO[1], SECONDO[0]);
    #10
    $fdisplay(outf, "Outputs: %b %b %b %b", MANCHE[1], MANCHE[0], PARTITA[1], PARTITA[0]);
    //terza 4 manche da giocare
    INIZIA = 1'b1;
	PRIMO = 2'b00;
    SECONDO = 2'b00; 
    $fdisplay(tbf, "simulate %b %b %b %b %b", INIZIA, PRIMO[1], PRIMO[0], SECONDO[1], SECONDO[0]);
    #10
    $fdisplay(outf, "Outputs: %b %b %b %b", MANCHE[1], MANCHE[0], PARTITA[1], PARTITA[0]);
    INIZIA = 1'b0;
    PRIMO = 2'b01;
    SECONDO = 2'b11; //vinta g1 1-0
    $fdisplay(tbf, "simulate %b %b %b %b %b", INIZIA, PRIMO[1], PRIMO[0], SECONDO[1], SECONDO[0]);
    #10
    $fdisplay(outf, "Outputs: %b %b %b %b", MANCHE[1], MANCHE[0], PARTITA[1], PARTITA[0]);
    INIZIA = 1'b0;
    PRIMO = 2'b01;
    SECONDO = 2'b11; //mossa non valida
    $fdisplay(tbf, "simulate %b %b %b %b %b", INIZIA, PRIMO[1], PRIMO[0], SECONDO[1], SECONDO[0]);
    #10
    $fdisplay(outf, "Outputs: %b %b %b %b", MANCHE[1], MANCHE[0], PARTITA[1], PARTITA[0]);
    INIZIA = 1'b0;
    PRIMO = 2'b11;
    SECONDO = 2'b10; //vinta g1 2-0
    $fdisplay(tbf, "simulate %b %b %b %b %b", INIZIA, PRIMO[1], PRIMO[0], SECONDO[1], SECONDO[0]);
    #10
    $fdisplay(outf, "Outputs: %b %b %b %b", MANCHE[1], MANCHE[0], PARTITA[1], PARTITA[0]);
    INIZIA = 1'b0;
    PRIMO = 2'b01;
    SECONDO = 2'b11; //vinta g1 3-0
    $fdisplay(tbf, "simulate %b %b %b %b %b",INIZIA, PRIMO[1], PRIMO[0], SECONDO[1], SECONDO[0]);
    #10
    $fdisplay(outf, "Outputs: %b %b %b %b", MANCHE[1], MANCHE[0], PARTITA[1], PARTITA[0]);
    INIZIA = 1'b0;
    PRIMO = 2'b10;
    SECONDO = 2'b01; //vinta g1 4-0 
    $fdisplay(tbf, "simulate %b %b %b %b %b", INIZIA, PRIMO[1], PRIMO[0], SECONDO[1], SECONDO[0]);
    #10
    $fdisplay(outf, "Outputs: %b %b %b %b", MANCHE[1], MANCHE[0], PARTITA[1], PARTITA[0]);
    //quarta 8
     INIZIA = 1'b1;	//fisso 8 manche da giocare
    PRIMO = 2'b01;
    SECONDO = 2'b00; 
    $fdisplay(tbf, "simulate %b %b %b %b %b", INIZIA, PRIMO[1], PRIMO[0], SECONDO[1], SECONDO[0]);
    #10
    $fdisplay(outf, "Outputs: %b %b %b %b", MANCHE[1], MANCHE[0], PARTITA[1], PARTITA[0]);
    INIZIA = 1'b0;
    PRIMO = 2'b01; //vince g2 0-1
    SECONDO = 2'b10; 
    $fdisplay(tbf, "simulate %b %b %b %b %b", INIZIA, PRIMO[1], PRIMO[0], SECONDO[1], SECONDO[0]);
    #10
    $fdisplay(outf, "Outputs: %b %b %b %b", MANCHE[1], MANCHE[0], PARTITA[1], PARTITA[0]);
    INIZIA = 1'b0;
    PRIMO = 2'b11; //manche non valida
    SECONDO = 2'b10; 
    $fdisplay(tbf, "simulate %b %b %b %b %b", INIZIA, PRIMO[1], PRIMO[0], SECONDO[1], SECONDO[0]);
    #10
    $fdisplay(outf, "Outputs: %b %b %b %b", MANCHE[1], MANCHE[0], PARTITA[1], PARTITA[0]);
    INIZIA = 1'b0;
    PRIMO = 2'b11; //mossa non valida
    SECONDO = 2'b10; 
    $fdisplay(tbf, "simulate %b %b %b %b %b", INIZIA, PRIMO[1], PRIMO[0], SECONDO[1], SECONDO[0]);
    #10
    $fdisplay(outf, "Outputs: %b %b %b %b", MANCHE[1], MANCHE[0], PARTITA[1], PARTITA[0]);
    INIZIA = 1'b0;
    PRIMO = 2'b11; //mossa non valida
    SECONDO = 2'b10; 
    $fdisplay(tbf, "simulate %b %b %b %b %b", INIZIA, PRIMO[1], PRIMO[0], SECONDO[1], SECONDO[0]);
    #10
    $fdisplay(outf, "Outputs: %b %b %b %b", MANCHE[1], MANCHE[0], PARTITA[1], PARTITA[0]);
    INIZIA = 1'b0;
    PRIMO = 2'b00;	//manche non valida
    SECONDO = 2'b00; 
    $fdisplay(tbf, "simulate %b %b %b %b %b", INIZIA, PRIMO[1], PRIMO[0], SECONDO[1], SECONDO[0]);
    #10
    $fdisplay(outf, "Outputs: %b %b %b %b", MANCHE[1], MANCHE[0], PARTITA[1], PARTITA[0]);
    INIZIA = 1'b0;
    PRIMO = 2'b11;	//pareggio
    SECONDO = 2'b11; 
    $fdisplay(tbf, "simulate %b %b %b %b %b", INIZIA, PRIMO[1], PRIMO[0], SECONDO[1], SECONDO[0]);
    #10
    $fdisplay(outf, "Outputs: %b %b %b %b", MANCHE[1], MANCHE[0], PARTITA[1], PARTITA[0]);
    INIZIA = 1'b0;
    PRIMO = 2'b01;	//pareggio
    SECONDO = 2'b01; 
    $fdisplay(tbf, "simulate %b %b %b %b %b", INIZIA, PRIMO[1], PRIMO[0], SECONDO[1], SECONDO[0]);
    #10
    $fdisplay(outf, "Outputs: %b %b %b %b", MANCHE[1], MANCHE[0], PARTITA[1], PARTITA[0]);
    INIZIA = 1'b0;
    PRIMO = 2'b11;	//vince g1 1-1
    SECONDO = 2'b10; 
    $fdisplay(tbf, "simulate %b %b %b %b %b", INIZIA, PRIMO[1], PRIMO[0], SECONDO[1], SECONDO[0]);
    #10
    $fdisplay(outf, "Outputs: %b %b %b %b", MANCHE[1], MANCHE[0], PARTITA[1], PARTITA[0]);
    INIZIA = 1'b0;
    PRIMO = 2'b01; //vince g2 1-2
    SECONDO = 2'b10; 
    $fdisplay(tbf, "simulate %b %b %b %b %b", INIZIA, PRIMO[1], PRIMO[0], SECONDO[1], SECONDO[0]);
    #10
    $fdisplay(outf, "Outputs: %b %b %b %b", MANCHE[1], MANCHE[0], PARTITA[1], PARTITA[0]);
    INIZIA = 1'b0;
    PRIMO = 2'b11;//vince g2 1-3
    SECONDO = 2'b01; 
    $fdisplay(tbf, "simulate %b %b %b %b %b", INIZIA, PRIMO[1], PRIMO[0], SECONDO[1], SECONDO[0]);
    #10
    $fdisplay(outf, "Outputs: %b %b %b %b", MANCHE[1], MANCHE[0], PARTITA[1], PARTITA[0]);
    //finisce con vittoria di g2 10
    $fdisplay(tbf, "quit");
    $fclose(tbf);
    $fclose(outf);
    $finish;
  end
endmodule