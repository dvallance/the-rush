defmodule TheScore.Repo.Migrations.CreateRushing do
  use Ecto.Migration

  def change do
    create table(:rushing, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :player_name, :string
      add :team_abbr, :string
      add :position, :string
      add :att_g, :float
      add :att, :float
      add :yds, :float
      add :avg, :float
      add :yds_g, :float
      add :td, :float
      add :lng, :float
      add :first, :float
      add :first_percent, :float
      add :twenty, :float
      add :forty, :float
      add :fum, :float

      timestamps()
    end

  end
end
