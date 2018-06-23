
function Room(type, tx, ty, w, h)
  local r = {}
  r.type = type
  r.tx   = tx
  r.ty   = ty
  r.w    = w
  r.h    = h

  function r:build()
    
  end

  return r
end
