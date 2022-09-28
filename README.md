this is a work to design pipelined cpu with risc-v.
Using verilog.


solved problem ' Cell 'vga/c2i1' of type 'Code2Inst ' has undefined
contents and is considered a black box.'
by adding

'''
initial begin
  inst="XXX";
end
'''

in auxillary\Code2Inst.v
