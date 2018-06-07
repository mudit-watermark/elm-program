#
# TO RUN THIS CODE
# OPEN MIX and RUN below Command
# mix run -e "Budget.Conversion.from_euro_to_dollor(15) |> IO.puts"
#
#


defmodule Budget.Conversion do

                def from_euro_to_dollor(amount) do
                  url = "http://cs-currency-rates.herokuapp.com/currency-rates"
                        case HTTPoison.get(url) do
                          {:ok , response} -> parse(response) |> convert(amount)
                          {:error, _} -> "Error Fectching Rates"
                        end
                      end

           defp parse(%{status_code: 200,body: json_response}) do
                Poison.Parser.parse(json_response)
              end


            defp convert({:ok,rates},amount) do
              rate = find_euro(rates)
              amount*rate
            end

            defp find_euro( [%{"currency" => "euro", "rate"=> rate } | _] ) do
              rate
            end


            defp find_euro([_ | tail ]) do
              find_euro(tail)
            end


            defp find_euro([]) do
              raise "No rate found for Euro"
            end
end
