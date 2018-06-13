defmodule FireStarter.EventQueries do
  import Ecto.Query

  alias FireStarter.{Repo,Events}

  def get_all do
    Repo.all(from Events)
  end

  def get_data_by_title(title) do
    query = from e in Events,
      where: e.title == ^title

      Repo.all(query)

  end

  def get_by_id(id) do
    Repo.get(Events,id)
  end

  def create(event) do
    Repo.insert!(event)
  end

end
