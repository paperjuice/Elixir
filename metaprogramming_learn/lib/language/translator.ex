defmodule Translator do
  #I18n.t("en", "flash.hello", first: "Chris", last: "McCord")

  defmacro __using__(_opts) do
    quote do
      Module.register_attribute(__MODULE__, :locales, accumulate: true, persist: false)
      import unquote(__MODULE__)
      @before_compile unquote(__MODULE__)
    end
  end

  defmacro __before_compile__(env) do
      compile(Module.get_attribute(env.module, :locales))
  end

  defmacro locale(name, mappings) do
    quote bind_quoted: [name: name, mappings: mappings] do
      @locales {name, mappings}
    end
  end

  def compile(translations) do
    translation_ast = for {locale, mappings} <- translations do
      deftranslation(locale, "", mappings)
    end

    final_ast = quote do
      def t(locale, path, bindings \\ [])
      unquote(translation_ast) |> IO.inspect
      def t(_locale, _path, _bindings), do: {:error, :no_translation}
    end

    # IO.puts Macro.to_string(final_ast)
    final_ast
  end

  defp deftranslation(locale, current_path, mappings) do
    for {key, val} <- mappings do
      path = append_path(current_path, key)
      if Keyword.keyword?(val) do
        deftranslation(locale, path, val)
      else
        quote do
          def t(unquote(locale), unquote(path), binding) do
            unquote(interpolate(val))
          end
        end
      end
    end
  end

  defp interpolate(string) do
    string
  end

  defp append_path("", next), do: to_string(next)
  defp append_path(current, next), do: "#{current}.#{next}"
end
