defmodule I18n do
  @moduledoc """
  Following Metaprogramming Elixir by Chris McCord, page: 49
  """

  use Translator


  locale "en",
    flash: [
      hello: "Hello %{first} %{last}!",
      bye: "Bye, %{name}!",
    ],
    users: [
      title: "Users"
    ]

  locale "fr",
    flash: [
      hello: "Bonjour %{first} %{last}!",
      bye: "Au revoir, %{name}!",
    ],
    users: [
      title: "Utilisateurs"
    ]
end
