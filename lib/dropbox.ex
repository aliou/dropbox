defmodule Dropbox do
  @moduledoc """
  Simple Dropbox API wrapper.
  """

  @base_url "https://content.dropboxapi.com/2/"

  @doc """
  <https://www.dropbox.com/developers/documentation/http/documentation#files-upload>
  """
  def upload(client, content, filepath, mode \\ :add) do
    HTTPoison.start

    endpoint = @base_url <> "files/upload"
    args = %{ path: filepath, mode: mode }
    headers = [
      { "Authorization", "Bearer " <> client.access_token },
      { "Content-Type", "application/octet-stream" },
      { "Dropbox-API-Arg", Poison.encode!(args) },
    ]

    HTTPoison.post(endpoint, content, headers)
  end
end
