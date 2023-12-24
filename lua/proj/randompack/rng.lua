Time = os.date("*t", os.time())
--print(Time.sec)

local function grn(min, max, opts)
  local r = math.random(min, max)
  if not opts.RbT then
    return r
  elseif opts.RbT then
    r = r * 1.5 + Time.sec
    while r > max do
      r = math.floor((r / 2)+0.5)
    end
  end
  return tonumber(r)
end

function Main()
  print("Bem vindo ao randompack/RNG!\nDigite o valor mínimo: ")
  local m = tonumber(io.read())
  print("Digite o valor máximo: ")
  local n = tonumber(io.read())

  print("Usar randomização aprimorada? <s n>")
  local _ = io.read()

  if _ == "s" then Opts = {RbT = true}
  elseif _ == "n" then Opts = {RbT = false} end

  print(grn(m, n, Opts))
end

Main()
