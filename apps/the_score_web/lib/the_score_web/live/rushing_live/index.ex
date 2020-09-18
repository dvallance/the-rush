defmodule TheScoreWeb.RushingLive.Index do
  use TheScoreWeb, :live_view

  alias TheScore.Statistics
  alias TheScore.Statistics.Rushing

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :rushing_collection, list_rushing())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Rushing")
    |> assign(:rushing, Statistics.get_rushing!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Rushing")
    |> assign(:rushing, %Rushing{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Rushing")
    |> assign(:rushing, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    rushing = Statistics.get_rushing!(id)
    {:ok, _} = Statistics.delete_rushing(rushing)

    {:noreply, assign(socket, :rushing_collection, list_rushing())}
  end

  defp list_rushing do
    Statistics.list_rushing()
  end
end
