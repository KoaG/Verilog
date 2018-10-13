module mux4to1
(input a,b,c,d,[1:0]sel,
output y1,y0);

assign y1 = (sel == 2'b00)? a :
	    (sel == 2'b01)? b :
	    (sel == 2'b10)? c : d;

assign y0 = (~sel[1]&~sel[0]&a)|
	    (~sel[1]&sel[0]&b)|
	    (sel[1]&~sel[0]&c)|
	    (sel[1]&sel[0]&d); 

endmodule 