# Dropbox

A simple Dropbox API wrapper in Elixir. For now only supports uploading.

## Example

```elixir
data = "Hello, world"
file_path = "/test_file.txt"

client = %Dropbox.Client{ access_token: "YOUR_ACCESS_TOKEN" }
case Dropbox.upload(client, data, file_path) do
  { :ok, _ }    -> IO.puts "Successfully uploaded \"#{file_path}\"."
  { :error, _ } -> IO.puts "An error occured while uploading \"#{file_path}\""
end
```

## Installation

Add `dropbox` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:dropbox, github: "aliou/dropbox"}]
end
```
