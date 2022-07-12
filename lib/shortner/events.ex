defmodule Shortner.Events do 
  @moduledoc """
  The Events context.
  """
  alias Shortner.{Repo, Links}
  import Ecto.Query
  
  def list_links() do
    Links
    |> Repo.all()
  end

  def list_link_id(id) do
    Links
    |> Repo.get(id)
  end

  def insert_link(url) do
    Repo.insert(%Links{
      url: url,
      slug: MnemonicSlugs.generate_slug,
      visits_counter: 1
      }
    )
  end

  def delete_link(id) do
    Repo.delete!(%Links{id: id})
  end

  #duvida de como fazer
  def update_link(%{"slug" => slug}, attrs) do
    %Links{slug: slug}
    |> Links.changeset(attrs)
    |> Repo.update()
  end
end
