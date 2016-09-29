local Utility = {};

function Utility.ExplodeStr(div,str)
    if (div=='') then return {} end
    local pos,arr = 0,{}
    for st,sp in function() return string.find(str,div,pos,true) end do
        table.insert(arr,string.sub(str,pos,st-1))
        pos = sp + 1
    end
    table.insert(arr,string.sub(str,pos))
    return arr
end

function Utility.TrimStr(str)
  if (str == nil) then
    return "";
  end
  return str:match( "^%s*(.-)%s*$" );
end

GottaGoFast.Utility = Utility;
