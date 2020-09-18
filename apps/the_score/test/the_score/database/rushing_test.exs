defmodule TheScore.Database.RushingTest do
  alias TheScore.Database.Rushing

  use TheScore.DataCase

  # asset we load 326 records from the json file
  test "load_rushing_statistics_from_json_file/0" do
    {:ok, count} = Rushing.load_rushing_statistics_from_json_file("./data/rushing.json")
    assert count == 326
  end
end
