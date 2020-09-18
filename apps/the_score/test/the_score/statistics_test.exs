defmodule TheScore.StatisticsTest do
  use TheScore.DataCase

  alias TheScore.Statistics

  describe "rushing" do
    alias TheScore.Statistics.Rushing

    @valid_attrs %{att: 120.5, att_g: 120.5, avg: 120.5, first: 120.5, first_percent: 120.5, forty: 120.5, fum: 120.5, lng: 120.5, player_name: "some player_name", position: "some position", td: 120.5, team_abbr: "some team_abbr", twenty: 120.5, yds: 120.5, yds_g: 120.5}
    @update_attrs %{att: 456.7, att_g: 456.7, avg: 456.7, first: 456.7, first_percent: 456.7, forty: 456.7, fum: 456.7, lng: 456.7, player_name: "some updated player_name", position: "some updated position", td: 456.7, team_abbr: "some updated team_abbr", twenty: 456.7, yds: 456.7, yds_g: 456.7}
    @invalid_attrs %{att: nil, att_g: nil, avg: nil, first: nil, first_percent: nil, forty: nil, fum: nil, lng: nil, player_name: nil, position: nil, td: nil, team_abbr: nil, twenty: nil, yds: nil, yds_g: nil}

    def rushing_fixture(attrs \\ %{}) do
      {:ok, rushing} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Statistics.create_rushing()

      rushing
    end

    test "list_rushing/0 returns all rushing" do
      rushing = rushing_fixture()
      assert Statistics.list_rushing() == [rushing]
    end

    test "get_rushing!/1 returns the rushing with given id" do
      rushing = rushing_fixture()
      assert Statistics.get_rushing!(rushing.id) == rushing
    end

    test "create_rushing/1 with valid data creates a rushing" do
      assert {:ok, %Rushing{} = rushing} = Statistics.create_rushing(@valid_attrs)
      assert rushing.att == 120.5
      assert rushing.att_g == 120.5
      assert rushing.avg == 120.5
      assert rushing.first == 120.5
      assert rushing.first_percent == 120.5
      assert rushing.forty == 120.5
      assert rushing.fum == 120.5
      assert rushing.lng == 120.5
      assert rushing.player_name == "some player_name"
      assert rushing.position == "some position"
      assert rushing.td == 120.5
      assert rushing.team_abbr == "some team_abbr"
      assert rushing.twenty == 120.5
      assert rushing.yds == 120.5
      assert rushing.yds_g == 120.5
    end

    test "create_rushing/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Statistics.create_rushing(@invalid_attrs)
    end

    test "update_rushing/2 with valid data updates the rushing" do
      rushing = rushing_fixture()
      assert {:ok, %Rushing{} = rushing} = Statistics.update_rushing(rushing, @update_attrs)
      assert rushing.att == 456.7
      assert rushing.att_g == 456.7
      assert rushing.avg == 456.7
      assert rushing.first == 456.7
      assert rushing.first_percent == 456.7
      assert rushing.forty == 456.7
      assert rushing.fum == 456.7
      assert rushing.lng == 456.7
      assert rushing.player_name == "some updated player_name"
      assert rushing.position == "some updated position"
      assert rushing.td == 456.7
      assert rushing.team_abbr == "some updated team_abbr"
      assert rushing.twenty == 456.7
      assert rushing.yds == 456.7
      assert rushing.yds_g == 456.7
    end

    test "update_rushing/2 with invalid data returns error changeset" do
      rushing = rushing_fixture()
      assert {:error, %Ecto.Changeset{}} = Statistics.update_rushing(rushing, @invalid_attrs)
      assert rushing == Statistics.get_rushing!(rushing.id)
    end

    test "delete_rushing/1 deletes the rushing" do
      rushing = rushing_fixture()
      assert {:ok, %Rushing{}} = Statistics.delete_rushing(rushing)
      assert_raise Ecto.NoResultsError, fn -> Statistics.get_rushing!(rushing.id) end
    end

    test "change_rushing/1 returns a rushing changeset" do
      rushing = rushing_fixture()
      assert %Ecto.Changeset{} = Statistics.change_rushing(rushing)
    end
  end
end
