defmodule F do
  def read_file do
    {status, content} = File.read("test.txt")

    case status do
      :ok ->
        Jason.decode(content) |> IO.inspect(lebel: "Parse")
      :error ->
        IO.puts("File Not Found")
    end
  end

  # ============================================
  def map_update do
    map = %{:a => 1, :b => 2}
    map |> Map.values  |> IO.inspect(label: "Map Values")
    map |> Map.update!(:a, &(&1 * 3))  |> IO.inspect(label: "Updated Map")
  end
end
