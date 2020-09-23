defmodule TheScore.Statistics.RushingCSVTest do
  alias TheScore.Statistics.Rushing
  alias TheScore.Statistics.RushingCSV

  use ExUnit.Case

  test "to_string/1" do
    csv_string =
      [
        struct(Rushing, %{
          att: 0.1,
          att_g: 0.1,
          avg: 0.1,
          first: 0.1,
          first_percent: 0.1,
          forty: 0.1,
          fum: 0.1,
          id: 1,
          inserted_at: ~N[2000-01-01 23:00:07],
          lng: 0.1,
          player_name: "Bob",
          position: "Runner",
          td: 0.1,
          team_abbr: "My Team",
          twenty: 0.1,
          updated_at: ~N[2000-01-01 23:00:07],
          yds: 0.1,
          yds_g: 0.1
        })
      ]
      |> RushingCSV.to_string()

    assert csv_string == "player_name,team_abbr,position,att_g,att,yds,avg,yds_g,td,lng,first,first_percent,twenty,forty,fum\r\nBob,My Team,Runner,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1\r\n"
  end
end
