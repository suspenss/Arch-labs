function Bit#(1) and1(Bit#(1) a, Bit#(1) b);
    return a&b;
endfunction

function Bit#(1) or1(Bit#(1) a, Bit#(1) b);
    return a|b;
endfunction

function Bit#(1) not1(Bit#(1) a);
    return ~a;
endfunction

// Exercise 1
function Bit#(1) multiplexer1(Bit#(1) sel, Bit#(1) a, Bit#(1) b);
    // f = a * s + a * not s
    return or1(and1(b, sel), and1(a, not1(sel)));
endfunction

// Exercise 3
function Bit#(n) multiplexer_n(Bit#(1) sel, Bit#(n) a, Bit#(n) b);
    Integer val_n = valueOf(n);
    Bit#(val_n) ans = 0;
    for (Integer i = 0; i < val_n; i = i + 1) begin
        let s = multiplexer1(sel, a[i], b[i]);
        ans[i] = s;
    end
    return ans;
endfunction

// Exercise 2
function Bit#(5) multiplexer5(Bit#(1) sel, Bit#(5) a, Bit#(5) b);
    return multiplexer_n(sel, a, b);
endfunction