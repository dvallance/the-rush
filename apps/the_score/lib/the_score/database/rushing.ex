defmodule TheScore.Database.Rushing do
  alias TheScore.Repo
  alias TheScore.Statistics

  @moduledoc """
  Loacation for any methods related to the "rushing" database.
  """

  def load_rushing_statistics_from_json_file(path) when is_binary(path) do
    with {:ok, data} <- File.read(path),
         {:ok, json} <- Jason.decode(data),
         {:ok, entries} <- generate_entries(json),
         {count, nil} <- Repo.insert_all(Statistics.Rushing, entries) do
      {:ok, count}
    end
  end

  # generates entries for the repo insert_all command
  defp generate_entries(json) do
    entries =
      Enum.map(json, fn attributes ->
        %{
          att: to_float(attributes["Att"]),
          att_g: to_float(attributes["Att/G"]),
          avg: to_float(attributes["Avg"]),
          first: to_float(attributes["1st"]),
          first_percent: to_float(attributes["1st%"]),
          forty: to_float(attributes["40+"]),
          fum: to_float(attributes["FUM"]),
          lng: to_float(attributes["Lng"]),
          player_name: attributes["Player"],
          position: attributes["Pos"],
          td: to_float(attributes["TD"]),
          team_abbr: attributes["Team"],
          twenty: to_float(attributes["20+"]),
          yds: to_float(attributes["Yds"]),
          yds_g: to_float(attributes["Yds/G"]),
          inserted_at: NaiveDateTime.truncate(NaiveDateTime.utc_now(), :second),
          updated_at: NaiveDateTime.truncate(NaiveDateTime.utc_now(), :second)
        }
      end)

    {:ok, entries}
  end

  defp to_float(attr) when is_binary(attr) do
    {float, _} = Float.parse(attr)
    float
  end

  defp to_float(attr) when is_integer(attr), do: attr / 1
  defp to_float(attr) when is_float(attr), do: attr
end
