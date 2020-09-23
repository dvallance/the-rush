defmodule TheScoreWeb.DownloadController do
  use TheScoreWeb, :controller

  def rushing_stats(conn, params) do
    sort_direction = String.to_atom(Map.get(params, "sort_direction", "asc"))
    sort_field = String.to_atom(Map.get(params, "sort_field", "player_name"))
    name_filter = Map.get(params, "name_filter", nil)

    csv_string =
      TheScore.Statistics.list_rushing({sort_direction, sort_field}, name_filter)
      |> TheScore.Statistics.RushingCSV.to_string()

    conn
    |> put_resp_content_type("text/csv")
    |> put_resp_header(
      "content-disposition",
      "attachment; filename=\"Player Rushing Statistics\""
    )
    |> send_resp(200, csv_string)
  end
end
