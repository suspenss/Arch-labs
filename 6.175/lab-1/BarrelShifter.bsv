import Vector::*;
import Multiplexer::*;

function Bit#(32) shiftRightPow2(Bit#(1) en, Bit#(32) unshifted, Integer power);
    Integer distance = 2**power;
    Bit#(32) shifted = 0;
    if(en == 0) begin
        return unshifted;
    end else begin
        for(Integer i = 0; i < 32; i = i + 1) begin
            if(i + distance < 32) begin
                shifted[i] = unshifted[i + distance];
            end
        end
        return shifted;
    end
endfunction

// Exercise 6
function Bit#(32) barrelShifterRight(Bit#(32) in, Bit#(5) shiftBy);
    Bit#(32) ans = in;
    for (Integer i = 0; i < 5; i = i + 1) begin
        let shifted = shiftRightPow2(1, ans, i);
        ans = multiplexer_n(shiftBy[i], ans, shifted);
    end
    return ans;
endfunction