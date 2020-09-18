defmodule TheScore.Statistics.Rushing do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "rushing" do
    field :player_name, :string
    field :team_abbr, :string
    field :position, :string
    field :att, :float
    field :att_g, :float
    field :avg, :float
    field :first, :float
    field :first_percent, :float
    field :forty, :float
    field :fum, :float
    field :lng, :float
    field :td, :float
    field :twenty, :float
    field :yds, :float
    field :yds_g, :float

    timestamps()
  end

  @doc false
  def changeset(rushing, attrs) do
    rushing
    |> cast(attrs, [:player_name, :team_abbr, :position, :att_g, :att, :yds, :avg, :yds_g, :td, :lng, :first, :first_percent, :twenty, :forty, :fum])
    |> validate_required([:player_name, :team_abbr, :position, :att_g, :att, :yds, :avg, :yds_g, :td, :lng, :first, :first_percent, :twenty, :forty, :fum])
  end
end
