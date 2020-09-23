defmodule TheScoreWeb.RushingLive.Index do
  use TheScoreWeb, :live_view
  import TheScoreWeb.RushingView

  alias TheScore.Statistics
  alias TheScore.Statistics.Rushing

  @type direction() :: :asc | :desc
  @type sorting() :: {direction(), Rushing.field()}

  @impl true
  def mount(_params, _session, socket) do
    default_sorting = {:asc, :player_name}

    socket =
      socket
      |> assign(:sorting, default_sorting)
      |> assign(:rushing_collection, list_rushing(default_sorting))

    {:ok, socket}
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

  @doc """
  Event handler to load the rushing data into the database from the 
  json file.
  """
  @impl true
  def handle_event("load_rushing_data", _, socket) do
    "#{System.cwd!()}/apps/the_score/data/rushing.json"
    |> TheScore.Database.Rushing.load_rushing_statistics_from_json_file()

    {:noreply, socket}
  end

  @doc """
  Event handler for rushing table sorting by headers.
  """
  @impl true
  def handle_event("rushing-sort-by", params, socket) do
    sorting =
      sorting_from_params(params, socket)

    socket =
      socket
      |> assign(:rushing_collection, Statistics.list_rushing(sorting))
      |> assign(:sorting, sorting)

    {:noreply, socket}
  end

  @spec list_rushing(sorting()) :: [%Rushing{}]
  defp list_rushing(sorting) do
    Statistics.list_rushing(sorting)
  end

  @spec list_rushing() :: [%Rushing{}]
  defp list_rushing() do
    Statistics.list_rushing()
  end

  @doc """
  Figures out what sorting to use by the existing sorting in the socket and the
  desired sorting from params.
  """
  defp sorting_from_params(%{"field" => field} = _params, socket) do
    {direction, sorting_field} = socket.assigns.sorting
                         |> IO.inspect(label: "SORTING")
    field = String.to_atom(field)

    if field == sorting_field do 
      {swap_direction(direction), field}
    else
      {:asc, field}
    end
  end

  defp swap_direction(:asc), do: :desc
  defp swap_direction(:desc), do: :asc
end
