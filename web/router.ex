defmodule LoudsaInternal.Router do
  use LoudsaInternal.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", LoudsaInternal do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/contacts", ContactsController, :index
    get "/contact/:id", ContactsController, :show
    get "/contacts/create", ContactsController, :create
  end

  # Other scopes may use custom stacks.
  # scope "/api", LoudsaInternal do
  #   pipe_through :api
  # end
end
