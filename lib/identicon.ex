defmodule Identicon do
  @moduledoc """
  Documentation for `Identicon`.
  """

  def main(input) do
    input
    |> hash_input
    |> pick_color
    |> build_grid
  end

  def build_grid(%Identicon.Image{hex: hex } = image) do
    hex
    |> Enum.chunk_every(3, 3, :discard)
  end

  @doc """
  Given a list of 3 elements, returns list with second and first elements
  mirrored as tail of list

  ## Example

      iex> mirrow_row([1, 2, 3])
      [1, 2, 3, 2, 1]

  """
  def mirror_row(row) do
    [first, second | _tail] = row
    row ++ [second, first]
  end

  @doc """
  Pick a color (rgb) from first 3 values in image
  Input: image => %Identicon.Image{ hex: [] }
  """
  def pick_color(%Identicon.Image{hex: [r, g, b | _tail]} = image) do
     %Identicon.Image{image | color: {r, g, b}}
  end

  def hash_input(input) do
    hex = :crypto.hash(:md5, input)
    |> :binary.bin_to_list

    %Identicon.Image{hex: hex}
  end
end
