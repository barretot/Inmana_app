defmodule Inmana.Welcomer do
  # Receber um nome e uma _ do usuario
  # Se o usuário chamar #banana" e tiver idade "42", ele recebe uma msg especial
  # Se p usuário for maior de idade, ele recebe uma msg normal
  # Se p usuário for menor de idade, retornamos um erro
  # Temos que tratar o nome do ususario para entradas erradas, como "BaNaNa", "BaNaNa \n"
  def welcome(%{"name" => name, "age" => age}) do
    age = String.to_integer(age)

    # Imutabilidade, pipe é boa prática
    name
    |> String.trim()
    |> String.downcase()
    |> evaluate(age)
  end

  ## Funções matching
  defp evaluate("banana", 42) do
    # Tuplas de retornos
    {:ok, "Você é especial banana"}
  end

  defp evaluate(name, age) when age >= 18 do
    {:ok, "Bem vindo #{name}"}
  end

  defp evaluate(name, _age) do
    {:error, "Você não pode passar #{name}"}
  end
end
