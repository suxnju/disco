(self.webpackChunkdisco_frontend=self.webpackChunkdisco_frontend||[]).push([[2647],{31789:e=>{e.exports=function(e){const n="~?[a-z$_][0-9a-zA-Z$_]*",a="`?[A-Z$_][0-9a-zA-Z$_]*",s="'?[a-z$_][0-9a-z$_]*",i=n+"(\\s*:\\s*[a-z$_][0-9a-z$_]*(\\(\\s*("+s+"\\s*(,"+s+"\\s*)*)?\\))?){0,2}",r="("+["||","++","**","+.","*","/","*.","/.","..."].map((function(e){return e.split("").map((function(e){return"\\"+e})).join("")})).join("|")+"|\\|>|&&|==|===)",l="\\s+"+r+"\\s+",t={keyword:"and as asr assert begin class constraint do done downto else end exception external for fun function functor if in include inherit initializer land lazy let lor lsl lsr lxor match method mod module mutable new nonrec object of open or private rec sig struct then to try type val virtual when while with",built_in:"array bool bytes char exn|5 float int int32 int64 list lazy_t|5 nativeint|5 ref string unit ",literal:"true false"},c="\\b(0[xX][a-fA-F0-9_]+[Lln]?|0[oO][0-7_]+[Lln]?|0[bB][01_]+[Lln]?|[0-9][0-9_]*([Lln]|(\\.[0-9_]*)?([eE][-+]?[0-9_]+)?)?)",o={className:"number",relevance:0,variants:[{begin:c},{begin:"\\(-"+c+"\\)"}]},b={className:"operator",relevance:0,begin:r},g=[{className:"identifier",relevance:0,begin:n},b,o],d=[e.QUOTE_STRING_MODE,b,{className:"module",begin:"\\b"+a,returnBegin:!0,end:".",contains:[{className:"identifier",begin:a,relevance:0}]}],m=[{className:"module",begin:"\\b"+a,returnBegin:!0,end:".",relevance:0,contains:[{className:"identifier",begin:a,relevance:0}]}],u={className:"function",relevance:0,keywords:t,variants:[{begin:"\\s(\\(\\.?.*?\\)|"+n+")\\s*=>",end:"\\s*=>",returnBegin:!0,relevance:0,contains:[{className:"params",variants:[{begin:n},{begin:i},{begin:/\(\s*\)/}]}]},{begin:"\\s\\(\\.?[^;\\|]*\\)\\s*=>",end:"\\s=>",returnBegin:!0,relevance:0,contains:[{className:"params",relevance:0,variants:[{begin:n,end:"(,|\\n|\\))",relevance:0,contains:[b,{className:"typing",begin:":",end:"(,|\\n)",returnBegin:!0,relevance:0,contains:m}]}]}]},{begin:"\\(\\.\\s"+n+"\\)\\s*=>"}]};d.push(u);const v={className:"constructor",begin:a+"\\(",end:"\\)",illegal:"\\n",keywords:t,contains:[e.QUOTE_STRING_MODE,b,{className:"params",begin:"\\b"+n}]},N={className:"pattern-match",begin:"\\|",returnBegin:!0,keywords:t,end:"=>",relevance:0,contains:[v,b,{relevance:0,className:"constructor",begin:a}]},_={className:"module-access",keywords:t,returnBegin:!0,variants:[{begin:"\\b("+a+"\\.)+"+n},{begin:"\\b("+a+"\\.)+\\(",end:"\\)",returnBegin:!0,contains:[u,{begin:"\\(",end:"\\)",skip:!0}].concat(d)},{begin:"\\b("+a+"\\.)+\\{",end:/\}/}],contains:d};return m.push(_),{name:"ReasonML",aliases:["re"],keywords:t,illegal:"(:-|:=|\\$\\{|\\+=)",contains:[e.COMMENT("/\\*","\\*/",{illegal:"^(#,\\/\\/)"}),{className:"character",begin:"'(\\\\[^']+|[^'])'",illegal:"\\n",relevance:0},e.QUOTE_STRING_MODE,{className:"literal",begin:"\\(\\)",relevance:0},{className:"literal",begin:"\\[\\|",end:"\\|\\]",relevance:0,contains:g},{className:"literal",begin:"\\[",end:"\\]",relevance:0,contains:g},v,{className:"operator",begin:l,illegal:"--\x3e",relevance:0},o,e.C_LINE_COMMENT_MODE,N,u,{className:"module-def",begin:"\\bmodule\\s+"+n+"\\s+"+a+"\\s+=\\s+\\{",end:/\}/,returnBegin:!0,keywords:t,relevance:0,contains:[{className:"module",relevance:0,begin:a},{begin:/\{/,end:/\}/,skip:!0}].concat(d)},_]}}}}]);