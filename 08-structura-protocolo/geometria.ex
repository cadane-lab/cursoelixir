defmodule Geometry do
  defmodule Rectangle do
    @enforce_keys [:b]
    defstruct [:b, h: 1] #base, height
  end

  defmodule Circle do
    defstruct r: 1 #radius
  end

  defmodule HiperCube do
    #
    defstruct [:a, :d, b: 1, c: 1]
    #
    #
    #
  end

  defprotocol Shape do
    @fallback_to_any true
    def area(shape)
    def perimeter(shape)
  end

  #
  defimpl Shape, for: Rectangle do
    def area(r), do: r.b * r.h
    def perimeter(r), do: 2 * r.b + 2 * r.h
  end

   #
  defimpl Shape, for: Circle do
    def area(c), do: :math.pi() * c.r * c.r / 2
    def perimeter(c), do: 2 * :math.pi() * c.r
  end

  defimpl Shape, for: Any do
    def area(_), do: :error
    def perimeter(_), do: :error
  end
end
