Version 4
SymbolType BLOCK
TEXT 32 32 LEFT 4 fifo_13_1_asynch
RECTANGLE Normal 32 32 800 3680
LINE Normal 0 112 32 112
PIN 0 112 LEFT 36
PINATTR PinName rst
PINATTR Polarity IN
LINE Normal 0 208 32 208
PIN 0 208 LEFT 36
PINATTR PinName wr_clk
PINATTR Polarity IN
LINE Wide 0 240 32 240
PIN 0 240 LEFT 36
PINATTR PinName din[15:0]
PINATTR Polarity IN
LINE Normal 0 272 32 272
PIN 0 272 LEFT 36
PINATTR PinName wr_en
PINATTR Polarity IN
LINE Normal 0 464 32 464
PIN 0 464 LEFT 36
PINATTR PinName full
PINATTR Polarity OUT
LINE Normal 0 496 32 496
PIN 0 496 LEFT 36
PINATTR PinName almost_full
PINATTR Polarity OUT
LINE Wide 0 624 32 624
PIN 0 624 LEFT 36
PINATTR PinName wr_data_count[14:0]
PINATTR Polarity OUT
LINE Normal 832 240 800 240
PIN 832 240 RIGHT 36
PINATTR PinName rd_clk
PINATTR Polarity IN
LINE Wide 832 272 800 272
PIN 832 272 RIGHT 36
PINATTR PinName dout[15:0]
PINATTR Polarity OUT
LINE Normal 832 304 800 304
PIN 832 304 RIGHT 36
PINATTR PinName rd_en
PINATTR Polarity IN
LINE Normal 832 496 800 496
PIN 832 496 RIGHT 36
PINATTR PinName empty
PINATTR Polarity OUT
LINE Normal 832 592 800 592
PIN 832 592 RIGHT 36
PINATTR PinName valid
PINATTR Polarity OUT
LINE Wide 832 656 800 656
PIN 832 656 RIGHT 36
PINATTR PinName rd_data_count[14:0]
PINATTR Polarity OUT

