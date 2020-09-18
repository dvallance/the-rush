defmodule TheScoreWeb.RushingLiveTest do
  use TheScoreWeb.ConnCase

  import Phoenix.LiveViewTest

  alias TheScore.Statistics

  @create_attrs %{att: 120.5, att_g: 120.5, avg: 120.5, first: 120.5, first_percent: 120.5, forty: 120.5, fum: 120.5, lng: 120.5, player_name: "some player_name", position: "some position", td: 120.5, team_abbr: "some team_abbr", twenty: 120.5, yds: 120.5, yds_g: 120.5}
  @update_attrs %{att: 456.7, att_g: 456.7, avg: 456.7, first: 456.7, first_percent: 456.7, forty: 456.7, fum: 456.7, lng: 456.7, player_name: "some updated player_name", position: "some updated position", td: 456.7, team_abbr: "some updated team_abbr", twenty: 456.7, yds: 456.7, yds_g: 456.7}
  @invalid_attrs %{att: nil, att_g: nil, avg: nil, first: nil, first_percent: nil, forty: nil, fum: nil, lng: nil, player_name: nil, position: nil, td: nil, team_abbr: nil, twenty: nil, yds: nil, yds_g: nil}

  defp fixture(:rushing) do
    {:ok, rushing} = Statistics.create_rushing(@create_attrs)
    rushing
  end

  defp create_rushing(_) do
    rushing = fixture(:rushing)
    %{rushing: rushing}
  end

  describe "Index" do
    setup [:create_rushing]

    test "lists all rushing", %{conn: conn, rushing: rushing} do
      {:ok, _index_live, html} = live(conn, Routes.rushing_index_path(conn, :index))

      assert html =~ "Listing Rushing"
      assert html =~ rushing.player_name
    end

    test "saves new rushing", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.rushing_index_path(conn, :index))

      assert index_live |> element("a", "New Rushing") |> render_click() =~
               "New Rushing"

      assert_patch(index_live, Routes.rushing_index_path(conn, :new))

      assert index_live
             |> form("#rushing-form", rushing: @invalid_attrs)
             |> render_change() =~ "can&apos;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#rushing-form", rushing: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.rushing_index_path(conn, :index))

      assert html =~ "Rushing created successfully"
      assert html =~ "some player_name"
    end

    test "updates rushing in listing", %{conn: conn, rushing: rushing} do
      {:ok, index_live, _html} = live(conn, Routes.rushing_index_path(conn, :index))

      assert index_live |> element("#rushing-#{rushing.id} a", "Edit") |> render_click() =~
               "Edit Rushing"

      assert_patch(index_live, Routes.rushing_index_path(conn, :edit, rushing))

      assert index_live
             |> form("#rushing-form", rushing: @invalid_attrs)
             |> render_change() =~ "can&apos;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#rushing-form", rushing: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.rushing_index_path(conn, :index))

      assert html =~ "Rushing updated successfully"
      assert html =~ "some updated player_name"
    end

    test "deletes rushing in listing", %{conn: conn, rushing: rushing} do
      {:ok, index_live, _html} = live(conn, Routes.rushing_index_path(conn, :index))

      assert index_live |> element("#rushing-#{rushing.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#rushing-#{rushing.id}")
    end
  end

  describe "Show" do
    setup [:create_rushing]

    test "displays rushing", %{conn: conn, rushing: rushing} do
      {:ok, _show_live, html} = live(conn, Routes.rushing_show_path(conn, :show, rushing))

      assert html =~ "Show Rushing"
      assert html =~ rushing.player_name
    end

    test "updates rushing within modal", %{conn: conn, rushing: rushing} do
      {:ok, show_live, _html} = live(conn, Routes.rushing_show_path(conn, :show, rushing))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Rushing"

      assert_patch(show_live, Routes.rushing_show_path(conn, :edit, rushing))

      assert show_live
             |> form("#rushing-form", rushing: @invalid_attrs)
             |> render_change() =~ "can&apos;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#rushing-form", rushing: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.rushing_show_path(conn, :show, rushing))

      assert html =~ "Rushing updated successfully"
      assert html =~ "some updated player_name"
    end
  end
end
