defmodule Calc do
  #==================================================
  #
  #
  #===================================================
  # def getPower(a , b , newpower \\ 1) do
  #       if b > 0 do
  #         newpower = newpower*a |> IO.inspect
  #         getPower(a,b-1,newpower)
  #       else
  #         newpower   |> IO.inspect
  #       end
  # end
  #==================================================
  #
  #
  #===================================================
  def pows(a, b) do
    if b > 0 do
      newpower(a, pows(a, b - 1)) |> IO.inspect()
    else
      1 |> IO.inspect()
    end
  end

  def newpower(x, y) do
    if y > 0 do
      (x + newpower(x, y - 1)) |> IO.inspect()
    end
  end
end
