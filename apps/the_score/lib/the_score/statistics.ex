defmodule TheScore.Statistics do
  @moduledoc """
  The Statistics context.
  """

  import Ecto.Query, warn: false
  alias TheScore.Repo

  alias TheScore.Statistics.Rushing

  @doc """
  Returns the list of rushing.

  ## Examples

      iex> list_rushing()
      [%Rushing{}, ...]

  """
  def list_rushing do
    Repo.all(Rushing)
  end

  #NOTE I just hacked in the name filter. ...but ideally an array of filters 
  # should be allowed and the query could apply them all. This would allow 
  # pagination as well.
  def list_rushing(sorting, name_filter_value) do
    Rushing |> order_by(^sorting) |> apply_name_filter(name_filter_value) |> Repo.all()
  end

  defp apply_name_filter(%Ecto.Query{} = query, nil), do: query
  defp apply_name_filter(%Ecto.Query{} = query, name_filters_value) do
    name_like = "%#{name_filters_value}%"
    query |> where([rushing], like(rushing.player_name, ^name_like))
  end

  @doc """
  Gets a single rushing.

  Raises `Ecto.NoResultsError` if the Rushing does not exist.

  ## Examples

      iex> get_rushing!(123)
      %Rushing{}

      iex> get_rushing!(456)
      ** (Ecto.NoResultsError)

  """
  def get_rushing!(id), do: Repo.get!(Rushing, id)

  @doc """
  Creates a rushing.

  ## Examples

      iex> create_rushing(%{field: value})
      {:ok, %Rushing{}}

      iex> create_rushing(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_rushing(attrs \\ %{}) do
    %Rushing{}
    |> Rushing.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a rushing.

  ## Examples

      iex> update_rushing(rushing, %{field: new_value})
      {:ok, %Rushing{}}

      iex> update_rushing(rushing, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_rushing(%Rushing{} = rushing, attrs) do
    rushing
    |> Rushing.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a rushing.

  ## Examples

      iex> delete_rushing(rushing)
      {:ok, %Rushing{}}

      iex> delete_rushing(rushing)
      {:error, %Ecto.Changeset{}}

  """
  def delete_rushing(%Rushing{} = rushing) do
    Repo.delete(rushing)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking rushing changes.

  ## Examples

      iex> change_rushing(rushing)
      %Ecto.Changeset{data: %Rushing{}}

  """
  def change_rushing(%Rushing{} = rushing, attrs \\ %{}) do
    Rushing.changeset(rushing, attrs)
  end
end
