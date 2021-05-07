defmodule Identicon do
  @moduledoc """
  Documentation for `Identicon`.
  """

  def main(input) do
    input
    |> hash_input
    |> pick_color
  end

  @doc """
  Pick a color (rgb) from first 3 values in image
  Input: image => %Identicon.Image{ hex: [] }
  """
  defp pick_color(%Identicon.Image{hex: [r, g, b | _tail]} = image) do
     %Identicon.Image{image | color: {r, g, b}}
  end

  defp hash_input(input) do
    hex = :crypto.hash(:md5, input)
    |> :binary.bin_to_list

    %Identicon.Image{hex: hex}
  end
end
