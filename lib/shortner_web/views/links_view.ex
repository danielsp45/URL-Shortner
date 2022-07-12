defmodule ShortnerWeb.LinksView do
  use ShortnerWeb, :view

  def render("show_one.json", %{link: link}) do
    %{id: link.id, url: link.url, slug: link.slug}
  end

  def render("show_all.json", %{links: links}) do
    %{data: render_many(links, ShortnerWeb.LinksView, "show_one.json")}
  end
end
