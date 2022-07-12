defmodule Shortner.Links do
  use Ecto.Schema
  import Ecto.Changeset

  schema "links" do
    field :slug, :string
    field :url, :string
    field :visits_counter, :integer

    timestamps()
  end

  # this function bellow checks if the data being inserted in the data base is valid
  # we can also add more checks
  @doc false
  def changeset(links, attrs) do
    links
    |> cast(attrs, [:url, :slug, :visits_counter])
    |> validate_required([:url, :slug, :visits_counter])
  end
end
