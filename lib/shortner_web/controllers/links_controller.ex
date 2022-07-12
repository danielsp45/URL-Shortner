defmodule ShortnerWeb.LinksController do
  use ShortnerWeb, :controller

  alias Shortner.Events

  alias Shortner.Repo

  def show_all(conn, _params) do
    links = Events.list_links()
    render(conn, "show_all.json", links: links)
  end

  def show_link(conn, %{"id" => id}) do
    link = Events.list_link_id(id)
    render(conn, "show_one.json", link: link)
  end

  def new_link(conn, %{"url" => url}) do
    Events.insert_link(url)
    send_resp(conn, 200, "Link created")
  end
  
  def update_link(conn, %{"id" => id, "url" => url}) do
    Events.update_link(url)
    send_resp(conn, 200, "Link updated")
  end
  def update_link(conn, %{"id" => id, "slug" => slug}) do
    Events.update_link(slug: slug)
    send_resp(conn, 200, "Link updated")
  end

  def delete_link(conn, %{"id" => id}) do
    String.to_integer(id)
    |> Events.delete_link()
  end

    send_resp(conn, 200, "Link deleted")
  end
end

