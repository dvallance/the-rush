defmodule TheScore.Statistics.RushingCSV do
  @moduledoc """
  Responsible for Rushing to CSV generation.
  """
  alias TheScore.Statistics.Rushing

  @spec to_string([%TheScore.Statistics.Rushing{}]) :: String.t()
  def to_string([]), do: ""

  def to_string(statistics_rushing_list) do
    [headers | Enum.map(statistics_rushing_list, &values_from_rushing/1)]
    |> CSV.encode()
    |> Enum.to_list()
    |> Kernel.to_string()
  end

  # NOTE should declare this in the schema instead of pasting it again here.
  defp headers() do
    [
      :player_name,
      :team_abbr,
      :position,
      :att_g,
      :att,
      :yds,
      :avg,
      :yds_g,
      :td,
      :lng,
      :first,
      :first_percent,
      :twenty,
      :forty,
      :fum
    ] 
  end

  defp values_from_rushing(%Rushing{} = rushing) do
    [
      Map.get(rushing, :player_name),
      Map.get(rushing, :team_abbr),
      Map.get(rushing, :position),
      Map.get(rushing, :att_g),
      Map.get(rushing, :att),
      Map.get(rushing, :yds),
      Map.get(rushing, :avg),
      Map.get(rushing, :yds_g),
      Map.get(rushing, :td),
      Map.get(rushing, :lng),
      Map.get(rushing, :first),
      Map.get(rushing, :first_percent),
      Map.get(rushing, :twenty),
      Map.get(rushing, :forty),
      Map.get(rushing, :fum)
    ]
  end
end
