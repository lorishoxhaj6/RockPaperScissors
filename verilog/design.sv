module MorraCinese(
  input [1:0] PRIMO,
  input [1:0] SECONDO,
  input INIZIA,
  input clk,
  output reg [1:0] MANCHE,
  output reg [1:0] PARTITA);
  
  reg [4:0] contamanche; //conta il numero di manche
  reg [1:0] manchepartita; //risultato partita
  reg [1:0] precedenteprimo;//salva mossa precedente g1
  reg [1:0] precedentesecondo;//salva mossa precedente g2
  reg [4:0] maxmanche; //numero massimo manche in una partita
  reg READY; //bit indica giocate almeno 4 manche
  reg FINE;//bit indica giocate tutte manche
  reg [1:0] succ1;
  reg [1:0] succ2;
  
  always @(posedge clk)
    begin
      //DATAPATH
      if(INIZIA) begin
        precedenteprimo = 2'b00;
        precedentesecondo = 2'b00;
        manchepartita = 2'b00;
        succ1=2'b00;
        succ2=2'b00;
      end
      else begin
         precedenteprimo = succ1;
      	 precedentesecondo = succ2;
        
      //logica di gioco+controllo mossa  
      case({precedenteprimo, precedentesecondo, PRIMO, SECONDO})
        8'b00000000: begin manchepartita = 2'b00; succ1=2'b00; succ2=2'b00; end
        8'b00000001:begin manchepartita = 2'b00;  succ1=2'b00; succ2=2'b00; end
        8'b00000010: begin manchepartita = 2'b00; succ1=2'b00; succ2=2'b00; end
        8'b00000011: begin manchepartita = 2'b00; succ1=2'b00; succ2=2'b00; end
        8'b00000100: begin manchepartita = 2'b00; succ1=2'b00; succ2=2'b00; end
        8'b00000101: begin manchepartita = 2'b11; succ1=2'b00; succ2=2'b00; end
        8'b00000110: begin manchepartita = 2'b10; succ1=2'b00; succ2=2'b10; end
        8'b00000111: begin manchepartita = 2'b01; succ1=2'b01; succ2=2'b00; end
        8'b00001000: begin manchepartita = 2'b00; succ1=2'b00; succ2=2'b00; end
        8'b00001001: begin manchepartita = 2'b01; succ1=2'b10; succ2=2'b00; end
        8'b00001010: begin manchepartita = 2'b11; succ1=2'b00; succ2=2'b00; end
        8'b00001011: begin manchepartita = 2'b10; succ1=2'b00; succ2=2'b11; end
        8'b00001100: begin manchepartita = 2'b00; succ1=2'b00; succ2=2'b00; end
        8'b00001101: begin manchepartita = 2'b10; succ1=2'b00; succ2=2'b01; end
        8'b00001110: begin manchepartita = 2'b01; succ1=2'b11; succ2=2'b00; end
        8'b00001111: begin manchepartita = 2'b11; succ1=2'b00; succ2=2'b00; end
        8'b00010000: begin manchepartita = 2'b00; succ1=2'b00; succ2=2'b01; end
		8'b00010001: begin manchepartita = 2'b00; succ1=2'b00; succ2=2'b01; end	
		8'b00010010: begin manchepartita = 2'b00; succ1=2'b00; succ2=2'b01; end
		8'b00010011: begin manchepartita = 2'b00; succ1=2'b00; succ2=2'b01; end
		8'b00010100: begin manchepartita = 2'b00; succ1=2'b00; succ2=2'b01; end
		8'b00010101: begin manchepartita = 2'b00; succ1=2'b00; succ2=2'b01; end
		8'b00010110: begin manchepartita = 2'b10; succ1=2'b00; succ2=2'b10; end
		8'b00010111: begin manchepartita = 2'b01; succ1=2'b01; succ2=2'b00; end
		8'b00011000: begin manchepartita = 2'b00; succ1=2'b00; succ2=2'b01; end
		8'b00011001: begin manchepartita = 2'b00; succ1=2'b00; succ2=2'b01; end
		8'b00011010: begin manchepartita = 2'b11; succ1=2'b00; succ2=2'b00; end
		8'b00011011: begin manchepartita = 2'b10; succ1=2'b00; succ2=2'b11; end
		8'b00011100: begin manchepartita = 2'b00; succ1=2'b00; succ2=2'b01; end
		8'b00011101: begin manchepartita = 2'b00; succ1=2'b00; succ2=2'b01; end
		8'b00011110: begin manchepartita = 2'b01; succ1=2'b11; succ2=2'b00; end
		8'b00011111: begin manchepartita = 2'b11; succ1=2'b00; succ2=2'b00; end
        8'b00100000: begin manchepartita = 2'b00; succ1=2'b00; succ2=2'b10; end
		8'b00100001: begin manchepartita = 2'b00; succ1=2'b00; succ2=2'b10; end  
		8'b00100010: begin manchepartita = 2'b00; succ1=2'b00; succ2=2'b10; end
		8'b00100011: begin manchepartita = 2'b00; succ1=2'b00; succ2=2'b10; end
		8'b00100100: begin manchepartita = 2'b00; succ1=2'b00; succ2=2'b10; end
		8'b00100101: begin manchepartita = 2'b11; succ1=2'b00; succ2=2'b00; end
		8'b00100110: begin manchepartita = 2'b00; succ1=2'b00; succ2=2'b10; end
		8'b00100111: begin manchepartita = 2'b01; succ1=2'b01; succ2=2'b00; end
		8'b00101000: begin manchepartita = 2'b00; succ1=2'b00; succ2=2'b10; end
		8'b00101001: begin manchepartita = 2'b01; succ1=2'b10; succ2=2'b00; end
		8'b00101010: begin manchepartita = 2'b11; succ1=2'b00; succ2=2'b00; end
		8'b00101011: begin manchepartita = 2'b10; succ1=2'b00; succ2=2'b11; end
		8'b00101100: begin manchepartita = 2'b00; succ1=2'b00; succ2=2'b10; end
		8'b00101101: begin manchepartita = 2'b10; succ1=2'b00; succ2=2'b01; end
		8'b00101110: begin manchepartita = 2'b00; succ1=2'b00; succ2=2'b10; end
		8'b00101111: begin manchepartita = 2'b11; succ1=2'b00; succ2=2'b00; end
		8'b00110000: begin manchepartita = 2'b00; succ1=2'b00; succ2=2'b11; end
		8'b00110001: begin manchepartita = 2'b00; succ1=2'b00; succ2=2'b11; end
		8'b00110010: begin manchepartita = 2'b00; succ1=2'b00; succ2=2'b11; end
		8'b00110011: begin manchepartita = 2'b00; succ1=2'b00; succ2=2'b11; end
		8'b00110100: begin manchepartita = 2'b00; succ1=2'b00; succ2=2'b11; end
		8'b00110101: begin manchepartita = 2'b11; succ1=2'b00; succ2=2'b00; end
		8'b00110110: begin manchepartita = 2'b10; succ1=2'b00; succ2=2'b10; end
		8'b00110111: begin manchepartita = 2'b00; succ1=2'b00; succ2=2'b11; end
		8'b00111000: begin manchepartita = 2'b00; succ1=2'b00; succ2=2'b11; end
		8'b00111001: begin manchepartita = 2'b01; succ1=2'b10; succ2=2'b00; end
		8'b00111010: begin manchepartita = 2'b11; succ1=2'b00; succ2=2'b00; end
		8'b00111011: begin manchepartita = 2'b00; succ1=2'b00; succ2=2'b11; end
		8'b00111100: begin manchepartita = 2'b00; succ1=2'b00; succ2=2'b11; end
		8'b00111101: begin manchepartita = 2'b10; succ1=2'b00; succ2=2'b01; end
		8'b00111110: begin manchepartita = 2'b01; succ1=2'b11; succ2=2'b00; end
		8'b00111111: begin manchepartita = 2'b00; succ1=2'b00; succ2=2'b11; end
		8'b01000000: begin manchepartita = 2'b00; succ1=2'b01; succ2=2'b00; end
		8'b01000001: begin manchepartita = 2'b00; succ1=2'b01; succ2=2'b00; end
		8'b01000010: begin manchepartita = 2'b00; succ1=2'b01; succ2=2'b00; end
		8'b01000011: begin manchepartita = 2'b00; succ1=2'b01; succ2=2'b00; end
		8'b01000100: begin manchepartita = 2'b00; succ1=2'b01; succ2=2'b00; end
		8'b01000101: begin manchepartita = 2'b00; succ1=2'b01; succ2=2'b00; end
		8'b01000110: begin manchepartita = 2'b00; succ1=2'b01; succ2=2'b00; end
		8'b01000111: begin manchepartita = 2'b00; succ1=2'b01; succ2=2'b00; end
		8'b01001000: begin manchepartita = 2'b00; succ1=2'b01; succ2=2'b00; end
		8'b01001001: begin manchepartita = 2'b01; succ1=2'b10; succ2=2'b00; end
		8'b01001010: begin manchepartita = 2'b11; succ1=2'b00; succ2=2'b00; end
		8'b01001011: begin manchepartita = 2'b10; succ1=2'b00; succ2=2'b11; end
		8'b01001100: begin manchepartita = 2'b00; succ1=2'b01; succ2=2'b00; end
		8'b01001101: begin manchepartita = 2'b10; succ1=2'b00; succ2=2'b01; end
		8'b01001110: begin manchepartita = 2'b01; succ1=2'b11; succ2=2'b00; end
		8'b01001111: begin manchepartita = 2'b11; succ1=2'b00; succ2=2'b00; end
		8'b01010000: begin manchepartita = 2'b00; succ1=2'b01; succ2=2'b01; end
		8'b01010001: begin manchepartita = 2'b00; succ1=2'b01; succ2=2'b01; end
		8'b01010010: begin manchepartita = 2'b00; succ1=2'b01; succ2=2'b01; end
		8'b01010011: begin manchepartita = 2'b00; succ1=2'b01; succ2=2'b01; end
		8'b01010100: begin manchepartita = 2'b00; succ1=2'b01; succ2=2'b01; end
		8'b01010101: begin manchepartita = 2'b00; succ1=2'b01; succ2=2'b01; end
		8'b01010110: begin manchepartita = 2'b00; succ1=2'b01; succ2=2'b10; end
		8'b01010111: begin manchepartita = 2'b00; succ1=2'b01; succ2=2'b01; end
		8'b01011000: begin manchepartita = 2'b00; succ1=2'b01; succ2=2'b01; end
		8'b01011001: begin manchepartita = 2'b00; succ1=2'b01; succ2=2'b01; end
		8'b01011010: begin manchepartita = 2'b11; succ1=2'b00; succ2=2'b00; end
		8'b01011011: begin manchepartita = 2'b10; succ1=2'b00; succ2=2'b11; end
		8'b01011100: begin manchepartita = 2'b00; succ1=2'b01; succ2=2'b01; end
		8'b01011101: begin manchepartita = 2'b00; succ1=2'b01; succ2=2'b01; end
		8'b01011110: begin manchepartita = 2'b01; succ1=2'b11; succ2=2'b00; end
		8'b01011111: begin manchepartita = 2'b11; succ1=2'b00; succ2=2'b00; end
		8'b01100000: begin manchepartita = 2'b00; succ1=2'b01; succ2=2'b10; end
		8'b01100001: begin manchepartita = 2'b00; succ1=2'b01; succ2=2'b10; end
		8'b01100010: begin manchepartita = 2'b00; succ1=2'b01; succ2=2'b10; end
		8'b01100011: begin manchepartita = 2'b00; succ1=2'b01; succ2=2'b10; end
		8'b01100100: begin manchepartita = 2'b00; succ1=2'b01; succ2=2'b10; end
		8'b01100101: begin manchepartita = 2'b00; succ1=2'b01; succ2=2'b10; end
		8'b01100110: begin manchepartita = 2'b00; succ1=2'b01; succ2=2'b10; end
		8'b01100111: begin manchepartita = 2'b00; succ1=2'b01; succ2=2'b10; end
		8'b01101000: begin manchepartita = 2'b00; succ1=2'b01; succ2=2'b10; end
		8'b01101001: begin manchepartita = 2'b10; succ1=2'b00; succ2=2'b01; end
		8'b01101010: begin manchepartita = 2'b00; succ1=2'b01; succ2=2'b10; end
		8'b01101011: begin manchepartita = 2'b10; succ1=2'b00; succ2=2'b11; end
		8'b01101100: begin manchepartita = 2'b00; succ1=2'b01; succ2=2'b10; end
		8'b01101101: begin manchepartita = 2'b10; succ1=2'b00; succ2=2'b01; end
		8'b01101110: begin manchepartita = 2'b00; succ1=2'b01; succ2=2'b10; end
		8'b01101111: begin manchepartita = 2'b11; succ1=2'b00; succ2=2'b00; end
		8'b01110000: begin manchepartita = 2'b00; succ1=2'b01; succ2=2'b11; end
		8'b01110001: begin manchepartita = 2'b00; succ1=2'b01; succ2=2'b11; end
		8'b01110010: begin manchepartita = 2'b00; succ1=2'b01; succ2=2'b11; end
		8'b01110011: begin manchepartita = 2'b00; succ1=2'b01; succ2=2'b11; end
		8'b01110100: begin manchepartita = 2'b00; succ1=2'b01; succ2=2'b11; end
		8'b01110101: begin manchepartita = 2'b00; succ1=2'b01; succ2=2'b11; end
		8'b01110110: begin manchepartita = 2'b00; succ1=2'b01; succ2=2'b11; end
		8'b01110111: begin manchepartita = 2'b00; succ1=2'b01; succ2=2'b11; end
		8'b01111000: begin manchepartita = 2'b00; succ1=2'b01; succ2=2'b11; end
		8'b01111001: begin manchepartita = 2'b01; succ1=2'b10; succ2=2'b00; end
		8'b01111010: begin manchepartita = 2'b11; succ1=2'b00; succ2=2'b00; end
		8'b01111011: begin manchepartita = 2'b00; succ1=2'b01; succ2=2'b11; end
		8'b01111100: begin manchepartita = 2'b00; succ1=2'b01; succ2=2'b11; end
		8'b01111101: begin manchepartita = 2'b10; succ1=2'b00; succ2=2'b01; end
		8'b01111110: begin manchepartita = 2'b01; succ1=2'b11; succ2=2'b00; end
		8'b01111111: begin manchepartita = 2'b00; succ1=2'b01; succ2=2'b11; end
		8'b10000000: begin manchepartita = 2'b00; succ1=2'b10; succ2=2'b00; end
		8'b10000001: begin manchepartita = 2'b00; succ1=2'b10; succ2=2'b00; end
		8'b10000010: begin manchepartita = 2'b00; succ1=2'b10; succ2=2'b00; end
		8'b10000011: begin manchepartita = 2'b00; succ1=2'b10; succ2=2'b00; end
		8'b10000100: begin manchepartita = 2'b00; succ1=2'b10; succ2=2'b00; end
		8'b10000101: begin manchepartita = 2'b11; succ1=2'b00; succ2=2'b00; end
		8'b10000110: begin manchepartita = 2'b10; succ1=2'b00; succ2=2'b10; end
		8'b10000111: begin manchepartita = 2'b01; succ1=2'b01; succ2=2'b00; end
		8'b10001000: begin manchepartita = 2'b00; succ1=2'b10; succ2=2'b00; end
		8'b10001001: begin manchepartita = 2'b00; succ1=2'b10; succ2=2'b00; end
		8'b10001010: begin manchepartita = 2'b00; succ1=2'b10; succ2=2'b00; end
		8'b10001011: begin manchepartita = 2'b00; succ1=2'b10; succ2=2'b00; end
		8'b10001100: begin manchepartita = 2'b00; succ1=2'b10; succ2=2'b00; end
		8'b10001101: begin manchepartita = 2'b10; succ1=2'b00; succ2=2'b01; end
		8'b10001110: begin manchepartita = 2'b01; succ1=2'b11; succ2=2'b00; end
		8'b10001111: begin manchepartita = 2'b11; succ1=2'b00; succ2=2'b00; end
		8'b10010000: begin manchepartita = 2'b00; succ1=2'b10; succ2=2'b01; end
		8'b10010001: begin manchepartita = 2'b00; succ1=2'b10; succ2=2'b01; end
		8'b10010010: begin manchepartita = 2'b00; succ1=2'b10; succ2=2'b01; end
		8'b10010011: begin manchepartita = 2'b00; succ1=2'b10; succ2=2'b01; end
		8'b10010100: begin manchepartita = 2'b00; succ1=2'b10; succ2=2'b01; end
		8'b10010101: begin manchepartita = 2'b00; succ1=2'b10; succ2=2'b01; end
		8'b10010110: begin manchepartita = 2'b10; succ1=2'b00; succ2=2'b10; end
		8'b10010111: begin manchepartita = 2'b01; succ1=2'b01; succ2=2'b00; end
		8'b10011000: begin manchepartita = 2'b00; succ1=2'b10; succ2=2'b01; end
		8'b10011001: begin manchepartita = 2'b00; succ1=2'b10; succ2=2'b01; end
		8'b10011010: begin manchepartita = 2'b00; succ1=2'b10; succ2=2'b01; end
		8'b10011011: begin manchepartita = 2'b00; succ1=2'b10; succ2=2'b01; end
		8'b10011100: begin manchepartita = 2'b00; succ1=2'b10; succ2=2'b01; end
		8'b10011101: begin manchepartita = 2'b00; succ1=2'b10; succ2=2'b01; end
		8'b10011110: begin manchepartita = 2'b01; succ1=2'b11; succ2=2'b00; end
		8'b10011111: begin manchepartita = 2'b11; succ1=2'b00; succ2=2'b00; end
		8'b10100000: begin manchepartita = 2'b00; succ1=2'b10; succ2=2'b10; end
		8'b10100001: begin manchepartita = 2'b00; succ1=2'b10; succ2=2'b10; end
		8'b10100010: begin manchepartita = 2'b00; succ1=2'b10; succ2=2'b10; end
		8'b10100011: begin manchepartita = 2'b00; succ1=2'b10; succ2=2'b10; end
		8'b10100100: begin manchepartita = 2'b00; succ1=2'b10; succ2=2'b10; end
		8'b10100101: begin manchepartita = 2'b11; succ1=2'b00; succ2=2'b00; end
		8'b10100110: begin manchepartita = 2'b00; succ1=2'b10; succ2=2'b10; end
		8'b10100111: begin manchepartita = 2'b01; succ1=2'b01; succ2=2'b00; end
		8'b10101000: begin manchepartita = 2'b00; succ1=2'b10; succ2=2'b10; end
		8'b10101001: begin manchepartita = 2'b00; succ1=2'b10; succ2=2'b10; end
		8'b10101010: begin manchepartita = 2'b00; succ1=2'b10; succ2=2'b10; end
		8'b10101011: begin manchepartita = 2'b00; succ1=2'b10; succ2=2'b10; end
		8'b10101100: begin manchepartita = 2'b00; succ1=2'b10; succ2=2'b10; end
		8'b10101101: begin manchepartita = 2'b10; succ1=2'b00; succ2=2'b01; end
		8'b10101110: begin manchepartita = 2'b00; succ1=2'b10; succ2=2'b10; end
		8'b10101111: begin manchepartita = 2'b11; succ1=2'b00; succ2=2'b00; end
		8'b10110000: begin manchepartita = 2'b00; succ1=2'b10; succ2=2'b11; end
		8'b10110001: begin manchepartita = 2'b00; succ1=2'b10; succ2=2'b11; end
		8'b10110010: begin manchepartita = 2'b00; succ1=2'b10; succ2=2'b11; end
		8'b10110011: begin manchepartita = 2'b00; succ1=2'b10; succ2=2'b11; end
		8'b10110100: begin manchepartita = 2'b00; succ1=2'b10; succ2=2'b11; end
		8'b10110101: begin manchepartita = 2'b11; succ1=2'b00; succ2=2'b00; end
		8'b10110110: begin manchepartita = 2'b10; succ1=2'b00; succ2=2'b10; end
		8'b10110111: begin manchepartita = 2'b00; succ1=2'b10; succ2=2'b11; end
		8'b10111000: begin manchepartita = 2'b00; succ1=2'b10; succ2=2'b11; end
		8'b10111001: begin manchepartita = 2'b00; succ1=2'b10; succ2=2'b11; end
		8'b10111010: begin manchepartita = 2'b00; succ1=2'b10; succ2=2'b11; end
		8'b10111011: begin manchepartita = 2'b00; succ1=2'b10; succ2=2'b11; end
		8'b10111100: begin manchepartita = 2'b00; succ1=2'b10; succ2=2'b11; end
		8'b10111101: begin manchepartita = 2'b10; succ1=2'b00; succ2=2'b01; end
		8'b10111110: begin manchepartita = 2'b01; succ1=2'b11; succ2=2'b00; end
		8'b10111111: begin manchepartita = 2'b00; succ1=2'b10; succ2=2'b11; end
		8'b11000000: begin manchepartita = 2'b00; succ1=2'b11; succ2=2'b00; end
		8'b11000001: begin manchepartita = 2'b00; succ1=2'b11; succ2=2'b00; end
		8'b11000010: begin manchepartita = 2'b00; succ1=2'b11; succ2=2'b00; end
		8'b11000011: begin manchepartita = 2'b00; succ1=2'b11; succ2=2'b00; end
		8'b11000100: begin manchepartita = 2'b00; succ1=2'b11; succ2=2'b00; end
		8'b11000101: begin manchepartita = 2'b11; succ1=2'b00; succ2=2'b00; end
		8'b11000110: begin manchepartita = 2'b10; succ1=2'b00; succ2=2'b10; end
		8'b11000111: begin manchepartita = 2'b01; succ1=2'b01; succ2=2'b00; end
		8'b11001000: begin manchepartita = 2'b00; succ1=2'b11; succ2=2'b00; end
		8'b11001001: begin manchepartita = 2'b01; succ1=2'b10; succ2=2'b00; end
		8'b11001010: begin manchepartita = 2'b11; succ1=2'b00; succ2=2'b00; end
		8'b11001011: begin manchepartita = 2'b10; succ1=2'b00; succ2=2'b11; end
		8'b11001100: begin manchepartita = 2'b00; succ1=2'b11; succ2=2'b00; end
		8'b11001101: begin manchepartita = 2'b00; succ1=2'b11; succ2=2'b00; end
		8'b11001110: begin manchepartita = 2'b00; succ1=2'b11; succ2=2'b00; end
		8'b11001111: begin manchepartita = 2'b00; succ1=2'b11; succ2=2'b00; end
		8'b11010000: begin manchepartita = 2'b00; succ1=2'b11; succ2=2'b01; end
		8'b11010001: begin manchepartita = 2'b00; succ1=2'b11; succ2=2'b01; end
		8'b11010010: begin manchepartita = 2'b00; succ1=2'b11; succ2=2'b01; end
		8'b11010011: begin manchepartita = 2'b00; succ1=2'b11; succ2=2'b01; end
		8'b11010100: begin manchepartita = 2'b00; succ1=2'b11; succ2=2'b01; end
		8'b11010101: begin manchepartita = 2'b00; succ1=2'b11; succ2=2'b01; end
		8'b11010110: begin manchepartita = 2'b10; succ1=2'b00; succ2=2'b10; end
		8'b11010111: begin manchepartita = 2'b01; succ1=2'b01; succ2=2'b00; end
		8'b11011000: begin manchepartita = 2'b00; succ1=2'b11; succ2=2'b01; end
		8'b11011001: begin manchepartita = 2'b00; succ1=2'b11; succ2=2'b01; end
		8'b11011010: begin manchepartita = 2'b11; succ1=2'b00; succ2=2'b00; end
		8'b11011011: begin manchepartita = 2'b10; succ1=2'b00; succ2=2'b11; end
		8'b11011100: begin manchepartita = 2'b00; succ1=2'b11; succ2=2'b01; end
		8'b11011101: begin manchepartita = 2'b00; succ1=2'b11; succ2=2'b01; end
		8'b11011110: begin manchepartita = 2'b00; succ1=2'b11; succ2=2'b01; end
		8'b11011111: begin manchepartita = 2'b00; succ1=2'b11; succ2=2'b01; end
		8'b11100000: begin manchepartita = 2'b00; succ1=2'b11; succ2=2'b10; end
		8'b11100001: begin manchepartita = 2'b00; succ1=2'b11; succ2=2'b10; end
		8'b11100010: begin manchepartita = 2'b00; succ1=2'b11; succ2=2'b10; end
		8'b11100011: begin manchepartita = 2'b00; succ1=2'b11; succ2=2'b10; end
		8'b11100100: begin manchepartita = 2'b00; succ1=2'b11; succ2=2'b10; end
		8'b11100101: begin manchepartita = 2'b11; succ1=2'b00; succ2=2'b00; end
		8'b11100110: begin manchepartita = 2'b00; succ1=2'b11; succ2=2'b10; end
		8'b11100111: begin manchepartita = 2'b01; succ1=2'b01; succ2=2'b00; end
		8'b11101000: begin manchepartita = 2'b00; succ1=2'b11; succ2=2'b10; end
		8'b11101001: begin manchepartita = 2'b01; succ1=2'b10; succ2=2'b00; end
		8'b11101010: begin manchepartita = 2'b00; succ1=2'b11; succ2=2'b10; end
		8'b11101011: begin manchepartita = 2'b10; succ1=2'b00; succ2=2'b11; end
		8'b11101100: begin manchepartita = 2'b00; succ1=2'b11; succ2=2'b10; end
		8'b11101101: begin manchepartita = 2'b00; succ1=2'b11; succ2=2'b10; end
		8'b11101110: begin manchepartita = 2'b00; succ1=2'b11; succ2=2'b10; end
		8'b11101111: begin manchepartita = 2'b00; succ1=2'b11; succ2=2'b10; end
		8'b11110000: begin manchepartita = 2'b00; succ1=2'b11; succ2=2'b11; end
		8'b11110001: begin manchepartita = 2'b00; succ1=2'b11; succ2=2'b11; end
		8'b11110010: begin manchepartita = 2'b00; succ1=2'b11; succ2=2'b11; end
		8'b11110011: begin manchepartita = 2'b00; succ1=2'b11; succ2=2'b11; end
		8'b11110100: begin manchepartita = 2'b00; succ1=2'b11; succ2=2'b11; end
		8'b11110101: begin manchepartita = 2'b11; succ1=2'b00; succ2=2'b00; end
		8'b11110110: begin manchepartita = 2'b10; succ1=2'b00; succ2=2'b10; end
		8'b11110111: begin manchepartita = 2'b00; succ1=2'b11; succ2=2'b11; end
		8'b11111000: begin manchepartita = 2'b00; succ1=2'b11; succ2=2'b11; end
		8'b11111001: begin manchepartita = 2'b01; succ1=2'b10; succ2=2'b00; end
		8'b11111010: begin manchepartita = 2'b11; succ1=2'b00; succ2=2'b00; end
		8'b11111011: begin manchepartita = 2'b00; succ1=2'b11; succ2=2'b11; end
		8'b11111100: begin manchepartita = 2'b00; succ1=2'b11; succ2=2'b11; end
		8'b11111101: begin manchepartita = 2'b00; succ1=2'b11; succ2=2'b11; end
		8'b11111110: begin manchepartita = 2'b00; succ1=2'b11; succ2=2'b11; end
		8'b11111111: begin manchepartita = 2'b00; succ1=2'b11; succ2=2'b11; end
       	endcase
        end
      
   
      //conteggio manche
      if(INIZIA) 
        contamanche = 5'b00000;
      else
        if(manchepartita != 2'b00)
          contamanche = contamanche + 5'b00001;
      else
        contamanche = contamanche + 5'b00000;
      //numero massimo di manche
      if(INIZIA)
        maxmanche = 5'b00100 + {PRIMO,SECONDO};
      else
        maxmanche = maxmanche;
      //bit fine
      if(maxmanche == contamanche)
        FINE = 1'b1;
      else
        FINE = 1'b0;
      //bit ready
      if(contamanche >= 5'b00100)
        READY = 1'b1;
      else
        READY = 1'b0;
    end
  
  assign MANCHE = manchepartita;
    
  //inizio FSM

// Prova di modellazione della FSMD del gioco della morra in Verilog 
//FSM DEL GIOCO DELLA MORRA
reg[2:0] stato = 3'b000, statoprox = 3'b000; 


always @(posedge clk) begin
  if(INIZIA) 
    stato = 3'b000;
  
  else 
  	stato = statoprox;  
  end 
  
  always@(stato, INIZIA, READY, FINE, MANCHE, PARTITA) begin
    
    case(stato)
      
      3'b000: begin //stato start (pareggio iniziale)
        
        case({INIZIA, MANCHE, READY, FINE})
          
          5'b01100: begin statoprox = 3'b000; PARTITA = 2'b00; end // caso di pareggio
          5'b01110: begin statoprox = 3'b000; PARTITA = 2'b00; end // caso di pareggio
          5'b01111:	begin statoprox = 3'b000; PARTITA = 2'b11; end //caso pareggio+fine	
          
          5'b00100: begin statoprox = 3'b001; PARTITA = 2'b00; end //caso vittoria G1
          5'b00110: begin statoprox = 3'b001; PARTITA = 2'b00; end //caso vittoria G1
          5'b00111: begin statoprox = 3'b000; PARTITA = 2'b11; end //caso vG1+fine 
          
          5'b01000: begin statoprox = 3'b100; PARTITA = 2'b00; end // caso vittoria G2
          5'b01010: begin statoprox = 3'b100; PARTITA = 2'b00; end // caso vittoria G2
          5'b01011: begin statoprox = 3'b000; PARTITA = 2'b11; end
          
          default begin statoprox= 3'b000; PARTITA = 2'b00; end
        endcase
        
      end
        
      3'b001: begin //stato vantaggio +1 del G1
        
        case({INIZIA, MANCHE, READY, FINE})
          
          5'b01000: begin statoprox = 3'b000; PARTITA = 2'b00; end // caso vittoria G2
          5'b01010: begin statoprox = 3'b000; PARTITA = 2'b00; end // caso vittoria G2
          5'b01011: begin statoprox = 3'b000; PARTITA = 2'b11; end
          
          5'b01100: begin statoprox = 3'b001; PARTITA = 2'b00; end // caso pareggio
          5'b01110: begin statoprox = 3'b001; PARTITA = 2'b00; end // caso pareggio
          5'b01111: begin statoprox = 3'b000; PARTITA = 2'b11; end
          
          5'b00100: begin statoprox = 3'b010; PARTITA = 2'b00; end // caso vittoria G1
          5'b00110: begin statoprox = 3'b000; PARTITA = 2'b01; end // caso vittoria G1
          5'b00111: begin statoprox = 3'b000; PARTITA = 2'b01; end
          
          default begin statoprox = 3'b001; PARTITA = 2'b00; end
        endcase
        
      end
        
      3'b010: begin //stato vantaggio +2 del G1
        
        case({INIZIA, MANCHE, READY, FINE})
          
          5'b01000: begin statoprox = 3'b001; PARTITA = 2'b00; end // caso vittoria G2
          5'b01010: begin statoprox = 3'b001; PARTITA = 2'b00; end // caso vittoria G2
          5'b01011: begin statoprox = 3'b000; PARTITA = 2'b11; end
          
          
          5'b01100: begin statoprox = 3'b010; PARTITA = 2'b00; end // caso di pareggio
          5'b01110: begin statoprox = 3'b010; PARTITA = 2'b00; end 
          5'b01111: begin statoprox = 3'b000; PARTITA = 2'b01; end
          
          5'b00100: begin statoprox = 3'b011; PARTITA = 2'b00; end
          5'b00110: begin statoprox = 3'b000; PARTITA = 2'b01; end // caso vantaggio G1+2
          5'b00111: begin statoprox = 3'b000; PARTITA = 2'b01; end // caso vantaggio G1+2
          
          default begin statoprox = 3'b010; PARTITA = 2'b00; end
        endcase
        
      end
        
      3'b011: begin //stato vantaggio +3 del G1
        
        case({INIZIA, MANCHE, READY, FINE})
          
          
          5'b00110: begin statoprox = 3'b000; PARTITA = 2'b01; end // caso vittoria G1
          5'b00111: begin statoprox = 3'b000; PARTITA = 2'b01; end // caso vittoria G1
          
          5'b01000: begin statoprox = 3'b000; PARTITA = 2'b01; end // caso vittoria G2
          5'b01010: begin statoprox = 3'b000; PARTITA = 2'b01; end // caso vittoria G2
          5'b01011: begin statoprox = 3'b000; PARTITA = 2'b01; end
          
          5'b01100: begin statoprox = 3'b000; PARTITA = 2'b01; end
          5'b01110: begin statoprox = 3'b000; PARTITA = 2'b01; end // caso pareggio
          5'b01111: begin statoprox = 3'b000; PARTITA = 2'b01; end // caso pareggio
          
        default begin statoprox = 3'b011; PARTITA = 2'b00; end
        endcase
     
      end
        
      3'b100: begin //stato vantaggio +1 del G2
        
        case({INIZIA, MANCHE, READY, FINE})
          
          5'b00100: begin statoprox = 3'b000; PARTITA = 2'b00; end // caso vittoria G1
          5'b00110: begin statoprox = 3'b000; PARTITA = 2'b00; end // caso vittoria G1
          5'b00111: begin statoprox = 3'b000; PARTITA = 2'b11; end
     
          5'b01100: begin statoprox = 3'b100; PARTITA = 2'b00; end // caso pareggio
          5'b01110: begin statoprox = 3'b100; PARTITA = 2'b00; end // caso pareggio
          5'b01111: begin statoprox = 3'b000; PARTITA = 2'b11; end
          
          5'b01000: begin statoprox = 3'b101; PARTITA = 2'b00; end // caso vittoria G2
          5'b01010: begin statoprox = 3'b000; PARTITA = 2'b10; end // caso vittoria G2
          5'b01011: begin statoprox = 3'b000; PARTITA = 2'b11; end // finisce partita con solo un v +1
          
        default begin statoprox = 3'b100; PARTITA = 2'b00; end
        endcase   
        
      end
        
        
      3'b101: begin //stato vantaggio +2 del G2
        
        case({INIZIA, MANCHE, READY, FINE})
          
          5'b00100: begin statoprox = 3'b100; PARTITA = 2'b00; end // caso vittoria G1
          5'b00110: begin statoprox = 3'b100; PARTITA = 2'b00; end // caso vittoria G1
          5'b00111: begin statoprox = 3'b000; PARTITA = 2'b11; end
          
          5'b01100: begin statoprox = 3'b101; PARTITA = 2'b00; end // caso di pareggio
          5'b01110: begin statoprox = 3'b000; PARTITA = 2'b10; end 
          5'b01111: begin statoprox = 3'b000; PARTITA = 2'b10; end
          
    	  	
          5'b01010: begin statoprox = 3'b000; PARTITA = 2'b10; end // caso vittoria G2
          5'b01011: begin statoprox = 3'b000; PARTITA = 2'b10; end // caso vantaggio G2
          
          5'b01000: begin statoprox = 3'b110; PARTITA = 2'b00; end //caso vantaggio +3
          
        default begin statoprox = 3'b101; PARTITA = 2'b00; end
        endcase
   
      end
        
        
      3'b110: begin //stato vantaggio +3 del G2
        
        case({INIZIA, MANCHE, READY, FINE})
          
          5'b01010: begin statoprox = 3'b000; PARTITA = 2'b10; end // caso vittoria G2
          5'b01011: begin statoprox = 3'b000; PARTITA = 2'b10; end // caso vittoria G2
          
          5'b01110: begin statoprox = 3'b000; PARTITA = 2'b10; end // caso pareggio
          5'b01111: begin statoprox = 3'b000; PARTITA = 2'b10; end // caso pareggio
          
          5'b00100: begin statoprox = 3'b000; PARTITA = 2'b10; end
          5'b00110: begin statoprox = 3'b000; PARTITA = 2'b10; end
          5'b00111: begin statoprox = 3'b000; PARTITA = 2'b10; end
        
          default: begin statoprox = 3'b110; PARTITA = 2'b00; end
        endcase
     
      end
  
    endcase
  end
    
endmodule