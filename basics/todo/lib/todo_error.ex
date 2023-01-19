defmodule TodoError do

  @type t() :: %__MODULE__{
    message: String.t
  }

  defexception [:message]

  def not_found(id) do
    %TodoError{message: "No todo found with id #{id}"}
  end
end
