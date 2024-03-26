module Func_AS(a, b, Add, Sub, Inc, Switch, c);
input [3:0] a, b;
input Add, Sub, Inc, Switch;
output reg [3:0] c;
always @(a or b or Add or Sub or Inc or Switch) begin
    if(Add)
        c = a + b;
    else
    if(Switch)
        c = Sub_Inc_Dec(a, Sub, b, Inc);
    else
        c = Sub_Inc_Dec(b, a, Sub, Inc);
end
function [3:0] Sub_Inc_Dec;
input [3:0] a, b;
input Sub, Inc;
begin
    $display("b value: %b", b);
    if(Sub)
        Sub_Inc_Dec = (a - b);
    else begin
        if(Inc)
            Sub_Inc_Dec = (a + 1);
        else
            Sub_Inc_Dec = (a - 1);
    end
end
endfunction
endmodule