defmodule FireStarter.EventController do
  use FireStarter.Web, :controller

  def show(conn, %{"id"=>id}) do
    event = FireStarter.EventQueries.get_by_id(id)
    |> IO.inspect()
    render conn, "details.html", event: event
  end
  def list(conn, _params) do
    events = FireStarter.EventQueries.get_all
    render conn, "list.html", events: events
  end
end
